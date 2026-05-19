<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="css/form.css"> </head>
<body>
    <div class="login-container">
        <h2>Đăng nhập hệ thống</h2>
        <%
            String register = request.getParameter("register");
            if ("success".equals(register)) {
        %>
            <p style="color: green; text-align: center; font-weight: bold;">
                Đăng ký thành công! Vui lòng đăng nhập.
            </p>
        <%
            }
        %>
        <form action="Login" method="POST">
            <div class="form-group">
                <label>Tên đăng nhập:</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>Mật khẩu:</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit">Đăng nhập</button>
        </form>
        <%-- Phần hiển thị thông báo --%>
        <%
            String error = request.getParameter("error");
            if ("login_required".equals(error)) {
        %>
            <div style="color: red; text-align: center; margin-bottom: 20px; font-weight: bold; background: #ffe6e6; padding: 10px; border-radius: 5px;">
                ⚠️ Vui lòng đăng nhập để thêm sách!
            </div>
        <% 
            } else if (error != null) { 
        %>
            <p style="color: red; text-align: center;">Tên đăng nhập hoặc mật khẩu không đúng!</p>
        <% 
            } 
        %>
    </div>
</body>
</html>