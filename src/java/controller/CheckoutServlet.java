package controller;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.CartItem;
import model.OrderDAO;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("dangnhap.jsp?error=login_required");
            return;
        }

        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("CartServlet?action=view");
            return;
        }

        OrderDAO dao = new OrderDAO();

        boolean success = dao.checkout(username, cart);

        if (success) {
            cart.clear();
            session.setAttribute("checkoutSuccess", "Thanh toán thành công!");
        } else {
            session.setAttribute("checkoutError", "Thanh toán thất bại! Có thể sách không đủ số lượng.");
        }

        response.sendRedirect("CartServlet?action=view");
    }
}