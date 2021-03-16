-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2020 at 05:45 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salondb`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `appointment_status` tinyint(1) DEFAULT NULL,
  `specialist_specialist_id` int(11) NOT NULL,
  `auth_user_id` int(11) NOT NULL,
  `services_service_id` int(11) DEFAULT NULL,
  `package_package` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `appointment_date`, `appointment_time`, `appointment_status`, `specialist_specialist_id`, `auth_user_id`, `services_service_id`, `package_package`) VALUES
(41, '2020-02-13', '06:27:00', 1, 2, 7, 4, NULL),
(42, '2020-02-13', '06:27:00', 1, 2, 7, 4, NULL),
(43, '2020-02-15', '08:30:00', 1, 2, 7, 3, NULL),
(49, '2020-02-15', '08:30:00', 1, 2, 7, 3, NULL),
(50, '2020-02-15', '08:30:00', 1, 2, 7, 3, NULL),
(51, '2020-02-15', '08:30:00', 1, 2, 7, 3, NULL),
(52, '2020-02-15', '08:30:00', 1, 2, 7, 3, NULL),
(53, '2020-02-15', '08:30:00', 1, 2, 7, 3, NULL),
(54, '2020-02-15', '08:30:00', 1, 2, 7, 3, NULL),
(55, '2020-02-15', '08:30:00', 1, 2, 7, 3, NULL),
(56, '2022-04-15', '14:17:00', 1, 2, 7, 4, NULL),
(57, '2022-04-15', '14:17:00', 1, 2, 7, 4, NULL),
(58, '2022-04-15', '14:17:00', 1, 2, 7, 4, NULL),
(60, '2020-03-03', '17:00:00', 0, 1, 5, 3, NULL),
(61, '2020-03-05', '18:00:00', 0, 2, 5, 4, NULL),
(62, '2020-03-05', '18:00:00', 1, 2, 5, 4, NULL),
(63, '2020-03-05', '11:00:00', 1, 1, 5, 3, NULL),
(64, '2020-03-07', '12:00:00', 1, 2, 5, 2, NULL),
(65, '2020-03-13', '12:00:00', 0, 2, 5, 2, NULL),
(66, '2020-03-09', '12:00:00', 0, 2, 5, 3, NULL),
(67, '2020-03-09', '12:00:00', 0, 2, 5, 3, NULL),
(68, '2020-03-09', '12:00:00', 1, 2, 5, 3, NULL),
(69, '2020-03-09', '12:00:00', 1, 2, 5, 3, NULL),
(70, '2020-03-11', '15:00:00', 1, 2, 5, 3, NULL),
(71, '2020-03-11', '15:00:00', 1, 2, 5, 3, NULL),
(72, '2020-03-08', '17:00:00', 1, 1, 5, 1, NULL),
(73, '2020-03-08', '17:00:00', 1, 1, 5, 1, NULL),
(74, '2020-03-17', '11:00:00', 0, 2, 5, 2, NULL),
(75, '2020-03-07', '09:00:00', 1, 2, 7, 1, NULL),
(76, '2020-03-07', '09:00:00', 1, 2, 7, 1, NULL),
(77, '2020-03-09', '14:00:00', 1, 2, 7, 2, NULL),
(78, '2020-03-09', '14:00:00', 1, 2, 7, 2, NULL),
(112, '2020-03-11', '16:00:00', 1, 2, 8, 1, NULL),
(117, '2020-03-15', '03:00:00', 1, 2, 8, 2, NULL),
(118, '2020-03-12', '13:00:00', 1, 1, 5, 9, NULL),
(119, '2020-03-12', '12:00:00', 0, 1, 5, 6, NULL),
(120, '2020-03-12', '15:00:00', 1, 1, 7, 9, NULL),
(121, '2020-03-13', '12:00:00', 1, 1, 7, 1, NULL),
(122, '2020-03-13', '16:00:00', 0, 2, 5, 11, NULL),
(123, '2020-06-13', '09:00:00', 0, 1, 5, 5, NULL),
(124, '2020-03-14', '13:00:00', 0, 1, 5, 8, NULL),
(125, '2020-03-17', '18:00:00', 0, 1, 5, 5, NULL),
(126, '2020-03-16', '18:00:00', 1, 1, 5, 5, NULL),
(127, '2020-03-14', '13:00:00', 0, 3, 12, 5, NULL),
(128, '2020-03-17', '17:00:00', 1, 2, 12, 2, NULL),
(129, '2020-03-17', '17:00:00', 1, 3, 12, 4, NULL),
(130, '2020-03-16', '13:00:00', 1, 2, 9, 10, NULL),
(131, '2020-04-06', '20:00:00', 1, 2, 5, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `cust_member_start_date` datetime(6) DEFAULT NULL,
  `cust_member_end_date` datetime(6) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `membership_type_membership_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `contact_no`, `cust_member_start_date`, `cust_member_end_date`, `is_staff`, `is_active`, `date_joined`, `membership_type_membership_type`) VALUES
