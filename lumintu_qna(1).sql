-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2021 at 09:32 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lumintu_qna`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id_admin`, `email`, `password`, `username`) VALUES
(1, 'adminqna@gmail.com', 'admin1234', 'adminqna');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id_chat` int(11) NOT NULL,
  `id_session` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id_chat`, `id_session`, `status`) VALUES
(1, 1, 0),
(2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `directus_activity`
--

CREATE TABLE `directus_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(45) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(50) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directus_activity`
--

INSERT INTO `directus_activity` (`id`, `action`, `user`, `timestamp`, `ip`, `user_agent`, `collection`, `item`, `comment`) VALUES
(1, 'login', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 03:51:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_users', '14682075-f26c-490d-9fcd-4fccf26370f7', NULL),
(2, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:53:15', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'coba', NULL),
(3, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:54:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'coba', NULL),
(4, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:54:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'admins', NULL),
(5, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'admins', NULL),
(6, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'chats', NULL),
(7, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:15', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'events', NULL),
(8, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'messages', NULL),
(9, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:21', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'participants', NULL),
(10, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'sessions', NULL),
(11, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'events', NULL),
(12, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'chats', NULL),
(13, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:35', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'messages', NULL),
(14, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'participants', NULL),
(15, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:55:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'sessions', NULL),
(16, 'delete', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 04:57:39', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_collections', 'coba', NULL),
(17, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:07:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '1', NULL),
(18, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:07:51', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '1', NULL),
(19, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:09:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '2', NULL),
(20, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:09:40', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '2', NULL),
(21, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:09:42', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '3', NULL),
(22, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:09:44', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '3', NULL),
(23, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:09:47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '4', NULL),
(24, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:09:49', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '4', NULL),
(25, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:09:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '5', NULL),
(26, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:09:54', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '5', NULL),
(27, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:13:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '6', NULL),
(28, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:16:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'events', '1', NULL),
(29, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:17:50', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '7', NULL),
(30, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:09', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '8', NULL),
(31, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '9', NULL),
(32, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '10', NULL),
(33, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '11', NULL),
(34, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:32', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '12', NULL),
(35, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:35', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '13', NULL),
(36, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:39', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '14', NULL),
(37, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:42', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '15', NULL),
(38, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '11', NULL),
(39, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '12', NULL),
(40, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '14', NULL),
(41, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:47', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '13', NULL),
(42, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:19:48', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '15', NULL),
(43, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:20:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '11', NULL),
(44, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:22:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '1', NULL),
(45, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:22:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '2', NULL),
(46, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:23:57', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '16', NULL),
(47, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:24:03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '17', NULL),
(48, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:24:05', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '18', NULL),
(49, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:24:11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '17', NULL),
(50, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:24:11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '16', NULL),
(51, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:24:11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '18', NULL),
(52, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:24:22', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '16', NULL),
(53, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:25:16', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '19', NULL),
(54, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:25:19', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '20', NULL),
(55, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:25:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '21', NULL),
(56, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:25:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '22', NULL),
(57, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:26:40', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '23', NULL),
(58, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:27:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '4', NULL),
(59, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:27:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '1', NULL),
(60, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:27:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '2', NULL),
(61, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:27:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '5', NULL),
(62, 'update', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:27:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '6', NULL),
(63, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:29:10', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '24', NULL),
(64, 'create', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-18 08:30:36', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'directus_fields', '25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_collections`
--

CREATE TABLE `directus_collections` (
  `collection` varchar(64) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `display_template` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `singleton` tinyint(1) NOT NULL DEFAULT 0,
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `archive_field` varchar(64) DEFAULT NULL,
  `archive_app_filter` tinyint(1) NOT NULL DEFAULT 1,
  `archive_value` varchar(255) DEFAULT NULL,
  `unarchive_value` varchar(255) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `color` varchar(255) DEFAULT NULL,
  `item_duplication_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_duplication_fields`)),
  `sort` int(11) DEFAULT NULL,
  `group` varchar(64) DEFAULT NULL,
  `collapse` varchar(255) NOT NULL DEFAULT 'open'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directus_collections`
--

INSERT INTO `directus_collections` (`collection`, `icon`, `note`, `display_template`, `hidden`, `singleton`, `translations`, `archive_field`, `archive_app_filter`, `archive_value`, `unarchive_value`, `sort_field`, `accountability`, `color`, `item_duplication_fields`, `sort`, `group`, `collapse`) VALUES
('admins', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
('chats', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
('events', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
('messages', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
('participants', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
('sessions', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open');

-- --------------------------------------------------------

--
-- Table structure for table `directus_dashboards`
--

CREATE TABLE `directus_dashboards` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'dashboard',
  `note` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directus_fields`
--

CREATE TABLE `directus_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `collection` varchar(64) NOT NULL,
  `field` varchar(64) NOT NULL,
  `special` varchar(64) DEFAULT NULL,
  `interface` varchar(64) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `display` varchar(64) DEFAULT NULL,
  `display_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`display_options`)),
  `readonly` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED DEFAULT NULL,
  `width` varchar(30) DEFAULT 'full',
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `note` text DEFAULT NULL,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `required` tinyint(1) DEFAULT 0,
  `group` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directus_fields`
--

INSERT INTO `directus_fields` (`id`, `collection`, `field`, `special`, `interface`, `options`, `display`, `display_options`, `readonly`, `hidden`, `sort`, `width`, `translations`, `note`, `conditions`, `required`, `group`) VALUES
(1, 'messages', 'id_chat', NULL, 'select-dropdown-m2o', NULL, 'related-values', NULL, 0, 0, 2, 'full', NULL, NULL, NULL, 0, NULL),
(2, 'messages', 'id_pengirim', NULL, 'select-dropdown-m2o', NULL, 'related-values', NULL, 0, 0, 3, 'full', NULL, NULL, NULL, 0, NULL),
(4, 'messages', 'id_conversation', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'full', NULL, NULL, NULL, 0, NULL),
(5, 'messages', 'pesan', NULL, NULL, NULL, NULL, NULL, 0, 0, 4, 'full', NULL, NULL, NULL, 0, NULL),
(6, 'messages', 'satus', NULL, 'input', NULL, 'raw', NULL, 0, 0, 5, 'full', NULL, NULL, NULL, 0, NULL),
(7, 'events', 'id_event', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL),
(8, 'events', 'nama_event', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL),
(9, 'events', 'event_mulai', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL),
(10, 'events', 'event_berakhir', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL),
(11, 'sessions', 'id_event', NULL, 'select-dropdown-m2o', NULL, 'related-values', NULL, 0, 0, 1, 'full', NULL, NULL, NULL, 0, NULL),
(12, 'sessions', 'id_session', NULL, NULL, NULL, NULL, NULL, 0, 0, 2, 'full', NULL, NULL, NULL, 0, NULL),
(13, 'sessions', 'start', NULL, NULL, NULL, NULL, NULL, 0, 0, 4, 'full', NULL, NULL, NULL, 0, NULL),
(14, 'sessions', 'session_name', NULL, NULL, NULL, NULL, NULL, 0, 0, 3, 'full', NULL, NULL, NULL, 0, NULL),
(15, 'sessions', 'finish', NULL, NULL, NULL, NULL, NULL, 0, 0, 5, 'full', NULL, NULL, NULL, 0, NULL),
(16, 'chats', 'id_session', NULL, 'select-dropdown-m2o', NULL, NULL, NULL, 0, 0, 2, 'full', NULL, NULL, NULL, 0, NULL),
(17, 'chats', 'id_chat', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'full', NULL, NULL, NULL, 0, NULL),
(19, 'admins', 'id_admin', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL),
(20, 'admins', 'email', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL),
(21, 'admins', 'password', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL),
(22, 'admins', 'nama', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL),
(23, 'chats', 'id_websocket', NULL, 'input', NULL, 'raw', NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL),
(24, 'messages', 'status', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL),
(25, 'messages', 'waktu_pengiriman', 'date-created', 'datetime', '{\"includeSeconds\":true}', 'datetime', NULL, 0, 0, NULL, 'full', NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_files`
--

CREATE TABLE `directus_files` (
  `id` char(36) NOT NULL,
  `storage` varchar(255) NOT NULL,
  `filename_disk` varchar(255) DEFAULT NULL,
  `filename_download` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `folder` char(36) DEFAULT NULL,
  `uploaded_by` char(36) DEFAULT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(36) DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `charset` varchar(50) DEFAULT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `width` int(10) UNSIGNED DEFAULT NULL,
  `height` int(10) UNSIGNED DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT NULL,
  `embed` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directus_folders`
--

CREATE TABLE `directus_folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directus_migrations`
--

CREATE TABLE `directus_migrations` (
  `version` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directus_migrations`
--

INSERT INTO `directus_migrations` (`version`, `name`, `timestamp`) VALUES
('20201028A', 'Remove Collection Foreign Keys', '2021-10-18 03:49:03'),
('20201029A', 'Remove System Relations', '2021-10-18 03:49:03'),
('20201029B', 'Remove System Collections', '2021-10-18 03:49:03'),
('20201029C', 'Remove System Fields', '2021-10-18 03:49:03'),
('20201105A', 'Add Cascade System Relations', '2021-10-18 03:49:05'),
('20201105B', 'Change Webhook URL Type', '2021-10-18 03:49:05'),
('20210225A', 'Add Relations Sort Field', '2021-10-18 03:49:05'),
('20210304A', 'Remove Locked Fields', '2021-10-18 03:49:05'),
('20210312A', 'Webhooks Collections Text', '2021-10-18 03:49:05'),
('20210331A', 'Add Refresh Interval', '2021-10-18 03:49:05'),
('20210415A', 'Make Filesize Nullable', '2021-10-18 03:49:05'),
('20210416A', 'Add Collections Accountability', '2021-10-18 03:49:05'),
('20210422A', 'Remove Files Interface', '2021-10-18 03:49:05'),
('20210506A', 'Rename Interfaces', '2021-10-18 03:49:05'),
('20210510A', 'Restructure Relations', '2021-10-18 03:49:05'),
('20210518A', 'Add Foreign Key Constraints', '2021-10-18 03:49:09'),
('20210519A', 'Add System Fk Triggers', '2021-10-18 03:49:09'),
('20210521A', 'Add Collections Icon Color', '2021-10-18 03:49:09'),
('20210525A', 'Add Insights', '2021-10-18 03:49:10'),
('20210608A', 'Add Deep Clone Config', '2021-10-18 03:49:10'),
('20210626A', 'Change Filesize Bigint', '2021-10-18 03:49:10'),
('20210716A', 'Add Conditions to Fields', '2021-10-18 03:49:10'),
('20210721A', 'Add Default Folder', '2021-10-18 03:49:10'),
('20210802A', 'Replace Groups', '2021-10-18 03:49:10'),
('20210803A', 'Add Required to Fields', '2021-10-18 03:49:10'),
('20210805A', 'Update Groups', '2021-10-18 03:49:10'),
('20210805B', 'Change Image Metadata Structure', '2021-10-18 03:49:10'),
('20210811A', 'Add Geometry Config', '2021-10-18 03:49:10'),
('20210831A', 'Remove Limit Column', '2021-10-18 03:49:10'),
('20210903A', 'Add Auth Provider', '2021-10-18 03:49:10'),
('20210907A', 'Webhooks Collections Not Null', '2021-10-18 03:49:10'),
('20210910A', 'Move Module Setup', '2021-10-18 03:49:10'),
('20210920A', 'Webhooks URL Not Null', '2021-10-18 03:49:10'),
('20210924A', 'Add Collection Organization', '2021-10-18 03:49:10'),
('20210927A', 'Replace Fields Group', '2021-10-18 03:49:10'),
('20210927B', 'Replace M2M Interface', '2021-10-18 03:49:10'),
('20210929A', 'Rename Login Action', '2021-10-18 03:49:11'),
('20211007A', 'Update Presets', '2021-10-18 03:49:11');

-- --------------------------------------------------------

--
-- Table structure for table `directus_panels`
--

CREATE TABLE `directus_panels` (
  `id` char(36) NOT NULL,
  `dashboard` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(30) DEFAULT 'insert_chart',
  `color` varchar(10) DEFAULT NULL,
  `show_header` tinyint(1) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directus_permissions`
--

CREATE TABLE `directus_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `action` varchar(10) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`presets`)),
  `fields` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directus_presets`
--

CREATE TABLE `directus_presets` (
  `id` int(10) UNSIGNED NOT NULL,
  `bookmark` varchar(255) DEFAULT NULL,
  `user` char(36) DEFAULT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `search` varchar(100) DEFAULT NULL,
  `layout` varchar(100) DEFAULT 'tabular',
  `layout_query` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_query`)),
  `layout_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_options`)),
  `refresh_interval` int(11) DEFAULT NULL,
  `filter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`filter`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directus_presets`
--

INSERT INTO `directus_presets` (`id`, `bookmark`, `user`, `role`, `collection`, `search`, `layout`, `layout_query`, `layout_options`, `refresh_interval`, `filter`) VALUES
(1, NULL, '14682075-f26c-490d-9fcd-4fccf26370f7', NULL, 'admins', NULL, 'tabular', '{\"tabular\":{\"page\":1}}', NULL, NULL, NULL),
(2, NULL, '14682075-f26c-490d-9fcd-4fccf26370f7', NULL, 'sessions', NULL, 'tabular', '{\"tabular\":{\"page\":1}}', NULL, NULL, NULL),
(3, NULL, '14682075-f26c-490d-9fcd-4fccf26370f7', NULL, 'chats', NULL, 'tabular', '{\"tabular\":{\"page\":1}}', NULL, NULL, NULL),
(4, NULL, '14682075-f26c-490d-9fcd-4fccf26370f7', NULL, 'directus_webhooks', NULL, 'tabular', '{\"tabular\":{\"page\":1}}', NULL, NULL, NULL),
(5, NULL, '14682075-f26c-490d-9fcd-4fccf26370f7', NULL, 'directus_files', NULL, 'cards', '{\"cards\":{\"sort\":[\"-uploaded_on\"],\"page\":1}}', '{\"cards\":{\"icon\":\"insert_drive_file\",\"title\":\"{{ title }}\",\"subtitle\":\"{{ type }} • {{ filesize }}\",\"size\":4,\"imageFit\":\"crop\"}}', NULL, NULL),
(7, NULL, '14682075-f26c-490d-9fcd-4fccf26370f7', NULL, 'events', NULL, 'tabular', '{\"tabular\":{\"page\":1}}', NULL, NULL, NULL),
(8, NULL, '14682075-f26c-490d-9fcd-4fccf26370f7', NULL, 'directus_users', NULL, 'cards', '{\"cards\":{\"sort\":[\"email\"],\"page\":1}}', '{\"cards\":{\"icon\":\"account_circle\",\"title\":\"{{ first_name }} {{ last_name }}\",\"subtitle\":\"{{ email }}\",\"size\":4}}', NULL, NULL),
(9, NULL, '14682075-f26c-490d-9fcd-4fccf26370f7', NULL, 'messages', NULL, 'tabular', '{\"tabular\":{\"page\":1}}', NULL, NULL, NULL),
(10, NULL, '14682075-f26c-490d-9fcd-4fccf26370f7', NULL, 'participants', NULL, 'tabular', '{\"tabular\":{\"page\":1}}', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_relations`
--

CREATE TABLE `directus_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `many_collection` varchar(64) NOT NULL,
  `many_field` varchar(64) NOT NULL,
  `one_collection` varchar(64) DEFAULT NULL,
  `one_field` varchar(64) DEFAULT NULL,
  `one_collection_field` varchar(64) DEFAULT NULL,
  `one_allowed_collections` text DEFAULT NULL,
  `junction_field` varchar(64) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `one_deselect_action` varchar(255) NOT NULL DEFAULT 'nullify'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directus_revisions`
--

CREATE TABLE `directus_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity` int(10) UNSIGNED NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `delta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`delta`)),
  `parent` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directus_revisions`
--

INSERT INTO `directus_revisions` (`id`, `activity`, `collection`, `item`, `data`, `delta`, `parent`) VALUES
(1, 2, 'directus_collections', 'coba', '{\"hidden\":true,\"collection\":\"coba\"}', '{\"hidden\":true,\"collection\":\"coba\"}', NULL),
(2, 3, 'directus_collections', 'coba', '{\"collection\":\"coba\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\"}', '{\"hidden\":false}', NULL),
(3, 4, 'directus_collections', 'admins', '{\"hidden\":true,\"collection\":\"admins\"}', '{\"hidden\":true,\"collection\":\"admins\"}', NULL),
(4, 5, 'directus_collections', 'admins', '{\"collection\":\"admins\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\"}', '{\"hidden\":false}', NULL),
(5, 6, 'directus_collections', 'chats', '{\"hidden\":true,\"collection\":\"chats\"}', '{\"hidden\":true,\"collection\":\"chats\"}', NULL),
(6, 7, 'directus_collections', 'events', '{\"hidden\":true,\"collection\":\"events\"}', '{\"hidden\":true,\"collection\":\"events\"}', NULL),
(7, 8, 'directus_collections', 'messages', '{\"hidden\":true,\"collection\":\"messages\"}', '{\"hidden\":true,\"collection\":\"messages\"}', NULL),
(8, 9, 'directus_collections', 'participants', '{\"hidden\":true,\"collection\":\"participants\"}', '{\"hidden\":true,\"collection\":\"participants\"}', NULL),
(9, 10, 'directus_collections', 'sessions', '{\"hidden\":true,\"collection\":\"sessions\"}', '{\"hidden\":true,\"collection\":\"sessions\"}', NULL),
(10, 11, 'directus_collections', 'events', '{\"collection\":\"events\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\"}', '{\"hidden\":false}', NULL),
(11, 12, 'directus_collections', 'chats', '{\"collection\":\"chats\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\"}', '{\"hidden\":false}', NULL),
(12, 13, 'directus_collections', 'messages', '{\"collection\":\"messages\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\"}', '{\"hidden\":false}', NULL),
(13, 14, 'directus_collections', 'participants', '{\"collection\":\"participants\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\"}', '{\"hidden\":false}', NULL),
(14, 15, 'directus_collections', 'sessions', '{\"collection\":\"sessions\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":null,\"unarchive_value\":null,\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\"}', '{\"hidden\":false}', NULL),
(15, 17, 'directus_fields', '1', '{\"collection\":\"messages\",\"field\":\"id_chat\"}', '{\"collection\":\"messages\",\"field\":\"id_chat\"}', NULL),
(16, 18, 'directus_fields', '1', '{\"id\":1,\"collection\":\"messages\",\"field\":\"id_chat\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"id_chat\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', NULL),
(17, 19, 'directus_fields', '2', '{\"collection\":\"messages\",\"field\":\"id_pengirim\"}', '{\"collection\":\"messages\",\"field\":\"id_pengirim\"}', NULL),
(18, 20, 'directus_fields', '2', '{\"id\":2,\"collection\":\"messages\",\"field\":\"id_pengirim\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"id_pengirim\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', NULL),
(19, 21, 'directus_fields', '3', '{\"collection\":\"messages\",\"field\":\"id_penerima\"}', '{\"collection\":\"messages\",\"field\":\"id_penerima\"}', NULL),
(20, 22, 'directus_fields', '3', '{\"id\":3,\"collection\":\"messages\",\"field\":\"id_penerima\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"id_penerima\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', NULL),
(21, 23, 'directus_fields', '4', '{\"collection\":\"messages\",\"field\":\"id_conversation\"}', '{\"collection\":\"messages\",\"field\":\"id_conversation\"}', NULL),
(22, 24, 'directus_fields', '4', '{\"id\":4,\"collection\":\"messages\",\"field\":\"id_conversation\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"id_conversation\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', NULL),
(23, 25, 'directus_fields', '5', '{\"collection\":\"messages\",\"field\":\"pesan\"}', '{\"collection\":\"messages\",\"field\":\"pesan\"}', NULL),
(24, 26, 'directus_fields', '5', '{\"id\":5,\"collection\":\"messages\",\"field\":\"pesan\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"pesan\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', NULL),
(25, 27, 'directus_fields', '6', '{\"hidden\":false,\"interface\":\"input\",\"options\":null,\"display\":\"raw\",\"display_options\":null,\"readonly\":false,\"special\":null,\"collection\":\"messages\",\"field\":\"satus\"}', '{\"hidden\":false,\"interface\":\"input\",\"options\":null,\"display\":\"raw\",\"display_options\":null,\"readonly\":false,\"special\":null,\"collection\":\"messages\",\"field\":\"satus\"}', NULL),
(26, 28, 'events', '1', '{\"nama_event\":\"Webminar Pengenalan Diri\",\"event_mulai\":\"2021-10-18\",\"event_berakhir\":\"2021-10-20\"}', '{\"nama_event\":\"Webminar Pengenalan Diri\",\"event_mulai\":\"2021-10-18\",\"event_berakhir\":\"2021-10-20\"}', NULL),
(27, 29, 'directus_fields', '7', '{\"collection\":\"events\",\"field\":\"id_event\"}', '{\"collection\":\"events\",\"field\":\"id_event\"}', NULL),
(28, 30, 'directus_fields', '8', '{\"collection\":\"events\",\"field\":\"nama_event\"}', '{\"collection\":\"events\",\"field\":\"nama_event\"}', NULL),
(29, 31, 'directus_fields', '9', '{\"collection\":\"events\",\"field\":\"event_mulai\"}', '{\"collection\":\"events\",\"field\":\"event_mulai\"}', NULL),
(30, 32, 'directus_fields', '10', '{\"collection\":\"events\",\"field\":\"event_berakhir\"}', '{\"collection\":\"events\",\"field\":\"event_berakhir\"}', NULL),
(31, 33, 'directus_fields', '11', '{\"collection\":\"sessions\",\"field\":\"id_event\"}', '{\"collection\":\"sessions\",\"field\":\"id_event\"}', NULL),
(32, 34, 'directus_fields', '12', '{\"collection\":\"sessions\",\"field\":\"id_session\"}', '{\"collection\":\"sessions\",\"field\":\"id_session\"}', NULL),
(33, 35, 'directus_fields', '13', '{\"collection\":\"sessions\",\"field\":\"start\"}', '{\"collection\":\"sessions\",\"field\":\"start\"}', NULL),
(34, 36, 'directus_fields', '14', '{\"collection\":\"sessions\",\"field\":\"session_name\"}', '{\"collection\":\"sessions\",\"field\":\"session_name\"}', NULL),
(35, 37, 'directus_fields', '15', '{\"collection\":\"sessions\",\"field\":\"finish\"}', '{\"collection\":\"sessions\",\"field\":\"finish\"}', NULL),
(36, 38, 'directus_fields', '11', '{\"id\":11,\"collection\":\"sessions\",\"field\":\"id_event\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":1,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"sessions\",\"field\":\"id_event\",\"sort\":1,\"group\":null}', NULL),
(37, 39, 'directus_fields', '12', '{\"id\":12,\"collection\":\"sessions\",\"field\":\"id_session\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":2,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"sessions\",\"field\":\"id_session\",\"sort\":2,\"group\":null}', NULL),
(38, 40, 'directus_fields', '14', '{\"id\":14,\"collection\":\"sessions\",\"field\":\"session_name\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":3,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"sessions\",\"field\":\"session_name\",\"sort\":3,\"group\":null}', NULL),
(39, 41, 'directus_fields', '13', '{\"id\":13,\"collection\":\"sessions\",\"field\":\"start\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":4,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"sessions\",\"field\":\"start\",\"sort\":4,\"group\":null}', NULL),
(40, 42, 'directus_fields', '15', '{\"id\":15,\"collection\":\"sessions\",\"field\":\"finish\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":5,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"sessions\",\"field\":\"finish\",\"sort\":5,\"group\":null}', NULL),
(41, 43, 'directus_fields', '11', '{\"id\":11,\"collection\":\"sessions\",\"field\":\"id_event\",\"special\":null,\"interface\":\"select-dropdown-m2o\",\"options\":null,\"display\":\"related-values\",\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":1,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"sessions\",\"field\":\"id_event\",\"special\":null,\"interface\":\"select-dropdown-m2o\",\"options\":null,\"display\":\"related-values\",\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":1,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', NULL),
(42, 44, 'directus_fields', '1', '{\"id\":1,\"collection\":\"messages\",\"field\":\"id_chat\",\"special\":null,\"interface\":\"select-dropdown-m2o\",\"options\":null,\"display\":\"related-values\",\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"id_chat\",\"special\":null,\"interface\":\"select-dropdown-m2o\",\"options\":null,\"display\":\"related-values\",\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', NULL),
(43, 45, 'directus_fields', '2', '{\"id\":2,\"collection\":\"messages\",\"field\":\"id_pengirim\",\"special\":null,\"interface\":\"select-dropdown-m2o\",\"options\":null,\"display\":\"related-values\",\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"id_pengirim\",\"special\":null,\"interface\":\"select-dropdown-m2o\",\"options\":null,\"display\":\"related-values\",\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":null,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', NULL),
(44, 46, 'directus_fields', '16', '{\"collection\":\"chats\",\"field\":\"id_session\"}', '{\"collection\":\"chats\",\"field\":\"id_session\"}', NULL),
(45, 47, 'directus_fields', '17', '{\"collection\":\"chats\",\"field\":\"id_chat\"}', '{\"collection\":\"chats\",\"field\":\"id_chat\"}', NULL),
(46, 48, 'directus_fields', '18', '{\"collection\":\"chats\",\"field\":\"status\"}', '{\"collection\":\"chats\",\"field\":\"status\"}', NULL),
(47, 49, 'directus_fields', '17', '{\"id\":17,\"collection\":\"chats\",\"field\":\"id_chat\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":1,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"chats\",\"field\":\"id_chat\",\"sort\":1,\"group\":null}', NULL),
(48, 50, 'directus_fields', '16', '{\"id\":16,\"collection\":\"chats\",\"field\":\"id_session\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":2,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"chats\",\"field\":\"id_session\",\"sort\":2,\"group\":null}', NULL),
(49, 51, 'directus_fields', '18', '{\"id\":18,\"collection\":\"chats\",\"field\":\"status\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":3,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"chats\",\"field\":\"status\",\"sort\":3,\"group\":null}', NULL),
(50, 52, 'directus_fields', '16', '{\"id\":16,\"collection\":\"chats\",\"field\":\"id_session\",\"special\":null,\"interface\":\"select-dropdown-m2o\",\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":2,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"chats\",\"field\":\"id_session\",\"special\":null,\"interface\":\"select-dropdown-m2o\",\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":2,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', NULL),
(51, 53, 'directus_fields', '19', '{\"collection\":\"admins\",\"field\":\"id_admin\"}', '{\"collection\":\"admins\",\"field\":\"id_admin\"}', NULL),
(52, 54, 'directus_fields', '20', '{\"collection\":\"admins\",\"field\":\"email\"}', '{\"collection\":\"admins\",\"field\":\"email\"}', NULL),
(53, 55, 'directus_fields', '21', '{\"collection\":\"admins\",\"field\":\"password\"}', '{\"collection\":\"admins\",\"field\":\"password\"}', NULL),
(54, 56, 'directus_fields', '22', '{\"collection\":\"admins\",\"field\":\"nama\"}', '{\"collection\":\"admins\",\"field\":\"nama\"}', NULL),
(55, 57, 'directus_fields', '23', '{\"hidden\":false,\"interface\":\"input\",\"options\":null,\"display\":\"raw\",\"display_options\":null,\"readonly\":false,\"special\":null,\"collection\":\"chats\",\"field\":\"id_websocket\"}', '{\"hidden\":false,\"interface\":\"input\",\"options\":null,\"display\":\"raw\",\"display_options\":null,\"readonly\":false,\"special\":null,\"collection\":\"chats\",\"field\":\"id_websocket\"}', NULL),
(56, 58, 'directus_fields', '4', '{\"id\":4,\"collection\":\"messages\",\"field\":\"id_conversation\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":1,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"id_conversation\",\"sort\":1,\"group\":null}', NULL),
(57, 59, 'directus_fields', '1', '{\"id\":1,\"collection\":\"messages\",\"field\":\"id_chat\",\"special\":null,\"interface\":\"select-dropdown-m2o\",\"options\":null,\"display\":\"related-values\",\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":2,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"id_chat\",\"sort\":2,\"group\":null}', NULL),
(58, 60, 'directus_fields', '2', '{\"id\":2,\"collection\":\"messages\",\"field\":\"id_pengirim\",\"special\":null,\"interface\":\"select-dropdown-m2o\",\"options\":null,\"display\":\"related-values\",\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":3,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"id_pengirim\",\"sort\":3,\"group\":null}', NULL),
(59, 61, 'directus_fields', '5', '{\"id\":5,\"collection\":\"messages\",\"field\":\"pesan\",\"special\":null,\"interface\":null,\"options\":null,\"display\":null,\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":4,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"pesan\",\"sort\":4,\"group\":null}', NULL),
(60, 62, 'directus_fields', '6', '{\"id\":6,\"collection\":\"messages\",\"field\":\"satus\",\"special\":null,\"interface\":\"input\",\"options\":null,\"display\":\"raw\",\"display_options\":null,\"readonly\":false,\"hidden\":false,\"sort\":5,\"width\":\"full\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null}', '{\"collection\":\"messages\",\"field\":\"satus\",\"sort\":5,\"group\":null}', NULL),
(61, 63, 'directus_fields', '24', '{\"collection\":\"messages\",\"field\":\"status\"}', '{\"collection\":\"messages\",\"field\":\"status\"}', NULL),
(62, 64, 'directus_fields', '25', '{\"hidden\":false,\"interface\":\"datetime\",\"options\":{\"includeSeconds\":true},\"display\":\"datetime\",\"display_options\":null,\"readonly\":false,\"special\":\"date-created\",\"collection\":\"messages\",\"field\":\"waktu_pengiriman\"}', '{\"hidden\":false,\"interface\":\"datetime\",\"options\":{\"includeSeconds\":true},\"display\":\"datetime\",\"display_options\":null,\"readonly\":false,\"special\":\"date-created\",\"collection\":\"messages\",\"field\":\"waktu_pengiriman\"}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_roles`
--

CREATE TABLE `directus_roles` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'supervised_user_circle',
  `description` text DEFAULT NULL,
  `ip_access` text DEFAULT NULL,
  `enforce_tfa` tinyint(1) NOT NULL DEFAULT 0,
  `collection_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`collection_list`)),
  `admin_access` tinyint(1) NOT NULL DEFAULT 0,
  `app_access` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directus_roles`
--

INSERT INTO `directus_roles` (`id`, `name`, `icon`, `description`, `ip_access`, `enforce_tfa`, `collection_list`, `admin_access`, `app_access`) VALUES
('7a4e7146-6af4-4cd7-90cb-664eec7ee9d6', 'Administrator', 'verified', 'Initial administrative role with unrestricted App/API access', NULL, 0, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `directus_sessions`
--

CREATE TABLE `directus_sessions` (
  `token` varchar(64) NOT NULL,
  `user` char(36) NOT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directus_sessions`
--

INSERT INTO `directus_sessions` (`token`, `user`, `expires`, `ip`, `user_agent`, `data`) VALUES
('H0CkGQqApagDQ0d1ZaLFzmOMWu6IEv1E6Y7IN09yoQOfCnH-a6KWT4k0ZzX6XLd6', '14682075-f26c-490d-9fcd-4fccf26370f7', '2021-10-25 09:13:58', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_settings`
--

CREATE TABLE `directus_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_name` varchar(100) NOT NULL DEFAULT 'Directus',
  `project_url` varchar(255) DEFAULT NULL,
  `project_color` varchar(10) DEFAULT '#00C897',
  `project_logo` char(36) DEFAULT NULL,
  `public_foreground` char(36) DEFAULT NULL,
  `public_background` char(36) DEFAULT NULL,
  `public_note` text DEFAULT NULL,
  `auth_login_attempts` int(10) UNSIGNED DEFAULT 25,
  `auth_password_policy` varchar(100) DEFAULT NULL,
  `storage_asset_transform` varchar(7) DEFAULT 'all',
  `storage_asset_presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`storage_asset_presets`)),
  `custom_css` text DEFAULT NULL,
  `storage_default_folder` char(36) DEFAULT NULL,
  `basemaps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`basemaps`)),
  `mapbox_key` varchar(255) DEFAULT NULL,
  `module_bar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`module_bar`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directus_users`
--

CREATE TABLE `directus_users` (
  `id` char(36) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `avatar` char(36) DEFAULT NULL,
  `language` varchar(8) DEFAULT 'en-US',
  `theme` varchar(20) DEFAULT 'auto',
  `tfa_secret` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'active',
  `role` char(36) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `last_access` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_page` varchar(255) DEFAULT NULL,
  `provider` varchar(128) NOT NULL DEFAULT 'default',
  `external_identifier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directus_users`
--

INSERT INTO `directus_users` (`id`, `first_name`, `last_name`, `email`, `password`, `location`, `title`, `description`, `tags`, `avatar`, `language`, `theme`, `tfa_secret`, `status`, `role`, `token`, `last_access`, `last_page`, `provider`, `external_identifier`) VALUES
('14682075-f26c-490d-9fcd-4fccf26370f7', 'Admin', 'User', 'adminqna@gmail.com', '$argon2i$v=19$m=4096,t=3,p=1$30GpOtMy1+VHwulsvvGHxA$ffGSOWp4nR7a0BNxiPgkUnUoTsyKxLKACvqJERapEqI', NULL, NULL, NULL, NULL, NULL, 'en-US', 'auto', NULL, 'active', '7a4e7146-6af4-4cd7-90cb-664eec7ee9d6', NULL, '2021-10-18 09:14:03', '/settings/data-model/messages', 'default', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_webhooks`
--

CREATE TABLE `directus_webhooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL DEFAULT 'POST',
  `url` text NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `data` tinyint(1) NOT NULL DEFAULT 1,
  `actions` varchar(100) NOT NULL,
  `collections` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id_event` int(11) NOT NULL,
  `nama_event` varchar(255) NOT NULL,
  `event_mulai` date NOT NULL,
  `event_berakhir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id_event`, `nama_event`, `event_mulai`, `event_berakhir`) VALUES
(1, 'Webminar Pengenalan Diri', '2021-10-17', '2021-10-17'),
(2, 'Workshop IT', '2021-10-19', '2021-10-19'),
(3, 'Workshop UI/UX', '2021-10-19', '2021-10-19'),
(4, 'Training - Game Maker', '2021-10-25', '2021-10-25');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL,
  `id_chat` int(11) NOT NULL,
  `id_pengirim` int(11) NOT NULL,
  `pesan` longtext NOT NULL,
  `status` int(11) DEFAULT NULL,
  `waktu_pengiriman` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id_message`, `id_chat`, `id_pengirim`, `pesan`, `status`, `waktu_pengiriman`) VALUES
(93, 1, 9, 'Admin, saya ingin bertanya. Saya Mina. Peserta dengan id 9. Bagaimana ya cara untuk menjadi percaya diri ? karena saya belakangan ini sulit percaya diri. Saya ingin menjadi percaya diri, dan bisa berbicara dengan orang banyak. ', 1, '2021-11-02 22:25:52'),
(176, 1, 11, 'Halo admin sesi 1, ini id 11, perkenalkan saya asa darussalam dari jurusan Sistem Informasi ITS. Izin bertanya mengenai bagaimana cara agar percaya diri tanp[a insecure? kan terkadang kita juga meyakinkan diri sepenuhnya.', 0, '2021-11-03 21:37:22'),
(181, 1, 9, 'Admin, saya mau bertanya kembali. Bagaimana ya cara menyampaikan kepada teman saya kalau saya suka dia?', 0, '2021-11-03 20:02:36'),
(182, 1, 9, 'Lagi ya min. Aku kepo soalnya', 2, '2021-11-03 20:04:14'),
(196, 1, 11, 'Admin, aku mau nanya ya', 0, '2021-11-04 22:40:36'),
(197, 1, 9, 'Kenapa saya harus mengerjakan tugas yang sesulit ini min? Saya pusing, Stress. Saya mau mendapatkan tugas yang lebih mudah. ', 0, '2021-11-07 21:55:12'),
(198, 1, 11, 'Jadi nanya ya aku min', 0, '2021-11-07 23:03:22'),
(201, 1, 9, 'Hallo admin, ini mina.', 0, '2021-11-08 00:41:45'),
(202, 1, 9, 'Admin', 0, '2021-11-08 00:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id_participant` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id_participant`, `nama`, `email`) VALUES
(1, 'nabilah', 'nabilah1234@gmail.com'),
(2, 'danes', 'danes000@gmail.com'),
(3, 'anggun', 'aaaaangun@gmail.com'),
(4, 'Edwina', 'edwina01010@gmail.com'),
(5, 'Jeremia', 'jeremi000@gmail.com'),
(6, 'Mina', 'akumina@gmail.com'),
(7, 'Ari', 'iniariya@gmail.com'),
(8, 'Arafat', 'arafatspesial@gmail.com'),
(9, 'Kar', 'kartikabela@gmail.com'),
(10, 'Agung', 'lordagung@gmail.com'),
(11, 'Asa', 'asa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id_session` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `session_name` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `finish` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id_session`, `id_event`, `session_name`, `start`, `finish`) VALUES
(1, 1, 'Sesi 1', '2021-10-17 10:00:00', '2021-10-17 12:00:00'),
(2, 1, 'Sesi 2', '2021-10-17 15:00:00', '2021-10-17 17:00:00'),
(3, 2, 'Sesi 1', '2021-10-19 13:00:00', '2021-10-19 15:00:00'),
(4, 3, 'Sesi 1', '2021-10-19 13:00:00', '2021-10-19 15:00:00'),
(5, 4, 'Sesi 1', '2021-10-25 10:00:00', '2021-10-25 12:00:00'),
(6, 4, 'Sesi 2', '2021-10-25 15:00:00', '2021-10-25 17:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `id_session` (`id_session`);

--
-- Indexes for table `directus_activity`
--
ALTER TABLE `directus_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_activity_collection_foreign` (`collection`);

--
-- Indexes for table `directus_collections`
--
ALTER TABLE `directus_collections`
  ADD PRIMARY KEY (`collection`),
  ADD KEY `directus_collections_group_foreign` (`group`);

--
-- Indexes for table `directus_dashboards`
--
ALTER TABLE `directus_dashboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_dashboards_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_fields`
--
ALTER TABLE `directus_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_fields_collection_foreign` (`collection`);

--
-- Indexes for table `directus_files`
--
ALTER TABLE `directus_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_files_uploaded_by_foreign` (`uploaded_by`),
  ADD KEY `directus_files_modified_by_foreign` (`modified_by`),
  ADD KEY `directus_files_folder_foreign` (`folder`);

--
-- Indexes for table `directus_folders`
--
ALTER TABLE `directus_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_folders_parent_foreign` (`parent`);

--
-- Indexes for table `directus_migrations`
--
ALTER TABLE `directus_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `directus_panels`
--
ALTER TABLE `directus_panels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_panels_dashboard_foreign` (`dashboard`),
  ADD KEY `directus_panels_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_permissions`
--
ALTER TABLE `directus_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_permissions_collection_foreign` (`collection`),
  ADD KEY `directus_permissions_role_foreign` (`role`);

--
-- Indexes for table `directus_presets`
--
ALTER TABLE `directus_presets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_presets_collection_foreign` (`collection`),
  ADD KEY `directus_presets_user_foreign` (`user`),
  ADD KEY `directus_presets_role_foreign` (`role`);

--
-- Indexes for table `directus_relations`
--
ALTER TABLE `directus_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_relations_many_collection_foreign` (`many_collection`),
  ADD KEY `directus_relations_one_collection_foreign` (`one_collection`);

--
-- Indexes for table `directus_revisions`
--
ALTER TABLE `directus_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_revisions_collection_foreign` (`collection`),
  ADD KEY `directus_revisions_parent_foreign` (`parent`),
  ADD KEY `directus_revisions_activity_foreign` (`activity`);

--
-- Indexes for table `directus_roles`
--
ALTER TABLE `directus_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directus_sessions`
--
ALTER TABLE `directus_sessions`
  ADD PRIMARY KEY (`token`),
  ADD KEY `directus_sessions_user_foreign` (`user`);

--
-- Indexes for table `directus_settings`
--
ALTER TABLE `directus_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_settings_project_logo_foreign` (`project_logo`),
  ADD KEY `directus_settings_public_foreground_foreign` (`public_foreground`),
  ADD KEY `directus_settings_public_background_foreign` (`public_background`),
  ADD KEY `directus_settings_storage_default_folder_foreign` (`storage_default_folder`);

--
-- Indexes for table `directus_users`
--
ALTER TABLE `directus_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `directus_users_external_identifier_unique` (`external_identifier`),
  ADD UNIQUE KEY `directus_users_email_unique` (`email`),
  ADD KEY `directus_users_role_foreign` (`role`);

--
-- Indexes for table `directus_webhooks`
--
ALTER TABLE `directus_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `id_pengirim` (`id_pengirim`),
  ADD KEY `id_chat` (`id_chat`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id_participant`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id_session`),
  ADD KEY `id_event` (`id_event`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `directus_activity`
--
ALTER TABLE `directus_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `directus_fields`
--
ALTER TABLE `directus_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `directus_permissions`
--
ALTER TABLE `directus_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directus_presets`
--
ALTER TABLE `directus_presets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `directus_relations`
--
ALTER TABLE `directus_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directus_revisions`
--
ALTER TABLE `directus_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `directus_settings`
--
ALTER TABLE `directus_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directus_webhooks`
--
ALTER TABLE `directus_webhooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id_participant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `sessions` (`id_session`);

--
-- Constraints for table `directus_collections`
--
ALTER TABLE `directus_collections`
  ADD CONSTRAINT `directus_collections_group_foreign` FOREIGN KEY (`group`) REFERENCES `directus_collections` (`collection`);

--
-- Constraints for table `directus_dashboards`
--
ALTER TABLE `directus_dashboards`
  ADD CONSTRAINT `directus_dashboards_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_files`
--
ALTER TABLE `directus_files`
  ADD CONSTRAINT `directus_files_folder_foreign` FOREIGN KEY (`folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `directus_files_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `directus_files_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `directus_folders`
--
ALTER TABLE `directus_folders`
  ADD CONSTRAINT `directus_folders_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_folders` (`id`);

--
-- Constraints for table `directus_panels`
--
ALTER TABLE `directus_panels`
  ADD CONSTRAINT `directus_panels_dashboard_foreign` FOREIGN KEY (`dashboard`) REFERENCES `directus_dashboards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_panels_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_permissions`
--
ALTER TABLE `directus_permissions`
  ADD CONSTRAINT `directus_permissions_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directus_presets`
--
ALTER TABLE `directus_presets`
  ADD CONSTRAINT `directus_presets_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_presets_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directus_revisions`
--
ALTER TABLE `directus_revisions`
  ADD CONSTRAINT `directus_revisions_activity_foreign` FOREIGN KEY (`activity`) REFERENCES `directus_activity` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_revisions_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_revisions` (`id`);

--
-- Constraints for table `directus_sessions`
--
ALTER TABLE `directus_sessions`
  ADD CONSTRAINT `directus_sessions_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directus_settings`
--
ALTER TABLE `directus_settings`
  ADD CONSTRAINT `directus_settings_project_logo_foreign` FOREIGN KEY (`project_logo`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_public_background_foreign` FOREIGN KEY (`public_background`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_public_foreground_foreign` FOREIGN KEY (`public_foreground`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_storage_default_folder_foreign` FOREIGN KEY (`storage_default_folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_users`
--
ALTER TABLE `directus_users`
  ADD CONSTRAINT `directus_users_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_chat`) REFERENCES `chats` (`id_chat`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`id_pengirim`) REFERENCES `participants` (`id_participant`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
