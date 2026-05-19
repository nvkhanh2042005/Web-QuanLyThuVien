package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.BookDAO;

@WebServlet("/BookDetailServlet")
public class BookDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            BookDAO dao = new BookDAO();
            Book book = dao.getBookById(Integer.parseInt(idParam));
            request.setAttribute("book", book);
        }

        request.setAttribute("hideSidebar", true);
        request.setAttribute("view", "includes/bookDetail.jsp");

        request.getRequestDispatcher("base.jsp").forward(request, response);
    }
}