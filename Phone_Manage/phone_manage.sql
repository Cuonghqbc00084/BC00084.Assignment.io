-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 07, 2023 lúc 08:23 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phone_manage`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `adminaccount`
--
  
CREATE TABLE `adminaccount` (
  `admin_username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_fullname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `adminaccount`
--

INSERT INTO `adminaccount` (`admin_username`, `admin_password`, `admin_fullname`) VALUES
('Admin 01', '14e1b600b1fd579f47433b88e8d85291', 'Admin Cuong'),
('Admin 02', '14e1b600b1fd579f47433b88e8d85291', 'Admin BTEC');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_message` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_name`, `contact_email`, `contact_title`, `contact_message`, `contact_time`) VALUES
(1, 'User 01', 'user1@gmail.com', 'Help me', 'Please direct me to see detailed product information, thank you.', '2022-12-05'),
(3, 'User 03', 'user03@btec.com', 'Evaluated', 'Products of the website are good, reasonable prices, convenient to buy, I will come back to buy here.', '2022-12-06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `create_date` date NOT NULL DEFAULT current_timestamp(),
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `invoice`
--

INSERT INTO `invoice` (`id`, `user_id`, `total_price`, `create_date`, `address`) VALUES
(4, 1, 50000, '2022-12-03', 'KP Phước Thành Lập, Thị trấn Gò Quao, Kiên Giang'),
(5, 2, 210000, '2022-12-03', '38 Lê Văn Sĩ, quận 5, TP Hồ Chí Minh'),
(6, 3, 40000, '2022-12-04', '44 Đ. Nguyễn Khuyến, Tân An, Ninh Kiều, Cần Thơ, Vietnam'),
(7, 4, 42000, '2022-12-04', 'Floor 2 at Q Industries Vietnam Lot 9, road 7, Quận 7, Thành phố Hồ Chí Minh, Vietnam'),
(8, 1, 80000, '2022-12-06', 'KP Phước Thành Lập, Thị trấn Gò Quao, Kiên Giang'),
(9, 1, 40000, '2022-12-08', 'KP Phước Thành Lập, Thị trấn Gò Quao, Kiên Giang');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `invoice_detail`
--

INSERT INTO `invoice_detail` (`id`, `product_id`, `quantity`, `invoice_id`) VALUES
(1, 78, 3, 4),
(2, 82, 2, 4),
(3, 88, 2, 5),
(4, 82, 3, 5),
(5, 80, 5, 5),
(6, 78, 1, 6),
(7, 81, 1, 6),
(8, 78, 3, 7),
(9, 80, 1, 7),
(10, 78, 2, 8),
(18, 78, 1, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_description` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `product_description`, `product_image`) VALUES
(78, 'Mac Book', 40000, 'Apple M1', 'Images/1690514341-App.png'),
(80, 'Acer', 12000, 'Asprie 7', 'Images/1670174429-acer-aspire-7-gaming-a715-42g-removebg-preview.png'),
(81, 'HP', 30000, 'Victus 16', 'Images/1670174442-hp-victus-16-d0292tx-i5-removebg-preview.png'),
(82, 'Asus', 20000, 'Vivo book', 'Images/1670174464-asus-vivobook-15x-oled--removebg-preview.png'),
(83, 'MSI', 24000, 'GF63 Thin', 'Images/1670174501-msi-gaming-gf63-thin--removebg-preview.png'),
(84, 'Lenovo', 25000, 'Yoga 7', 'Images/1670174523-lenovo-yoga-duet-7-13itl6-i7-removebg-preview.png'),
(85, 'Dell', 12000, 'G15', 'Images/1670174535-dell-gaming-g15-5515-r5-p105f004dgr-291121-114930-600x600-removebg-preview.png'),
(87, 'Acer', 20000, 'Nitro 5', 'Images/1670174559-Acernitro5-removebg-preview.png'),
(88, 'Lenovo', 60000, 'Legion 5', 'Images/1670174570-lenovo-legion-5-15iah7-i5-82rc003wvn-a-thumb-600x600-removebg-preview.png'),
(95, 'Bánh xèo', 20000, 'adsds', 'Images/1691369661-about.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(9) NOT NULL,
  `user_fullname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_phonenumber` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `user_fullname`, `user_email`, `user_phonenumber`, `user_password`, `user_address`, `user_status`) VALUES
(1, 'User 01', 'user1@btec.com', '0396514864', 'e10adc3949ba59abbe56e057f20f883e', 'KP Phước Thành Lập, Thị trấn Gò Quao, Kiên Giang', 1),
(2, 'User 02', 'user2@btecct.com', '0393569978', 'e10adc3949ba59abbe56e057f20f883e', '38 Lê Văn Sĩ, quận 5, TP Hồ Chí Minh', 1),
(3, 'User 03', 'user03@btec.com', '03513215462', 'e40f01afbb1b9ae3dd6747ced5bca532', '44 Đ. Nguyễn Khuyến, Tân An, Ninh Kiều, Cần Thơ, Vietnam', 1),
(4, 'User 04', 'user04@gmail.com', '0393459983', '25d55ad283aa400af464c76d713c07ad', '72 Bùi Tá Hán, Khuê Mỹ, Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 1),
(5, 'User 05', 'user05@btec.com', '0355646546', '62146513132', 'Floor 2 at Q Industries Vietnam Lot 9, road 7, Quận 7, Thành phố Hồ Chí Minh, Vietnam', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `adminaccount`
--
ALTER TABLE `adminaccount`
  ADD PRIMARY KEY (`admin_username`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Chỉ mục cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `invoice_detail_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `invoice_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
