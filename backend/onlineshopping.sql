-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: May 09, 2025 at 11:26 AM
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
(1, 1, '2025-05-05 17:15:59', '2025-05-05 17:15:59'),
(2, 2, '2025-05-05 17:15:59', '2025-05-05 17:15:59'),
(3, 3, '2025-05-05 17:15:59', '2025-05-05 17:15:59'),
(4, 4, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(5, 5, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(6, 6, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(7, 7, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(8, 8, '2025-05-09 09:42:44', '2025-05-09 09:42:44'),
(9, 9, '2025-05-09 09:42:44', '2025-05-09 09:42:44');

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
) ;

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
(9, 9, 7, 1, '2025-05-09 09:49:32');

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
(9, 7);

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
(1, 'Vanda', 'CPE', 'vanda123', 'vanda@gmail.com', 'pass1234', '0812345678', '2025-05-05 10:35:30', '2025-05-05 10:35:30'),
(2, 'Gim', 'CPE', 'gim123', 'gim@gmail.com', 'pass1234', '0812345679', '2025-05-05 10:37:45', '2025-05-05 13:46:56'),
(3, 'Pang', 'CPE', 'pang123', 'pang@gmail.com', 'pass1234', '0812345670', '2025-05-05 10:40:10', '2025-05-05 13:47:07'),
(4, 'Alice', 'Smith', 'alice_smith', 'alice@example.com', 'password123', '0802345678', '2025-05-09 08:51:45', '2025-05-09 08:51:59'),
(5, 'Bob', 'Johnson', 'bob_johnson', 'bob@example.com', 'password456', '0823456789', '2025-05-09 08:51:45', '2025-05-09 09:03:51'),
(6, 'Carol', 'Williams', 'carol_williams', 'carol@example.com', 'password789', '0834567890', '2025-05-09 08:51:45', '2025-05-09 09:03:56'),
(7, 'David', 'Brown', 'david_brown', 'david@example.com', 'pass321', '0841234567', '2025-05-09 08:51:45', '2025-05-09 09:04:00'),
(8, 'Eva', 'Davis', 'eva_davis', 'eva@example.com', 'pass654', '0852345678', '2025-05-09 08:51:45', '2025-05-09 09:04:04'),
(9, 'Frank', 'Miller', 'frank_miller', 'frank@example.com', 'pass987', '0863456789', '2025-05-09 08:51:45', '2025-05-09 09:04:09');

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
(8, 9, '2025-05-09 11:15:11', 'add_to_cart', 'Products', 1);

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
(5, 9, 3590.00, 1, 1, '2025-05-09 11:09:42');

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
(5, 5, 7, 1, 3590.00);

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
(5, 5, 1, 1, NULL, 'TXN456789', '2025-05-09 11:11:11', '2025-05-09 11:11:11');

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
  `image_url` varchar(90) NOT NULL,
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
(1, '1234567890123', 'Chocolate Chip Cookies', 'Delicious homemade cookies packed with chocolate chips.', 89.00, 50, 'https://shorturl.at/ZaggE', '2025-05-05 16:05:44', '2025-05-05 16:05:44', 1, NULL, NULL, NULL, NULL, NULL),
(2, '2345678901234', 'iPhone 16e 128GB White', 'Latest model smartphone', 400000.00, 50, 'https://shorturl.asia/h6eau', '2025-05-09 09:34:32', '2025-05-09 09:34:32', 0, NULL, NULL, NULL, NULL, NULL),
(3, '3456789012345', 'Designer Dress', 'Elegant evening dress', 4999.00, 20, 'https://shorturl.asia/JU3Vf', '2025-05-09 09:34:32', '2025-05-09 09:34:32', 1, NULL, NULL, NULL, NULL, NULL),
(4, '4567890123456', 'Organic Skincare Set', 'Natural skincare products', 1999.00, 2, 'https://shorturl.asia/cXGdM', '2025-05-09 09:34:32', '2025-05-09 09:34:32', 0, NULL, NULL, NULL, NULL, NULL),
(5, '5678901234567', 'Blender Pro', 'High-power kitchen blender', 2590.00, 40, 'https://shorturl.asia/AYg31', '2025-05-09 09:34:32', '2025-05-09 09:34:32', 1, NULL, NULL, NULL, NULL, NULL),
(6, '6789012345678', 'Romance Novel Set', 'Box set of 5 romance novels', 1490.00, 60, 'https://shorturl.asia/tERrf', '2025-05-09 09:34:32', '2025-05-09 09:34:32', 2, NULL, NULL, NULL, NULL, NULL),
(7, '7890123456789', 'Lego Castle', 'Castle-themed Lego set', 3590.00, 25, 'https://shorturl.asia/1c8ZP', '2025-05-09 09:34:32', '2025-05-09 09:34:32', 1, NULL, NULL, NULL, NULL, NULL);

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
(7, 3, 5, 3);

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
(3, 9, 7, 5, 'My kids love it!', '2025-05-09 11:14:55');

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
(3, '7890123456789', 5, 9, 7, 1, '2025-05-09 11:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `Sellers`
--

CREATE TABLE `Sellers` (
  `citizen_id` varchar(50) NOT NULL,
  `store_name` varchar(50) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `image_url` varchar(90) DEFAULT NULL,
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
('1234567890123', 'SweetTreats Bakery', 'Somchai Meesuk', 'https://shorturl.at/Uh4J0', 'SweetTreatsBakery@gmail.com', 'SweetTreatsBakery123', '0812345678', '99 Moo 5, Ratchada Rd.', '2025-05-05 15:33:27', '2025-05-05 15:33:27', 1, 1, '2023-01-01 10:00:00', '2025-05-01 09:30:00', 3.75),
('2345678901234', 'GadgetStore', 'Alice Smith', 'https://shorturl.at/USfjE', 'gadget@example.com', 'pass123', '0845678901', '123 Tech Rd, Bangkok', '2025-05-09 09:11:09', '2025-05-09 09:11:09', 1, 1, NULL, NULL, NULL),
('3456789012345', 'FashionHub', 'Bob Johnson', 'https://shorturl.at/LjHOb', 'fashion@example.com', 'pass456', '0856789012', '456 Style St, Chiang Mai', '2025-05-09 09:11:09', '2025-05-09 09:11:09', 1, 1, NULL, NULL, NULL),
('4567890123456', 'BeautyCorner', 'Carol Williams', 'https://shorturl.asia/2ixnG', 'beauty@example.com', 'pass789', '0867890123', '789 Beauty Ave, Phuket', '2025-05-09 09:11:09', '2025-05-09 09:11:09', 1, 1, NULL, NULL, NULL),
('5678901234567', 'KitchenWorld', 'David Brown', 'https://shorturl.asia/XYfj1', 'kitchen@example.com', 'pass321', '0874567890', '101 Cook Ln, Khon Kaen', '2025-05-09 09:16:37', '2025-05-09 09:16:37', 1, 1, NULL, NULL, NULL),
('6789012345678', 'BookHeaven', 'Eva Davis', 'https://shorturl.asia/YLCu2', 'books@example.com', 'pass654', '0885678901', '202 Read St, Hat Yai', '2025-05-09 09:17:30', '2025-05-09 09:17:30', 1, 1, NULL, NULL, NULL),
('7890123456789', 'ToyLand', 'Frank Miller', 'https://shorturl.asia/xArKB', 'toys@example.com', 'pass987', '0896789012', '303 Play Ave, Korat', '2025-05-09 09:17:30', '2025-05-09 09:17:30', 1, 1, NULL, NULL, NULL);

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
(7, '7890123456789', 'UOB', '666-777-8888', 'Frank Miller', '2025-05-09 09:18:41');

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
(8, 9, 4, '2025-05-09 11:14:21');

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
  ADD UNIQUE KEY `image_url` (`image_url`);

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
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Cart_Items`
--
ALTER TABLE `Cart_Items`
  MODIFY `cart_item_id` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `interaction_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Order_Items`
--
ALTER TABLE `Order_Items`
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Payments`
--
ALTER TABLE `Payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Recommendations`
--
ALTER TABLE `Recommendations`
  MODIFY `recommendation_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Reviews`
--
ALTER TABLE `Reviews`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Sales_History`
--
ALTER TABLE `Sales_History`
  MODIFY `sale_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Seller_Bank_Accounts`
--
ALTER TABLE `Seller_Bank_Accounts`
  MODIFY `bank_account_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `wishlist_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
