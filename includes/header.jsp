<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header">
    <a href="BookListServlet" class="logo" style="
        color: white;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 8px;
    ">
        <i class="fa-solid fa-book-open"></i>
        <span>Sách Online</span>
    </a>
    
    <form action="BookListServlet" method="GET" class="search-bar">
        <input type="text" name="search" placeholder="Nhập tiêu đề hoặc tác giả..." value="${param.search}">
        <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
    </form>
    
    <%
    String username = (String) session.getAttribute("username");
    %>

    <div class="user-actions">
        <% if (username == null) { %>
            <a href="dangnhap.jsp" class="btn-login"><i class="fa-solid fa-user"></i> Đăng nhập</a>
            <a href="dangky.jsp" class="btn-register"><i class="fa-solid fa-user-plus"></i> Đăng ký</a>
        <% } else { %>
            <span style="margin-right: 15px;">Xin chào, <strong><%= username %></strong></span>
            <a href="LogoutServlet" class="btn-logout"><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a>
        <% } %>
        
        <%
            java.util.Map cart = (java.util.Map) session.getAttribute("cart");
            int cartCount = 0;

            if (cart != null) {
                java.util.Collection values = cart.values();

                for (Object obj : values) {
                    model.CartItem item = (model.CartItem) obj;
                    cartCount += item.getQuantity();
                }
            }
        %>

        <a href="CartServlet?action=view" class="cart">
            <i class="fa-solid fa-cart-shopping"></i>
            <span class="cart-badge"><%= cartCount %></span>
        </a>
    </div>
</header>