(2, 'pbkdf2_sha256$150000$IPwDWK9Rc4GN$i/Q8jv+3nvK+brOvDn8GwwKnI5yU7XzBsNTKVauRSNA=', '2020-04-06 13:17:10.348839', 1, 'bhavin', '', '', 'bhavinvghl@gmail.com', '9870051982', NULL, NULL, 1, 1, '2020-02-09 10:50:36.000000', NULL),
(3, 'pbkdf2_sha256$150000$RI5Tk9q4Nvtk$SuksOO/O6PSTJcCvkLfhe2tOBzOnNS8uPHoQDi3my1A=', '2020-02-11 10:06:04.640421', 1, 'dhruv', '', '', 'dhruv@gmail.com', NULL, NULL, NULL, 1, 1, '2020-02-09 10:51:00.172871', NULL),
(4, 'pbkdf2_sha256$150000$Ml0Gs9Pfv5R1$9oTR1ZjIv7wlKpFjHO7y62aJ1rtSvHZSr5G6S/70e+Y=', '2020-04-06 15:30:05.109578', 1, 'daya', '', '', 'daya@gmail.com', NULL, NULL, NULL, 1, 1, '2020-02-09 10:51:16.781391', NULL),
(5, 'pbkdf2_sha256$150000$cCkUMnBIRZK6$PasZQTFCRez/h2+mkSM9Bh4iTI99wSUja1XbV6xRBPI=', '2020-04-06 13:46:39.627270', 0, 'Mk', 'Mansi', 'Keshur', 'mk@gmail.com', '9913998883', '2020-03-12 21:23:38.226604', '2020-05-12 21:23:38.225488', 0, 1, '2020-02-10 07:27:51.000000', 1),
(7, 'pbkdf2_sha256$150000$hgckoar0pvHM$kvDRCylDJ/ncQqgrsjuXM6O0xT5JyOoDCTfldm/JNJY=', '2020-03-12 05:44:12.104644', 0, 'raj', 'raj', 'hj', 'ranpuradhruv11@gmail.com', NULL, NULL, NULL, 0, 1, '2020-02-11 06:27:17.000000', NULL),
(8, 'pbkdf2_sha256$150000$cCkUMnBIRZK6$PasZQTFCRez/h2+mkSM9Bh4iTI99wSUja1XbV6xRBPI=', '2020-03-12 14:24:18.629149', 0, 'bh@v!n', 'Bhavin', 'Vaghela', 'bhavinvghl@gmail.com', '9870051982', '2020-03-10 23:32:00.788495', '2020-05-10 23:32:00.787495', 0, 1, '2020-03-08 07:00:51.720988', 1),
(9, 'pbkdf2_sha256$150000$IPwDWK9Rc4GN$i/Q8jv+3nvK+brOvDn8GwwKnI5yU7XzBsNTKVauRSNA=', '2020-03-13 07:35:32.286237', 0, 'Dhruv@', 'Dhruv', 'Ranpura', 'ranpuradhruv11@gmail.com', NULL, NULL, NULL, 0, 1, '2020-03-12 17:57:49.582438', NULL),
(10, 'pbkdf2_sha256$150000$35gzsGhBU5Hf$NvazCr1Myv3DOPJEob9+fwVqf9iOs1etfO/ReyKOUeg=', NULL, 0, 'Dayayadav', 'Daya', 'Yadav', 'dayayadav@gmail.com', NULL, NULL, NULL, 0, 1, '2020-03-12 18:33:12.295101', NULL),
(11, 'pbkdf2_sha256$150000$plEhmxTVOHd4$3wmoqmUJF1uhNBwNPC0vDioZv2Edu09sJQwjunN7/kw=', NULL, 0, 'Mavin', 'Bhavin', 'Vaghela', 'bhavinvghl@gmail.com', NULL, NULL, NULL, 0, 1, '2020-03-12 18:37:12.625280', NULL),
(12, 'pbkdf2_sha256$150000$7Zahbz2704KE$Y83WwV0RhVwEWJ1RU41c4bLmr2t+3/loBXNBJBwFapw=', '2020-03-13 07:01:28.116568', 0, 'fuzel', 'fuzel', 'mansuri', 'mansurifuzel1112@gmail.com', NULL, '2020-03-13 12:42:22.148539', '2020-05-13 12:42:22.148539', 0, 1, '2020-03-13 06:54:17.610985', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `prod_qty` int(50) NOT NULL,
  `total_price` float NOT NULL,
  `product_product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `dealer_id` int(11) NOT NULL,
  `dealer_name` varchar(45) DEFAULT NULL,
  `dealer_contact_no` varchar(15) DEFAULT NULL,
  `dealer_address` varchar(45) DEFAULT NULL,
  `salon_Salon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`dealer_id`, `dealer_name`, `dealer_contact_no`, `dealer_address`, `salon_Salon_id`) VALUES
