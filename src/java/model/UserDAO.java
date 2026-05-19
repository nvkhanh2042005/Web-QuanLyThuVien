package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // Đăng nhập
    public boolean checkLogin(String username, String password) {

        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";

        try {
            Connection conn = DBContext.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Lấy role
    public String getRole(String username) {

        String sql = "SELECT role FROM users WHERE username = ?";

        try {
            Connection conn = DBContext.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("role");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "user";
    }

    // Kiểm tra username tồn tại
    public boolean checkUsernameExists(String username) {

        String sql = "SELECT * FROM users WHERE username = ?";

        try {
            Connection conn = DBContext.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Đăng ký
    public boolean register(String username, String password) {

        String sql = "INSERT INTO users(username, password, role) VALUES (?, ?, 'user')";

        try {
            Connection conn = DBContext.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}