package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    
    
    public List<Book> getAllBooks(int page, int pageSize) {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM Books LIMIT ?, ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            int offset = (page - 1) * pageSize;
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Book(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getDouble("price"),
                        rs.getString("image_name"),
                        rs.getString("mota"),
                        rs.getString("tacgia"),
                        rs.getInt("soluong")
                    ));
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi getAllBooks: " + e.getMessage());
        }
        return list;
    }
    
    
    public int getTotalBooks() {
        String sql = "SELECT COUNT(*) FROM Books";
        
        try (Connection conn = DBContext.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Lỗi getTotalBooks: " + e.getMessage());
        }
        return 0;
    }
    
   
    public int getTotalPages(int pageSize) {
        int totalBooks = getTotalBooks();
        return (int) Math.ceil((double) totalBooks / pageSize);
    }
    
    
    public Book getBookById(int id) {
        String sql = "SELECT * FROM Books WHERE id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Book(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getDouble("price"),
                        rs.getString("image_name"),
                        rs.getString("mota"),
                        rs.getString("tacgia"),
                        rs.getInt("soluong")
                    );
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi getBookById: " + e.getMessage());
        }
        return null;
    }
    
    
    public boolean addBook(String title, String tacgia, double price, int soluong, String mota, String imageName) {
        String sql = "INSERT INTO Books (title, price, image_name, mota, tacgia, soluong) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, title);
            ps.setDouble(2, price);
            ps.setString(3, imageName);
            ps.setString(4, mota);
            ps.setString(5, tacgia);
            ps.setInt(6, soluong);
            
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            System.out.println("Lỗi addBook: " + e.getMessage());
            return false;
        }
    }
    
    
    public boolean updateBook(int id, String title, String tacgia, double price, int soluong, String mota, String imageName) {
        String sql = "UPDATE Books SET title=?, price=?, image_name=?, mota=?, tacgia=?, soluong=? WHERE id=?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, title);
            ps.setDouble(2, price);
            ps.setString(3, imageName);
            ps.setString(4, mota);
            ps.setString(5, tacgia);
            ps.setInt(6, soluong);
            ps.setInt(7, id);
            
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            System.out.println("Lỗi updateBook: " + e.getMessage());
            return false;
        }
    }
    
    
    public boolean updateBookNoImage(int id, String title, String tacgia, double price, int soluong, String mota) {
        String sql = "UPDATE Books SET title=?, price=?, mota=?, tacgia=?, soluong=? WHERE id=?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, title);
            ps.setDouble(2, price);
            ps.setString(3, mota);
            ps.setString(4, tacgia);
            ps.setInt(5, soluong);
            ps.setInt(6, id);
            
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            System.out.println("Lỗi updateBookNoImage: " + e.getMessage());
            return false;
        }
    }
    
    
    public boolean deleteBook(int id) {
        String sql = "DELETE FROM Books WHERE id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            System.out.println("Lỗi deleteBook: " + e.getMessage());
            return false;
        }
    }
    
    
    public List<Book> searchBooks(String keyword) {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM Books WHERE title LIKE ? OR tacgia LIKE ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Book(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getDouble("price"),
                        rs.getString("image_name"),
                        rs.getString("mota"),
                        rs.getString("tacgia"),
                        rs.getInt("soluong")
                    ));
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi searchBooks: " + e.getMessage());
        }
        return list;
    }
    
    
    public List<Book> filterByPrice(String filterType) {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM Books WHERE 1=1";
        
        switch (filterType) {
            case "under_100":
                sql += " AND price < 100000";
                break;
            case "100_300":
                sql += " AND price >= 100000 AND price <= 300000";
                break;
            case "over_300":
                sql += " AND price > 300000";
                break;
            default:
                
                break;
        }
        
        try (Connection conn = DBContext.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            
            while (rs.next()) {
                list.add(new Book(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getDouble("price"),
                    rs.getString("image_name"),
                    rs.getString("mota"),
                    rs.getString("tacgia"),
                    rs.getInt("soluong")
                ));
            }
        } catch (Exception e) {
            System.out.println("Lỗi filterByPrice: " + e.getMessage());
        }
        return list;
    }
    
    
    public boolean updateQuantity(int id, int newQuantity) {
        String sql = "UPDATE Books SET soluong = ? WHERE id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, newQuantity);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            System.out.println("Lỗi updateQuantity: " + e.getMessage());
            return false;
        }
    }
}