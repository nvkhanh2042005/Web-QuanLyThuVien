package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.UserDAO;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

       
        if (!password.equals(confirmPassword)) {

            response.sendRedirect("dangky.jsp?error=confirm");

            return;
        }

        UserDAO dao = new UserDAO();

        
        if (dao.checkUsernameExists(username)) {

            response.sendRedirect("dangky.jsp?error=exists");

            return;
        }

        
        boolean success = dao.register(username, password);

        if (success) {

            response.sendRedirect("dangnhap.jsp?register=success");

        } else {

            response.sendRedirect("dangky.jsp?error=fail");
        }
    }
}