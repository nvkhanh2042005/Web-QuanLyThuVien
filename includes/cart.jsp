<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<div class="content-body">

    <h2 class="section-title">GIỎ HÀNG CỦA BẠN</h2>
    <c:if test="${not empty sessionScope.checkoutSuccess}">
        <div style="background:#d4edda; color:#155724; padding:15px; border-radius:6px; margin-bottom:20px; font-weight:bold;">
            ${sessionScope.checkoutSuccess}
        </div>
        <c:remove var="checkoutSuccess" scope="session" />
    </c:if>

    <c:if test="${not empty sessionScope.checkoutError}">
        <div style="background:#f8d7da; color:#721c24; padding:15px; border-radius:6px; margin-bottom:20px; font-weight:bold;">
            ${sessionScope.checkoutError}
        </div>
        <c:remove var="checkoutError" scope="session" />
    </c:if>
    <c:choose>
        <c:when test="${empty sessionScope.cart}">
            <div style="
                background: white;
                padding: 50px;
                text-align: center;
                border-radius: 10px;
                box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            ">
                <i class="fa-solid fa-cart-shopping" style="font-size: 50px; color: #999;"></i>
                <h3 style="margin-top: 20px; color: #555;">Giỏ hàng đang trống</h3>

                <a href="BookListServlet" style="
                    display: inline-block;
                    margin-top: 25px;
                    padding: 12px 25px;
                    background: #0084ff;
                    color: white;
                    text-decoration: none;
                    border-radius: 6px;
                    font-weight: bold;
                ">
                    Tiếp tục mua sách
                </a>
            </div>
        </c:when>

        <c:otherwise>

            <table style="
                width: 100%;
                border-collapse: collapse;
                background: white;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            ">
                <thead>
                    <tr style="background: #0084ff; color: white;">
                        <th style="padding: 14px;">Ảnh</th>
                        <th style="padding: 14px;">Tên sách</th>
                        <th style="padding: 14px;">Giá</th>
                        <th style="padding: 14px;">Số lượng</th>
                        <th style="padding: 14px;">Thành tiền</th>
                        <th style="padding: 14px;">Xóa</th>
                    </tr>
                </thead>

                <tbody>
                    <c:set var="total" value="0" />

                    <c:forEach var="entry" items="${sessionScope.cart}">
                        <c:set var="item" value="${entry.value}" />
                        <c:set var="subTotal" value="${item.book.price * item.quantity}" />
                        <c:set var="total" value="${total + subTotal}" />

                        <tr style="border-bottom: 1px solid #eee;">
                            <td style="padding: 12px; text-align: center;">
                                <img src="images/${item.book.imageName}" style="
                                    width: 70px;
                                    height: 90px;
                                    object-fit: contain;
                                ">
                            </td>

                            <td style="padding: 12px; font-weight: bold;">
                                ${item.book.title}
                            </td>

                            <td style="padding: 12px; color: #d70018; font-weight: bold;">
                                ${String.format("%,.0f", item.book.price)} ₫
                            </td>

                            <td style="padding: 12px; text-align: center;">
                                <form action="CartServlet" method="post" style="display: flex; gap: 6px; justify-content: center;">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="bookId" value="${item.book.id}">

                                    <input type="number" name="quantity" value="${item.quantity}" min="1" style="
                                        width: 65px;
                                        padding: 6px;
                                        border: 1px solid #ccc;
                                        border-radius: 4px;
                                        text-align: center;
                                    ">

                                    <button type="submit" style="
                                        padding: 6px 10px;
                                        background: #28a745;
                                        color: white;
                                        border: none;
                                        border-radius: 4px;
                                        cursor: pointer;
                                    ">
                                        Cập nhật
                                    </button>
                                </form>
                            </td>

                            <td style="padding: 12px; color: #d70018; font-weight: bold;">
                                ${String.format("%,.0f", subTotal)} ₫
                            </td>

                            <td style="padding: 12px; text-align: center;">
                                <a href="CartServlet?action=remove&bookId=${item.book.id}" style="
                                    color: white;
                                    background: #dc3545;
                                    padding: 8px 12px;
                                    border-radius: 4px;
                                    text-decoration: none;
                                    font-weight: bold;
                                ">
                                    Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div style="
                margin-top: 25px;
                background: white;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 3px 10px rgba(0,0,0,0.08);
                text-align: right;
            ">
                <h2 style="color: #d70018; margin-bottom: 20px;">
                    Tổng tiền: ${String.format("%,.0f", total)} ₫
                </h2>

                <a href="BookListServlet" style="
                    display: inline-block;
                    padding: 12px 22px;
                    border: 1px solid #0084ff;
                    color: #0084ff;
                    text-decoration: none;
                    border-radius: 6px;
                    font-weight: bold;
                    margin-right: 10px;
                ">
                    Tiếp tục mua
                </a>

                <a href="CartServlet?action=clear" style="
                    display: inline-block;
                    padding: 12px 22px;
                    background: #dc3545;
                    color: white;
                    text-decoration: none;
                    border-radius: 6px;
                    font-weight: bold;
                    margin-right: 10px;
                ">
                    Xóa giỏ hàng
                </a>

                <a href="CheckoutServlet" style="
                    display: inline-block;
                    padding: 12px 22px;
                    background: #0084ff;
                    color: white;
                    text-decoration: none;
                    border-radius: 6px;
                    font-weight: bold;
                ">
                    Thanh toán
                </a>
            </div>

        </c:otherwise>
    </c:choose>

</div>