(1, 'Dikshit shah', '1245968745', 'Nikol, Ahmedabad', 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(16, 'auth', 'group'),
(17, 'auth', 'user'),
(13, 'salon', 'appointment'),
(18, 'salon', 'authuser'),
(21, 'salon', 'cart'),
(27, 'salon', 'dealer'),
(20, 'salon', 'feedback'),
(19, 'salon', 'gallary'),
(11, 'salon', 'membershiptype'),
(10, 'salon', 'offers'),
(22, 'salon', 'package'),
(29, 'salon', 'packageservices'),
(23, 'salon', 'packagesservices'),
(14, 'salon', 'product'),
(15, 'salon', 'productcategories'),
(26, 'salon', 'purchase'),
(30, 'salon', 'purchasedetails'),
(24, 'salon', 'sales'),
(25, 'salon', 'salesdetail'),
(7, 'salon', 'salon'),
(8, 'salon', 'servicecategories'),
(28, 'salon', 'servicegiven'),
(9, 'salon', 'services'),
(12, 'salon', 'specialist');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3viae1hhetow169p1u4rhfkndss3eru1', 'YjY3YzhmN2RhOTU0ZWNiOWJkMzczODkzMjEyNTZlYTVlMTc5MmFhNTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMWRkNjY4NTNlNGI1N2VjMTA0OGRiMjIzMGY0MWNiMGI2MDhhYjQxIn0=', '2020-03-14 07:11:48.679946'),
('e3ueueai8ilipb4p0b1zhoa3q0bkmjve', 'ZTZjZTdhNzFmZThmODFjZjZiMTBiZGVmN2FkZmU4NGUxNTc2ZjkwNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNTJjMmEyMWQzYmM1MzVlYzhkYmE3OGJmYjUzN2NlOGM5OTA0MWUxIn0=', '2020-02-23 17:05:07.654291'),
('eu03yazgvzi6u0hqcpyx5t1jugsqg507', 'NWJmZDg5YWYxMGI1NDk2MGU5Y2Q0NWY0NTQyZjQ0OTRhNzI1ZjQxZDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZjI3Y2U2MzMwMTUxZDNlMjlmOWQzY2U5MzRkYTQ4MDZmYTk5NjllIn0=', '2020-02-23 10:51:54.514862'),
('flf4j3pe66s1ydggk7b7ine7vfej9yb7', 'ZTZjZTdhNzFmZThmODFjZjZiMTBiZGVmN2FkZmU4NGUxNTc2ZjkwNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNTJjMmEyMWQzYmM1MzVlYzhkYmE3OGJmYjUzN2NlOGM5OTA0MWUxIn0=', '2020-02-24 05:50:59.581100'),
('gfukt6argi6a61vsytib1iihlrv5zqsr', 'ZTZjZTdhNzFmZThmODFjZjZiMTBiZGVmN2FkZmU4NGUxNTc2ZjkwNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNTJjMmEyMWQzYmM1MzVlYzhkYmE3OGJmYjUzN2NlOGM5OTA0MWUxIn0=', '2020-02-27 19:06:51.274887'),
('rilooirjm0obk84k2ry2bixpqk1g8gzr', 'ZTZjZTdhNzFmZThmODFjZjZiMTBiZGVmN2FkZmU4NGUxNTc2ZjkwNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNTJjMmEyMWQzYmM1MzVlYzhkYmE3OGJmYjUzN2NlOGM5OTA0MWUxIn0=', '2020-03-25 05:49:18.272812'),
('u6rne79ma1yj7z66npr5bkah0280whhi', 'ZTZjZTdhNzFmZThmODFjZjZiMTBiZGVmN2FkZmU4NGUxNTc2ZjkwNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNTJjMmEyMWQzYmM1MzVlYzhkYmE3OGJmYjUzN2NlOGM5OTA0MWUxIn0=', '2020-03-25 06:42:21.046988'),
('wt1swiv261du7kg7m6lthe7d8013vq2o', 'YjY3YzhmN2RhOTU0ZWNiOWJkMzczODkzMjEyNTZlYTVlMTc5MmFhNTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMWRkNjY4NTNlNGI1N2VjMTA0OGRiMjIzMGY0MWNiMGI2MDhhYjQxIn0=', '2020-02-29 05:21:12.013411'),
('xhyjxpd257c20hao159x1fb1l5dxr9nm', 'YzM3OTRkNzNmMDRiOTU1ZmNlYWVmYzQ3YTY0ZTNkNjNmMDIwNDAxYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YmU5OGZkNzQ3ODc1MzA2YTY3NWZmMjgzMzg5MmNmZmZiYjQ0OWM0In0=', '2020-04-06 06:49:15.170682');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_desc` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `Services_service_id` int(11) DEFAULT NULL,
  `product_product_id` int(11) DEFAULT NULL,
  `specialist_specialist_id` int(11) DEFAULT NULL,
  `auth_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_desc`, `date`, `Services_service_id`, `product_product_id`, `specialist_specialist_id`, `auth_user_id`) VALUES
(9, 'Great Service', NULL, 2, NULL, NULL, 5),
(12, 'Best service', NULL, 2, NULL, NULL, 5),
(13, 'great hair treatements', NULL, 4, NULL, NULL, 5),
(14, 'I like this', NULL, 4, NULL, NULL, 5),
(15, 'I like this', NULL, 4, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `gallary`
--

CREATE TABLE `gallary` (
  `image_id` int(11) NOT NULL,
  `image_url` varchar(250) DEFAULT NULL,
  `auth_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallary`
--

INSERT INTO `gallary` (`image_id`, `image_url`, `auth_user_id`) VALUES
(1, 'photos/service-5.jpg', 4),
(2, 'photos/service-4.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `membership_type`
--

CREATE TABLE `membership_type` (
  `membership_type_id` int(11) NOT NULL,
  `membership_name` varchar(50) DEFAULT NULL,
  `membership_duration` int(11) DEFAULT NULL,
  `membership_fees` int(11) DEFAULT NULL,
  `payment_type` varchar(50) NOT NULL,
  `salon_Salon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_type`
--

INSERT INTO `membership_type` (`membership_type_id`, `membership_name`, `membership_duration`, `membership_fees`, `payment_type`, `salon_Salon_id`) VALUES
(1, 'Kallistaa-Hair-service', 2, 5000, 'Cash', 1),
(2, 'Kallistaa-Makeup', 3, 4500, 'Cash', 1);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `offer_id` int(11) NOT NULL,
  `offers_start_date` date DEFAULT NULL,
  `offers_end_date` date DEFAULT NULL,
  `offer_code` varchar(25) NOT NULL,
  `discount` float DEFAULT NULL,
  `membership_type_membership_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`offer_id`, `offers_start_date`, `offers_end_date`, `offer_code`, `discount`, `membership_type_membership_type_id`) VALUES
(1, '2020-02-09', '2020-02-26', 'Dk2910', 10, 1),
(2, '2020-03-13', '2020-03-23', 'DBD1303', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_name` varchar(45) NOT NULL,
  `package_start_dt` date DEFAULT NULL,
  `package_end_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `package_name`, `package_start_dt`, `package_end_dt`) VALUES
(1, 'Kallistaa- Hair service', '2020-03-03', '2020-09-03'),
(2, 'Kallistaa-Makeup-Combo', '2020-03-08', '2020-09-08');

