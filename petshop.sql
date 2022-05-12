-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 24, 2021 lúc 12:16 SA
-- Phiên bản máy phục vụ: 5.7.14
-- Phiên bản PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `petshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `title`) VALUES
(4, 'INABA'),
(5, 'VEGEBRAND'),
(6, 'ROYAL CANIN'),
(7, 'WHISKAS');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cat_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `title`) VALUES
(1, 'Thức ăn cho chó'),
(2, 'Thức ăn cho mèo'),
(3, 'Thức ăn cho thỏ'),
(4, 'Thức ăn cho chim');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_image`
--

CREATE TABLE `tbl_image` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_image`
--

INSERT INTO `tbl_image` (`id`, `name`, `url`) VALUES
(34, 'pate-cho', 'resources/images/product/pate-cho.jpg'),
(35, 'pate-meo', 'resources/images/product/pate-meo.jpg'),
(36, 'thuc-an-meo', 'resources/images/product/thuc-an-meo.jpg'),
(39, 'chimthucan', 'resources/images/product/chimthucan.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(100) NOT NULL COMMENT 'ID đơn hàng khách đặt',
  `fullname` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(250) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `price` int(20) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `fullname`, `phone`, `address`, `product_name`, `price`, `qty`) VALUES
(16, 'long', '123', 'háº§m sÃ i gÃ²n', 'Pate cho chó n??c s?t v? th?t bò PEDIGREE Pouch Beef', 25000, 3),
(17, 'long', '113', 'háº§m sÃ i gÃ²n', 'CÁM CHÍCH CHOÈ ANH THÔNG GÓI 150GR', 9000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `desc` varchar(250) DEFAULT NULL,
  `price` int(20) NOT NULL,
  `purchased` int(11) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `name`, `desc`, `price`, `purchased`, `brand_id`, `cat_id`) VALUES
(16, 'Pate cho chó nước sốt vị thịt bò PEDIGREE Pouch Beef', '', 25000, 0, 5, 1),
(17, 'Pate cho mèo vị nước sốt cá ngừ WHISKAS Tuna Flavour Sauce', '', 25000, 1, 7, 2),
(18, 'Thức ăn cho mèo con ROYAL CANIN Kitten', '', 100000, 2, 6, 2),
(21, 'CÁM CHÍCH CHOÈ ANH THÔNG GÓI 150GR', 'ngon', 9000, 0, 4, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `using_images`
--

CREATE TABLE `using_images` (
  `id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `using_images`
--

INSERT INTO `using_images` (`id`, `image_id`, `product_id`) VALUES
(14, 34, 16),
(15, 35, 17),
(16, 36, 18),
(19, 39, 21);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Chỉ mục cho bảng `tbl_image`
--
ALTER TABLE `tbl_image`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Chỉ mục cho bảng `using_images`
--
ALTER TABLE `using_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `image_id` (`image_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `tbl_image`
--
ALTER TABLE `tbl_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(100) NOT NULL AUTO_INCREMENT COMMENT 'ID đơn hàng khách đặt', AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT cho bảng `using_images`
--
ALTER TABLE `using_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `tbl_category` (`cat_id`),
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brand` (`brand_id`);

--
-- Các ràng buộc cho bảng `using_images`
--
ALTER TABLE `using_images`
  ADD CONSTRAINT `using_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`),
  ADD CONSTRAINT `using_images_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `tbl_image` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
