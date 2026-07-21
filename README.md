# Web-QuanLyThuVien
# 📚 Quản Lý Thư Viện(Book Store Management)

Website quản lý và bán sách được xây dựng bằng **Java Servlet + JSP + MySQL** theo mô hình **MVC**, hỗ trợ xem sách, tìm kiếm, đăng nhập, đăng ký, giỏ hàng và thanh toán.

---

## 🚀 Công nghệ sử dụng

- Java JDK 17+
- Jakarta Servlet
- JSP
- HTML5
- CSS3
- MySQL
- NetBeans IDE
- GlassFish Server 7

---

## 📂 Cấu trúc dự án

```
QuanLySach
│
├── src/
│   ├── controller/      # Servlet xử lý nghiệp vụ
│   ├── model/           # DAO, Model, DBContext
│   └── conf/
│
├── web/
│   ├── css/
│   ├── images/
│   ├── includes/
│   ├── WEB-INF/
│   └── *.jsp
│
├── build.xml
└── nbproject/
```

---

## ✨ Chức năng chính

### 👤 Người dùng

- Đăng ký tài khoản
- Đăng nhập / Đăng xuất
- Xem danh sách sách
- Xem chi tiết sách
- Tìm kiếm sách
- Lọc theo giá
- Phân trang
- Thêm sách vào giỏ hàng
- Xem giỏ hàng
- Thanh toán

---

## ⚙️ Cấu hình Database

Trong file

```
src/java/model/DBContext.java
```

Sửa thông tin kết nối nếu cần.

```java
String url = "jdbc:mysql://localhost:3306/qlthuvien";
String username = "root";
String password = "";
```

Sau đó import cơ sở dữ liệu **qlthuvien** vào MySQL.

---

## ▶️ Cách chạy dự án

### 1. Clone project

```bash
git clone https://github.com/USERNAME/QuanLySach.git
```

### 2. Mở bằng NetBeans

```
File
→ Open Project
→ QuanLySach
```

### 3. Cấu hình

- Cài JDK 17
- Cài GlassFish Server 7
- Cài MySQL
- Import database `qlthuvien`

### 4. Run

```
Run Project
```

Truy cập

```
http://localhost:8080/QuanLySach/
```

---

## 📁 Một số Servlet

- BookListServlet
- BookDetailServlet
- LoginServlet
- RegisterServlet
- LogoutServlet
- CartServlet
- CheckoutServlet
- UploadToDServlet

---

## 🛠 Mô hình MVC

```
Client
   │
   ▼
Servlet (Controller)
   │
   ▼
DAO (Model)
   │
   ▼
MySQL
   │
   ▼
JSP (View)
```

---

## 📸 Giao diện

Project bao gồm các trang:

- Trang chủ
- Đăng nhập
- Đăng ký
- Danh sách sách
- Chi tiết sách
- Giỏ hàng
- Thanh toán

---

## 👨‍💻 Tác giả

**Nguyễn Văn Khánh**

Sinh viên Công nghệ thông tin

---

## 📄 License

Dự án được thực hiện phục vụ mục đích học tập và nghiên cứu.
