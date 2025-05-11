-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: May 11, 2025 at 06:22 PM
-- Server version: 9.2.0
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `Carts`
--

CREATE TABLE `Carts` (
  `cart_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Carts`
--

INSERT INTO `Carts` (`cart_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-04-30 17:15:59', '2025-05-05 17:15:59'),
(2, 2, '2025-05-01 17:15:59', '2025-05-05 17:15:59'),
(3, 3, '2025-05-05 17:15:59', '2025-05-05 17:15:59'),
(4, 4, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(5, 5, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(6, 6, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(7, 7, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(8, 8, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(9, 9, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(10, 10, '2025-05-03 10:20:15', '2025-05-03 10:20:15'),
(11, 11, '2025-05-04 11:35:22', '2025-05-04 11:35:22'),
(12, 12, '2025-05-05 09:25:33', '2025-05-05 09:25:33'),
(13, 13, '2025-05-06 14:50:45', '2025-05-06 14:50:45'),
(14, 14, '2025-05-07 16:15:18', '2025-05-07 16:15:18'),
(15, 15, '2025-05-08 09:00:30', '2025-05-08 09:00:30'),
(16, 16, '2025-05-09 10:30:45', '2025-05-09 10:30:45'),
(17, 17, '2025-05-10 09:20:25', '2025-05-10 09:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `Cart_Items`
--

CREATE TABLE `Cart_Items` (
  `cart_item_id` int NOT NULL,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Cart_Items`
--

INSERT INTO `Cart_Items` (`cart_item_id`, `cart_id`, `product_id`, `quantity`, `added_at`) VALUES
(1, 2, 1, 3, '2025-05-05 17:22:34'),
(2, 3, 1, 4, '2025-05-05 17:22:34'),
(3, 1, 1, 2, '2025-05-05 17:22:34'),
(4, 4, 1, 2, '2025-05-09 09:49:32'),
(5, 5, 3, 2, '2025-05-09 09:49:32'),
(6, 6, 7, 1, '2025-05-09 09:49:32'),
(7, 7, 5, 1, '2025-05-09 09:49:32'),
(8, 8, 3, 2, '2025-05-09 09:49:32'),
(9, 9, 7, 1, '2025-05-09 09:49:32'),
(10, 10, 2, 1, '2025-05-03 10:45:12'),
(11, 11, 3, 1, '2025-05-04 12:10:33'),
(12, 12, 4, 2, '2025-05-05 09:50:22'),
(13, 13, 5, 1, '2025-05-06 15:25:45'),
(14, 14, 6, 3, '2025-05-07 16:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`category_id`, `category_name`) VALUES
(1, 'All'),
(3, 'Electronics & Appliances'),
(8, 'Electronics & Gadgets'),
(2, 'Fashion & Clothing'),
(6, 'Food & Beverages'),
(4, 'Health & Beauty'),
(5, 'Home & Living'),
(7, 'Mom & Baby'),
(9, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `Categories_Products`
--

CREATE TABLE `Categories_Products` (
  `category_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Categories_Products`
--

INSERT INTO `Categories_Products` (`category_id`, `product_id`) VALUES
(6, 1),
(8, 2),
(2, 3),
(4, 4),
(3, 5),
(9, 6),
(9, 7),
(5, 8),
(9, 9),
(9, 10),
(9, 11),
(6, 12),
(9, 13);

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `customer_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`customer_id`, `first_name`, `last_name`, `username`, `email`, `password`, `phone_number`, `created_at`, `updated_at`) VALUES
(1, 'Vanda', 'CPE', 'vanda123', 'vanda@gmail.com', 'pass1234', '0812345678', '2025-02-05 10:35:30', '2025-05-05 10:35:30'),
(2, 'Gim', 'CPE', 'gim123', 'gim@gmail.com', 'pass1234', '0812345679', '2025-03-14 11:01:03', '2025-05-05 13:46:56'),
(3, 'Pang', 'CPE', 'pang123', 'pang@gmail.com', 'pass1234', '0812345670', '2025-04-22 17:51:33', '2025-05-05 13:47:07'),
(4, 'Alice', 'Smith', 'alice_smith', 'alice@example.com', 'password123', '0802345678', '2025-04-30 03:27:40', '2025-05-09 08:51:59'),
(5, 'Bob', 'Johnson', 'bob_johnson', 'bob@example.com', 'password456', '0823456789', '2025-05-05 08:51:45', '2025-05-09 09:03:51'),
(6, 'Carol', 'Williams', 'carol_williams', 'carol@example.com', 'password789', '0834567890', '2025-05-09 08:51:45', '2025-05-09 09:03:56'),
(7, 'David', 'Brown', 'david_brown', 'david@example.com', 'pass321', '0841234567', '2025-05-09 08:51:45', '2025-05-09 09:04:00'),
(8, 'Eva', 'Davis', 'eva_davis', 'eva@example.com', 'pass654', '0852345678', '2025-05-10 08:51:45', '2025-05-09 09:04:04'),
(9, 'Frank', 'Miller', 'frank_miller', 'frank@example.com', 'pass987', '0863456789', '2025-05-10 08:51:45', '2025-05-09 09:04:09'),
(10, 'Sarah', 'Wilson', 'sarah_wilson', 'sarah@example.com', 'pass222', '0871234567', '2025-05-03 10:15:22', '2025-05-11 15:10:41'),
(11, 'Michael', 'Taylor', 'michael_taylor', 'michael@example.com', 'pass333', '0882345678', '2025-05-04 11:30:45', '2025-05-11 15:10:41'),
(12, 'Jennifer', 'Anderson', 'jennifer_anderson', 'jennifer@example.com', 'pass444', '0893456789', '2025-05-05 09:20:15', '2025-05-11 15:10:41'),
(13, 'Christopher', 'Thomas', 'chris_thomas', 'chris@example.com', 'pass555', '0904567890', '2025-05-06 14:45:30', '2025-05-11 15:10:41'),
(14, 'Jessica', 'Jackson', 'jessica_jackson', 'jessica@example.com', 'pass666', '0915678901', '2025-05-07 16:10:25', '2025-05-11 15:10:41'),
(15, 'Matthew', 'White', 'matt_white', 'matt@example.com', 'pass777', '0926789012', '2025-05-08 08:55:40', '2025-05-11 15:10:41'),
(16, 'Amanda', 'Harris', 'amanda_harris', 'amanda@example.com', 'pass888', '0937890123', '2025-05-09 10:25:33', '2025-05-11 15:10:41'),
(17, 'Daniel', 'Martin', 'daniel_martin', 'daniel@example.com', 'pass999', '0948901234', '2025-05-10 09:15:18', '2025-05-11 15:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Addresses`
--

CREATE TABLE `Customer_Addresses` (
  `address_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `address_line1` varchar(50) NOT NULL,
  `address_line2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postal_code` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customer_Addresses`
--

INSERT INTO `Customer_Addresses` (`address_id`, `customer_id`, `address_line1`, `address_line2`, `city`, `state`, `postal_code`, `country`, `created_at`) VALUES
(1, 1, '123 Main Street', NULL, 'Apt. 4B', 'Bangkok', '10110', 'Thailand', '2025-05-05 13:45:48'),
(2, 2, '456 Main Street', NULL, 'Apt. 4B', 'Bangkok', '10110', 'Thailand', '2025-05-05 13:47:25'),
(3, 3, '456 Sukhumvit Road', NULL, 'Bangkok', 'Bangkok', '10120', 'Thailand', '2025-05-05 15:13:04');

-- --------------------------------------------------------

--
-- Table structure for table `Interaction_Logs`
--

CREATE TABLE `Interaction_Logs` (
  `interaction_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `interaction_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `interaction_type` varchar(50) NOT NULL,
  `entity_type` varchar(50) NOT NULL,
  `entity_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Interaction_Logs`
--

INSERT INTO `Interaction_Logs` (`interaction_id`, `customer_id`, `interaction_timestamp`, `interaction_type`, `entity_type`, `entity_id`) VALUES
(1, 1, '2025-05-05 18:36:01', 'view', 'Products', 1),
(2, 1, '2025-05-05 18:36:01', 'search', 'Categories', 1),
(3, 2, '2025-05-09 11:15:11', 'view', 'Products', 1),
(4, 3, '2025-05-09 11:15:11', 'click', 'Categories', 2),
(5, 5, '2025-05-09 11:15:11', 'add_to_cart', 'Products', 1),
(6, 7, '2025-05-09 11:15:11', 'click', 'Products', 1),
(7, 8, '2025-05-09 11:15:11', 'view', 'Categories', 2),
(8, 9, '2025-05-09 11:15:11', 'add_to_cart', 'Products', 1),
(9, 10, '2025-05-01 08:30:15', 'view', 'Products', 11),
(10, 10, '2025-05-01 08:35:22', 'add_to_cart', 'Products', 11),
(11, 11, '2025-05-03 09:40:33', 'search', 'Categories', 6),
(12, 11, '2025-05-03 09:45:45', 'view', 'Products', 12),
(13, 11, '2025-05-03 09:50:18', 'add_to_cart', 'Products', 12),
(14, 12, '2025-05-05 10:55:22', 'view', 'Products', 8),
(15, 12, '2025-05-05 11:00:33', 'add_to_cart', 'Products', 8),
(16, 13, '2025-05-07 12:05:45', 'search', 'Categories', 9),
(17, 13, '2025-05-07 12:10:18', 'view', 'Products', 9),
(18, 13, '2025-05-07 12:15:22', 'add_to_cart', 'Products', 9),
(19, 14, '2025-05-09 13:20:33', 'view', 'Products', 10),
(20, 14, '2025-05-09 13:25:45', 'add_to_cart', 'Products', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_status` int NOT NULL,
  `payment_status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`order_id`, `customer_id`, `total_price`, `order_status`, `payment_status`, `created_at`) VALUES
(1, 1, 89.00, 1, 1, '2025-05-05 16:55:46'),
(2, 5, 9998.00, 1, 2, '2025-05-09 11:09:42'),
(3, 7, 2590.00, 2, 2, '2025-05-09 11:09:42'),
(4, 8, 9998.00, 1, 1, '2025-05-09 11:09:42'),
(5, 9, 3590.00, 1, 1, '2025-05-09 11:09:42'),
(6, 1, 178.00, 2, 1, '2025-03-10 13:22:15'),
(7, 2, 9998.00, 2, 1, '2025-03-15 14:33:45'),
(8, 3, 2590.00, 2, 1, '2025-03-20 15:44:22'),
(9, 4, 9998.00, 2, 1, '2025-03-25 16:55:33'),
(10, 5, 3590.00, 2, 1, '2025-04-05 10:15:45'),
(11, 6, 4999.00, 2, 1, '2025-04-10 11:25:18'),
(12, 7, 4500.00, 2, 1, '2025-04-15 12:35:22'),
(13, 8, 1200.00, 2, 1, '2025-04-20 13:45:33'),
(14, 9, 3800.00, 2, 1, '2025-04-25 14:55:45'),
(15, 10, 950.00, 1, 1, '2025-05-01 09:10:15'),
(16, 11, 650.00, 1, 1, '2025-05-03 10:20:22'),
(17, 12, 4500.00, 1, 1, '2025-05-05 11:30:33'),
(18, 13, 1200.00, 1, 1, '2025-05-07 12:40:45'),
(19, 14, 3800.00, 1, 1, '2025-05-09 13:50:18');

-- --------------------------------------------------------

--
-- Table structure for table `Order_Items`
--

CREATE TABLE `Order_Items` (
  `order_item_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Order_Items`
--

INSERT INTO `Order_Items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 2, 178.00),
(2, 2, 3, 2, 4999.00),
(3, 3, 5, 1, 2590.00),
(4, 4, 3, 2, 4999.00),
(5, 5, 7, 1, 3590.00),
(6, 6, 1, 2, 89.00),
(7, 7, 3, 2, 4999.00),
(8, 8, 5, 1, 2590.00),
(9, 9, 3, 2, 4999.00),
(10, 10, 7, 1, 3590.00),
(11, 11, 3, 1, 4999.00),
(12, 12, 8, 1, 4500.00),
(13, 13, 9, 1, 1200.00),
(14, 14, 10, 1, 3800.00),
(15, 15, 11, 1, 950.00),
(16, 16, 12, 1, 650.00),
(17, 17, 8, 1, 4500.00),
(18, 18, 9, 1, 1200.00),
(19, 19, 10, 1, 3800.00);

-- --------------------------------------------------------

--
-- Table structure for table `Payments`
--

CREATE TABLE `Payments` (
  `payment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `payment_method` int NOT NULL,
  `payment_status` int NOT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Payments`
--

INSERT INTO `Payments` (`payment_id`, `order_id`, `payment_method`, `payment_status`, `payment_date`, `transaction_id`, `create_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-05-05 17:47:16', 'TXN0001', '2025-05-05 17:47:16', '2025-05-05 17:47:16'),
(2, 2, 1, 2, NULL, NULL, '2025-05-09 11:11:11', '2025-05-09 11:11:11'),
(3, 3, 1, 0, NULL, NULL, '2025-05-09 11:11:11', '2025-05-09 11:11:11'),
(4, 4, 1, 1, NULL, 'TXN345678', '2025-05-09 11:11:11', '2025-05-09 11:11:11'),
(5, 5, 1, 1, NULL, 'TXN456789', '2025-05-09 11:11:11', '2025-05-09 11:11:11'),
(6, 6, 1, 1, '2025-03-10 13:30:15', 'TXN123456', '2025-03-10 13:30:15', '2025-05-11 15:10:41'),
(7, 7, 1, 1, '2025-03-15 14:40:45', 'TXN234567', '2025-03-15 14:40:45', '2025-05-11 15:10:41'),
(8, 8, 1, 1, '2025-03-20 15:50:22', 'TXN345679', '2025-03-20 15:50:22', '2025-05-11 15:10:41'),
(9, 9, 1, 1, '2025-03-25 17:00:33', 'TXN456780', '2025-03-25 17:00:33', '2025-05-11 15:10:41'),
(10, 10, 1, 1, '2025-04-05 10:20:45', 'TXN567890', '2025-04-05 10:20:45', '2025-05-11 15:10:41'),
(11, 11, 1, 1, '2025-04-10 11:30:18', 'TXN678901', '2025-04-10 11:30:18', '2025-05-11 15:10:41'),
(12, 12, 1, 1, '2025-04-15 12:40:22', 'TXN789012', '2025-04-15 12:40:22', '2025-05-11 15:10:41'),
(13, 13, 1, 1, '2025-04-20 13:50:33', 'TXN890123', '2025-04-20 13:50:33', '2025-05-11 15:10:41'),
(14, 14, 1, 1, '2025-04-25 15:00:45', 'TXN901234', '2025-04-25 15:00:45', '2025-05-11 15:10:41'),
(15, 15, 1, 1, '2025-05-01 09:15:15', 'TXN012345', '2025-05-01 09:15:15', '2025-05-11 15:10:41'),
(16, 16, 1, 1, '2025-05-03 10:25:22', 'TXN123450', '2025-05-03 10:25:22', '2025-05-11 15:10:41'),
(17, 17, 1, 1, '2025-05-05 11:35:33', 'TXN234501', '2025-05-05 11:35:33', '2025-05-11 15:10:41'),
(18, 18, 1, 1, '2025-05-07 12:45:45', 'TXN345012', '2025-05-07 12:45:45', '2025-05-11 15:10:41'),
(19, 19, 1, 1, '2025-05-09 13:55:18', 'TXN450123', '2025-05-09 13:55:18', '2025-05-11 15:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `product_id` int NOT NULL,
  `citizen_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(90) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pa_status` int NOT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `fs_start_time` timestamp NULL DEFAULT NULL,
  `fs_end_time` timestamp NULL DEFAULT NULL,
  `fs_created_at` timestamp NULL DEFAULT NULL,
  `fs_status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`product_id`, `citizen_id`, `name`, `description`, `price`, `stock_quantity`, `image_url`, `created_at`, `updated_at`, `pa_status`, `discount_percentage`, `fs_start_time`, `fs_end_time`, `fs_created_at`, `fs_status`) VALUES
(1, '1234567890123', 'Chocolate Chip Cookies', 'Delicious homemade cookies packed with chocolate chips.', 89.00, 50, 'https://tastesbetterfromscratch.com/wp-content/uploads/2020/02/Double-Chocolate-Cookies24-Thumbnail-1.jpg', '2025-05-05 16:05:44', '2025-05-11 18:11:51', 1, NULL, NULL, NULL, NULL, NULL),
(2, '2345678901234', 'iPhone 16e 128GB White', 'Latest model smartphone', 400000.00, 50, 'https://media-cdn.bnn.in.th/470246/iPhone_16e_White_1-square_medium.jpg', '2025-05-09 09:34:32', '2025-05-11 18:14:24', 0, NULL, NULL, NULL, NULL, NULL),
(3, '3456789012345', 'Designer Dress', 'Elegant evening dress', 4999.00, 20, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgUysIyUCzKrWyl3EjggAYWMC9RRY93Xdajg&s', '2025-05-09 09:34:32', '2025-05-11 18:14:58', 1, 15.00, '2025-05-01 00:00:00', '2025-05-15 23:59:59', '2025-04-25 10:00:00', 1),
(4, '4567890123456', 'Organic Skincare Set', 'Natural skincare products', 1999.00, 2, 'https://media.timeout.com/images/105473507/image.jpg', '2025-05-09 09:34:32', '2025-05-11 18:15:20', 0, NULL, NULL, NULL, NULL, NULL),
(5, '5678901234567', 'Blender Pro', 'High-power kitchen blender', 2590.00, 40, 'https://m.media-amazon.com/images/I/813t7vPL8iS.jpg', '2025-05-09 09:34:32', '2025-05-11 18:15:55', 1, 15.00, '2025-05-01 00:00:00', '2025-05-15 23:59:59', '2025-04-25 10:00:00', 1),
(6, '6789012345678', 'Romance Novel Set', 'Box set of 5 romance novels', 1490.00, 60, 'https://www.thebookbundler.com/cdn/shop/products/bulk-books-5-books-premium-used-harlequin-romance-intrigue-suspense-books-thebookbundler-13724113797214.jpg?v=1690491169&width=1445', '2025-05-09 09:34:32', '2025-05-11 18:16:58', 2, NULL, NULL, NULL, NULL, NULL),
(7, '7890123456789', 'Lego Castle', 'Castle-themed Lego set', 3590.00, 25, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTc-lQFQqAyPdAigpIai1Syq8eC3ONINXEow&s', '2025-05-09 09:34:32', '2025-05-11 18:17:19', 1, 15.00, '2025-05-01 00:00:00', '2025-05-15 23:59:59', '2025-04-25 10:00:00', 1),
(8, '8901234567890', 'Tennis Racket Pro', 'Professional grade tennis racket', 4500.00, 30, 'https://au.wilson.com/cdn/shop/files/WR150511U_4_Blade_Pro_98_16x19_V9_GR.png.cq5dam.web.1200.1200_1024x1024.jpg?v=1706652872', '2025-05-06 14:00:15', '2025-05-11 18:17:45', 1, 20.00, '2025-05-05 00:00:00', '2025-05-20 23:59:59', '2025-04-30 10:00:00', 1),
(9, '9012345678901', 'Premium Dog Food', 'Organic dog food 5kg bag', 1200.00, 45, 'https://m.media-amazon.com/images/I/61meUiA6IWL._AC_UF894,1000_QL80_.jpg', '2025-05-07 14:40:22', '2025-05-11 18:18:04', 1, NULL, NULL, NULL, NULL, NULL),
(10, '0123456789012', 'Acoustic Guitar', 'Beginner friendly acoustic guitar', 3800.00, 15, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKYGv_YEmBvoBWEiYouYyiXRVzxINkd8dMCg&s', '2025-05-08 15:25:33', '2025-05-11 18:18:42', 1, 20.00, '2025-05-05 00:00:00', '2025-05-20 23:59:59', '2025-04-30 10:00:00', 1),
(11, '1234567890122', 'Watercolor Set', 'Professional 24 color watercolor set', 950.00, 60, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfRUePc81i49D-hjFfgEv0qegQCET9AWPbcw&s', '2025-05-09 09:50:45', '2025-05-11 18:19:10', 1, NULL, NULL, NULL, NULL, NULL),
(12, '2345678901233', 'Organic Vegetables Box', 'Mixed organic vegetables weekly box', 650.00, 100, 'https://static.ooooby.org/image/product/npm/cb944129-0366-4006-b0ed-9e935893c93c.ec868af4.jpg', '2025-05-10 08:35:18', '2025-05-11 18:19:55', 1, NULL, NULL, NULL, NULL, NULL),
(13, '3456789012344', 'Generic Product', 'Just a generic product', 599.00, 10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB7aoLYROje8-HRV3leHl7TyLAMxParWTbMQ&s', '2025-04-01 09:25:45', '2025-05-11 18:21:13', 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Recommendations`
--

CREATE TABLE `Recommendations` (
  `recommendation_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `recommendation_score` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Recommendations`
--

INSERT INTO `Recommendations` (`recommendation_id`, `customer_id`, `product_id`, `recommendation_score`) VALUES
(1, 1, 1, 7),
(2, 8, 3, 8),
(3, 9, 7, 9),
(4, 2, 1, 4),
(5, 5, 3, 8),
(6, 7, 5, 6),
(7, 3, 5, 3),
(8, 10, 11, 9),
(9, 11, 12, 8),
(10, 12, 8, 7),
(11, 13, 9, 9),
(12, 14, 10, 8),
(15, 15, 6, 7),
(16, 16, 4, 8),
(17, 17, 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--

CREATE TABLE `Reviews` (
  `review_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `review_text` varchar(90) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Reviews`
--

INSERT INTO `Reviews` (`review_id`, `customer_id`, `product_id`, `rating`, `review_text`, `created_at`) VALUES
(1, 1, 1, 4, 'Yummy!', '2025-05-05 18:23:18'),
(2, 8, 3, 4, 'Very stylish and comfortable.', '2025-05-09 11:14:55'),
(3, 9, 7, 5, 'My kids love it!', '2025-05-09 11:14:55'),
(4, 10, 11, 5, 'Great quality watercolors! Vibrant colors.', '2025-05-01 09:20:15'),
(5, 11, 12, 4, 'Fresh vegetables, good variety.', '2025-05-03 10:30:22'),
(6, 12, 8, 5, 'Perfect tennis racket for my games.', '2025-05-05 11:40:33'),
(7, 13, 9, 4, 'My dog loves this food.', '2025-05-07 12:50:45'),
(8, 14, 10, 5, 'Excellent guitar for beginners.', '2025-05-09 14:00:18');

-- --------------------------------------------------------

--
-- Table structure for table `Sales_History`
--

CREATE TABLE `Sales_History` (
  `sale_id` int NOT NULL,
  `citizen_id` varchar(50) NOT NULL,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity_sold` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Sales_History`
--

INSERT INTO `Sales_History` (`sale_id`, `citizen_id`, `order_id`, `customer_id`, `product_id`, `quantity_sold`, `created_at`) VALUES
(1, '1234567890123', 1, 3, 1, 2, '2025-05-05 18:17:09'),
(2, '3456789012345', 4, 8, 3, 2, '2025-05-09 11:14:07'),
(3, '7890123456789', 5, 9, 7, 1, '2025-05-09 11:14:07'),
(4, '1234567890123', 6, 1, 1, 2, '2025-03-10 13:25:15'),
(5, '3456789012345', 7, 2, 3, 2, '2025-03-15 14:35:45'),
(6, '5678901234567', 8, 3, 5, 1, '2025-03-20 15:46:22'),
(7, '3456789012345', 9, 4, 3, 2, '2025-03-25 16:57:33'),
(8, '7890123456789', 10, 5, 7, 1, '2025-04-05 10:17:45'),
(9, '3456789012345', 11, 6, 3, 1, '2025-04-10 11:27:18'),
(10, '8901234567890', 12, 7, 8, 1, '2025-04-15 12:37:22'),
(11, '9012345678901', 13, 8, 9, 1, '2025-04-20 13:47:33'),
(12, '0123456789012', 14, 9, 10, 1, '2025-04-25 14:57:45'),
(13, '1234567890122', 15, 10, 11, 1, '2025-05-01 09:12:15'),
(14, '2345678901233', 16, 11, 12, 1, '2025-05-03 10:22:22'),
(15, '8901234567890', 17, 12, 8, 1, '2025-05-05 11:32:33'),
(16, '9012345678901', 18, 13, 9, 1, '2025-05-07 12:42:45'),
(17, '0123456789012', 19, 14, 10, 1, '2025-05-09 13:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `Sellers`
--

CREATE TABLE `Sellers` (
  `citizen_id` varchar(50) NOT NULL,
  `store_name` varchar(50) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `business_address` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qualification_status` int NOT NULL,
  `srl_status` int NOT NULL,
  `srl_date_previous` timestamp NULL DEFAULT NULL,
  `srl_date` timestamp NULL DEFAULT NULL,
  `avg_rating` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Sellers`
--

INSERT INTO `Sellers` (`citizen_id`, `store_name`, `owner_name`, `image_url`, `email`, `password`, `phone_number`, `business_address`, `created_at`, `updated_at`, `qualification_status`, `srl_status`, `srl_date_previous`, `srl_date`, `avg_rating`) VALUES
('0123456789012', 'MusicMasters', 'Ivan Chen', 'https://www.fau.edu/newsdesk/images/news/jail-suicide-newsdesk.jpg', 'music@example.com', 'pass678', '0929012345', '606 Beat Blvd, Pattaya', '2025-05-08 15:15:33', '2025-05-11 17:56:50', 1, 1, NULL, NULL, NULL),
('1234567890122', 'ArtSupplies', 'Julia Park', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTq10SqXhiRKDVLv43CkDPrUbOb9Y_xZ6lFw&s', 'art@example.com', 'pass901', '0930123456', '707 Canvas Rd, Hua Hin', '2025-05-09 09:40:45', '2025-05-11 17:59:08', 1, 1, NULL, NULL, NULL),
('1234567890123', 'SweetTreats Bakery', 'Somchai Meesuk', 'https://coingape.com/wp-content/uploads/2025/01/Donald-Trump-Launches-TRUMP-Solana-Meme-Coin-Ahead-of-Inauguration-768x512.webp', 'SweetTreatsBakery@gmail.com', 'SweetTreatsBakery123', '0812345678', '99 Moo 5, Ratchada Rd.', '2025-05-05 15:33:27', '2025-05-11 18:00:02', 1, 1, '2023-01-01 10:00:00', '2025-05-01 09:30:00', 3.75),
('2345678901233', 'OrganicFarm', 'Kevin Lee', 'https://img.iproperty.com.my/thinkofliving/750x500-fit,format=webp/wp-content/uploads/1/2011/10/t_hero.png', 'organic@example.com', 'pass234', '0941234567', '808 Green Path, Krabi', '2025-05-10 08:25:18', '2025-05-11 18:00:34', 1, 1, NULL, NULL, NULL),
('2345678901234', 'GadgetStore', 'Alice Smith', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxqB24JHnXnfJcvgMfJBTFjkPc-GIIDgHlsA&s', 'gadget@example.com', 'pass123', '0845678901', '123 Tech Rd, Bangkok', '2025-05-09 09:11:09', '2025-05-11 18:01:02', 1, 1, NULL, NULL, NULL),
('3456789012344', 'InactiveStore', 'Lazy Seller', 'https://creatorset.com/cdn/shop/files/Screenshot_2024-04-24_173231.png?v=1713973029', 'inactive@example.com', 'pass567', '0952345678', '909 Quiet St, Ayutthaya', '2025-04-01 09:15:22', '2025-05-11 18:01:56', 1, 1, NULL, NULL, NULL),
('3456789012345', 'FashionHub', 'Bob Johnson', 'https://a.pinatafarm.com/1280x828/00496f03a9/travis-scott-e85157c2d2fb16da6868dd289711104e-meme.jpeg', 'fashion@example.com', 'pass456', '0856789012', '456 Style St, Chiang Mai', '2025-05-09 09:11:09', '2025-05-11 18:02:38', 1, 1, NULL, NULL, NULL),
('4567890123456', 'BeautyCorner', 'Carol Williams', 'https://hips.hearstapps.com/hmg-prod/images/dv3-pfou0aaftp-1518629622.jpg?crop=0.800xw:1.00xh;0.101xw,0&resize=1200:*', 'beauty@example.com', 'pass789', '0867890123', '789 Beauty Ave, Phuket', '2025-05-09 09:11:09', '2025-05-11 18:03:04', 1, 1, NULL, NULL, NULL),
('5678901234567', 'KitchenWorld', 'David Brown', 'https://www.nme.com/wp-content/uploads/2023/03/David-Jonsson-Press_2_043.jpg', 'kitchen@example.com', 'pass321', '0874567890', '101 Cook Ln, Khon Kaen', '2025-05-09 09:16:37', '2025-05-11 18:03:34', 1, 1, NULL, NULL, NULL),
('6789012345678', 'BookHeaven', 'Eva Davis', 'https://img.decrypt.co/insecure/rs:fit:1920:0:0:0/plain/https://cdn.decrypt.co/wp-content/uploads/2024/11/chillguy-gID_7.jpg@webp', 'books@example.com', 'pass654', '0885678901', '202 Read St, Hat Yai', '2025-05-09 09:17:30', '2025-05-11 18:04:08', 1, 1, NULL, NULL, NULL),
('7890123456789', 'ToyLand', 'Frank Miller', 'https://images.techteesusa.com/2024/11/Elon-Musk-Chill-Guy-meme-circle.jpg', 'toys@example.com', 'pass987', '0896789012', '303 Play Ave, Korat', '2025-05-09 09:17:30', '2025-05-11 18:04:30', 1, 1, NULL, NULL, NULL),
('8901234567890', 'SportyGoods', 'George Wilson', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF3qeERkLQbjFRpflIsg2FRWUqIQJ0pfbTiA&s', 'sporty@example.com', 'pass012', '0907890123', '404 Active Ave, Bangkok', '2025-05-06 13:45:22', '2025-05-11 18:05:13', 1, 1, NULL, NULL, NULL),
('9012345678901', 'PetParadise', 'Helen Davis', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2DV2MUf7CjgWQzAP5jVNZrmi5nGBEY0lwaw&s', 'pets@example.com', 'pass345', '0918901234', '505 Animal St, Chiang Rai', '2025-05-07 14:30:15', '2025-05-11 18:05:36', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Seller_Bank_Accounts`
--

CREATE TABLE `Seller_Bank_Accounts` (
  `bank_account_id` int NOT NULL,
  `citizen_id` varchar(50) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `account_holder_name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Seller_Bank_Accounts`
--

INSERT INTO `Seller_Bank_Accounts` (`bank_account_id`, `citizen_id`, `bank_name`, `account_number`, `account_holder_name`, `created_at`) VALUES
(1, '1234567890123', 'Bangkok Bank', '123-456-7890', 'Somchai Meesuk', '2025-05-05 15:40:38'),
(2, '2345678901234', 'Bangkok Bank', '111-222-3333', 'Alice Smith', '2025-05-09 09:18:41'),
(3, '3456789012345', 'Kasikorn Bank', '222-333-4444', 'Bob Johnson', '2025-05-09 09:18:41'),
(4, '4567890123456', 'SCB', '333-444-5555', 'Carol Williams', '2025-05-09 09:18:41'),
(5, '5678901234567', 'Krungthai Bank', '444-555-6666', 'David Brown', '2025-05-09 09:18:41'),
(6, '6789012345678', 'TTB', '555-666-7777', 'Eva Davis', '2025-05-09 09:18:41'),
(7, '7890123456789', 'UOB', '666-777-8888', 'Frank Miller', '2025-05-09 09:18:41'),
(8, '8901234567890', 'Kasikorn Bank', '777-888-9999', 'George Wilson', '2025-05-06 13:50:33'),
(9, '9012345678901', 'Bangkok Bank', '888-999-0000', 'Helen Davis', '2025-05-07 14:35:45'),
(10, '0123456789012', 'SCB', '999-000-1111', 'Ivan Chen', '2025-05-08 15:20:22'),
(11, '1234567890122', 'Krungthai Bank', '000-111-2222', 'Julia Park', '2025-05-09 09:45:15'),
(12, '2345678901233', 'TTB', '111-222-1234', 'Kevin Lee', '2025-05-10 08:30:33'),
(13, '3456789012344', 'Bangkok Bank', '987-654-3210', 'Lazy Seller', '2025-04-01 09:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `Shipments`
--

CREATE TABLE `Shipments` (
  `shipment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `tracking_number` varchar(50) NOT NULL,
  `shipping_status` int NOT NULL,
  `estimated_delivery_date` timestamp NULL DEFAULT NULL,
  `shipping_company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Shipments`
--

INSERT INTO `Shipments` (`shipment_id`, `order_id`, `tracking_number`, `shipping_status`, `estimated_delivery_date`, `shipping_company_id`) VALUES
(1, 1, 'TRACK123', 2, '2025-05-10 12:00:00', 2),
(2, 4, 'TRACK234', 2, '2025-05-24 18:13:27', 1),
(3, 5, 'TRACK345', 1, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Shipping_Companies`
--

CREATE TABLE `Shipping_Companies` (
  `shipping_company_id` int NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `contact_info` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Shipping_Companies`
--

INSERT INTO `Shipping_Companies` (`shipping_company_id`, `company_name`, `contact_info`) VALUES
(1, 'Kerry Express', '02-123-4567'),
(2, 'Flash Express', '02-234-5678'),
(3, 'QuickDelivery', '03-456-7890');

-- --------------------------------------------------------

--
-- Table structure for table `Wishlists`
--

CREATE TABLE `Wishlists` (
  `wishlist_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Wishlists`
--

INSERT INTO `Wishlists` (`wishlist_id`, `customer_id`, `product_id`, `created_at`) VALUES
(1, 2, 1, '2025-05-05 18:20:09'),
(2, 3, 1, '2025-05-05 18:20:09'),
(3, 4, 2, '2025-05-09 11:14:21'),
(4, 5, 6, '2025-05-09 11:14:21'),
(5, 6, 1, '2025-05-09 11:14:21'),
(6, 7, 5, '2025-05-09 11:14:21'),
(7, 8, 6, '2025-05-09 11:14:21'),
(8, 9, 4, '2025-05-09 11:14:21'),
(9, 10, 3, '2025-05-01 08:40:15'),
(10, 10, 7, '2025-05-01 08:45:22'),
(11, 11, 5, '2025-05-03 09:55:33'),
(12, 12, 10, '2025-05-05 11:05:45'),
(13, 13, 8, '2025-05-07 12:20:18'),
(14, 14, 11, '2025-05-09 13:30:22'),
(15, 15, 9, '2025-05-08 09:05:33'),
(16, 16, 12, '2025-05-09 10:35:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Carts`
--
ALTER TABLE `Carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `Cart_Items`
--
ALTER TABLE `Cart_Items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `Categories_Products`
--
ALTER TABLE `Categories_Products`
  ADD PRIMARY KEY (`category_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `Customer_Addresses`
--
ALTER TABLE `Customer_Addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `Interaction_Logs`
--
ALTER TABLE `Interaction_Logs`
  ADD PRIMARY KEY (`interaction_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `Order_Items`
--
ALTER TABLE `Order_Items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD UNIQUE KEY `transaction_id_2` (`transaction_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `Products_ibfk_1` (`citizen_id`);

--
-- Indexes for table `Recommendations`
--
ALTER TABLE `Recommendations`
  ADD PRIMARY KEY (`recommendation_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `Sales_History`
--
ALTER TABLE `Sales_History`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `citizen_id` (`citizen_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `Sellers`
--
ALTER TABLE `Sellers`
  ADD PRIMARY KEY (`citizen_id`),
  ADD UNIQUE KEY `store_name` (`store_name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `image_url` (`image_url`),
  ADD UNIQUE KEY `image_url_2` (`image_url`);

--
-- Indexes for table `Seller_Bank_Accounts`
--
ALTER TABLE `Seller_Bank_Accounts`
  ADD PRIMARY KEY (`bank_account_id`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `citizen_id` (`citizen_id`);

--
-- Indexes for table `Shipments`
--
ALTER TABLE `Shipments`
  ADD PRIMARY KEY (`shipment_id`),
  ADD UNIQUE KEY `tracking_number` (`tracking_number`),
  ADD KEY `shipping_company_id` (`shipping_company_id`);

--
-- Indexes for table `Shipping_Companies`
--
ALTER TABLE `Shipping_Companies`
  ADD PRIMARY KEY (`shipping_company_id`),
  ADD UNIQUE KEY `company_name` (`company_name`);

--
-- Indexes for table `Wishlists`
--
ALTER TABLE `Wishlists`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Carts`
--
ALTER TABLE `Carts`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Cart_Items`
--
ALTER TABLE `Cart_Items`
  MODIFY `cart_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Customer_Addresses`
--
ALTER TABLE `Customer_Addresses`
  MODIFY `address_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Interaction_Logs`
--
ALTER TABLE `Interaction_Logs`
  MODIFY `interaction_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `Order_Items`
--
ALTER TABLE `Order_Items`
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `Payments`
--
ALTER TABLE `Payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Recommendations`
--
ALTER TABLE `Recommendations`
  MODIFY `recommendation_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Reviews`
--
ALTER TABLE `Reviews`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Sales_History`
--
ALTER TABLE `Sales_History`
  MODIFY `sale_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Seller_Bank_Accounts`
--
ALTER TABLE `Seller_Bank_Accounts`
  MODIFY `bank_account_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Shipments`
--
ALTER TABLE `Shipments`
  MODIFY `shipment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Shipping_Companies`
--
ALTER TABLE `Shipping_Companies`
  MODIFY `shipping_company_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Wishlists`
--
ALTER TABLE `Wishlists`
  MODIFY `wishlist_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Carts`
--
ALTER TABLE `Carts`
  ADD CONSTRAINT `Carts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`);

--
-- Constraints for table `Cart_Items`
--
ALTER TABLE `Cart_Items`
  ADD CONSTRAINT `Cart_Items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `Carts` (`cart_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Cart_Items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

--
-- Constraints for table `Categories_Products`
--
ALTER TABLE `Categories_Products`
  ADD CONSTRAINT `Categories_Products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Categories_Products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `Customer_Addresses`
--
ALTER TABLE `Customer_Addresses`
  ADD CONSTRAINT `Customer_Addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`);

--
-- Constraints for table `Interaction_Logs`
--
ALTER TABLE `Interaction_Logs`
  ADD CONSTRAINT `Interaction_Logs_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`);

--
-- Constraints for table `Order_Items`
--
ALTER TABLE `Order_Items`
  ADD CONSTRAINT `Order_Items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  ADD CONSTRAINT `Order_Items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

--
-- Constraints for table `Payments`
--
ALTER TABLE `Payments`
  ADD CONSTRAINT `Payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`);

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`citizen_id`) REFERENCES `Sellers` (`citizen_id`) ON DELETE CASCADE;

--
-- Constraints for table `Recommendations`
--
ALTER TABLE `Recommendations`
  ADD CONSTRAINT `Recommendations_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`),
  ADD CONSTRAINT `Recommendations_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

--
-- Constraints for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`),
  ADD CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

--
-- Constraints for table `Sales_History`
--
ALTER TABLE `Sales_History`
  ADD CONSTRAINT `Sales_History_ibfk_1` FOREIGN KEY (`citizen_id`) REFERENCES `Sellers` (`citizen_id`),
  ADD CONSTRAINT `Sales_History_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  ADD CONSTRAINT `Sales_History_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`),
  ADD CONSTRAINT `Sales_History_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

--
-- Constraints for table `Seller_Bank_Accounts`
--
ALTER TABLE `Seller_Bank_Accounts`
  ADD CONSTRAINT `Seller_Bank_Accounts_ibfk_1` FOREIGN KEY (`citizen_id`) REFERENCES `Sellers` (`citizen_id`);

--
-- Constraints for table `Shipments`
--
ALTER TABLE `Shipments`
  ADD CONSTRAINT `Shipments_ibfk_1` FOREIGN KEY (`shipping_company_id`) REFERENCES `Shipping_Companies` (`shipping_company_id`);

--
-- Constraints for table `Wishlists`
--
ALTER TABLE `Wishlists`
  ADD CONSTRAINT `Wishlists_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`),
  ADD CONSTRAINT `Wishlists_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
