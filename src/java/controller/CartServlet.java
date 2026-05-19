package controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Book;
import model.BookDAO;
import model.CartItem;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processCart(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processCart(request, response);
    }

    private void processCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new LinkedHashMap<>();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");

        if (action == null) {
            action = "view";
        }

        switch (action) {
            case "add":
                addToCart(request, cart);
                response.sendRedirect("CartServlet?action=view");
                break;

            case "remove":
                removeFromCart(request, cart);
                response.sendRedirect("CartServlet?action=view");
                break;

            case "update":
                updateCart(request, cart);
                response.sendRedirect("CartServlet?action=view");
                break;

            case "clear":
                cart.clear();
                response.sendRedirect("CartServlet?action=view");
                break;

            case "view":
            default:
                request.setAttribute("view", "includes/cart.jsp");
                request.getRequestDispatcher("base.jsp").forward(request, response);
                break;
        }
    }

    private void addToCart(HttpServletRequest request, Map<Integer, CartItem> cart) {
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));

            BookDAO dao = new BookDAO();
            Book book = dao.getBookById(bookId);

            if (book == null) {
                return;
            }

            if (cart.containsKey(bookId)) {
                CartItem item = cart.get(bookId);
                item.setQuantity(item.getQuantity() + 1);
            } else {
                cart.put(bookId, new CartItem(book, 1));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void removeFromCart(HttpServletRequest request, Map<Integer, CartItem> cart) {
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            cart.remove(bookId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateCart(HttpServletRequest request, Map<Integer, CartItem> cart) {
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (cart.containsKey(bookId)) {
                if (quantity <= 0) {
                    cart.remove(bookId);
                } else {
                    cart.get(bookId).setQuantity(quantity);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}