<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="sidebar">
    <form action="BookListServlet" method="GET">
        <div class="filter-group">
            <h3>Lọc theo giá</h3>
            <ul>
                <li>
                    <label>
                        <input type="radio" name="price_filter" value="all" ${empty param.price_filter || param.price_filter == 'all' ? 'checked' : ''}> Tất cả
                    </label>
                </li>
                <li>
                    <label>
                        <input type="radio" name="price_filter" value="under_100" ${param.price_filter == 'under_100' ? 'checked' : ''}> Dưới 100.000đ
                    </label>
                </li>
                <li>
                    <label>
                        <input type="radio" name="price_filter" value="100_300" ${param.price_filter == '100_300' ? 'checked' : ''}> 100.000 - 300.000đ
                    </label>
                </li>
                <li>
                    <label>
                        <input type="radio" name="price_filter" value="over_300" ${param.price_filter == 'over_300' ? 'checked' : ''}> Trên 300.000đ
                    </label>
                </li>
            </ul>
        </div>

        <div class="filter-group border-top">
            <h3>Lọc theo giá</h3>
            <button type="submit" class="btn-apply">Áp dụng</button>
        </div>
    </form>
</aside>