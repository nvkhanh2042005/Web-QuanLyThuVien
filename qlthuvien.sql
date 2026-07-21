-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 19, 2026 lúc 04:49 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlthuvien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `tacgia` varchar(30) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `mota` varchar(1000) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`id`, `title`, `tacgia`, `price`, `image_name`, `mota`, `soluong`) VALUES
(1, 'Nhà Giả Kim', 'Kaisa', 36000.00, '1.jpg', 'Hành trình theo đuổi ước mơ và bài học về việc lắng nghe tiếng gọi trái tim.', 15),
(2, 'Cha Giàu Cha Nghèo', 'Shinobi', 20000.00, '2.jpg\r\n\r\n', 'Cuốn sách kinh điển thay đổi tư duy về tiền bạc và tự do tài chính.', 2),
(3, 'Chiếc bật lửa và váy công chúa', 'Xa Vắng', 40000.00, '3.jpg', 'Câu chuyện tình yêu thanh xuân rực rỡ, góc cạnh nhưng cũng đầy sâu lắng.', 9),
(4, 'Tháp Rơi Tự Do', 'Hiraku', 24000.00, '4.jpg', 'Trải nghiệm cảm giác mạnh với những tình tiết kịch tính, nghẹt thở đến phút chót.', 9),
(5, 'Khó dỗ dành', 'Onikia', 25000.00, '5.jpg', 'Chuyện tình oan gia ngõ hẹp siêu ngọt ngào đốn tim mọi độc giả.', 25),
(6, 'Hacker Lỏ xưng bá Lobby', 'Ngọc Đô', 30123.00, '6.jpg', 'Góc nhìn hài hước, dở khóc dở cười về thế giới game thủ và những pha xử lý \"đi vào lòng đất\".', 18),
(7, 'Cậu bé lập trình trong thời đại AI', 'Vibe Coding', 18036.00, '7.jpg', 'Cẩm nang truyền cảm hứng và đánh thức đam mê công nghệ cho thế hệ trẻ.', 100),
(8, 'Sinh viên IT năm cuối may mắn', 'ĐH UNETI', 101010.01, '8.jpg', 'Những câu chuyện \"cười ra nước mắt\" về đồ án, fix bug và hi vọng ra trường đúng hạn.', 2),
(9, 'Naruto Shippuden', 'Kishimoto Masashi', 12345.00, '9.jpg', 'Huyền thoại về chặng đường trưởng thành của cậu bé ninja làng Lá mang trong mình Cửu Vĩ.', 300),
(10, 'Boruto Bỏ làng và cái kết', 'Kishimoto Masashi', 12231.00, '10.jpg', 'Một góc nhìn chế cháo đầy phá cách và tấu hài về thế hệ nhẫn giả tiếp theo.', 199),
(11, 'Giá như tôi chọn HUST', 'PKK2023', 888888.88, '11.png', 'Nỗi niềm trăn trở, nuối tiếc pha chút hài hước về thanh xuân và ngưỡng cửa đại học Bách Khoa.', 1),
(12, 'Doraemon và đám bạn khờ', ' Fujiko Fujio', 789654.00, '12.jpg', 'Tấm vé trở về tuổi thơ trọn vẹn với những bảo bối thần kỳ và tình bạn ngây ngô.', 12),
(13, 'Kudo Shinichi trở lại', 'Gosho Aoyama', 31003.00, '13.jpg', 'Cuộc đấu trí đỉnh cao và hành trình tìm lại thân phận thật của chàng thám tử trung học.', 1052),
(14, 'Thằng An Thiên 29C1', 'An Thuyên', 293817.00, '14.jpg', 'Hồi ký học đường siêu lầy lội và những trò nhất quỷ nhì ma của nam sinh lớp 29C1.', 2938),
(16, 'LaptopDell', 'KhanhsDZ', 18000000.00, '1778558457013_Screenshot 2026-03-12 210410.png', 'Laptop Dell Latide khang dinh thuong hieu', 3),
(17, 'Tin 17a2', 'Thuỵ Ánh', 55500.00, '1778558757884_Screenshot 2025-11-27 133423.png', 'thầy tôi chưa biết mặt', 5),
(18, 'Tuần Sau Vấn Đáp Cuối Kì', 'Doãn Thuý Hiền', 666666.00, '1779150748363_UseCaseTQ.png', 'Vậy là từ tuần sau sẽ bắt đầu vấn đáp lấy điểm cuối kì môn Thực hành Java Web.Nội dung xoay quanh bài đã làm, Luồng xử lý -> Servlet dùng Post/Get hay cả 2, click các nút sẽ dẫn tới đâu, JSP -> JSP và vào các Servlet nào . Cần phân tích và hiểu rõ hệ thống của bài', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `total_price` decimal(12,2) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'Đã thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `username`, `total_price`, `order_date`, `status`) VALUES
(1, 'vankhanh', 20000.00, '2026-05-19 08:29:25', 'Đã thanh toán'),
(2, 'vankhanh', 44000.00, '2026-05-19 08:30:51', 'Đã thanh toán'),
(3, 'vankhanh', 666666.00, '2026-05-19 08:31:18', 'Đã thanh toán'),
(4, 'vankhanh', 32231.00, '2026-05-19 08:32:01', 'Đã thanh toán');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `book_id`, `quantity`, `price`, `subtotal`) VALUES
(1, 1, 2, 1, 20000.00, 20000.00),
(2, 2, 2, 1, 20000.00, 20000.00),
(3, 2, 4, 1, 24000.00, 24000.00),
(4, 3, 18, 1, 666666.00, 666666.00),
(5, 4, 2, 1, 20000.00, 20000.00),
(6, 4, 10, 1, 12231.00, 12231.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`username`, `password`, `role`) VALUES
('vankhanh', '123456', 'admin');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