-- --------------------------------------------------------

--
-- Table structure for table `packageservices`
--

CREATE TABLE `packageservices` (
  `package_package_id` int(11) NOT NULL,
  `services_service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packageservices`
--

INSERT INTO `packageservices` (`package_package_id`, `services_service_id`) VALUES
(1, 1),
(1, 9),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` text,
  `product_price` int(11) DEFAULT NULL,
  `Product_url` varchar(250) DEFAULT NULL,
  `product_desc` varchar(1000) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `Product_categories_Product_categories_id` int(11) NOT NULL,
  `offers_offer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `Product_url`, `product_desc`, `qty`, `Product_categories_Product_categories_id`, `offers_offer_id`) VALUES
(1, 'Shampoo', 300, 'prod_image/prod_ec_1566999702.jpg', 'This is best shampoo for hairfall.', 477, 1, 1),
(2, 'conditioner', 350, 'prod_image/prod_ec_1563815202.jpg', 'Best Conditioner', 46, 2, 1),
(3, '6 Oil Nourish', 199, 'prod_image/6Oil_nourishment_DSLBO5a.jpg', 'Strong, Thick, Shiny, smooth, Soft, Managable', 49, 1, 1),
(4, 'MyTHIC OIL', 950, 'prod_image/Mythic_Oil_a1aQL6r.jpg', 'For Men For Dry Hair, All Hair Types, Normal Hair...', 50, 7, 2),
(5, 'SERIE EXPERT WHEAT OIL', 559, 'prod_image/serie_Expert_wheat_oli_absolute_repair.jpg', 'A Nourishing and Repairing Serum for Very Damaged ...', 50, 7, 1),
(6, 'SERIE EXPERT ABSOLUT REPAIR', 559, 'prod_image/Série-Expert-Absolut-Repair-Lipidium-Mask.jpg', 'Hair care Hair conditioners L\'Oreal Professionnel Expert Absolut Repair Lipidium Conditioner 200 Reconstructive conditioner. Treats hair in depth, facilitates disentangling and provides softness, shine and a homogeneity from root to ends. Spread evenly on washed and towel-dried hair.', 44, 8, 1),
(7, 'SERIE EXPERT ABSOLUTE REPAIR', 693, 'prod_image/Série-Expert-Absolut-Repair-Lipidium-Mask_n3aQEs6.jpg', 'Cleans your hair gently while it moisturizes and protects it!  TheSerie expert gold quinoa+protein absolut repair shampoo is the ideal product for sensitized hair!', 50, 1, NULL),
(8, 'SERIE EXPERT INSTANT CLEAR', 500, 'prod_image/serie-expert-omega6-density-advanced-shampoo.jpg', 'Instant Clear Anti-Dandruff Shampoo from LOréal Professionnel is a shampoo that eliminates the appearance of dandruff. Created especially for dry, dyed hair and a tendency to have dandruff, its formula works to purify the hair and scalp, while calming them. The hair is nourished with a soft and light touch, and the colour is shiny and protected.', 50, 1, NULL),
(9, 'SERIOXYL GLUCOBOOST', 600, 'prod_image/serioxyl_glucoBoost.jpeg', 'Serioxyl glucoboost+incell conditioner colored thining hairs step 2 250ml with ayur sunscreen lotion 50ml Cleanse your hair with this luxurious shampoo that works to leave your hair fuller and thicker whilst protecting your colour It helps improve the look of the hair fibre density', 22, 1, 2),
(10, 'SERIEOX YL GlucoBoost + Incell', 700, 'prod_image/serioxyl_GlucoBoost_incell.jpg', 'Let Serioxyl take care of your thin hair. The intense thickening range immediately helps hair look denser and lifted. It helps improve the look of the hair fibre density and is ideal for use on fine hair. Try our complete kits today to make your hair feel thicker and healthier.', 38, 2, NULL),
(11, '3 SCULPTE', 503, 'prod_image/3_Sculpie.jpeg', NULL, 50, 8, NULL),
(12, 'SERIE EXPERT LISS UNLIMITED', 500, 'prod_image/serie-expert-prokeratin-liss-unlimited-smoothing-shampoo.jpg', 'Anti-frizz   Smoothing Humidity protection', 50, 1, NULL),
(13, 'SERIE EXPERT INFORCER', 1229, 'prod_image/serie-expert-B6-Biotin-Inforcer-Masque.jpg', 'Fortifying formula enriched with vitamin B6 and Biotin, to instantly reduce breakage and achieve greater softness.   Hair is stronger and stronger with continuous use.', 50, 8, NULL),
(14, 'SERIE EXPERT INFOCER SHAMPOO', 2000, 'prod_image/serie-expert-B6-Biotin-Inforcer-shampoo.jpg', 'ntroducing the new L\'Oréal Professionnel Serie Expert Inforcer Shampoo, for strengthening fragile hair. Inforcer reinforcing shampoo is designed to target breakage and split ends, leaving hair soft and healthy. With continued use, the Inforcer Shampoo helps your hair to become more resistant and stronger. The shampoo is enriched with Biotin and B6 A \" known for their hair strengthening properties.', 47, 1, NULL),
(15, 'SERIE EXPERT LISS UNLIMITED SMOOTHING MASQUE', 500, 'prod_image/loreal-professionnel-serie-expert-prokeratin-liss-unlimited-smoothing-masque.jpg', 'This luscious smoothing hair mask nourishes the feel of the hair and protects your hair fibre against the look of frizz. Try luxuriously bathing your hair in nourishment, smoothing the look of its surface and providing an effective humidity protection.', 45, 8, NULL),
(16, 'TECNI ART FULL VOLUME EXTRA', 900, 'prod_image/Tecni_ART_FULL_Volume_Extra.jpg', 'TECNI.ART Full Volume Extra Mousse by L’Oréal', 50, 9, NULL),
(17, 'LOREAL SMARTBOND', 1500, 'prod_image/loreal-smartbond.jpg', NULL, 50, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `Product_categories_id` int(11) NOT NULL,
  `Product_categories_name` varchar(45) DEFAULT NULL,
  `salon_Salon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`Product_categories_id`, `Product_categories_name`, `salon_Salon_id`) VALUES
(1, 'Shampoo', 1),
(2, 'conditioner', 1),
(7, 'Oil', 1),
(8, 'Masque', 1),
(9, 'Serum', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `Purchase_id` int(11) NOT NULL,
  `Purchase_date` date DEFAULT NULL,
  `Purchase_Amount` int(11) DEFAULT NULL,
  `dealer_dealer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`Purchase_id`, `Purchase_date`, `Purchase_Amount`, `dealer_dealer_id`) VALUES
