package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Book;
import model.BookDAO;

@WebServlet("/BookListServlet")
public class BookListServlet extends HttpServlet {
    private static final int PAGE_SIZE = 4;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // THÊM DÒNG NÀY - Đặt encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            page = Integer.parseInt(pageStr);
        }

        // Lấy tham số tìm kiếm và lọc
        String search = request.getParameter("search");
        String priceFilter = request.getParameter("price_filter");
        
        BookDAO dao = new BookDAO();
        List<Book> list;
        int totalBooks;
        
        // Xử lý tìm kiếm
        if (search != null && !search.trim().isEmpty()) {
            list = dao.searchBooks(search.trim());
            totalBooks = list.size();
            
            int fromIndex = (page - 1) * PAGE_SIZE;
            int toIndex = Math.min(fromIndex + PAGE_SIZE, totalBooks);
            
            if (fromIndex < totalBooks) {
                list = list.subList(fromIndex, toIndex);
            } else {
                list = list.subList(0, 0);
            }
        }
        // Xử lý lọc theo giá
        else if (priceFilter != null && !priceFilter.isEmpty() && !priceFilter.equals("all")) {
            list = dao.filterByPrice(priceFilter);
            totalBooks = list.size();
            
            int fromIndex = (page - 1) * PAGE_SIZE;
            int toIndex = Math.min(fromIndex + PAGE_SIZE, totalBooks);
            
            if (fromIndex < totalBooks) {
                list = list.subList(fromIndex, toIndex);
            } else {
                list = list.subList(0, 0);
            }
        }
        // Mặc định: hiển thị tất cả
        else {
            list = dao.getAllBooks(page, PAGE_SIZE);
            totalBooks = dao.getTotalBooks();
        }
        
        int totalPages = (int) Math.ceil((double) totalBooks / PAGE_SIZE);

        request.setAttribute("listBooks", list);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("search", search);
        request.setAttribute("priceFilter", priceFilter);
        
        request.getRequestDispatcher("base.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}