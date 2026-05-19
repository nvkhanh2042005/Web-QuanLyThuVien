<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký</title>
    <link rel="stylesheet" href="css/form.css">
</head>

<body>
    <div class="login-container">
        <h2>Đăng ký tài khoản</h2>

        <%
            String error = request.getParameter("error");

            if ("confirm".equals(error)) {
        %>
            <p style="color:red; text-align:center; font-weight:bold;">
                Mật khẩu xác nhận không khớp!
            </p>
        <%
            } else if ("exists".equals(error)) {
        %>
            <p style="color:red; text-align:center; font-weight:bold;">
                Tên đăng nhập đã tồn tại!
            </p>
        <%
            } else if ("fail".equals(error)) {
        %>
            <p style="color:red; text-align:center; font-weight:bold;">
                Đăng ký thất bại!
            </p>
        <%
            }
        %>

        <form action="Register" method="POST">
            <div class="form-group">
                <label>Họ tên:</label>
                <input type="text" name="fullname" required>
            </div>

            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required>
            </div>

            <div class="form-group">
                <label>Tên đăng nhập:</label>
                <input type="text" name="username" required>
            </div>

            <div class="form-group">
                <label>Mật khẩu:</label>
                <input type="password" name="password" required>
            </div>

            <div class="form-group">
                <label>Nhập lại mật khẩu:</label>
                <input type="password" name="confirmPassword" required>
            </div>

            <button type="submit">Đăng ký</button>
        </form>

        <p style="text-align:center; margin-top:15px;">
            Đã có tài khoản?
            <a href="dangnhap.jsp" style="color:#0084ff; font-weight:bold; text-decoration:none;">
                Đăng nhập
            </a>
        </p>

        <p style="text-align:center; margin-top:10px;">
            <a href="BookListServlet" style="color:#555; text-decoration:none;">
                ← Quay lại thư viện
            </a>
        </p>
    </div>
</body>
</html>