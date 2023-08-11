-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2023 at 06:21 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lego_manage`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminaccount`
--

CREATE TABLE `adminaccount` (
  `admin_username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_fullname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adminaccount`
--

INSERT INTO `adminaccount` (`admin_username`, `admin_password`, `admin_fullname`) VALUES
('Admin 01', '14e1b600b1fd579f47433b88e8d85291', 'Admin Cuong'),
('Admin 02', '14e1b600b1fd579f47433b88e8d85291', 'Admin BTEC');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
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
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_name`, `contact_email`, `contact_title`, `contact_message`, `contact_time`) VALUES
(1, 'User 01', 'user1@gmail.com', 'Help me', 'Please direct me to see detailed product information, thank you.', '2022-12-05'),
(3, 'User 03', 'user03@btec.com', 'Evaluated', 'Products of the website are good, reasonable prices, convenient to buy, I will come back to buy here.', '2022-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `create_date` date NOT NULL DEFAULT current_timestamp(),
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice`
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
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_detail`
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
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_description` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `product_description`, `product_image`) VALUES
(78, 'F1', 209000, 'Speed Racing Car', 'Images/1691723921-lego f1.jpg'),
(80, 'Lego Vespa 125', 3199000, 'Build and display your own model version of an Italian icon with this LEGO® Vespa 125 inspired by the classic 1960s Vespa.', 'Images/1691723959-lego spaceship.jpg'),
(81, 'Lego Tranquil Garden	', 2999000, 'Create an enchanting display for the home or office with the LEGO® Icons Tranquil Garden building project for adults	', 'Images/1691724023-lego house.jpg'),
(82, 'Lego Beach Buggy Fun	', 263000, 'Introduce kids to modern friendship stories with the new generation of LEGO® Friends sets and its diverse cast of characters	', 'Images/1691724069-lego buggy.jpg'),
(83, 'Lego Succulents	', 1599000, 'Enjoy a rewarding building project, creating a succulents plant display to enhance your home or office decor.	', 'Images/1691724122-lego lotus.jpg'),
(84, 'Lego Vespa 125	', 3199000, 'Build and display your own model version of an Italian icon with this LEGO® Vespa 125 inspired by the classic 1960s Vespa.	', 'Images/1691724155-legovespa.jpg'),
(85, 'Rocket Launch Centre', 3289000, 'Launch kids’ imaginative play into orbit with the Rocket Launch Centre playset – packed with realistic NASA-inspired details.', 'Images/1691724524-nasa rocket.jpg'),
(87, 'Rocket Launch Centre', 769000, 'You were born to explore the universe! Build and inspire the next generation of astronauts with LEGO® Space rockets and vehicle', 'Images/1691724686-lego nasa.jpg'),
(88, 'Lego BMW M 1000 RR', 8199000, 'Experience building instructions that follow the order of the actual assembly line process.', 'Images/1691724547-moto bmw.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_fullname`, `user_email`, `user_phonenumber`, `user_password`, `user_address`, `user_status`) VALUES
(1, 'User 01', 'user1@btec.com', '0396514864', 'e10adc3949ba59abbe56e057f20f883e', 'Phuoc Thanh Lap Neighbourhood, Go Quao Town, Kien Giang Province', 1),
(2, 'User 02', 'user2@btecct.com', '0393569978', 'e10adc3949ba59abbe56e057f20f883e', '38 Lê Văn Sĩ, quận 5, TP Hồ Chí Minh', 1),
(3, 'User 03', 'user03@btec.com', '03513215462', 'e40f01afbb1b9ae3dd6747ced5bca532', '44 Đ. Nguyễn Khuyến, Tân An, Ninh Kiều, Cần Thơ, Vietnam', 1),
(4, 'User 04', 'user04@gmail.com', '0393459983', '25d55ad283aa400af464c76d713c07ad', '72 Bùi Tá Hán, Khuê Mỹ, Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 1),
(5, 'User 05', 'user05@btec.com', '0355646546', 'e10adc3949ba59abbe56e057f20f883e', 'Floor 2 at Q Industries Vietnam Lot 9, road 7, Quận 7, Thành phố Hồ Chí Minh, Vietnam', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminaccount`
--
ALTER TABLE `adminaccount`
  ADD PRIMARY KEY (`admin_username`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `invoice_detail_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `invoice_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
