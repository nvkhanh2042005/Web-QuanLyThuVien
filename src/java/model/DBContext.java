package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    
    public static Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/qlthuvien?useUnicode=true&characterEncoding=UTF-8";
        String username = "root"; 
        String password = ""; 
 
        Class.forName("com.mysql.cj.jdbc.Driver");
 
        return DriverManager.getConnection(url, username, password);
    }
}