package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

public class OrderDAO {

    public boolean checkout(String username, Map<Integer, CartItem> cart) {
        Connection conn = null;
        PreparedStatement psOrder = null;
        PreparedStatement psDetail = null;
        PreparedStatement psUpdateBook = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection();
            conn.setAutoCommit(false);

            double total = 0;

            for (CartItem item : cart.values()) {
                total += item.getBook().getPrice() * item.getQuantity();
            }

            String sqlOrder = "INSERT INTO orders(username, total_price) VALUES (?, ?)";
            psOrder = conn.prepareStatement(sqlOrder, PreparedStatement.RETURN_GENERATED_KEYS);
            psOrder.setString(1, username);
            psOrder.setDouble(2, total);
            psOrder.executeUpdate();

            rs = psOrder.getGeneratedKeys();

            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            String sqlDetail = """
                INSERT INTO order_details(order_id, book_id, quantity, price, subtotal)
                VALUES (?, ?, ?, ?, ?)
            """;

            String sqlUpdateBook = """
                UPDATE books
                SET soluong = soluong - ?
                WHERE id = ? AND soluong >= ?
            """;

            psDetail = conn.prepareStatement(sqlDetail);
            psUpdateBook = conn.prepareStatement(sqlUpdateBook);

            for (CartItem item : cart.values()) {
                int bookId = item.getBook().getId();
                int quantity = item.getQuantity();
                double price = item.getBook().getPrice();
                double subtotal = price * quantity;

                psUpdateBook.setInt(1, quantity);
                psUpdateBook.setInt(2, bookId);
                psUpdateBook.setInt(3, quantity);

                int updated = psUpdateBook.executeUpdate();

                if (updated == 0) {
                    conn.rollback();
                    return false;
                }

                psDetail.setInt(1, orderId);
                psDetail.setInt(2, bookId);
                psDetail.setInt(3, quantity);
                psDetail.setDouble(4, price);
                psDetail.setDouble(5, subtotal);
                psDetail.addBatch();
            }

            psDetail.executeBatch();

            conn.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();

            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            return false;

        } finally {
            try {
                if (rs != null) rs.close();
                if (psOrder != null) psOrder.close();
                if (psDetail != null) psDetail.close();
                if (psUpdateBook != null) psUpdateBook.close();
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}