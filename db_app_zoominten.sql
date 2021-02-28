-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 28, 2021 at 04:14 PM
-- Server version: 10.3.25-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_app_zoominten`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_account`
--

CREATE TABLE `tb_account` (
  `account_id` int(11) NOT NULL,
  `account_email` varchar(150) NOT NULL,
  `max_participant` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_app_setting`
--

CREATE TABLE `tb_app_setting` (
  `app_id` int(1) NOT NULL,
  `app_title` varchar(100) NOT NULL,
  `app_title_alt` varchar(50) NOT NULL,
  `fetch_data_time` int(11) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `app_icon` varchar(255) NOT NULL,
  `app_logo_dark` varchar(255) NOT NULL,
  `app_logo_light` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_app_setting`
--

INSERT INTO `tb_app_setting` (`app_id`, `app_title`, `app_title_alt`, `fetch_data_time`, `footer_text`, `app_icon`, `app_logo_dark`, `app_logo_light`, `company_name`) VALUES
(1, 'Zoom Meeting Information And Teleconference Management', 'ZOOMINTEN', 120000, 'ZOOMINTEN - DISKOMINFO KOTA TANGERANG', 'app_icon/zoominten-icon_F7iZOgfoVUtQ3jO8ouQtUg_JxmfWdly_8513_236790184_uwMR2V_1614502585.webp', 'app_logo_dark/6a246040-941b-44a4-b96d-ca074d2de6cb_200x200_8xohz27ymI1OQdpxqjOYA_cOeRqjtI_6521_058749316_5qXbok_1614503267.webp', 'app_logo_light/6b542572-ec8a-48b5-9655-6dd7005357a7_200x200_M3vG00XURt46VJ3qJCcSg_UWEnvRbN_7286_093581246_zaj0In_1614503094.webp', 'DINAS KOMUNIKASI DAN INFORMATIKA KOTA TANGERANG');

-- --------------------------------------------------------

--
-- Table structure for table `tb_meeting`
--

CREATE TABLE `tb_meeting` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `meeting_passcode` varchar(10) NOT NULL,
  `meeting_link` varchar(255) NOT NULL,
  `meeting_start` datetime NOT NULL,
  `meeting_end` datetime NOT NULL,
  `meeting_duration` int(2) NOT NULL,
  `meeting_location` varchar(150) NOT NULL,
  `meeting_pic` varchar(255) NOT NULL,
  `meeting_status` enum('started','running','ended','not-started') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_parent` int(11) DEFAULT NULL,
  `menu_label` varchar(100) NOT NULL,
  `menu_link` varchar(150) NOT NULL,
  `menu_icon` varchar(80) DEFAULT NULL,
  `menu_location` enum('mainmenu','submenu','content') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_menu`
--

INSERT INTO `tb_menu` (`menu_id`, `menu_parent`, `menu_label`, `menu_link`, `menu_icon`, `menu_location`) VALUES
(1, NULL, 'Dashboard', 'dashboard', 'fa fa-dashboard', 'mainmenu'),
(3, NULL, 'User Management', 'user-management', 'fa fa-users', 'mainmenu'),
(4, NULL, 'Application Settings', 'app-settings', 'fa fa-cogs', 'mainmenu'),
(11, NULL, 'Meeting Management', 'meeting-management', 'dw dw-chip', 'mainmenu'),
(12, NULL, 'Add Meeting', 'add-meeting', 'fa fa-plus-square', 'content'),
(13, NULL, 'Edit Meeting', 'edit-meeting', 'fa fa-pencil-square', 'content'),
(14, NULL, 'Delete Meeting', 'delete-meeting', 'fa fa-trash-o', 'content'),
(24, NULL, 'Add User', 'add-user', 'fa fa-plus-square', 'content'),
(25, NULL, 'Edit User', 'edit-user', 'fa fa-pencil-square', 'content'),
(26, NULL, 'Delete User', 'delete-user', 'fa fa-trash-o', 'content'),
(27, NULL, 'Access Management', 'access-management', 'fa fa-key', 'mainmenu'),
(28, NULL, 'Add Access', 'add-access', 'fa fa-plus-square', 'content'),
(29, NULL, 'Edit Access', 'edit-access', 'fa fa-pencil-square', 'content'),
(30, NULL, 'Delete Access', 'delete-access', 'fa fa-trash-o', 'content');

-- --------------------------------------------------------

--
-- Table structure for table `tb_roles`
--

CREATE TABLE `tb_roles` (
  `role_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_roles`
--

INSERT INTO `tb_roles` (`role_id`, `type_id`, `menu_id`) VALUES
(1, 2, 1),
(4, 2, 3),
(10, 2, 11),
(11, 2, 12),
(12, 2, 13),
(13, 2, 14),
(20, 2, 24),
(21, 2, 25),
(22, 2, 26),
(23, 1, 1),
(24, 1, 28),
(25, 1, 24),
(26, 1, 4),
(27, 1, 30),
(28, 1, 26),
(29, 1, 29),
(30, 1, 25),
(31, 1, 3),
(32, 1, 27);

-- --------------------------------------------------------

--
-- Table structure for table `tb_tools`
--

CREATE TABLE `tb_tools` (
  `tool_id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `tool` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_realname` varchar(150) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `user_picture` varchar(255) NOT NULL,
  `user_token` varchar(512) DEFAULT NULL,
  `is_active` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `type_id`, `user_name`, `user_password`, `user_realname`, `user_email`, `user_picture`, `user_token`, `is_active`) VALUES
(4, 1, 'userman', '$argon2id$v=19$m=2048,t=4,p=3$MzFaYWtHT1V3a2lWZ2tqTQ$184peklxAFz5vk8zmWmQYnCqJ37sjDt3YHYZ3fNQjHc', 'User Manager', 'userman@somewhere.com', 'default.png', NULL, 'Y'),
(5, 2, 'employee', '$argon2id$v=19$m=2048,t=4,p=3$LjluUzRpUHNzaDJvMmszaw$23nO/SqswKSe3XaXOvkIwdJKq6Id54LCoarDQlYP1zA', 'Employee', 'employee@somewhere.com', 'default.png', NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_type`
--

CREATE TABLE `tb_user_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user_type`
--

INSERT INTO `tb_user_type` (`type_id`, `type_name`) VALUES
(1, 'userman'),
(2, 'employee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_account`
--
ALTER TABLE `tb_account`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `tb_app_setting`
--
ALTER TABLE `tb_app_setting`
  ADD PRIMARY KEY (`app_id`);

--
-- Indexes for table `tb_meeting`
--
ALTER TABLE `tb_meeting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `meeting_id` (`meeting_id`),
  ADD KEY `tb_meeting_ibfk_1` (`account_id`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `tb_tools`
--
ALTER TABLE `tb_tools`
  ADD PRIMARY KEY (`tool_id`),
  ADD KEY `meeting_id` (`meeting_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `tb_user_type`
--
ALTER TABLE `tb_user_type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_account`
--
ALTER TABLE `tb_account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_meeting`
--
ALTER TABLE `tb_meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tb_tools`
--
ALTER TABLE `tb_tools`
  MODIFY `tool_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_user_type`
--
ALTER TABLE `tb_user_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_meeting`
--
ALTER TABLE `tb_meeting`
  ADD CONSTRAINT `tb_meeting_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `tb_account` (`account_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD CONSTRAINT `tb_roles_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tb_user_type` (`type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roles_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `tb_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_tools`
--
ALTER TABLE `tb_tools`
  ADD CONSTRAINT `tb_tools_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `tb_meeting` (`meeting_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tb_user_type` (`type_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;