(1, '2020-03-10', 5000, 1),
(2, '2020-03-15', 50000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `product_product_id` int(11) NOT NULL,
  `Purchase_Purchase_id` int(11) NOT NULL,
  `Prod_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchase_details`
--

INSERT INTO `purchase_details` (`product_product_id`, `Purchase_Purchase_id`, `Prod_qty`) VALUES
(1, 2, 1000),
(11, 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return`
--

CREATE TABLE `purchase_return` (
  `Purchase_return_id` int(11) NOT NULL,
  `Purchase_return_date` date DEFAULT NULL,
  `Purchase_return_amount` int(11) DEFAULT NULL,
  `Purchase_Purchase_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_details`
--

CREATE TABLE `purchase_return_details` (
  `Purchase_return_Purchase_return_id` int(11) NOT NULL,
  `product_product_id` int(11) NOT NULL,
  `Purchase_return_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `Rating` int(5) DEFAULT NULL,
  `User_user_id` int(11) NOT NULL,
  `product_product_id` int(11) NOT NULL,
  `auth_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `state` varchar(15) NOT NULL,
  `pincode` int(6) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `Sales_date` date DEFAULT NULL,
  `Payment` varchar(50) DEFAULT NULL,
  `auth_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `address`, `phone`, `city`, `state`, `pincode`, `email_id`, `Sales_date`, `Payment`, `auth_user_id`) VALUES
(2, 'Ambawadi', '7048443580', 'Ahmedabad', 'Gujarat', 380009, 'ranpuradhruv11@gmail.com', '2020-03-05', 'E-wallet', 7),
(3, 'viratnagr', '9878152233', 'ahmedabad', 'gujarat', 380016, 'abc@gmail.com', '2020-03-05', 'Cash', 7),
(4, 'viratnagr', '9878152233', 'ahmedabad', 'gujarat', 380016, 'abc@gmail.com', '2020-03-05', 'Cash', 7),
(5, 'Narannagar', '9913998883', 'Ahmedabad', 'Gujarat', 382415, 'mk@gmail.com', '2020-03-06', 'Credit Card/Debit Card', 7),
(6, 'Ambawadi', '7040443580', 'Ahmedabad', 'Gujarat', 380409, 'ranpuradhruv11@gmail.com', '2020-03-06', 'Credit Card/Debit Card', 7),
(7, 'Viratnagar', '7048266273', 'Ahmedabad', 'Gujarayt', 382350, 'bhavinvghl@gmail.com', '2020-03-06', 'E-wallet', 7),
(10, 'Viratnagar', '7048266273', 'Ahmedabad', 'Gujarayt', 382350, 'bhavinvghl@gmail.com', '2020-03-06', 'E-wallet', 7),
(26, 'Narayannagar', '9913998883', 'Ahmedabad', 'Gujarat', 382450, 'bhavinvghl@gmail.com', '2020-03-07', 'Cash', 5),
(28, 'Viratnagar', '9870051982', 'Ahmedabad', 'Gujarat', 382315, 'bhavinvghl@gmail.com', '2020-03-08', 'Credit Card/Debit Card', 8),
(29, 'Ambawadi', '9997891230', 'Ahmedabad', 'Gujarat', 400500, 'ranpuradhruv11@gmail.com', '2020-03-09', 'Cash', 7),
(30, 'Ambawadi', '9997891230', 'Ahmedabad', 'Gujarat', 400500, 'ranpuradhruv11@gmail.com', '2020-03-09', 'Cash', 7),
(31, 'Ambawadi', '9997891230', 'Ahmedabad', 'Gujarat', 400500, 'ranpuradhruv11@gmail.com', '2020-03-09', 'Credit Card/Debit Card', 5),
(33, 'Ambawadi', '9997891230', 'Ahmedabad', 'Gujarat', 400500, 'ranpuradhruv11@gmail.com', '2020-03-09', 'E-wallet', 8),
(34, 'Viratnagar', '9870051982', 'Ahmedabad', 'Gujarat', 382315, 'bhavinvghl@gmail.com', '2020-03-12', 'Credit Card/Debit Card', 5),
(35, 'Viratnagar', '9870051982', 'Ahmedabad', 'Gujarat', 382315, 'bhavinvghl@gmail.com', '2020-03-12', 'E-wallet', 5),
(36, 'Ambawadi', '9997891230', 'Ahmedabad', 'Gujarat', 400500, 'ranpuradhruv11@gmail.com', '2020-03-12', 'E-wallet', 5),
(37, 'Viratnagar', '9870051982', 'Ahmedabad', 'Gujarat', 382315, 'bhavinvghl@gmail.com', '2020-03-12', 'Credit Card/Debit Card', 5),
(38, 'Ambawadi', '7048443580', 'Ahmedabad', 'Gujarat', 380009, 'ranpuradhruv11@gmail.com', '2020-03-21', 'E-wallet', 9),
(39, 'Ambawadi', '7048443580', 'Ahmedabad', 'Gujarat', 380009, 'ranpuradhruv11@gmail.com', '2020-03-21', 'E-wallet', 9);

-- --------------------------------------------------------

--
-- Table structure for table `sales_detail`
--

CREATE TABLE `sales_detail` (
  `product_product_id` int(11) NOT NULL,
  `Sales_sales_id` int(11) NOT NULL,
  `qty_order` int(11) DEFAULT NULL,
  `sales_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales_detail`
--

INSERT INTO `sales_detail` (`product_product_id`, `Sales_sales_id`, `qty_order`, `sales_price`) VALUES
(1, 34, 1, 300),
(1, 35, 4, 1200),
(2, 28, 3, 900),
(3, 31, 3, 597),
(3, 35, 1, 199),
(6, 37, 2, 1118),
(9, 35, 8, 4800),
(10, 35, 9, 6300),
(10, 38, 3, 2100),
(14, 36, 3, 6000),
(15, 39, 4, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `sales_return`
--

CREATE TABLE `sales_return` (
  `Sales_return_id` int(11) NOT NULL,
  `Sales_return_date` date DEFAULT NULL,
  `Sales_return_total_amount` int(11) DEFAULT NULL,
  `sales_sales_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_details`
--

CREATE TABLE `sales_return_details` (
  `product_product_id` int(11) NOT NULL,
  `Sales_return_Sales_return_id` int(11) NOT NULL,
  `sales_return_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salon`
--

CREATE TABLE `salon` (
  `Salon_id` int(11) NOT NULL,
  `Salon_Name` text NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Contact_no` int(15) NOT NULL,
  `Salon_Email` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salon`
--

INSERT INTO `salon` (`Salon_id`, `Salon_Name`, `Address`, `Contact_no`, `Salon_Email`) VALUES
(1, 'KALLISTAA', 'Navarangpura', 2147483647, 'kallistaa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `Service_name` text,
  `services_url` varchar(250) DEFAULT NULL,
  `Service_duration` varchar(20) DEFAULT NULL,
  `Service_rate` int(11) DEFAULT NULL,
  `service_categories_service_categories_no` int(11) NOT NULL,
  `offers_offer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `Service_name`, `services_url`, `Service_duration`, `Service_rate`, `service_categories_service_categories_no`, `offers_offer_id`) VALUES
(1, 'Hair color', 'service/hair.jpg', '30 min', 500, 1, NULL),
(2, 'Bridal Makeup', 'service/service-5.jpg', '60 min', 4500, 3, 2),
(3, 'Facial Massage', 'service/service-1.jpg', '60', 500, 2, 1),
(4, 'Hair spa', 'service/service-4_IM30xjU.jpg', '45', 300, 1, NULL),
(5, 'Full Face', 'service/full_face_bleach_93DIbOa.jpg', '30 Min', 500, 7, 1),
(6, 'Upper Lip', 'service/upper_lip_bleach_cISgxjw.jpg', '20 Min', 70, 7, 2),
(7, 'Cryseine Complex Intense Smoothing', 'service/cryseine_complex_intense_smoothing_SlvLfaX.jpeg', '4 hours', 3000, 9, NULL),
(8, 'Supreme Straightening', 'service/supreme_starightening_xQ6CDTC.jpeg', '4 hours', 4000, 9, NULL),
(9, 'Hair Fall Treatment(Per Sitting)', 'service/hair_fall_treatment_TlmbPcD.jpeg', '2 Hours', 2000, 4, NULL),
(10, 'Nape Length', 'service/nape_length_57U8FbK.jpeg', '45 Min', 800, 4, NULL),
(11, 'Neck Length', 'service/neck_3J14XdW.jpeg', '45 Min', 900, 4, NULL),
(12, 'Forehead', 'service/Threading_HyGVWFq.jpeg', '10 Min', 40, 8, 2),
(13, 'Sidelocks', 'service/sidelock_threading_IPfSBO0.jpeg', '10 Min', 50, 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `service_categories_no` int(11) NOT NULL,
  `service_categories_name` varchar(45) DEFAULT NULL,
  `salon_Salon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`service_categories_no`, `service_categories_name`, `salon_Salon_id`) VALUES
(1, 'Hair Services', 1),
(2, 'Facial Treatments', 1),
(3, 'Makeup Services', 1),
(4, 'Hair Spa Treatments', 1),
(7, 'Bleach', 1),
(8, 'Threading', 1),
(9, 'Hair Smoothing/Straightening', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_given`
--

CREATE TABLE `service_given` (
  `service_given_id` int(11) NOT NULL,
  `service_date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `appointment_appointment_id` int(11) NOT NULL,
  `auth_user_id` int(11) NOT NULL,
  `package_package_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_given_details`
--

CREATE TABLE `service_given_details` (
  `Services_service_id` int(11) NOT NULL,
  `service_given_service_given_id` int(11) NOT NULL,
  `specialist_specialist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `specialist_id` int(11) NOT NULL,
  `specialist_name` varchar(45) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `service_categories_service_categories_no1` int(11) NOT NULL,
  `salon_Salon_id` int(11) NOT NULL,
  `specialist_image` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`specialist_id`, `specialist_name`, `gender`, `contact`, `service_categories_service_categories_no1`, `salon_Salon_id`, `specialist_image`) VALUES
(1, 'Nargis', 1, '704866246', 1, 1, 'specialist/man-wearing-black-barber-cape-3101480_8QCKLBK.jpg'),
(2, 'Femi', 1, '987542310', 2, 1, 'specialist/man-drying-woman-s-hair-696285_Kw9U7ul.jpg'),
(3, 'Samir', 1, '7048443550', 4, 1, 'specialist/barber_team_03.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `fk_appointment_specialist1_idx` (`specialist_specialist_id`),
  ADD KEY `fk_appointment_auth_user1_idx` (`auth_user_id`),
  ADD KEY `fk_appointment_services1_idx` (`services_service_id`),
  ADD KEY `package_package` (`package_package`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `membershiptype_id` (`membership_type_membership_type`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`product_product_id`,`user_id`),
  ADD KEY `fk_product_has_customer_product1_idx` (`product_product_id`),
  ADD KEY `fk_cart_auth_user1_idx` (`user_id`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`dealer_id`),
  ADD KEY `fk_dealer_salon1_idx` (`salon_Salon_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `fk_django_admin_log_auth_user1_idx` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `fk_feedback_Services1_idx` (`Services_service_id`),
  ADD KEY `fk_feedback_product1_idx` (`product_product_id`),
  ADD KEY `fk_feedback_specialist1_idx` (`specialist_specialist_id`),
  ADD KEY `fk_feedback_auth_user1_idx` (`auth_user_id`);

--
-- Indexes for table `gallary`
--
ALTER TABLE `gallary`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `fk_gallary_auth_user1_idx` (`auth_user_id`);

--
-- Indexes for table `membership_type`
--
ALTER TABLE `membership_type`
  ADD PRIMARY KEY (`membership_type_id`),
  ADD KEY `fk_membership_type_salon1_idx` (`salon_Salon_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`offer_id`),
  ADD KEY `fk_offers_membership_type1_idx` (`membership_type_membership_type_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `packageservices`
--
ALTER TABLE `packageservices`
  ADD PRIMARY KEY (`package_package_id`,`services_service_id`),
  ADD KEY `fk_package_has_services_services1_idx` (`services_service_id`),
  ADD KEY `fk_package_has_services_package1_idx` (`package_package_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_Product_categories1_idx` (`Product_categories_Product_categories_id`),
  ADD KEY `fk_product_offers1_idx` (`offers_offer_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`Product_categories_id`),
  ADD KEY `fk_product_categories_salon1_idx` (`salon_Salon_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`Purchase_id`),
  ADD KEY `fk_Purchase_dealer1_idx` (`dealer_dealer_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`product_product_id`,`Purchase_Purchase_id`),
  ADD KEY `fk_purchase_details_product1_idx` (`product_product_id`),
  ADD KEY `fk_purchase_details_Purchase1_idx` (`Purchase_Purchase_id`);

--
-- Indexes for table `purchase_return`
--
ALTER TABLE `purchase_return`
  ADD PRIMARY KEY (`Purchase_return_id`),
  ADD KEY `fk_Purchase_return_Purchase1_idx` (`Purchase_Purchase_id`);

--
-- Indexes for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD PRIMARY KEY (`Purchase_return_Purchase_return_id`,`product_product_id`),
  ADD KEY `fk_Purchase_return_details_product1_idx` (`product_product_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD KEY `fk_User_has_product_product1_idx` (`product_product_id`),
  ADD KEY `fk_rating_auth_user1_idx` (`auth_user_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `fk_sales_auth_user1_idx` (`auth_user_id`);

--
-- Indexes for table `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD PRIMARY KEY (`product_product_id`,`Sales_sales_id`),
  ADD KEY `fk_sales_orderdetail_product1_idx` (`product_product_id`),
  ADD KEY `fk_sales_detail_Sales1_idx` (`Sales_sales_id`);

--
-- Indexes for table `sales_return`
--
ALTER TABLE `sales_return`
  ADD PRIMARY KEY (`Sales_return_id`),
  ADD KEY `fk_sales_return_sales1_idx` (`sales_sales_id`);

--
-- Indexes for table `sales_return_details`
--
ALTER TABLE `sales_return_details`
  ADD PRIMARY KEY (`product_product_id`,`Sales_return_Sales_return_id`),
  ADD KEY `fk_sales_return_details_product1_idx` (`product_product_id`),
  ADD KEY `fk_sales_return_details_Sales_return1_idx` (`Sales_return_Sales_return_id`);

--
-- Indexes for table `salon`
--
ALTER TABLE `salon`
  ADD PRIMARY KEY (`Salon_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`,`service_categories_service_categories_no`),
  ADD KEY `fk_Services_service_categories1_idx` (`service_categories_service_categories_no`),
  ADD KEY `fk_Services_offers1_idx` (`offers_offer_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`service_categories_no`),
  ADD KEY `fk_service_categories_salon1_idx` (`salon_Salon_id`);

--
-- Indexes for table `service_given`
--
ALTER TABLE `service_given`
  ADD PRIMARY KEY (`service_given_id`),
  ADD KEY `fk_service_given_appointment1_idx` (`appointment_appointment_id`),
  ADD KEY `fk_service_given_auth_user1_idx` (`auth_user_id`),
  ADD KEY `fk_service_given_package1_idx` (`package_package_id`);

--
-- Indexes for table `service_given_details`
--
ALTER TABLE `service_given_details`
  ADD PRIMARY KEY (`Services_service_id`,`service_given_service_given_id`),
  ADD KEY `fk_service_given_details_Services1_idx` (`Services_service_id`),
  ADD KEY `fk_service_given_details_service_given1_idx` (`service_given_service_given_id`),
  ADD KEY `fk_service_given_details_specialist1_idx` (`specialist_specialist_id`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`specialist_id`),
  ADD KEY `fk_specialist_service_categories1_idx` (`service_categories_service_categories_no1`),
  ADD KEY `fk_specialist_salon1_idx` (`salon_Salon_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealer`
--
ALTER TABLE `dealer`
  MODIFY `dealer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `gallary`
--
ALTER TABLE `gallary`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `membership_type`
--
ALTER TABLE `membership_type`
  MODIFY `membership_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `offer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `Product_categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `Purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_return`
--
ALTER TABLE `purchase_return`
  MODIFY `Purchase_return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `sales_return`
--
ALTER TABLE `sales_return`
  MODIFY `Sales_return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salon`
--
ALTER TABLE `salon`
  MODIFY `Salon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `service_categories_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `service_given`
--
ALTER TABLE `service_given`
  MODIFY `service_given_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specialist`
--
ALTER TABLE `specialist`
  MODIFY `specialist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`package_package`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `fk_appointment_auth_user1` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_appointment_services1` FOREIGN KEY (`services_service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_appointment_specialist1` FOREIGN KEY (`specialist_specialist_id`) REFERENCES `specialist` (`specialist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD CONSTRAINT `auth_user_ibfk_1` FOREIGN KEY (`membership_type_membership_type`) REFERENCES `membership_type` (`membership_type_id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_auth_user1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_has_customer_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dealer`
--
ALTER TABLE `dealer`
  ADD CONSTRAINT `fk_dealer_salon1` FOREIGN KEY (`salon_Salon_id`) REFERENCES `salon` (`Salon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `fk_django_admin_log_auth_user1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_feedback_Services1` FOREIGN KEY (`Services_service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_feedback_auth_user1` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_feedback_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_feedback_specialist1` FOREIGN KEY (`specialist_specialist_id`) REFERENCES `specialist` (`specialist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `gallary`
--
ALTER TABLE `gallary`
  ADD CONSTRAINT `fk_gallary_auth_user1` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `membership_type`
--
ALTER TABLE `membership_type`
  ADD CONSTRAINT `fk_membership_type_salon1` FOREIGN KEY (`salon_Salon_id`) REFERENCES `salon` (`Salon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `fk_offers_membership_type1` FOREIGN KEY (`membership_type_membership_type_id`) REFERENCES `membership_type` (`membership_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `packageservices`
--
ALTER TABLE `packageservices`
  ADD CONSTRAINT `fk_package_has_services_package1` FOREIGN KEY (`package_package_id`) REFERENCES `package` (`package_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_package_has_services_services1` FOREIGN KEY (`services_service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_Product_categories1` FOREIGN KEY (`Product_categories_Product_categories_id`) REFERENCES `product_categories` (`Product_categories_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_offers1` FOREIGN KEY (`offers_offer_id`) REFERENCES `offers` (`offer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `fk_product_categories_salon1` FOREIGN KEY (`salon_Salon_id`) REFERENCES `salon` (`Salon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk_Purchase_dealer1` FOREIGN KEY (`dealer_dealer_id`) REFERENCES `dealer` (`dealer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `fk_purchase_details_Purchase1` FOREIGN KEY (`Purchase_Purchase_id`) REFERENCES `purchase` (`Purchase_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_purchase_details_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchase_return`
--
ALTER TABLE `purchase_return`
  ADD CONSTRAINT `fk_Purchase_return_Purchase1` FOREIGN KEY (`Purchase_Purchase_id`) REFERENCES `purchase` (`Purchase_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD CONSTRAINT `fk_Purchase_return_details_Purchase_return1` FOREIGN KEY (`Purchase_return_Purchase_return_id`) REFERENCES `purchase_return` (`Purchase_return_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Purchase_return_details_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_User_has_product_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rating_auth_user1` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_auth_user1` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD CONSTRAINT `fk_sales_detail_Sales1` FOREIGN KEY (`Sales_sales_id`) REFERENCES `sales` (`sales_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sales_orderdetail_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sales_return`
--
ALTER TABLE `sales_return`
  ADD CONSTRAINT `fk_sales_return_sales1` FOREIGN KEY (`sales_sales_id`) REFERENCES `sales` (`sales_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sales_return_details`
--
ALTER TABLE `sales_return_details`
  ADD CONSTRAINT `fk_sales_return_details_Sales_return1` FOREIGN KEY (`Sales_return_Sales_return_id`) REFERENCES `sales_return` (`Sales_return_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sales_return_details_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_Services_offers1` FOREIGN KEY (`offers_offer_id`) REFERENCES `offers` (`offer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Services_service_categories1` FOREIGN KEY (`service_categories_service_categories_no`) REFERENCES `service_categories` (`service_categories_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD CONSTRAINT `fk_service_categories_salon1` FOREIGN KEY (`salon_Salon_id`) REFERENCES `salon` (`Salon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `service_given`
--
ALTER TABLE `service_given`
  ADD CONSTRAINT `fk_service_given_appointment1` FOREIGN KEY (`appointment_appointment_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_service_given_auth_user1` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_service_given_package1` FOREIGN KEY (`package_package_id`) REFERENCES `package` (`package_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `service_given_details`
--
ALTER TABLE `service_given_details`
  ADD CONSTRAINT `fk_service_given_details_Services1` FOREIGN KEY (`Services_service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_service_given_details_service_given1` FOREIGN KEY (`service_given_service_given_id`) REFERENCES `service_given` (`service_given_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_service_given_details_specialist1` FOREIGN KEY (`specialist_specialist_id`) REFERENCES `specialist` (`specialist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `specialist`
--
ALTER TABLE `specialist`
  ADD CONSTRAINT `fk_specialist_salon1` FOREIGN KEY (`salon_Salon_id`) REFERENCES `salon` (`Salon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_specialist_service_categories1` FOREIGN KEY (`service_categories_service_categories_no1`) REFERENCES `service_categories` (`service_categories_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
