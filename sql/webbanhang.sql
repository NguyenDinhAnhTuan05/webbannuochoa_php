-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2025 at 09:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webbanhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `email`, `fullname`, `phone`, `address`, `is_admin`, `money`, `created_at`) VALUES
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@example.com', 'Administrator', '', '', 1, 0, '2025-02-20 05:46:46'),
(2, 'admin1', '$2y$10$1X/QiD5xIhxltKpKTZWAh.nUwiaPzF/RYo1iHPehSc7m0DvZ0s25a', '', 'Nguyễn Đình Anh Tuấn', '0398702156', 'Nam cao', 0, 0, '2025-02-20 14:39:42'),
(3, 'admin11', '$2y$10$HOAJDelyHrrojMeK3gOeWu6CHe.PEQmAywBlTWwE2zU93WNO.I8R.', 'dzlataozd@gmail.com', 'Nguyễn Đình Anh Tuấn', '0398702156', 'Nam cao', 0, 22020000, '2025-02-20 16:34:41'),
(4, 'admin111', '$2y$10$ZF52h6RbFR5DDZZmFUBgrOXtje4bnJbbpqPONdMFwEJ.DDeqhLdv2', 'nguyentuan834897@gmail.com', 'Nguyễn Đình Anh Tuấn', '0398702156', 'Nam cao', 1, 0, '2025-02-22 02:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `all_product`
--

CREATE TABLE `all_product` (
  `id_product` int(11) NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `link_product` varchar(255) DEFAULT NULL,
  `describe_product` text DEFAULT NULL,
  `price_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `type_product` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `views` int(11) DEFAULT 0,
  `featured` tinyint(1) DEFAULT 0,
  `discount_percent` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `all_product`
--

INSERT INTO `all_product` (`id_product`, `name_product`, `link_product`, `describe_product`, `price_product`, `quantity`, `type_product`, `brand_id`, `status`, `views`, `featured`, `discount_percent`, `created_at`) VALUES
(48, 'Nước Hoa Nữ Chanel Gabrielle Essence', '/images/NướcHoaNữChanelGabrielleEssence_nuoc-hoa-nu-chanel-gabrielle-essence-1.jpg', 'Lưu hương:  7 giờ đến 12 giờ\nGiới tính: Nữ\nNhóm hương: Hoa Ngọc Lan Tây\nNhóm hương: hoa huệ\nNhóm hương: Hương citrus ( cam chanh )\nNồng độ: Eau De Parfum (EDP)\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2019\nToả hương: Thoang thoảng, dịu nhẹ xung quanh\nHương đầu: Cam chanh, Đào, Lá chanh, Nho đen, Quả mọng\nHương giữa: Dừa, Hoa cam, Hoa huệ, Hoa nhài, Hoa trắng, Ngọc lan tây\nHương cuối: Đàn hương, vanilla, Xạ hương\nXuất xứ: France', 1500000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:18:32'),
(49, 'Nước Hoa Nữ Chanel Chance EDP', '/images/NướcHoaNữChanelChanceEDP_nuoc-hoa-nu-chanel-chance-edp-1.jpg', 'Lưu hương:  Dưới 1 giờ\nGiới tính: Nữ\nNhóm hương: Hoắc hương\nNhóm hương: Hoa nhài\nNhóm hương: Xạ hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nữ tính, Quyến rũ, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2003\nNhà pha chế: Gabrielle Bonheur Chanel\nToả hương: Rất gần – Thoang thoảng trên làn da\nHương đầu: Hồng tiêu\nHương giữa: Cây diên vĩ, Hoa nhài\nHương cuối: Hoắc Hương, vanilla, Xạ hương', 4500000, 10000, 2, 14, 1, 1, 0, 0, '2025-02-24 03:18:35'),
(50, 'Nước Hoa Nữ Chanel Chance Eau Tendre EDP', '/images/NướcHoaNữChanelChanceEauTendreEDP_nuoc-hoa-nu-chanel-chance-eau-tendre-edp.jpg', 'Lưu hương:  4 đến 6 giờ\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ trái cây\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Ngọt ngào, Nữ tính\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2019\nToả hương: Rất gần – Thoang thoảng trên làn da\nHương đầu: Quả bưởi, Quả mộc qua\nHương giữa: Hoa hồng, Hoa nhài\nHương cuối: Xạ hương trắng', 4000000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:18:38'),
(51, 'Nước Hoa Nữ Chanel Coco Mademoiselle EDP', '/images/NướcHoaNữChanelCocoMademoiselleEDP_nuoc-hoa-nu-chanel-coco-mademoiselle-edp-1.jpg', 'Lưu hương: Trên 12 giờ\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ SÍP\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Quyến rũ, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2001\nNhà pha chế: Jacques Polge\nToả hương: Xa – Toả hương trong vòng bán kính 2 mét\nHương đầu: Cam Bergamot, Hoa cam, Quả cam, Quả quýt hồng\nHương giữa: Hoa hồng Thổ Nhĩ Kỳ, Hoa ngọc lan tây, Hoa nhài, Hoa trinh nữ\nHương cuối: Cây hoắc hương, Cỏ hương bài, Đậu Tonka, Hương Va ni, Một dược, Xạ hương trắng', 4000000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:18:41'),
(52, 'Nước Hoa Nữ Chanel Coco Noir', '/images/NướcHoaNữChanelCocoNoir_nuoc-hoa-nu-chanel-coco-noir-1.jpg', 'Lưu hương: 7 đến 12 giờ\nGiới tính: Nữ\nNhóm hương: Gỗ đàn hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Bí ẩn, Quyến rũ, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2012\nNhà pha chế: Jacques Polge\nToả hương: Xa với bán kính từ 1 đến 2 mét\nHương đầu: Bưởi hồng, Cam, Cam Bergamot\nHương giữa: Hoa hồng, Hoa nhài, Hoa phong lữ, Hoa thủy tiên, Trái đào\nHương cuối: Đậu Tonka, Gỗ đàn hương, Hoắc Hương, Nhựa hương, Vani, Xạ hương trắng', 4300000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:18:48'),
(53, 'Nước Hoa Nữ Chanel Coco Mademoiselle Intense', '/images/NướcHoaNữChanelCocoMademoiselleIntense_nuoc-hoa-nu-chanel-coco-mademoiselle-intense-1.jpg', 'Lưu hương: Trên 12 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ – Trái cây – Thực phẩm\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Nữ tính, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2018\nNhà pha chế: Oliver Polge\nToả hương: Xa – Toả hương trong vòng bán kính 2 mét\nHương đầu: Cam Bergamot Calabria, Quả cam Sicili\nHương giữa: Hoa hồng, Hoa nhài, Hương trái cây\nHương cuối: Cây hoắc hương, Đậu Tonka, hương vani Madagascar\nXuất xứ: Pháp', 3800000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:18:52'),
(54, 'Nước Hoa Nữ Chanel Chance Eau Fraiche', '/images/NướcHoaNữChanelChanceEauFraiche_nuoc-hoa-nu-chanel-chance-eau-fraiche-1.jpg', 'Lưu hương: 4 giờ đến 6 giờ\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ SÍP\nNồng độ: Eau De Toilette (EDT)\nPhong cách: tươi mát, Gợi cảm, Nữ tính\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2007\nNhà pha chế: Jacques Polge\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Gỗ tuyết tùng, Quả chanh vàng\nHương giữa: Hoa bèo tây (hoa lục bình), Hoa nhài, Hồng tiêu\nHương cuối: Cây hoắc hương, Cỏ hương bài, Gỗ Tếch, Hổ phách, Hoa diên vĩ, Xạ hương trắng', 3800000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:18:55'),
(55, 'Nước Hoa Nữ Chanel No5 EDP', '/images/NướcHoaNữChanelNo5EDP_nuoc-hoa-nu-chanel-no5-edp-1.jpg', 'Lưu hương: Từ 8 đến 10 giờ\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ An-Đê-Hít\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Cổ điển, Quyến rũ, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 1986\nNhà pha chế: Jacques Polges\nToả hương: Thoang thoảng, dịu nhẹ xung quanh\nHương đầu: Cam Bergamot, Chanh vàng, Hoa cam Neroli, Hoa ngọc lan tây, Hương An-đê-hít\nHương giữa: Hoa diên vĩ, Hoa hồng, Hoa linh lan thung lũng, Hoa nhài, Rễ cây diên vĩ\nHương cuối: Cây hoắc hương, Cỏ hương bài, Gỗ đàn hương, Hổ phách, Hương cầy, Hương Va ni, Rêu sồi, Xạ hương', 3500000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:18:58'),
(56, 'Nước Hoa Nữ Chanel Coco EDP', '/images/NướcHoaNữChanelCocoEDP_nuoc-hoa-nu-chanel-coco-edp-1-1.jpg', 'Lưu hương:  8 đến 12 tiếng\nGiới tính: Nữ\nNhóm hương: Hương cay nồng phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nồng Nàn, Quyến rũ, Trưởng Thành\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 1984\nNhà pha chế: Jacques Polge\nToả hương: Xa với bán kính từ 1 đến 2 mét\nHương đầu: Hoa hồng Bulgari, Hoa nhài, Ngò thơm, Quả quýt hồng, Trái đào\nHương giữa: Cỏ ba lá, Đinh hương, Hoa cam, Hoa hồng, Hoa mimosa\nHương cuối: Đậu Tonka, Gỗ đàn hương, Hổ phách, Hoa hồng, Hương Labdanum, Một dược, Vani', 4000000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:19:01'),
(57, 'Nước Hoa Nữ Chanel Chance Eau Tendre EDT', '/images/NướcHoaNữChanelChanceEauTendreEDT_nuoc-hoa-nu-chanel-chance-eau-tendre-EDT-1.jpg', 'Lưu hương: 4 đến 6 giờ\nGiới tính: Nữ\nNhóm hương: Hoa nhài\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nhẹ nhàng, Thanh lịch\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2010\nToả hương: gần – trong vòng 1 cánh tay\nHương đầu: Bưởi, Mộc qua\nHương giữa: Dạ lan hương, nhài\nHương cuối: Hổ phách, Iris, Xạ hương', 3800000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:19:04'),
(58, 'Nước hoa Chanel No 5 L’eau Limited Edition 2024', '/images/NướchoaChanelNo5LeauLimitedEdition2024_nuoc-hoa-nu-chanel-n-5-l-eau-limited-edition-edt-100ml-66764d6252167-22062024110450.webp', 'hương hiệu:Chanel\nNhóm nước hoa:Hương hoa cỏ An-Đê-Hít\nGiới tính:Nữ\nĐộ tuổi khuyên dùng:Trên 18\nNăm ra mắt:2024\nNồng độ:Eau de toilette (EDT)\nNhà pha chế:Olivier Polge\nĐộ lưu hương:Tạm ổn – 3 giờ đến 6 giờ\nĐộ toả hương:Gần – Toả hương trong vòng một cánh tay\nThời gian:Xuân, Hè, Thu\nPhong cách:Trẻ trung, Hiện đại, Tinh tế, Hấp dẫn\nXuất xứ:France', 8800000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:19:07'),
(59, 'Nước Hoa Nữ Chanel Gabrielle EDP', '/images/NướcHoaNữChanelGabrielleEDP_nuoc-hoa-nu-chanel-gabrielle-EDP-1.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nữ\nNhóm hương: hoa cỏ\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Quyến rũ, sang trọng, Thanh lịch\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2017\nNhà pha chế: Olivier Polge\nToả hương: Thoang thoảng, dịu nhẹ xung quanh\nHương đầu: Bưởi, Cam Mandarin, Quả lý chua đen\nHương giữa: Hoa cam, Hoa huệ, Hoa Ylang Ylang, lài\nHương cuối: Gỗ đàn hương, Xạ hương\nXuất xứ: Pháp', 4000000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:19:10'),
(60, 'Nước Hoa Nữ Chanel Chance EDT', '/images/NướcHoaNữChanelChanceEDT_nuoc-hoa-nu-chanel-chance-edt-1.jpg', 'Lưu hương: 8 đến 10 giờ\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ SÍP\nNồng độ: Eau De Parfum (EDP)\nPhong cách: năng động, Trẻ trung\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2003\nNhà pha chế: Jacques Polge\nToả hương: Xa với bán kính từ 1 đến 2 mét\nHương đầu: hoa diên vĩ, Lan dạ hương, Tiêu hồng, Trái dứa\nHương giữa: Chanh vàng, Hoa hồng, Hoa nhài\nHương cuối: Cỏ hương bài, Hổ phách, Hoắc Hương, Vani, Xạ hương', 3500000, 10000, 2, 14, 1, 0, 0, 0, '2025-02-24 03:19:14'),
(61, 'Nước Hoa Nữ Dior Joy Intense', '/images/NướcHoaNữDiorJoyIntense_nuoc-hoa-nu-dior-joy-intense-1.jpg', 'Giới tính: Nữ\nNhóm hương: Hoa cỏ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nữ tính, Thanh lịch, Tươi Mới\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2019\nNhà pha chế: Francois Demachy\nToả hương: Lâu, Từ 7 đến 12 tiếng\nHương đầu: Cam Bergamot, Hoa cam Neroli\nHương giữa: Hoa hồng Grasses, Hoa nhài\nHương cuối: Đậu Tonka, Gỗ đàn hương, vanilla, Xạ hương\nXuất xứ: France', 3800000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:23:39'),
(62, 'Nước Hoa Nữ Dior J’adore Infinissime EDP', '/images/NướcHoaNữDiorJadoreInfinissimeEDP_nuoc-hoa-nu-dior-jadore-infinissime-edp-1-1.jpg', 'Lưu hương: 4-6h\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: cuốn hút, Gợi cảm, Nữ tính\nĐộ tuổi khuyên dùng: trên 25 tuổi\nNăm ra mắt: 2020\nToả hương: Gần, trong vòng 1 cánh tay\nHương đầu: Cam Bergamot, Cam đỏ, Tiêu hồng\nHương giữa: Hoa hồng, Hoa huệ tây, Hoa linh lan thung lũng, Hoa ngọc lan tây, Hoa nhài Sambac\nHương cuối: Gỗ đàn hương\nXuất xứ: Pháp', 3700000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:23:42'),
(63, 'Nước Hoa Nữ Dior Joy EDP', '/images/NướcHoaNữDiorJoyEDP_nuoc-hoa-nu-dior-joy-edp-1.jpg', 'Lưu hương: Từ 7 đến 12 giờ.\nGiới tính: Nữ\nNhóm hương: Citrus cam chanh\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nữ tính, Quyến rũ, Sống Động\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2018\nNhà pha chế: Francois Demachy\nToả hương: Gần – Tỏa hương trong vòng một cánh tay.\nHương đầu: Cam Bergamot, Cam Mandarin\nHương giữa: Hoa hồng, Hoa nhài\nHương cuối: Cây hoắc hương, Gỗ đàn hương, Gỗ tuyết tùng, Xạ hương\nXuất xứ: France', 3500000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:23:45'),
(64, 'Nước Hoa Nữ Dior J’Adore In Joy EDT', '/images/NướcHoaNữDiorJAdoreInJoyEDT_nuoc-hoa-nu-dior-jadore-in-joy-edt-1-1.jpg', 'Lưu hương: 4-6h\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ trái cây\nNồng độ: Eau De Toilette (EDT)\nPhong cách: cuốn hút, Nữ tính, Quyến rũ\nĐộ tuổi khuyên dùng: Trên 25 tuổi\nNăm ra mắt: 2017\nToả hương: Gần, trong vòng 1 cánh tay\nHương đầu: Muối biển\nHương giữa: Hoa cam Neroli, Hoa huệ trắng, Hoa ngọc lan tây, Hoa nhài Sambac\nHương cuối: Quả đào\nXuất xứ: Pháp', 2600000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:23:48'),
(65, 'Nước Hoa Nữ Dior Miss Dior Blooming Bouquet', '/images/NướcHoaNữDiorMissDiorBloomingBouquet_nuoc-hoa-nu-dior-miss-dior-blooming-bouquet.jpg', 'Lưu hương: 4-6h\nGiới tính: Nữ\nNhóm hương: Hoa cỏ – Trái cây – Thực phẩm\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Ngọt ngào, Nữ tính, Trẻ trung\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2014\nNhà pha chế: Francois Demachy.\nToả hương: Rất Gần – Thoang thoảng trên da.\nHương đầu: Quýt hồng Sicili\nHương giữa: Đào, Hoa hồng Đan Mạch, Hoa Mẫu Đơn Hồng, Quả Mơ\nHương cuối: Xạ hương trắng\nXuất xứ: France', 3500000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:23:55'),
(66, 'Nước Hoa Nữ Dior Miss Dior Rose N’Roses', '/images/NướcHoaNữDiorMissDiorRoseNRoses_nuoc-hoa-nu-dior-miss-dior-rose-nroses-1.jpg', 'Lưu hương: Từ 3 đến 6 giờ\nGiới tính: Nữ\nNhóm hương: Hoa phong lữ\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Gợi cảm, Nhẹ nhàng, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2020\nNhà pha chế: Francois Demachy\nToả hương: Gần – Tỏa hương trong vòng một cánh tay\nHương đầu: Cam Bergamot, Hoa phong lữ, Quả quýt Ý.\nHương giữa: Hoa hồng Damask, Hoa hồng Grasse\nHương cuối: Xạ hương\nXuất xứ: France', 3500000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:23:58'),
(67, 'Nước Hoa Nữ Dior Jadore EDP', '/images/NướcHoaNữDiorJadoreEDP_nuoc-hoa-nu-dior-jadore-edp-1.jpg', 'Lưu hương: Từ 7 giờ đến 12 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ – Trái cây – Thực phẩm\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nữ tính, quý phái, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 1999\nNhà pha chế: Calice Becker\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Cam Bergamot, Dưa gang, Hoa Mộc Lan, Quả đào, Quả lê, Quả quýt hồng\nHương giữa: Hoa hồng, Hoa huệ trắng, Hoa lan Nam Phi, Hoa linh lan thung lũng, Hoa nhài, Hoa phong lan, Hoa tím, Quả mận\nHương cuối: Gỗ tuyết tùng, Hương Va ni, Quả mâm xôi đen, Xạ hương\nXuất xứ: France', 2800000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:24:02'),
(68, 'Nước Hoa Nữ Dior Miss Dior EDT', '/images/NướcHoaNữDiorMissDiorEDT_nuoc-hoa-nu-dior-miss-dior-edt-1.jpg', 'Lưu hương: Từ 3 đến 6 giờ\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ chypre\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Quyến rũ, Dịu dàng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2013\nNhà pha chế: Francois Demachy\nToả hương: Gần – Tỏa hương trong vòng một cánh tay\nHương đầu: Cam đỏ, Dầu hoa cam Tunisia\nHương giữa: hoa hồng Bulgaria, Hoa hồng Đan Mạch, Hoa hồng Thổ Nhĩ Kỳ\nHương cuối: Hoắc hương Indonesia\nXuất xứ: France', 3000000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:24:05'),
(69, 'Nước Hoa Nữ Dior Miss Dior Absolutely Blooming', '/images/NướcHoaNữDiorMissDiorAbsolutelyBlooming_nuoc-hoa-nu-dior-miss-dior-absolutely-blooming.jpg', 'Lưu hương: Lâu – 7 giờ đến 12 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ – Trái cây – Thực phẩm\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Hiện Đại, Quyến rũ, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2016\nNhà pha chế: Francois Demachy\nToả hương: Xa – Toả hương trong vòng bán kính 2 mét\nHương đầu: Hồng tiêu, Quả lựu, Quả lý chua đen, Quả mâm xôi\nHương giữa: Hoa hồng Tháng Năm, Hoa mẫu đơn\nHương cuối: Xạ hương trắng\nXuất xứ: France', 3000000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:24:08'),
(70, 'Nước Hoa Nữ Dior Miss Dior EDP', '/images/NướcHoaNữDiorMissDiorEDP_nuoc-hoa-nu-dior-miss-dior-edp-2.jpg', 'Lưu hương: Lâu – 7 giờ đến 12 giờ\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ SÍP\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Ngọt ngào, Quyến rũ, Trẻ trung\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2011\nNhà pha chế: Francois Demachy\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Dâu dại, Quả dâu tây, Quả quýt hồng\nHương giữa: Hoa hồng, Hoa nhài\nHương cuối: Cây hoắc hương, Cỏ hương bài, Gỗ đàn hương, Hổ phách, Rêu cây sồi\nXuất xứ: France', 4000000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:24:11'),
(71, 'Nước Hoa Nữ Dior J’adore EDT', '/images/NướcHoaNữDiorJadoreEDT_nuoc-hoa-nu-dior-jadore-edt-2.jpg', 'Lưu hương: 4-6h\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ\nNồng độ: Eau De Toilette (EDT)\nPhong cách: cuốn hút, Nữ tính, Quyến rũ\nĐộ tuổi khuyên dùng: Trên 25 tuổi\nNăm ra mắt: 2011\nToả hương: Gần, trong vòng 1 cánh tay\nHương đầu: Dầu hoa cam, Hương cam Quýt\nHương giữa: Hoa cam Nam Phi, Hoa hồng, Hoa huệ, Hoa ngọc lan tây, Hoa nhài\nHương cuối: Hương Gỗ., vanilla\nXuất xứ: Pháp', 3100000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:24:14'),
(72, 'Nước Hoa Nữ Dior Addict Eau Fraiche', '/images/NướcHoaNữDiorAddictEauFraiche_nuoc-hoa-nu-dior-addict-eau-fraiche-1.jpg', 'Lưu hương: Từ 3-6 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ phương đông\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Nữ tính, Nhẹ nhàng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2014\nNhà pha chế: Francois Demachy\nToả hương: Gần, trong vòng một cánh tay\nHương đầu: Cam Bergamot\nHương giữa: Hoa lan Nam Phi, Hoa linh lan thung lũng\nHương cuối: Xạ hương\nXuất xứ: France', 2600000, 10000, 2, 15, 1, 0, 0, 0, '2025-02-24 03:24:17'),
(73, 'Nước Hoa Nữ Hermes Eau des Merveilles Bleue', '/images/NướcHoaNữHermesEaudesMerveillesBleue_nuoc-hoa-nu-hermes-eau-des-merveilles-bleue.jpg', 'Lưu hương: Rất lâu – Trên 12 giờ\nGiới tính: Nữ\nNhóm hương: Hương biển\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Nhẹ nhàng, tinh tế, tươi mát\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2016\nNhà pha chế: Christine Nagel\nToả hương: Rất xa – Toả hương trong vòng bán kính trên 2 mét\nHương đầu: Cây hoắc hương\nHương giữa: Hương gỗ\nHương cuối: Hương nước biển\nXuất xứ: France', 3000000, 10000, 2, 16, 1, 0, 0, 0, '2025-02-24 03:25:57'),
(74, 'Nước Hoa Nữ Hermès Twilly d’Hermès Eau Poivrée', '/images/NướcHoaNữHermèsTwillydHermèsEauPoivrée_nuoc-hoa-nu-hermes-twilly-dhermes-eau-poivree-1.jpg', 'Lưu hương: Trên 12 giờ\nGiới tính: Nam\nNhóm hương: Hoa hồng\nNhóm hương: Hoắc hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: cuốn hút, Gợi cảm, Nữ tính, Quyến rũ, sang trọng\nNăm ra mắt: 2019\nNhà pha chế: Christine Nagel\nToả hương: Rất xa – Toả hương trong vòng bán kính trên 2 mét\nHương đầu: Tiêu hồng\nHương giữa: Hoa hồng\nHương cuối: Hoắc Hương\nXuất xứ: France', 3500000, 10000, 2, 16, 1, 1, 0, 0, '2025-02-24 03:26:00'),
(75, 'Nước Hoa Nữ Hermès Twilly d’Hermès EDP', '/images/NướcHoaNữHermèsTwillydHermèsEDP_nuoc-hoa-nu-hermes-twilly-dhermes-edp-1.jpg', 'Lưu hương: 3 giờ đến 6 giờ\nGiới tính: Nữ\nNhóm hương: hoa cỏ\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Quyến rũ, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2017\nNhà pha chế: Christine Nagel\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Cam Bergamot, Cam đắng, Gừng\nHương giữa: Hoa cam, Hoa huệ trắng, Hoa nhài\nHương cuối: Gỗ đàn hương, Hương Va ni\nXuất xứ: France', 3300000, 10000, 2, 16, 1, 0, 0, 0, '2025-02-24 03:26:03'),
(76, 'Nước Hoa Nữ Hermes Twilly Charming EDP', '/images/NướcHoaNữHermesTwillyCharmingEDP_nuoc-hoa-nu-hermes-twilly-charming-edp-2.jpg', 'Lưu hương: Lâu, 6-8h\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Nữ tính, tinh tế\nĐộ tuổi khuyên dùng: Trên 25 tuổi\nNăm ra mắt: 2017\nToả hương: Gần, trong vòng 1 cánh tay\nHương đầu: Cam Bergamot, Cam đắng, Gừng\nHương giữa: Hoa cam, Hoa huệ trắng, Hoa nhài\nHương cuối: Gỗ đàn hương, Hương Va ni\nXuất xứ: Pháp', 3500000, 10000, 2, 16, 1, 1, 0, 0, '2025-02-24 03:26:07'),
(77, 'Nước Hoa Nữ Hermès L’Ombre des Merveilles', '/images/NướcHoaNữHermèsLOmbredesMerveilles_nuoc-hoa-nu-hermes-lombre-des-merveilles-1.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nữ\nNhóm hương: Hương gỗ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Lôi Cuốn, Nữ tính, tinh tế\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2020\nNhà pha chế: Christine Nagel\nToả hương: Vừa phải\nHương đầu: Trà đen.\nHương giữa: Nhang thơm (hương trầm).\nHương cuối: Đậu Tonka\nXuất xứ: France', 1500000, 10000, 2, 16, 1, 0, 0, 0, '2025-02-24 03:26:14'),
(78, 'Nước Hoa Nữ Hermès Eau des Merveilles', '/images/NướcHoaNữHermèsEaudesMerveilles_nuoc-hoa-nu-hermes-eau-des-merveilles-1.jpg', 'Lưu hương: Trên 12 giờ\nGiới tính: Nữ\nNhóm hương: bạch đậu khấu\nNhóm hương: Hổ phách\nNhóm hương: Hương gỗ\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Cá tính, Dịu dàng, Dịu Nhẹ, Gần gũi, Giản dị, Hấp dẫn, Hiện Đại, Hoàn hảo, Nịnh Mũi\nĐộ tuổi khuyên dùng: Trên 22\nNăm ra mắt: 2004\nNhà pha chế: Ralf Schwieger, Nathalie Feisthauer\nToả hương: Rất xa – Toả hương trong vòng bán kính trên 2 mét\nHương đầu: Cam, chanh, elemi resin\nHương giữa: Hổ phách, Tiêu, Tiêu hồng, Violet\nHương cuối: Gỗ tuyết tùng, linh sam, madagascar vetiver, Rêu sồi\nXuất xứ: France', 3000000, 10000, 2, 16, 1, 0, 0, 0, '2025-02-24 03:26:17'),
(79, 'Nước Hoa Nữ Gucci Mémoire d’une Odeur', '/images/NướcHoaNữGucciMémoireduneOdeur_nuoc-hoa-nu-gucci-memoire-dune-odeur-1.jpg', 'Lưu hương: Từ 4 đến 6 tiếng\nGiới tính: Nữ\nNhóm hương: Hương trái cây chypre\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Bí ẩn, tinh tế\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2019\nNhà pha chế: Alberto Morillas\nToả hương: Gần, Trong vòng một cánh tay\nHương đầu: Hạnh nhân đắng, Hoa cúc La mã\nHương giữa: Hoa nhài, Hoa nhài Ấn Độ, Xạ hương\nHương cuối: Gỗ đàn hương, Gỗ tuyết tùng, vanilla', 3500000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:40:38'),
(80, 'Nước hoa Gucci Flora Gorgeous Orchid', '/images/NướchoaGucciFloraGorgeousOrchid_nuoc-hoa-gucci-flora-gorgeous-orchid-300x300-1.jpg', 'Thương hiệu:Gucci\nNhóm nước hoa:Hương Hoa cỏ – Trái cây – Thực phẩm\nGiới tính:Nữ\nĐộ tuổi khuyên dùng:Trên 18\nNăm ra mắt:2024\nNồng độ:Eau de parfum (EDP)\nNhà pha chế:Marie Salamagne\nĐộ lưu hương:Tạm ổn – 3 giờ đến 6 giờ\nĐộ toả hương:Gần – Toả hương trong vòng một cánh tay\nThời gian:Xuân, Hè, Thu\nPhong cách:Ngọt ngào, Hấp dẫn, Lôi cuốn\nXuất xứ:France', 3900000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:40:41'),
(81, 'Nước Hoa Nữ Gucci Bloom Acqua Di Fiori', '/images/NướcHoaNữGucciBloomAcquaDiFiori_nuoc-hoa-nu-gucci-bloom-acqua-di-fiori-1.jpg', 'Lưu hương: 3 giờ đến 6 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ – Trái cây – Thực phẩm\nNồng độ: Eau De Toilette (EDT)\nPhong cách: cuốn hút, Nữ tính, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Lá Galbanum, Lá và nụ hoa lý chua\nHương giữa: Hoa huệ trắng, Hoa kim ngân, Hoa nhài\nHương cuối: Gỗ đàn hương, Xạ hương', 3000000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:40:45'),
(82, 'Nước Hoa Nữ Gucci Bamboo EDP', '/images/NướcHoaNữGucciBambooEDP_nuoc-hoa-nu-gucci-bamboo-edp-1.jpg', 'Lưu hương: 4 giờ đến 6 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Nữ tính, Quyến rũ\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2015\nToả hương: Rất gần – Thoang thoảng trên làn da\nHương đầu: Cam Bergamot\nHương giữa: Hoa cam, Hoa huệ Casablanca, Hoa ngọc lan tây\nHương cuối: Gỗ đàn hương, Hổ phách, Hương Va ni Tahiti', 3500000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:40:48'),
(83, 'Nước Hoa Nữ Gucci Guilty Black Pour Femme', '/images/NướcHoaNữGucciGuiltyBlackPourFemme_nuoc-hoa-nu-gucci-guilty-black-pour-femme-1.jpg', 'Lưu hương: 4 giờ đến 6 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ phương đông\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Gợi cảm, Nữ tính, Quyến rũ\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2013\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Hồng tiêu, Trái cây đỏ\nHương giữa: Hoa tím, Hoa Tử Đinh Hương., Quả đào, Quả lý chua đỏ, Quả mâm xôi\nHương cuối: Cây hoắc hương, Đường thắng, Hổ phách', 3500000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:40:55'),
(84, 'Nước Hoa Nữ Gucci Bloom Ambrosia Di Fiori', '/images/NướcHoaNữGucciBloomAmbrosiaDiFiori_nuoc-hoa-nu-gucci-bloom-ambrosia-di-fiori-1.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nữ\nNhóm hương: Hoa hồng Đan Mạch\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Ngọt ngào, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2019\nNhà pha chế: Alberto Morillas\nToả hương: Rất gần – Thoang thoảng trên làn da\nHương đầu: Hoa kim ngân, Hoa nhài\nHương giữa: Hoa huệ\nHương cuối: Hoa hồng Đan Mạch, Orris', 3500000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:40:58'),
(85, 'Nước Hoa Nữ Gucci Guilty EDP Pour Femme', '/images/NướcHoaNữGucciGuiltyEDPPourFemme_nuoc-hoa-nu-gucci-guilty-edp-pour-femme-1.jpg', 'Lưu hương: 3h đến 6h\nGiới tính: Nữ\nNhóm hương: Hoa cỏ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, quý phái, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2019\nNhà pha chế: Alberto Morillas\nToả hương: Gần – Trong vòng một cánh tay\nHương đầu: Cam Bergamot, Quả Quýt, Tiêu hồng\nHương giữa: Hoa hồng, Phong lữ, Tử đinh hương, Violet\nHương cuối: Hổ phách, Hoắc Hương\nXuất xứ: Ý', 3500000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:41:02'),
(86, 'Nước Hoa Nữ Gucci Bloom Nettare Di Fiori', '/images/NướcHoaNữGucciBloomNettareDiFiori_nuoc-hoa-nu-gucci-bloom-nettare-di-fiori-1.jpg', 'Lưu hương: Trên 8 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Lôi Cuốn\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2018\nNhà pha chế: Alberto Morillas\nToả hương: Vừa phải, dịu nhẹ xung quanh\nHương đầu: Gừng, Hoa hồng\nHương giữa: Hoa huệ trắng, Hoa kim ngân, Hoa nhài Sambac\nHương cuối: Cỏ thơm Ấn Độ, Hoa Mộc, Xạ hương', 3200000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:41:05'),
(87, 'Nước Hoa Nữ Gucci Flora EDP', '/images/NướcHoaNữGucciFloraEDP_nuoc-hoa-nu-gucci-flora-edp-1.jpg', 'Lưu hương: Trên 8 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Trẻ trung, cuốn hút, Nữ tính\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2010\nNhà pha chế: Frida Giannini\nToả hương: Gần, dịu nhẹ xung quanh\nHương đầu: Hoa mẫu đơn, Hương cam chanh, Quả quýt hồng\nHương giữa: Hoa hồng, Hoa mộc\nHương cuối: Gỗ đàn hương, Hoắc Hương, Tiêu hồng', 3500000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:41:08'),
(88, 'Nước Hoa Nữ Gucci Bloom EDP', '/images/NướcHoaNữGucciBloomEDP_z5881435281998_02cc273ea47eaf8618399abf258cd884-scaled.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ – Trái cây – Thực phẩm\nNồng độ: Eau De Parfum (EDP)\nPhong cách: cuốn hút, Ngọt ngào, Nữ tính\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2017\nNhà pha chế: Alesxandro Michele\nToả hương: Rất gần – Thoang thoảng trên làn da\nHương đầu: Hoa nhài Sambac\nHương giữa: Hoa huệ trắng\nHương cuối: rễ cây diên vĩ', 3000000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:41:12'),
(89, 'Nước Hoa Nữ Gucci Bamboo EDT', '/images/NướcHoaNữGucciBambooEDT_nuoc-hoa-nu-gucci-bamboo-edt-1.jpg', 'Lưu hương: Trên 6 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ phương đông\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Nhẹ nhàng, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2016\nToả hương: Vừa phải, dịu nhẹ xung quanh\nHương đầu: Cam Bergamot Sicilian, Hoa cam, lê, Quýt hồng nước Ý\nHương giữa: Hoa huệ Casablanca, Hoa ngọc lan tây, Hoa nhài\nHương cuối: Gỗ đàn hương, Long diên hương, Vani Tây Ấn, Xạ hương trắng', 3500000, 10000, 2, 17, 1, 0, 0, 0, '2025-02-24 03:41:16'),
(90, 'Nước Hoa Nữ Narciso Rodriguez Musc Noir', '/images/NướcHoaNữNarcisoRodriguezMuscNoir_nuoc-hoa-nu-narciso-rodriguez-musc-noir-2.jpg', 'Lưu hương: 3 giờ đến 6 giờ\nGiới tính: Nam\nNhóm hương: Hương hoa cỏ, xạ hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: cuốn hút, Gợi cảm, Nam tính, Quyến rũ, sang trọng, tinh tế\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2022\nNhà pha chế: Sonia Constant\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Cam Bergamot, Tiêu hồng\nHương giữa: Hoa huệ, Mận, Xạ hương\nHương cuối: Da thuộc, Hoắc Hương, vanilla\nXuất xứ: France', 3500000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:14'),
(91, 'Nước Hoa Nữ Narciso Rodriguez Pure Musc', '/images/NướcHoaNữNarcisoRodriguezPureMusc_narciso-rodriguez-pure-musc-for-her.jpg', 'Lưu hương: 3 giờ đến 6 giờ\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ – gỗ – xạ hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Quyến rũ, Nữ tính, Thanh lịch\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2019\nNhà pha chế: Sonia Constant\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Xạ hương\nHương giữa: Hương của hoa\nHương cuối: Hương Cashmeran\nXuất xứ: France', 3000000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:17'),
(92, 'Nước Hoa Nữ Narciso Rodriguez For Her EDP', '/images/NướcHoaNữNarcisoRodriguezForHerEDP_nuoc-hoa-nu-narciso-rodriguez-for-her-edp-1.jpg', 'Lưu hương: Từ 7 giờ đến 12 giờ\nGiới tính: Nam\nNhóm hương: Hương gỗ hoa cỏ xạ hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Quyến rũ, sang trọng, tinh tế\nĐộ tuổi khuyên dùng: trên 25\nNăm ra mắt: 2006\nNhà pha chế: Francis Kurkdjian, Christine Nagel\nToả hương: Gần, trong khoảng 1 cánh tay.\nHương đầu: Hoa hồng và Đào\nHương giữa: Xạ hương và hổ phách\nHương cuối: Gỗ đàn hương và Hoắc hương', 2800000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:20'),
(93, 'Nước Hoa Nữ Narciso Rodriguez Cristal EDP', '/images/NướcHoaNữNarcisoRodriguezCristalEDP_narciso-rodriguez-cristal-edp.jpg', 'Lưu hương: Lâu, từ 7 đến 12 tiếng\nGiới tính: Nữ\nNhóm hương: Hương gỗ hoa cỏ xạ hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nữ tính, quyễn rũ, Tính tế\nĐộ tuổi khuyên dùng: trên 25\nNăm ra mắt: 2022\nNhà pha chế: Natalie Gracia- Cetto\nToả hương: Xa, trong khoảng 2m trở lại\nHương đầu: Cam Bergamot, Hoa cam, Hoa lan Nam Phi\nHương giữa: Hoa hồng, Hoa nhài, Hoa trắng, Xạ hương\nHương cuối: Benzoin, Gỗ Cashmere, Hổ phách, Tuyết tùng\nXuất xứ: France', 3500000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:23'),
(94, 'Nước Hoa Nữ Narciso Rodriguez Narciso Poudree', '/images/NướcHoaNữNarcisoRodriguezNarcisoPoudree_nuoc-hoa-nu-narciso-rodriguez-narciso-poudree-1.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nam\nNhóm hương: Hương hoa cỏ, xạ hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Đa tình, Gợi cảm, Nam tính, Nịnh Mũi, Quyến rũ, Thu hút, tươi mát\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2016\nNhà pha chế: Aurelien Guichard\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Hoa cam, Hoa hồng Bulgary, Hoa nhài\nHương giữa: Xạ hương\nHương cuối: Cây hoắc hương, Cỏ hương bài, Gỗ tuyết tùng, Hương Coumarin\nXuất xứ: France', 3200000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:30'),
(95, 'Nước Hoa Nữ Narciso Rodriguez For Her EDT', '/images/NướcHoaNữNarcisoRodriguezForHerEDT_3.jpg', 'Lưu hương: Lâu – 7 giờ đến 12 giờ\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ – gỗ – xạ hương\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Nữ tính, Quyến rũ, Thanh lịch\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2003\nNhà pha chế: Aurelien Guichard\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Cam Bergamot, Hoa cam Châu Phi, Hoa mộc tê\nHương giữa: Hổ phách, Xạ hương\nHương cuối: Cây hoắc hương, Cỏ hương bài, Hương Va ni (Vanille)\nXuất xứ: France', 2900000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:33'),
(96, 'Nước Hoa Nữ Narciso Rodriguez For Her Forever', '/images/NướcHoaNữNarcisoRodriguezForHerForever_nuoc-hoa-nu-narciso-rodriguez-for-her-forever-1.jpg', 'Lưu hương: lâu, 8-10 tiếng\nGiới tính: Nữ\nNhóm hương: Hoa cỏ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Quyến rũ, sang trọng\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2023\nToả hương: trong vòng 1m\nHương đầu: Hoa Dành Dành, Hoa nhài, Hoa Sứ\nHương giữa: Hoa cam Châu Phi, Hoa huệ, Hoa mộc tê\nHương cuối: Cây hoắc hương, Xạ hương Narciso\nXuất xứ: France', 4300000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:36'),
(97, 'Nước Hoa Nữ Narciso Rodriguez Ambree EDP', '/images/NướcHoaNữNarcisoRodriguezAmbreeEDP_nuoc-hoa-nu-narciso-rodriguez-ambree-edp-1.jpg', 'Lưu hương: 6 cho tới 12 tiếng\nGiới tính: Nữ\nNhóm hương: Hoa cỏ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: quyễn rũ, Tính tế\nĐộ tuổi khuyên dùng: trên 20\nNăm ra mắt: 2020\nNhà pha chế: Aurelien Guichard\nToả hương: Xa\nHương đầu: Hoa đại, Hoa sứ trắng, ngọc lan tây\nHương giữa: Xạ hương và hổ phách\nHương cuối: Cashmera, Tuyết tùng, vanilla\nXuất xứ: France', 3200000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:39'),
(98, 'Nước Hoa Nữ Narciso Rodriguez Narciso EDP', '/images/NướcHoaNữNarcisoRodriguezNarcisoEDP_nuoc-hoa-nu-narciso-rodriguez-narciso-edp-1.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nữ\nNhóm hương: Hương gỗ hoa cỏ xạ hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Gợi cảm, Nữ tính, Tính tế\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2014\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Hoa hồng, Quả đào\nHương giữa: Hổ phách, Xạ hương\nHương cuối: Cây hoắc hương, Gỗ đàn hương\nXuất xứ: France', 3000000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:42'),
(99, 'Nước Hoa Nữ Narciso Rodriguez Musc Noir Rose', '/images/NướcHoaNữNarcisoRodriguezMuscNoirRose_2.jpg', 'Lưu hương: 3 giờ đến 6 giờ\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ – gỗ – xạ hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Quyến rũ, nổi bật, Thu hút\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2022\nNhà pha chế: Aurelien Guichard\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Cam Bergamot, Tiêu hồng\nHương giữa: Hoa huệ, Mận, Xạ hương\nHương cuối: Da thuộc, Hoắc Hương, vanilla\nXuất xứ: France', 3200000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:45'),
(100, 'Nước Hoa Nữ Narciso Rodriguez Fleur Musc EDP', '/images/NướcHoaNữNarcisoRodriguezFleurMuscEDP_nuoc-hoa-nu-narciso-rodriguez-fleur-musc-edp-1.jpg', 'Lưu hương: 3 giờ đến 6 giờ\nGiới tính: Nam\nNhóm hương: Hương gỗ hoa cỏ xạ hương\nNồng độ: Eau De Parfum (EDP)\nPhong cách: cuốn hút, Gợi cảm, Lôi Cuốn, Ngọt ngào, Nữ tính, Quyến rũ, sang trọng, tinh tế\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2017\nNhà pha chế: Sonia Constant\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Hồng tiêu\nHương giữa: Hoa hồng, Hoa mẫu đơn, Xạ hương\nHương cuối: Cây hoắc hương, Hổ phách\nXuất xứ: France', 2800000, 10000, 2, 18, 1, 0, 0, 0, '2025-02-24 03:45:48'),
(101, 'Nước Hoa Nữ Yves Saint Laurent Black Opium EDP Intense', '/images/NướcHoaNữYvesSaintLaurentBlackOpiumEDPIntense_nuoc-hoa-nu-yves-saint-laurent-black-opium-edp-intense-2.jpg', 'Lưu hương: Lâu, 7-12h\nGiới tính: Nữ\nNhóm hương: Hương va-ni phương đông\nNồng độ: Eau De Parfume Intense\nPhong cách: cuốn hút, Gợi cảm, Quyến rũ\nĐộ tuổi khuyên dùng: Trên 25 tuổi\nNăm ra mắt: 2019\nToả hương: Xa, bán kính 2m\nHương đầu: Quả mâm xôi, Rượu Absinthe\nHương giữa: Cà phê, Hoa cam, Hoa nhài Sambac\nHương cuối: Cam thảo, Gỗ đàn hương, Hương Vanilla\nXuất xứ: Pháp', 3600000, 10000, 2, 19, 1, 0, 0, 0, '2025-02-24 03:49:11'),
(102, 'Nước Hoa Nữ Yves Saint Laurent Mon Paris', '/images/NướcHoaNữYvesSaintLaurentMonParis_yves-saint-laurent-mon-paris.jpg', 'Lưu hương: Rất lâu – Trên 12 giờ\nGiới tính: Nữ\nNhóm hương: Hoa cỏ – Trái cây – Thực phẩm\nNồng độ: Eau De Parfum (EDP)\nPhong cách: sang trọng, Quyến rũ, Thanh lịch\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2016\nToả hương: Rất xa – Toả hương trong vòng bán kính trên 2 mét\nHương đầu: Quả dâu tây, Quả lê, Quả mâm xôi\nHương giữa: Hoa cà dược, Hoa cam, Hoa mẫu đơn, Hoa nhài\nHương cuối: Cây hoắc hương, Hương Va ni (Vanila), Xạ hương trắng\nXuất xứ: France', 3500000, 10000, 2, 19, 1, 0, 0, 0, '2025-02-24 03:49:14'),
(103, 'Nước Hoa Nữ Yves Saint Laurent Libre EDP', '/images/NướcHoaNữYvesSaintLaurentLibreEDP_z5892026450062_8224851020dd6815a8640758326412b7.jpg', 'Lưu hương: Rất lâu – Trên 12 giờ\nGiới tính: Nữ\nNhóm hương: Hương cam chanh thơm ngát\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nữ tính, sang trọng, Thanh lịch\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2019\nNhà pha chế: Anne Flipo, Carlos Benaim\nToả hương: Rất xa – Toả hương trong vòng bán kính trên 2 mét\nHương đầu: Cam quýt, hoa lavender, lý chua đen\nHương giữa: Hoa cam, Hoa Lavender., Hoa nhài\nHương cuối: Gỗ tuyết tùng, Vani\nXuất xứ: France', 3500000, 10000, 2, 19, 1, 0, 0, 0, '2025-02-24 03:49:18'),
(104, 'Nước Hoa Nữ Yves Saint Laurent Libre EDT', '/images/NướcHoaNữYvesSaintLaurentLibreEDT_nuoc-hoa-nu-yves-saint-laurent-libre-edt-2.jpg', 'Lưu hương: 4-6h\nGiới tính: Nữ\nNhóm hương: Hương hoa cỏ\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Lôi Cuốn, Nữ tính, tinh tế\nĐộ tuổi khuyên dùng: trên 20 tuổi\nNăm ra mắt: 2021\nToả hương: Gần, trong vòng 1 cánh tay\nHương đầu: Cam Bergamot, Cam Mandarin, hoa lavender\nHương giữa: Hoa cam, Hoa nhài, Trà Nhài\nHương cuối: Ambergris, vanilla, Xạ hương\nXuất xứ: Pháp', 3800000, 10000, 2, 19, 1, 0, 0, 0, '2025-02-24 03:49:21'),
(105, 'Nước Hoa Nữ Yves Saint Laurent Black Opium', '/images/NướcHoaNữYvesSaintLaurentBlackOpium_nuoc-hoa-nu-yves-saint-laurent-black-opium-1.jpg', 'Lưu hương: 6 giờ đến 8 giờ\nGiới tính: Nữ\nNhóm hương: Hương vani phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Bí ẩn, năng động, Thu hút\nĐộ tuổi khuyên dùng: Trên 24\nNăm ra mắt: 2014\nNhà pha chế: Olivier Cresp\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Hoa cam, Hồng tiêu, Quả lê\nHương giữa: Cà phê, Cam thảo, Hạnh nhân đắng, Hoa nhài\nHương cuối: Cây hoắc hương, Gỗ Cashmere, Gỗ tuyết tùng, Hương Va ni\nXuất xứ: France', 1500000, 10000, 2, 19, 1, 0, 0, 0, '2025-02-24 03:49:28'),
(106, 'Nước Hoa Nam Yves Saint Laurent Y EDP Intense', '/images/NướcHoaNamYvesSaintLaurentYEDPIntense_nuoc-hoa-nam-yves-saint-laurent-y-edp-Intense-5.jpg', 'Lưu hương:  7-12h\nGiới tính: Nam\nNhóm hương: Hương dương xỉ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nam tính, Phong trần, Thanh lịch\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2023\nToả hương: Xa, trong vòng bán kính 2m\nHương đầu: Cam Bergamot, Gừng, Quả bách xù\nHương giữa: Cây xô thơm, Oải hương, Phong lữ\nHương cuối: cedar, Patchouli, Vetiver\nXuất xứ: Pháp', 3700000, 10000, 1, 19, 1, 0, 0, 0, '2025-02-24 03:51:55'),
(107, 'Nước hoa nam Yves Saint Laurent Y EDT', '/images/NướchoanamYvesSaintLaurentYEDT_nuoc-hoa-nam-yves-saint-laurent-y-edt.jpg', 'Lưu hương: 3 giờ đến 6 giờ\nGiới tính: Nam\nNhóm hương: Hương thơm dương xỉ\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Nam tính, Nam tính, tươi mát\nĐộ tuổi khuyên dùng: trên 25\nNăm ra mắt: 2017\nToả hương: Xa – Toả hương trong vòng bán kính 2 mét\nHương đầu: Ăng-đê-hít, Bạc hà, Cam Bergamot, Chanh vàng, Gừng\nHương giữa: Dừa, Hoa phong lữ, Hoa tím, Táo, Xô thơm\nHương cuối: Gỗ vetiver, Long diên hương, Nhang, Nhựa thơm, Tuyết tùng, Xạ hương', 3300000, 10000, 1, 19, 1, 0, 0, 0, '2025-02-24 03:51:58'),
(108, 'Nước Hoa Nam Yves Saint Laurent Y Live EDT Intense', '/images/NướcHoaNamYvesSaintLaurentYLiveEDTIntense_nuoc-hoa-nam-yves-saint-laurent-y-live-edt-intense.jpg', 'Lưu hương: 4 giờ đến 6 giờ\nGiới tính: Nam\nNhóm hương: Hương thơm cay nồng\nNồng độ: Eau De Toilette (EDT)\nPhong cách: cuốn hút, Nam tính, Trẻ trung\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2019\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Hoa cam (Orange Blossom)\nHương giữa: Cam Bergamot, Gừng (Ginger)\nHương cuối: Cây bách xù (Juniper), Hiền nhân (Sage)\nXuất xứ: France', 3500000, 10000, 1, 19, 1, 0, 0, 0, '2025-02-24 03:52:02'),
(109, 'Nước Hoa Nam Yves Saint Laurent Y Le Parfum', '/images/NướcHoaNamYvesSaintLaurentYLeParfum_nuoc-hoa-nam-yves-saint-laurent-y-le-parfum.jpg', 'Lưu hương:  3 giờ đến 6 giờ\nGiới tính: Nam\nNhóm hương: Hương thơm dương xỉ\nNồng độ: Le Parfum\nPhong cách: Lịch lãm, cuốn hút\nĐộ tuổi khuyên dùng: trên 25\nToả hương: Xa – Toả hương trong vòng bán kính 2 mét\nHương đầu: andehit, Bưởi, Gừng, táo\nHương giữa: Cây xô thơm, phong lữ tuyệt đối, tinh chất oải hương\nHương cuối: Olibanum, tinh chất hoắc hương, tonka, Tuyết tùng', 3700000, 10000, 1, 19, 1, 0, 0, 0, '2025-02-24 03:52:05'),
(110, 'Nước Hoa Nam Yves Saint Laurent La Nuit de L’Homme EDT', '/images/NướcHoaNamYvesSaintLaurentLaNuitdeLHommeEDT_nuoc-hoa-nam-yves-saint-laurent-la-nuit-de-lhomme-edt-2.jpg', 'Lưu hương: 6-8h\nGiới tính: Nam\nNhóm hương: Hương gỗ cay nồng\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Nam tính, Mạnh mẽ, Quyến rũ\nĐộ tuổi khuyên dùng: trên 25\nNăm ra mắt: 2009\nNhà pha chế: Pierre Wargnye\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Bạch đậu khấu\nHương giữa: Cam Bergamot, Gỗ tuyết tùng Virginia, Hoa Oải Hương\nHương cuối: Cỏ hương bài, Thì là Ba Tư', 2500000, 10000, 1, 19, 1, 0, 0, 0, '2025-02-24 03:52:12'),
(111, 'Nước Hoa Nam Versace Eros Parfum', '/images/NướcHoaNamVersaceErosParfum_Nuoc-Hoa-Nam-Versace-Eros-Parfum.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nam\nNhóm hương: Hương thơm dương xỉ\nNồng độ: parfum\nPhong cách: Ấm áp, Cá tính, Độc Đáo, Lôi Cuốn\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2021\nNhà pha chế: Aurelien Guichard\nToả hương: Xa – Toả hương trong vòng bán kính 2 mét\nHương đầu: Cây bời lời đỏ, Dầu chanh, Dầu Elemi, Dầu Mandarin, Dầu tiêu đen\nHương giữa: Dầu bưởi, Dầu phong lữ, Dầu xô thơm., Hoa Oải Hương\nHương cuối: Benzoin Resinoid, Patchouli và Vanilla.', 2800000, 10000, 1, 20, 1, 0, 0, 0, '2025-02-24 03:54:18'),
(112, 'Nước Hoa Nam Versace Pour Homme', '/images/NướcHoaNamVersacePourHomme_nuoc-hoa-nam-versace-pour-homme.jpg', 'Lưu hương: 3 giờ đến 6 giờ\nGiới tính: Nam\nNhóm hương: Hương thơm dương xỉ\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Nam tính, Gợi cảm, Khoẻ khoắn, mát mẻ, Thanh lịch\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2008\nNhà pha chế: Alberto Morillas\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Cam Bergamot, Hoa cam Neroli, Hoa hồng de Mai (tháng năm), Quả chanh vàng\nHương giữa: Cây đơn sâm, Gỗ tuyết tùng, Hoa lan dạ hương, Hoa phong lữ\nHương cuối: Đậu Tonka, Hổ phách, Xạ hương', 2200000, 10000, 1, 20, 1, 0, 0, 0, '2025-02-24 03:54:21'),
(113, 'Nước Hoa Nam Versace Eros Flame', '/images/NướcHoaNamVersaceErosFlame_nuoc-hoa-nam-versace-eros-flame.jpg', 'Lưu hương:  7 giờ đến 12 giờ\nGiới tính: Nam\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nam tính, Lôi Cuốn, Mạnh mẽ\nĐộ tuổi khuyên dùng: trên 25\nNăm ra mắt: 2018\nNhà pha chế: Aurelien Guichard.\nToả hương: Xa – Toả hương trong vòng bán kính 2 mét\nHương đầu: Cây hương thảo, Chinotto, Quả chanh vàng, Quả quýt hồng, Tiêu đen\nHương giữa: Hoa hồng, Hoa phong lữ, Tiêu\nHương cuối: Cây hoắc hương, Đậu Tonka, Gỗ đàn hương, Gỗ tuyết tùng Texas, Hương Va ni, Rêu sồi', 2500000, 10000, 1, 20, 1, 0, 0, 0, '2025-02-24 03:54:24'),
(114, 'Nước Hoa Nam Versace Eau Fraiche', '/images/NướcHoaNamVersaceEauFraiche_nuoc-hoa-nam-versace-eau-fraiche.jpg', 'Lưu hương:  3 giờ đến 6 giờ\nGiới tính: Nam\nNhóm hương: Hương gỗ biển\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Dễ chịu, Hiện Đại, Khoẻ khoắn, Nam tính, Nhẹ nhàng, Thanh mát, tươi mát\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2006\nNhà pha chế: Olivier Cresp\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Bạch đậu khấu, Cam Bergamot, Gỗ cẩm lai Brazil, Quả chanh vàng, Quả khế\nHương giữa: Cây ngải dấm, Cây xô thơm, Gỗ tuyết tùng, Tiêu\nHương cuối: Cây sung dâu, Hổ phách, Hương của gỗ, Nghệ tây, Xạ hương', 2200000, 10000, 1, 20, 1, 1, 0, 0, '2025-02-24 03:54:27'),
(115, 'Nước Hoa Nam Versace Dylan Pour Homme', '/images/NướcHoaNamVersaceDylanPourHomme_nuoc-hoa-nam-versace-dylan-pour-homme.jpg', 'Lưu hương:  Từ 4h đến 6h\nGiới tính: Nam\nNhóm hương: Hương thơm thảo mộc phương đông\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Hấp dẫn, Nam tính, tươi mát\nĐộ tuổi khuyên dùng: Trên 18 tuổi\nNăm ra mắt: 2016\nNhà pha chế: Alberto Morillas\nToả hương: 1 cánh tay\nHương đầu: Cam Bergamot Calabria, Hương nước, Lá sung, Quả bưởi\nHương giữa: Cây hoắc hương, Giấy cói, Hương Ambroxan, Lá hoa tím, Tiêu Đen\nHương cuối: Đậu Tonka, Nhang (Hương), Saffron, Xạ hương', 2200000, 10000, 1, 20, 1, 0, 0, 0, '2025-02-24 03:54:35'),
(116, 'Nước Hoa Nam Versace Eros EDP', '/images/NướcHoaNamVersaceErosEDP_nuoc-hoa-nam-versace-eros-edp.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nam\nNhóm hương: Hương thơm dương xỉ\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Ấm áp, Cá tính, Hấp dẫn, Nam tính, Thu hút\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2012\nNhà pha chế: Aurelien Guichard\nToả hương: Xa – Toả hương trong vòng bán kính 2 mét\nHương đầu: Bạc hà, Cam, chanh, Kẹo táo, Quýt\nHương giữa: Ambroxan, Phong lữ, Xô thơm\nHương cuối: Da thuộc, Đàn hương, Hoắc Hương, Tuyết tùng, vanilla, Vỏ cam', 2500000, 10000, 1, 20, 1, 0, 0, 0, '2025-02-24 03:54:38'),
(117, 'Nước Hoa Nam Versace Eros EDT', '/images/NướcHoaNamVersaceErosEDT_nuoc-hoa-nam-versace-eros-edt-4.jpg', 'Lưu hương: Lâu – 6 giờ đến 8 giờ\nGiới tính: Nam\nNhóm hương: Hương thơm dương xỉ\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Ấm áp, cuốn hút, Lôi Cuốn, nổi bật, Thu hút\nĐộ tuổi khuyên dùng: Trên 22\nNăm ra mắt: 2012\nNhà pha chế: Aurelien Guichard\nToả hương: Xa – Toả hương trong vòng bán kính 2 mét\nHương đầu: Cây bạc hà, Quả chanh vàng, Táo xanh\nHương giữa: Đậu Tonka, Hoa phong lữ, Hương Ambroxan\nHương cuối: Cỏ hương bài, Gỗ tuyết tùng Atlas., Gỗ tuyết tùng Virginia 2, Hương Va ni Madagascar, Rêu sồi', 2200000, 10000, 1, 20, 1, 0, 0, 0, '2025-02-24 03:54:41'),
(118, 'Nước Hoa Nam Tom Ford Ombre Leather Parfum', '/images/NướcHoaNamTomFordOmbreLeatherParfum_nuoc-hoa-nam-tom-ford-ombre-leather-Parfum.jpg', 'Lưu hương: 10 đến 12 tiếng\nGiới tính: Nam\nNhóm hương: Da thuộc\nNồng độ: parfum\nPhong cách: Độc đáo, cuốn hút, Nam tính\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2021\nToả hương: xa, trong bán kính 2m\nHương đầu: Lá Violet và Tuyết Tùng\nHương giữa: Hoa Nhài Sambac và Orris\nHương cuối: Da thuộc, Hương Gỗ và Thuốc Lá', 5000000, 10000, 1, 21, 1, 0, 0, 0, '2025-02-24 03:55:41'),
(119, 'Nước Hoa Nam Gucci Guilty Love Edition Pour Homme', '/images/NướcHoaNamGucciGuiltyLoveEditionPourHomme_nuoc-hoa-nam-gucci-guilty-love-edition-pour-homme.jpg', 'Lưu hương:  6 giờ đến 8 giờ\nGiới tính: Nam\nNhóm hương: Hạt tiêu đỏ\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Nam tính, Hấp dẫn, phóng khoáng\nĐộ tuổi khuyên dùng: trên 25\nNăm ra mắt: 2020\nNhà pha chế: Sonia Constant\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Cam Mandarin, Gừng, Hồng tiêu, Trái quất\nHương giữa: Cây hương thảo, Hoa phong lữ, Lavender\nHương cuối: Benzoin, cỏ Vetiver, Hoắc Hương', 3500000, 10000, 1, 17, 1, 0, 0, 0, '2025-02-24 03:56:45'),
(120, 'Nước Hoa Nam Gucci Guilty Pour Homme Parfum', '/images/NướcHoaNamGucciGuiltyPourHommeParfum_nuoc-hoa-nam-gucci-guilty-pour-homme-Parfum-1.jpg', 'Lưu hương: 6-8h\nGiới tính: Nam\nNhóm hương: Hương gỗ cay nồng\nNồng độ: parfum\nPhong cách: Mạnh mẽ, Lịch lãm, Nam tính\nĐộ tuổi khuyên dùng: Trên 25 tuổi\nNăm ra mắt: 2022\nToả hương: Gần, trong vòng 1 cánh tay\nHương đầu: Chanh Ý, Lavender\nHương giữa: Hoa cam\nHương cuối: Hoắc Hương, Tuyết tùng, Vani\nXuất xứ: Ý', 3500000, 10000, 1, 17, 1, 0, 0, 0, '2025-02-24 03:56:48'),
(121, 'Nước Hoa Nam Gucci Guilty EDT Pour Homme', '/images/NướcHoaNamGucciGuiltyEDTPourHomme_nuoc-hoa-nam-gucci-guilty-edt-pour-homme.jpg', 'Lưu hương: 3 giờ đến 6 giờ\nGiới tính: Nam\nNhóm hương: Hương gỗ thơm\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Nam tính, Gợi cảm, Nam tính\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2011\nNhà pha chế: Jacques Huclier\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Hoa Oải Hương, Quả chanh vàng Amalfi\nHương giữa: Hoa cam Châu Phi\nHương cuối: Cây hoắc hương, Gỗ tuyết tùng Virginia, Hương Va ni', 5000000, 10000, 1, 17, 1, 0, 0, 0, '2025-02-24 03:56:51'),
(122, 'Nước Hoa Nam Gucci Guilty Eau Pour Homme EDT', '/images/NướcHoaNamGucciGuiltyEauPourHommeEDT_nuoc-hoa-nam-gucci-guilty-eau-pour-homme-edt-2.jpg', 'Lưu hương:  4-6h\nGiới tính: Nam\nNhóm hương: Hương gỗ thơm\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Nam tính, Lịch lãm, Thanh lịch\nĐộ tuổi khuyên dùng: Trên 25 tuổi\nNăm ra mắt: 2015\nToả hương: Gần, trong vòng 1 cánh tay\nHương đầu: Cam Bergamot, Quả chanh vàng\nHương giữa: Hoa cam, Hoa diên vĩ (Orris), Nhục đậu khấu (Nutmeg)\nHương cuối: Cây hoắc hương, Xạ hương\nXuất xứ: Ý', 3000000, 10000, 1, 17, 1, 0, 0, 0, '2025-02-24 03:56:54'),
(123, 'Nước Hoa Nam Gucci Guilty EDP Pour Homme', '/images/NướcHoaNamGucciGuiltyEDPPourHomme_nuoc-hoa-nam-gucci-guilty-edp-pour-homme.jpg', 'Lưu hương: 3 giờ đến 6 giờ\nGiới tính: Nam\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Nam tính, năng động, Nhẹ nhàng, nổi bật, sang trọng, Sành điệu, Sống Động\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2011\nNhà pha chế: Jacques Huclier\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Giấm balsamic, Hoa Hồng Tươi, Tiêu, Tiêu Đỏ\nHương giữa: Hoa cam, Hoa Oải Hương, Orange Blossom\nHương cuối: Hoắc Hương, Tuyết tùng', 1500000, 10000, 1, 17, 1, 0, 0, 0, '2025-02-24 03:57:02'),
(124, 'Nước Hoa Nam Gucci Guilty Black Pour Homme', '/images/NướcHoaNamGucciGuiltyBlackPourHomme_nuoc-hoa-nam-gucci-guilty-black-pour-homme.jpg', 'Lưu hương:  3 giờ đến 6 giờ\nGiới tính: Nam\nNhóm hương: Hương thơm dương xỉ\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Ấn tượng, Cá tính, Đẳng cấp, Hấp dẫn, Nam tính, Phong cách, Thu hút\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2013\nToả hương: Ngày, Đêm, Xuân, Hạ, Thu\nHương đầu: Hoa Oải Hương, Ngò thơm xanh lục\nHương giữa: Hoa cam, Hoa cam Neroli, Hương lục\nHương cuối: Cây hoắc hương, Gỗ tuyết tùng', 3000000, 10000, 1, 17, 1, 0, 0, 0, '2025-02-24 03:57:05'),
(125, 'Set Nước Hoa Nam Dior Sauvage EDP (100ml + 10ml)', '/images/SetNướcHoaNamDiorSauvageEDP100ml10ml_nuoc-hoa-nam-dior-sauvage-edp-.jpg', 'Lưu hương: Lâu, 7-12h\nGiới tính: Nam\nNhóm hương: Hương dương xỉ phương đông\nNồng độ: Eau De Parfum (EDP)\nPhong cách: cuốn hút, Quyến rũ, sang trọng\nĐộ tuổi khuyên dùng: Trên 25 tuổi\nToả hương: Gần, trong vòng 1 cánh tay\nHương đầu: Cam Bergamot\nHương giữa: Hoa Oải Hương, Hồi hương, Nhục đậu khấu, Xuyên tiêu\nHương cuối: Hương Ambroxan, Hương Va ni\nXuất xứ: Pháp', 3600000, 10000, 1, 15, 1, 0, 0, 0, '2025-02-24 03:58:49'),
(126, 'Nước Hoa Nam Chanel Allure Homme Sport EDT', '/images/NướcHoaNamChanelAllureHommeSportEDT_nuoc-hoa-nam-chanel-allure-homme-sport-edt.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nam\nNhóm hương: Hương gỗ\nPhong cách: Cá tính, Khoẻ khoắn, Lịch lãm, Nam tính, Phong cách, phóng khoáng, Trẻ trung\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2004\nNhà pha chế: Jacques Polge\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Hương An-đê-hít, Hương nước biển, Quả cam, Quả quýt hồng huyết\nHương giữa: Gỗ tuyết tùng, Hoa cam Neroli, Tiêu\nHương cuối: Cỏ hương bài, Đậu Tonka, Hổ phách, Hương nhựa cây Elemi, Hương Va ni, Xạ hương trắng', 1500000, 10000, 1, 14, 1, 0, 0, 0, '2025-02-24 03:59:46'),
(127, 'Nước Hoa Nam Chanel Bleu de Chanel Parfum', '/images/NướcHoaNamChanelBleudeChanelParfum_nuoc-hoa-nam-chanel-bleu-de-chanel-parfum.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nam\nNhóm hương: Hương gỗ\nNồng độ: parfum\nPhong cách: Ấn tượng, Cá tính, Chững chạc, Cổ điển, Hiện Đại, Mạnh mẽ, Nam tính, Phong cách, phóng khoáng, sang trọng, Sành điệu\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2018\nToả hương: xa – Toả hương trong vòng hơn 1 cánh tay\nHương đầu: Cam Bergamot, Cây bạc hà, Lemon Zest, Ngải\nHương giữa: Hoa Oải Hương, Hoa phong lữ, Hương lục, Quả dứa (quả thơm)\nHương cuối: Amberwood, Đậu Tonka, Gỗ đàn hương, Gỗ tuyết tùng, Hương Iso E Super', 1500000, 10000, 1, 14, 1, 0, 0, 0, '2025-02-24 03:59:49');
INSERT INTO `all_product` (`id_product`, `name_product`, `link_product`, `describe_product`, `price_product`, `quantity`, `type_product`, `brand_id`, `status`, `views`, `featured`, `discount_percent`, `created_at`) VALUES
(128, 'Nước Hoa Nam Chanel Bleu de Chanel EDT', '/images/NướcHoaNamChanelBleudeChanelEDT_nuoc-hoa-nam-chanel-bleu-de-chanel-edt.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nam\nNhóm hương: Hương gỗ\nNồng độ: Eau De Toilette (EDT)\nPhong cách: Cá tính, Chững chạc, Hiện Đại, Khoẻ khoắn, Lịch lãm, Nam tính, sang trọng, Sành điệu\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2010\nNhà pha chế: Jacques Polge\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Cây bạc hà, Hồng tiêu, Quả bưởi, Quả chanh vàng\nHương giữa: Gừng, Hoa nhài, Hương Iso E Super, Nhục đậu khấu\nHương cuối: Cây hoắc hương, Cỏ hương bài, Gỗ đàn hương, Gỗ tuyết tùng, Hương Labdanum, Nhang (Hương), Xạ hương trắng\nXuất xứ: France', 1500000, 10000, 1, 14, 1, 0, 0, 0, '2025-02-24 03:59:52'),
(129, 'Nước Hoa Nam Chanel Bleu de Chanel EDP', '/images/NướcHoaNamChanelBleudeChanelEDP_nuoc-hoa-nam-chanel-bleu-de-chanel-edp.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nam\nNhóm hương: Hương gỗ\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Cá tính, Chững chạc, Hấp dẫn, Hiện Đại, Mạnh mẽ, sang trọng, Sành điệu\nĐộ tuổi khuyên dùng: Trên 25\nToả hương: Gần – Toả hương trong vòng một cánh tay\nHương đầu: Cam Bergamot, Cây bạc hà, Hồng tiêu, Hương An-đê-hít, Ngò thơm, Quả bưởi, Quả chanh vàng\nHương giữa: Dưa gang, Gừng, Hoa nhài, Nhục đậu khấu\nHương cuối: Amberwood, Cây hoắc hương, Gỗ đàn hương, Gỗ tuyết tùng, Hổ phách, Hương Labdanum, Nhang (Hương)', 3800000, 10000, 1, 14, 1, 0, 0, 0, '2025-02-24 03:59:55'),
(130, 'Nước Hoa Nam Chanel Allure Homme Sport Eau Extreme', '/images/NướcHoaNamChanelAllureHommeSportEauExtreme_nuoc-hoa-nam-chanel-allure-homme-sport-eau-extreme.jpg', 'Lưu hương: 7 giờ đến 12 giờ\nGiới tính: Nam\nNhóm hương: Hương gỗ thơm\nNồng độ: Eau De Parfum (EDP)\nPhong cách: Cá tính, Chững chạc, Độc Đáo, Lôi Cuốn, năng động, Thanh lịch\nĐộ tuổi khuyên dùng: Trên 25\nNăm ra mắt: 2012\nNhà pha chế: Jacques Polge\nToả hương: Xa – Toả hương trong vòng bán kính 2 mét\nHương đầu: Cây bạc hà, Cây Xô Thơm, Quả quýt hồng\nHương giữa: Tiêu\nHương cuối: Đậu Tonka, Gỗ đàn hương, Gỗ tuyết tùng, Xạ hương', 3800000, 10000, 1, 14, 1, 1, 0, 0, '2025-02-24 04:00:02'),
(170, 'Nước Hoa Ex Nihilo Paris Atlas Fever', '/images/NướcHoaExNihiloParisAtlasFever_Nuoc-hoa-E-hilo-Atlas-Fever-600x600-1.png', 'Thương Hiệu: Ex Nihilo Paris\nNhóm nước hoa: Vanilla Hổ phách\nGiới tính: Nam, Nữ\nNồng độ: Eau de Parfum\nXuất xứ : Pháp\nĐộ tuổi khuyên dùng: Trên 20\nNăm ra mắt: 2017\nĐộ lưu hương: Rất lâu – Trên 9 tiếng\nĐộ toả hương: Gần – Toả hương trong vòng một cánh tay\nThời điểm khuyên dùng: Ngày, Đêm, Xuân, Hạ, Thu, Đông', 10000000, 10000, 3, 22, 1, 3, 0, 0, '2025-02-24 04:12:11'),
(171, 'Nước Hoa Nam Burberry Weekend For Men EDT', '/images/NươcHoaNamBurberryWeekendForMenEDT_nuo-c-hoa-nam-burberry-weekend-for-men-edt-100ml-610259260df44-29072021143046.webp', 'Thương hiệu\nBurberry\n\n\nXuất xứ\nAnh\n\n\nGiới tính\nNam\n\n\nDung tích\n100ml\n\n\nNồng độ\nEau De Toilette (EDT)\n\n\nMùi hương\nCitrus – hương cam, chanh\n\n\nThời gian lưu hương\n3 – 6 giờ\n\n\nĐộ tỏa hương\n1 cánh tay', 2000000, 10000, 3, 22, 1, 1, 0, 0, '2025-02-24 04:12:14'),
(172, 'Nước Hoa Nữ Lancôme Tresor La Nuit A La Folie EDP', '/images/NướcHoaNữLancômeTresorLaNuitALaFolieEDP_nuoc-hoa-nu-lancome-tresor-la-nuit-a-la-folie-edp-75ml-6184e821cc7bd-05112021151529.webp', 'Thương hiệu\nLancôme\n\n\nXuất xứ\nPháp\n\n\nGiới tính\nNữ\n\n\nNhóm hương\nHương vani phương Đông\n\n\nThời gian lưu hương\nLâu 6 – 8h\n\n\nĐộ tỏa hương\nTrong vòng 1 cánh tay\n\n\nDung tích\n75ml', 4000000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:17'),
(173, 'Nước Hoa Unisex Lattafa Ramz Silver EDP', '/images/NướcHoaUnisexLattafaRamzSilverEDP_ramz-silver-5.webp', 'Thương hiệu:\nLattafa\n\n\nXuất xứ:\nẢ Rập\n\n\nNhóm hương:\nHương vani phương đông\n\n\nPhong cách:\nĐộc đáo, Lôi cuốn, Nghệ thuật\n\n\nHương đầu: Cam Bergamot và Bạc hà, Hoa Oải Hương, Quả lê\nHương giữa: bạch đậu khấu và cây xô thơm\nHương cuối: Hổ phách, Vani', 1100000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:24'),
(174, 'Nước Hoa Diptyque Orphéon EDP', '/images/NướcHoaDiptyqueOrphéonEDP_Nuoc-Hoa-Diptyque-Orpheon-Y-Perfume.jpg', 'Thương hiệu: Diptyque\nGiới tính: Unisex\nNồng độ: Eau de Parfum\nXuất xứ: Pháp\nNhóm nước hoa: Hương Gỗ Thơm Chypre\nĐộ tuổi khuyên dùng: Trên 20\nNăm ra mắt: 2021\nĐộ lưu hương: Rất lâu – Trên 8 tiếng\nĐộ toả hương: Gần – Toả hương trong vòng một cánh tay.', 4700000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:27'),
(175, 'Nước Hoa Unisex Franck Boclet Cocaïne Rock & Riot EDP', '/images/NướcHoaUnisexFranckBocletCocaïneRockRiotEDP_nuoc-hoa-unisex-franck-boclet-coca-ne-rock-riot-edp-100ml-65654efa7301b-28112023092250.webp', 'Thương hiệu \nFranck Boclet\n\n\nXuất xứ\nPháp\n\n\nDung tích\n100ml\n\n\nNồng độ\nEau de Parfum (EDP)\n\n\nNhóm hương\nHương thơm ngát\n\n\nThời gian lưu hương\nLâu – Trên 12h\n\n\nĐộ tỏa hương\nGần – 1 cánh tay\n\n\nPhong cách\nCá tính, hiện đại, trẻ trung\n\n\nThời điểm nên dùng\nNgày, Đêm, Xuân, Hạ, Thu, Đông', 3200000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:30'),
(176, 'Tiziana Terenzi Lyncis Assoluto (Unisex) Extrait De Parfum Spray', '/images/TizianaTerenziLyncisAssolutoUnisexExtraitDeParfumSpray_nuoc-hoa-tiziana-terenzi-lyncis-assoluto-parfum-357190.jpg', '– Thương hiệu: Tiziana Terenzi\n– Xuất xứ: Ý\n– Dung tích: 100 ml\n– Dạng sản phẩm: Nước hoa dạng xịt\n– Loại nước hoa: Extrait De Parfum, với nồng độ tinh dầu cao.\n– Thời gian lưu hương: Lâu hơn 8 giờ\n– Độ tỏa hương: Xa, trong phạm vi 1-2 mét\n– Phong cách: Mạnh mẽ, lôi cuốn, bí ẩn\n– Phù hợp với: Nam và nữ', 150000000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:33'),
(177, 'Nước Hoa Unisex Diptyque Philosykos Eau De Parfum', '/images/NướcHoaUnisexDiptyquePhilosykosEauDeParfum_nuoc-hoa-unisex-diptyque-philosykos-eau-de-parfum-75ml-676e69acb108c-27122024154740.webp', 'Thương hiệu\nDiptyque\n\n\nXuất xứ\nPháp\n\n\nGiới tính\nUnisex\n\n\nMùi hương\nHương gỗ thơm\n\n\nThời gian lưu hương\n3-6h\n\n\nDung tích\n75ml\n\n\nPhong cách \nTinh tế, thanh lịch, sang trọng', 6500000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:36'),
(178, 'Nước Hoa Unisex Atelier Des Ors Pomelo Riviera EDP', '/images/NướcHoaUnisexAtelierDesOrsPomeloRivieraEDP_nuoc-hoa-unisex-atelier-des-ors-pomelo-riviera-edp-100ml-677612d884e2b-02012025111520.webp', 'Thương hiệu\nAtelier Des Ors\n\n\nXuất xứ\nPháp\n\n\nGiới tính\nUnisex\n\n\nNồng độ\nEau de Parfum (EDP)\n\n\nMùi hương\nCitrus – hương cam, chanh\n\n\nThời gian lưu hương\nTrên 9h\n\n\nDung tích\n100ml\n\n\nPhong cách \nDịu dàng, gợi cảm, sang trọng\n\n\nThời điểm nên dùng\nNgày, Đêm, Xuân, Hạ, Thu, Đông', 5500000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:39'),
(179, 'Nước Hoa Argos Adonis Awakens Eau de Parfum', '/images/NướcHoaArgosAdonisAwakensEaudeParfum_1-34-300x300-1.jpg', 'Thương hiệu: Argos\nGiới tính: Unisex\nNồng độ: Eau de Parfum\nXuất xứ: USA\nNăm ra mắt: 2022\nNhóm nước hoa: Floral Fruity Gourmand (Hương hoa cỏ, trái cây, ngọt ngào).\nHương đầu: Cam bergamot, Bưởi, Tiêu hồng\nHương giữa: Hoa hồng Bulgari, Hoa nhài sambac, Mâm xôi, Vanilla\nHương cuối: Gỗ đàn hương, Gỗ cashmere, Tinh chất Hoa hồng\nĐộ tuổi khuyên dùng: Trên 20\nĐộ lưu hương: Rất lâu – Trên 6 tiếng\nĐộ toả hương: Gần – Toả hương trong vòng một cánh tay\n\nĐánh giá sản phẩm Argos Adonis Awakens', 6500000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:41'),
(180, 'Nước Hoa Nam Yves Saint Laurent YSL Y EDP', '/images/NướcHoaNamYvesSaintLaurentYSLYEDP_nuoc-hoa-nam-yves-saint-laurent-y-eau-de-parfum-100ml-620610a49d8f3-11022022143044.webp', 'Thương hiệu:\nYves Saint Laurent\n\n\nNhóm hương:\nHương thơm dương xỉ\n\n\nPhong cách:\nNam tính, Thu hút\n\n\nHương đầu: Cam Bergamot, Gừng, Quả táo xanh\nHương giữa: Cây xô thơm, Hoa phong lữ, Quả Bách Xù\nHương cuối: Đậu Tonka, Amberwood, Cỏ hương bài, Gỗ tuyết tùng, Trầm hương', 4000000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:44'),
(181, 'Nước Hoa Nữ Yves Saint Laurent YSL Opium Eau De Parfum', '/images/NướcHoaNữYvesSaintLaurentYSLOpiumEauDeParfum_nuoc-hoa-nu-yves-saint-laurent-ysl-opium-eau-de-parfum-90ml-67594a408fb0e-11122024151600.webp', 'Thương hiệu:\nYves Saint Laurent\n\n\nXuất xứ:\nPháp\n\n\nNhóm hương:\nHương cay nồng phương đông\n\n\nPhong cách:\nNữ tính, Quyến rũ, Sang trọng\n\n\nHương đầu: Cam Bergamot, Hoa linh lan thung lũng, Quýt\nHương giữa: Hoa nhài, Myrhh\nHương cuối: Hổ phách, Hoắc Hương, Opoponax, Vani', 3300000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:47'),
(182, 'Nước Hoa Nam Lattafa His Confession EDP', '/images/NướcHoaNamLattafaHisConfessionEDP_fullbox-Lattafa-His-Confession-EDP-1.jpg', 'Thương hiệu:\nLattafa\n\n\nXuất xứ:\nDubai\n\n\nNhóm hương:\nOriental Woody\n\n\nPhong cách:\nLịch lãm, Mạnh mẽ\n\n\nHương đầu: Hoa Oải Hương, Quýt, Quế\nHương giữa: : Hoa Iris, Benzoin, cypress, Mahonial\nHương cuối: Đậu Tonka, Amber, Cây hoắc hương, Nhang, vanilla, Cedarwood', 2200000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:50'),
(183, 'Nước Hoa Unisex Tiziana Terenzi Poggia Extrait De Parfum', '/images/NướcHoaUnisexTizianaTerenziPoggiaExtraitDeParfum_Nuoc-Hoa-Unisex-Tiziana-Terenzi-Poggia-Extrait-De-Parfum-40-300x300-1.png', 'Độ lưu hương: Lâu – Từ 7 đến 12 giờ\nDung tích: 100ml\nĐộ tỏa hương: Xa – Toả hương trong vòng bán kính 2 mét\nGiới tính: Nam, Nữ, Unisex\nNhóm hương: Fruity – Hương trái cây\nNồng độ: Extrait – Parfum\nPhong cách: Gợi cảm, thu hút, tinh tế\nXuất xứ: Italy\nThương hiệu: Tiziana Terenzi', 100000000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:53'),
(184, 'Nước Hoa Unisex Diptyque Fleur De Peau Eau De Parfum', '/images/NướcHoaUnisexDiptyqueFleurDePeauEauDeParfum_nuoc-hoa-unisex-diptyque-fleur-de-peau-edp-75ml-64b7a473d463d-19072023155307.webp', 'Thương hiệu\nDIPTYQUE\n\n\nXuất xứ\nNước hoa Pháp\n\n\nDung tích\nChai 75ml\n\n\nNồng độ \nEau De Parfum\n\n\nNhóm hương\nFloral Aldehyde – Hương hoa cỏ Aldehyde\n\n\nĐộ lưu hương\nLâu, Từ 7 đến 12 tiếng\n\n\nĐộ tỏa hương\nGần – Toả hương trong vòng một cánh tay\n\n\nThời điểm nên dùng\nNgày, Đêm, Xuân, Thu, Đông', 6000000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:12:56'),
(185, 'Nước Hoa Unisex Tiziana Terenzi Cubia Extrait De Parfum', '/images/NướcHoaUnisexTizianaTerenziCubiaExtraitDeParfum_Nuoc-Hoa-Unisex-Tiziana-Terenzi-Cubia-Extrait-De-Parfum-30-300x300-1.jpg', 'Độ lưu hương: Lâu – Từ 7 đến 12 giờ\nDung tích: 100ml\nĐộ tỏa hương: Gần – Toả hương trong vòng một cánh tay\nGiới tính: Unisex\nNhóm hương: Floral – Hương hoa cỏ\nXuất xứ: Italy\nPhong cách: Mê hoặc, quyến rũ, sang trọng\nThương hiệu: Tiziana Terenzi\nNồng độ: Extrait – Parfum', 100000000, 9999, 3, 22, 1, 2, 0, 0, '2025-02-24 04:12:58'),
(186, 'Nước Hoa Nam Emporio Armani Stronger With You Tobacco EDP', '/images/NướcHoaNamEmporioArmaniStrongerWithYouTobaccoEDP_1-3-1.jpg', 'Thương hiệu: Giorgio Armani \nGiới tính: Nam\nNồng độ: Eau de Parfum\nXuất xứ: Ý\nNăm ra mắt: 2024\nNhóm nước hoa: Hương Cay Nồng Phương Đông\nHương đầu: Tiêu đen, tiêu hồng, elemi, bạch đậu khấu, cây xô thơm\nHương giữa: Thuốc lá nguyên chất, lá quế, ớt, hạt dẻ\nHương cuối: Bourbon vani, benzoin, gỗ guaiac, hổ phách\nĐộ tuổi khuyên dùng: Trên 20\nĐộ lưu hương: Rất lâu – Trên 6 tiếng\nĐộ toả hương: Gần – Toả hương trong vòng một cánh tay', 3700000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:13:01'),
(187, 'Tiziana Terenzi Orionis Assoluto (Unisex) Extrait De Parfum Spray 100 ml', '/images/TizianaTerenziOrionisAssolutoUnisexExtraitDeParfumSpray100ml_tiziana-terenzi-orionis-assoluto-extrait-de-parfum-perfume-cologne-526371.webp', 'Nhóm hương: Gỗ\n– Giới tính: Unisex\n– Độ tuổi: Trên 18 tuổi\n– Dung tích: 100 ml\n– Nồng độ: Eau de Parfum\n– Độ lưu hương: 8 giờ\n– Độ tỏa hương: 1 mét\n– Mùi hương: Cam bergamot, chanh, tiêu, hoa hồng, hoa nhài, hoa diên vĩ, gỗ đàn hương, gỗ tuyết tùng, hoắc hương\n– Phù hợp với các dịp: Trang trọng, buổi tối lãng mạn\n– Phù hợp làm quà tặng cho những người đặc biệt', 170000000, 9999, 3, 22, 1, 19, 0, 0, '2025-02-24 04:13:04'),
(188, 'Nước Hoa Unisex Roja Parfums Lost In Paris From Paris With Love Parfum 100ml', '/images/NướcHoaUnisexRojaParfumsLostInParisFromParisWithLoveParfum100ml_nuoc-hoa-unisex-roja-parfums-lost-in-paris-from-paris-with-love-parfum-100ml-66fb9bca5', 'Thương hiệu: Roja Dove \nGiới tính: Unisex\nNồng độ: Parfum\nXuất xứ: Anh\nNăm ra mắt: 2024\nNhóm nước hoa: Hương Vani Phương Đông\nHương đầu: Quýt, rượu Rum, cam đỏ và cam đắng\nHương giữa: Đường, bơ và caramel\nHương cuối: Hạt tiêu hồng, gỗ cashmere, xạ hương, gỗ tuyết tùng, đinh hương, long diên hương, vani và quế\nĐộ tuổi khuyên dùng: Trên 20\nĐộ lưu hương: Rất lâu – Trên 6 tiếng\nĐộ toả hương: Gần – Toả hương trong vòng một cánh tay', 18000000, 10000, 3, 22, 1, 0, 0, 0, '2025-02-24 04:13:07'),
(189, 'Nước Hoa Nữ Atelier Des Ors Rose Omeyyade EDP', '/images/NướcHoaNữAtelierDesOrsRoseOmeyyadeEDP_nuoc-hoa-nu-atelier-des-ors-rose-omeyyade-edp-100ml-67763a82163d5-02012025140434.webp', 'Thương hiệu\nAtelier Des Ors\n\n\nXuất xứ\nPháp\n\n\nGiới tính\nUnisex\n\n\nNồng độ\nEau de Parfum (EDP)\n\n\nMùi hương\nFloral Fruity – hương hoa cỏ trái cây\n\n\nThời gian lưu hương\n8 – 10h\n\n\nDung tích\n100ml\n\n\nPhong cách \nTươi mới, thanh lịch, tinh tế\n\n\nThời điểm nên dùng \nNgày, Xuân, Hè', 4500000, 9999, 3, 22, 1, 4, 0, 0, '2025-02-24 04:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `description`, `logo`, `created_at`) VALUES
(14, 'Chanel', 'chanel', 'Nhà mốt biểu tượng của sự thanh lịch vượt thời gian, với những thiết kế cổ điển, sang trọng và tinh tế. Nổi tiếng với nước hoa Chanel No.5 và túi xách Chanel Classic Flap.', '/images/brand/chanel.jpg', '2025-02-24 03:18:31'),
(15, 'Dior', 'dior', 'Biểu tượng của sự quyến rũ và lãng mạn Pháp. Dior mang đến những thiết kế haute couture xa hoa, nước hoa Dior J\'adore đầy nữ tính và các sản phẩm làm đẹp cao cấp.', '/images/brand/dior.jpg', '2025-02-24 03:23:38'),
(16, 'Hermes', 'hermes', 'Thương hiệu xa xỉ với di sản thủ công tinh xảo. Hermes nổi tiếng với túi xách Birkin và Kelly làm từ da thuộc cao cấp, khăn lụa họa tiết độc đáo và các sản phẩm phong cách sống sang trọng.', '/images/brand/hermes.jpg', '2025-02-24 03:25:56'),
(17, 'Gucci', 'gucci', 'Nhà mốt Ý nổi tiếng với phong cách táo bạo, hiện đại và đầy màu sắc. Gucci mang đến những thiết kế thời trang độc đáo, phụ kiện nổi bật và sự kết hợp giữa cổ điển và đương đại.', '/image/brand/gucci.jpg', '2025-02-24 03:40:38'),
(18, 'Narciso', 'narciso', 'Thương hiệu nước hoa nổi tiếng với hương thơm xạ hương đặc trưng, quyến rũ và gợi cảm. Narciso tôn vinh vẻ đẹp tự nhiên và sự tự tin của người phụ nữ.', '/images/brand/narciso.jpg', '2025-02-24 03:45:13'),
(19, 'Ysl', 'ysl', 'Yves Saint Laurent là biểu tượng của sự nổi loạn và phá cách trong thời trang. YSL mang đến những thiết kế mạnh mẽ, gợi cảm và đầy cá tính, cùng với các sản phẩm làm đẹp mang tính biểu tượng.', '/images/brand/ysl.jpg', '2025-02-24 03:49:10'),
(20, 'Versace', 'versace', 'Nhà mốt Ý nổi tiếng với sự xa hoa, gợi cảm và phong cách Địa Trung Hải. Versace mang đến những thiết kế lộng lẫy, họa tiết baroque đặc trưng và sự tự tin tuyệt đối.', '/images/brand/versace.jpg', '2025-02-24 03:54:17'),
(21, 'Tom Ford', 'tom-ford', 'Thương hiệu thời trang và làm đẹp cao cấp mang phong cách quyến rũ, sang trọng và hiện đại. Tom Ford nổi tiếng với những thiết kế lịch lãm, nước hoa nam tính và các sản phẩm trang điểm cao cấp.', '/images/brand/tom-ford.jpg', '2025-02-24 03:55:40'),
(22, 'Unknown Brand', 'unknown-brand', 'Thương hiệu chưa xác định. Mô tả sẽ được cập nhật khi có thông tin chi tiết.', NULL, '2025-02-24 04:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `message`, `created_at`) VALUES
(1, 'Nguyễn Đình Anh Tuấn', 'nguyentuan834897@gmail.com', '0398702156', 'fhghgfhfgh', '2025-02-21 09:16:30'),
(2, 'Nguyễn Đình Anh Tuấn', 'nguyentuan834897@gmail.com', '0398702156', 'gfhgfnbnvb', '2025-02-21 09:16:49'),
(3, 'Nguyễn Đình Anh Tuấn', 'nguyentuan834897@gmail.com', '0398702156', 'gfhgfnbnvb', '2025-02-21 09:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `nap_momo`
--

CREATE TABLE `nap_momo` (
  `id_momo` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `partner_code` varchar(50) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `order_info` varchar(50) NOT NULL,
  `result_code` int(11) NOT NULL,
  `order_type` varchar(50) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `pay_type` varchar(30) NOT NULL,
  `code_cart` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nap_momo`
--

INSERT INTO `nap_momo` (`id_momo`, `name`, `partner_code`, `order_id`, `amount`, `order_info`, `result_code`, `order_type`, `trans_id`, `pay_type`, `code_cart`, `created_at`) VALUES
(7, 'admin11', 'MOMOBKUN20180529', 1740419530, 50000, 'Thanh toán qua MoMo', 99, 'momo_wallet', 2147483647, 'aio_qr', 4136, '2025-02-25');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` varchar(50) NOT NULL,
  `shipping_address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `note` text DEFAULT NULL,
  `order_status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_method` varchar(20) NOT NULL DEFAULT 'wallet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `shipping_address`, `phone`, `note`, `order_status`, `created_at`, `payment_method`) VALUES
(9, 3, '4500000', 'Nam cao', '0398702156', '', 'pending', '2025-02-24 18:33:37', 'wallet'),
(10, 3, 'Khi nhận hàng', 'Nam cao', '0398702156', '', 'delivered', '2025-02-24 19:47:49', 'cod');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(9, 9, 189, 1, 4500000),
(10, 10, 187, 1, 170000000);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `ten_theloai` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `ten_theloai`, `slug`, `description`, `parent_id`, `created_at`, `image`) VALUES
(1, 'Nước hoa nam', 'nuoc-hoa-nam', 'Các loại nước hoa dành cho nam', NULL, '2025-02-20 05:46:46', '/images/boy1.jpg'),
(2, 'Nước hoa nữ', 'nuoc-hoa-nu', 'Các loại nước hoa dành cho nữ', NULL, '2025-02-20 05:46:46', '/images/nu1.jpg'),
(3, 'Nước hoa unisex', 'nuoc-hoa-unisex', 'Các loại nước hoa dùng được cho cả nam và nữ', NULL, '2025-02-20 05:46:46', '/images/nuochoakhac1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `trans_log`
--

CREATE TABLE `trans_log` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `amount` bigint(20) NOT NULL,
  `seri` text NOT NULL,
  `pin` text NOT NULL,
  `type` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `trans_id` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `trans_log`
--

INSERT INTO `trans_log` (`id`, `name`, `amount`, `seri`, `pin`, `type`, `status`, `trans_id`, `date`) VALUES
(150, 'admin11', 20000, '10010733102462', '713876590658331', 'Vinaphone', 0, 'cf24f8ca2602d1f936418eb8a5664b44', '2025-02-22 21:01:27'),
(151, 'admin11', 100000, '10010729340616', '017152354077592', 'Viettel', 0, '43e9c84acd9afebf7486f6e6bb4f15c9', '2025-02-22 21:03:37'),
(152, 'admin11', 30000, '10010729340616', '510244382266670', 'Vinaphone', 0, 'f16c6b010e31795eea0253b9100bea26', '2025-02-22 21:19:04'),
(153, 'admin11', 50000, '10010729340616', '113669051915932', 'Vinaphone', 0, 'ec1f101d82382572a8241897788b6f69', '2025-02-24 18:13:19'),
(154, 'admin11', 30000, '10010733102462', '621596474688811', 'Viettel', 0, '1b66584efe7d0fe0e28db846b0f12bca', '2025-02-24 18:14:22'),
(155, 'admin11', 20000, '10010729340616', '621596474688811', 'Vinaphone', 0, '5f54a3702ae07aa5d84969798585217e', '2025-02-24 18:17:35'),
(156, 'admin11', 500000, '10010733102462', '017789331544567', 'Viettel', 0, '9e1f82d7c7ee1667fce7d6162d766b22', '2025-02-24 18:19:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `all_product`
--
ALTER TABLE `all_product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `type_product` (`type_product`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nap_momo`
--
ALTER TABLE `nap_momo`
  ADD PRIMARY KEY (`id_momo`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `trans_log`
--
ALTER TABLE `trans_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `all_product`
--
ALTER TABLE `all_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nap_momo`
--
ALTER TABLE `nap_momo`
  MODIFY `id_momo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trans_log`
--
ALTER TABLE `trans_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_product`
--
ALTER TABLE `all_product`
  ADD CONSTRAINT `all_product_ibfk_1` FOREIGN KEY (`type_product`) REFERENCES `product_categories` (`id`),
  ADD CONSTRAINT `all_product_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `all_product` (`id_product`);

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
