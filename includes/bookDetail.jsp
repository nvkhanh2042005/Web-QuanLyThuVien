<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<div class="content-body" style="width: 100%; padding: 25px 20px;">

    <c:choose>
        <c:when test="${not empty book}">

            <div style="
                background: #fff;
                padding: 35px;
                border-radius: 14px;
                display: flex;
                gap: 45px;
                box-shadow: 0 4px 18px rgba(0,0,0,0.1);
                max-width: 1150px;
                margin: 0 auto;
                align-items: flex-start;
            ">

                <div style="flex: 1; max-width: 360px;">
                    <img src="images/${book.imageName}" 
                         alt="${book.title}" 
                         style="
                            width: 100%;
                            height: auto;
                            border-radius: 10px;
                            border: 1px solid #eee;
                            box-shadow: 0 2px 10px rgba(0,0,0,0.12);
                            object-fit: cover;
                         ">
                </div>

                <div style="flex: 2; min-width: 0;">

                    <h1 style="
                        margin-bottom: 25px;
                        color: #222;
                        font-size: 34px;
                        line-height: 1.3;
                    ">
                        ${book.title}
                    </h1>

                    <div style="margin-bottom: 16px; font-size: 19px;">
                        <strong style="color: #555;">Tác giả:</strong>
                        <span style="color: #222;">
                            <c:choose>
                                <c:when test="${not empty book.tacgia}">
                                    ${book.tacgia}
                                </c:when>
                                <c:otherwise>
                                    Đang cập nhật
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>

                    <div style="margin-bottom: 16px; font-size: 19px;">
                        <strong style="color: #555;">Giá:</strong>
                        <span style="color: #ff424e; font-weight: bold; font-size: 27px;">
                            ${String.format("%,.0f", book.price)} ₫
                        </span>
                    </div>

                    <div style="margin-bottom: 16px; font-size: 19px;">
                        <strong style="color: #555;">Số lượng:</strong>
                        <span style="color: #222;">
                            <c:choose>
                                <c:when test="${book.soluong > 0}">
                                    ${book.soluong} cuốn
                                </c:when>
                                <c:otherwise>
                                    <span style="color: #ff424e; font-weight: bold;">Hết hàng</span>
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>

                    <div style="margin-bottom: 25px; font-size: 19px; line-height: 1.8;">
                        <strong style="color: #555;">Mô tả:</strong>

                        <p style="
                            margin-top: 10px;
                            color: #666;
                            text-align: justify;
                            max-width: 720px;
                        ">
                            <c:choose>
                                <c:when test="${not empty book.mota}">
                                    ${book.mota}
                                </c:when>
                                <c:otherwise>
                                    Chưa có mô tả cho cuốn sách này.
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>

                    <div style="
                        margin-top: 35px;
                        display: flex;
                        gap: 16px;
                        flex-wrap: wrap;
                        align-items: center;
                    ">

                        <c:choose>
                            <c:when test="${book.soluong > 0}">
                                <form action="CartServlet" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="bookId" value="${book.id}">

                                    <button type="submit" class="btn-buy" style="
                                        width: 220px;
                                        height: 50px;
                                        font-size: 18px;
                                        background-color: #0084ff;
                                        color: #fff;
                                        border: none;
                                        border-radius: 6px;
                                        cursor: pointer;
                                    ">
                                        <i class="fas fa-shopping-cart"></i> THÊM VÀO GIỎ
                                    </button>
                                </form>
                            </c:when>

                            <c:otherwise>
                                <button style="
                                            min-width: 235px;
                                            height: 55px;
                                            font-size: 18px;
                                            background: #ccc;
                                            color: #666;
                                            border: none;
                                            border-radius: 8px;
                                            cursor: not-allowed;
                                            font-weight: bold;
                                        " disabled>
                                    <i class="fas fa-shopping-cart"></i> HẾT HÀNG
                                </button>
                            </c:otherwise>
                        </c:choose>

                        <a href="BookListServlet"
                           style="
                               height: 55px;
                               min-width: 155px;
                               display: flex;
                               align-items: center;
                               justify-content: center;
                               color: #0084ff;
                               text-decoration: none;
                               border: 1px solid #0084ff;
                               border-radius: 8px;
                               font-weight: bold;
                               font-size: 17px;
                           ">
                            ← QUAY LẠI
                        </a>

                    </div>

                </div>
            </div>

        </c:when>

        <c:otherwise>
            <div style="
                text-align: center;
                width: 100%;
                padding: 60px;
                background: white;
                border-radius: 12px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            ">
                <h3 style="color: #ff424e;">
                    Rất tiếc, không tìm thấy thông tin chi tiết của sách này!
                </h3>

                <a href="BookListServlet"
                   style="
                       display: inline-block;
                       margin-top: 25px;
                       padding: 12px 25px;
                       background: #0084ff;
                       color: white;
                       text-decoration: none;
                       border-radius: 8px;
                       font-weight: bold;
                   ">
                    Quay lại trang chủ
                </a>
            </div>
        </c:otherwise>
    </c:choose>

</div>