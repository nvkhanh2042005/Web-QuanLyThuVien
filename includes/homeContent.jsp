<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<div class="content-body">
    <c:if test="${sessionScope.isAdmin}">
    <div class="form-container">
        <h2>Đăng ký Sách Mới</h2>
        
        <form action="UploadToDServlet" method="post" enctype="multipart/form-data">
            
            <div class="form-group">
                <input type="text" name="title" placeholder="Nhập tên sách..." required>
            </div>
            
            <div class="form-group">
                <input type="text" name="tacgia" placeholder="Nhập tên tác giả...">
            </div>
            
            <div class="form-group" style="display: flex; gap: 15px;">
                <input type="number" name="price" placeholder="Nhập giá bán..." required style="flex: 1;">
                <input type="number" name="soluong" placeholder="Số lượng..." required style="flex: 1;">
            </div>
            
            <div class="form-group">
                <textarea name="mota" placeholder="Nhập mô tả sách..." rows="4" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px; font-family: Arial, sans-serif;"></textarea>
            </div>
            
            <div class="form-group">
                <label class="file-upload-label">Chọn ảnh bìa:</label>
                <input type="file" name="fileAnh" accept="image/*" required>
            </div>
            
            <button type="submit" class="btn-save-drive">
                LƯU VÀO
            </button>
            
            <div style="text-align: center; margin-top: 15px;">
                <a href="BookListServlet" style="text-decoration: none; color: #666;">Quay lại danh sách</a>
            </div>
        </form>
    </div>
    </c:if>
    <h2 class="section-title">
        <c:choose>
            <c:when test="${not empty search}">
                KẾT QUẢ TÌM KIẾM: "${search}"
            </c:when>
            <c:when test="${not empty priceFilter && priceFilter != 'all'}">
                SÁCH 
                <c:choose>
                    <c:when test="${priceFilter == 'under_100'}">DƯỚI 100.000Đ</c:when>
                    <c:when test="${priceFilter == '100_300'}">100.000Đ - 300.000Đ</c:when>
                    <c:when test="${priceFilter == 'over_300'}">TRÊN 300.000Đ</c:when>
                </c:choose>
            </c:when>
            <c:otherwise>
                DANH MỤC SÁCH
            </c:otherwise>
        </c:choose>
    </h2>

    <div class="product-grid">
        <c:choose>
            <c:when test="${not empty listBooks}">
                <c:forEach var="b" items="${listBooks}">
                    <div class="book-card">
                        <a href="BookDetailServlet?id=${b.id}" class="card-img-link">
                            <div class="card-img-wrapper">
                                <img src="images/${b.imageName}" alt="${b.title}">
                            </div>
                        </a>
                        
                        <div class="card-info">
                            <a href="BookDetailServlet?id=${b.id}" class="book-title-link">
                                <h3 class="book-title">${b.title}</h3>
                            </a>
                            <div class="book-price">${String.format("%,.0f", b.price)} ₫</div>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="bookId" value="${b.id}">
                                <button type="submit" class="btn-buy">Mua ngay</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div style="grid-column: 1 / -1; text-align: center; padding: 50px; color: #999;">
                    <i class="fa-solid fa-book-open" style="font-size: 48px; margin-bottom: 15px;"></i>
                    <p style="font-size: 18px;">Không tìm thấy sách nào!</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    

    <c:if test="${totalPages > 1}">
        <div class="pagination">
            
            <c:set var="baseUrl" value="BookListServlet?" />
            <c:if test="${not empty search}">
                <c:set var="baseUrl" value="${baseUrl}search=${search}&" />
            </c:if>
            <c:if test="${not empty priceFilter && priceFilter != 'all'}">
                <c:set var="baseUrl" value="${baseUrl}price_filter=${priceFilter}&" />
            </c:if>
            
            <c:if test="${currentPage > 1}">
                <a href="${baseUrl}page=1" class="page-btn">&laquo; Đầu</a>
                <a href="${baseUrl}page=${currentPage - 1}" class="page-btn">&lsaquo; Trước</a>
            </c:if>

            <c:set var="startPage" value="${currentPage - 2}" />
            <c:if test="${startPage < 1}">
                <c:set var="startPage" value="1" />
            </c:if>

            <c:set var="endPage" value="${currentPage + 2}" />
            <c:if test="${endPage > totalPages}">
                <c:set var="endPage" value="${totalPages}" />
            </c:if>

            <c:if test="${startPage > 1}">
                <span class="ellipsis">...</span>
            </c:if>

            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                <a href="${baseUrl}page=${i}" class="page-btn ${i == currentPage ? 'active' : ''}">${i}</a>
            </c:forEach>

            <c:if test="${endPage < totalPages}">
                <span class="ellipsis">...</span>
            </c:if>

            <c:if test="${currentPage < totalPages}">
                <a href="${baseUrl}page=${currentPage + 1}" class="page-btn">Sau &rsaquo;</a>
                <a href="${baseUrl}page=${totalPages}" class="page-btn">Cuối &raquo;</a>
            </c:if>
        </div>
    </c:if>
</div>