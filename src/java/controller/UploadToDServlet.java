package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.BookDAO;

@WebServlet("/UploadToDServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  
    maxFileSize = 1024 * 1024 * 10,       
    maxRequestSize = 1024 * 1024 * 50     
)
public class UploadToDServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");

        if (isAdmin == null || !isAdmin) {
            response.sendRedirect("dangnhap.jsp?error=login_required");
            return; 
        }
        
        try {
            
            String title = request.getParameter("title");
            String tacgia = request.getParameter("tacgia");
            String mota = request.getParameter("mota");
            String priceStr = request.getParameter("price");
            String soluongStr = request.getParameter("soluong");
            
            double price = Double.parseDouble(priceStr);
            int soluong = Integer.parseInt(soluongStr);
            
            
            Part filePart = request.getPart("fileAnh");
            String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            
            
            String localPath = "C:/Users/Admin/Code Java/QuanLySach/web/images";
            File localDir = new File(localPath);
            if (!localDir.exists()) {
                localDir.mkdirs(); 
            }
            File localFile = new File(localDir, fileName);

            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, localFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
            
            
            String serverPath = getServletContext().getRealPath("/") + "images";
            File serverDir = new File(serverPath);
            if (!serverDir.exists()) {
                serverDir.mkdirs();
            }
            File serverFile = new File(serverDir, fileName);
            Files.copy(localFile.toPath(), serverFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

            
            BookDAO dao = new BookDAO();
            boolean success = dao.addBook(title, tacgia, price, soluong, mota, fileName);

            if (success) {
                response.sendRedirect("BookListServlet");
            } else {
                response.getWriter().println("Lỗi: Không thể thêm sách vào database!");
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("Lỗi: Giá hoặc số lượng không hợp lệ! Vui lòng nhập số.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi hệ thống: " + e.getMessage());
        }
    }
}