-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2024 at 03:31 AM
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
-- Database: `zikry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_telp` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`) VALUES
(2, 'Irawan', 'irawan', 'adminirawan', '085774137284', 'irawan@gmail.com', 'Jl. Raya Kadu Seungit'),
(3, 'Diana', 'diana', '1234', '085788992919', 'Diana@gmail.com', 'Suka Seneng Cikeusik'),
(4, 'Hazwan', 'hazwan', '123', '085787778811', 'hazwan@gmail.com', 'Cikeusik Pandeglang'),
(5, 'Zikry', 'zikry', '12', '242356373', 'zikry123@gmai.com', 'Galanggang'),
(6, 'Afe', 'aaaaa', '123', '00284276424', 'zikrynursalam@gmail.com', 'Rerere'),
(7, 'Asa', 'asaa', '123', '00284276424', 'zikrynursalam@gmail.com', 'Rerere');

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`) VALUES
(15, 'Bawah Air'),
(16, 'Hewan Peliharaan'),
(17, 'olahraga'),
(18, 'Makanan'),
(23, 'iphone');

-- --------------------------------------------------------

--
-- Table structure for table `tb_image`
--

CREATE TABLE `tb_image` (
  `image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_image`
--

INSERT INTO `tb_image` (`image_id`, `category_id`, `category_name`, `admin_id`, `admin_name`, `image_name`, `image_description`, `image`, `image_status`, `date_created`) VALUES
(50, 15, 'Bawah Air', 5, 'Zikry', 'qsqs', 'w1w1w', 'foto1708651072.jpg', 1, '2024-02-23 01:17:52'),
(51, 15, 'Bawah Air', 5, 'Zikry', 'bawah air', 'Banyak ikan', 'foto1708652517.jpeg', 1, '2024-02-23 01:41:57'),
(52, 15, 'Bawah Air', 5, 'Zikry', 'ikan', 'Banyak ikan', 'foto1708652564.jpeg', 1, '2024-02-23 01:42:44'),
(58, 15, 'Bawah Air', 5, 'Zikry', 'aaf', 'aaaaa', 'foto1708652743.jpeg', 1, '2024-02-23 01:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `tb_komentar`
--

CREATE TABLE `tb_komentar` (
  `komentar_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `isi_komentar` text NOT NULL,
  `tanggal_komentar` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_like`
--

CREATE TABLE `tb_like` (
  `like_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `admin_name` varchar(25) NOT NULL,
  `suka` int(11) NOT NULL,
  `tanggal_like` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `tb_image`
--
ALTER TABLE `tb_image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `tb_komentar`
--
ALTER TABLE `tb_komentar`
  ADD PRIMARY KEY (`komentar_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `tb_like`
--
ALTER TABLE `tb_like`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `suka` (`suka`),
  ADD KEY `image_id_2` (`image_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_image`
--
ALTER TABLE `tb_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tb_komentar`
--
ALTER TABLE `tb_komentar`
  MODIFY `komentar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_like`
--
ALTER TABLE `tb_like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_image`
--
ALTER TABLE `tb_image`
  ADD CONSTRAINT `tb_image_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`),
  ADD CONSTRAINT `tb_image_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`);

--
-- Constraints for table `tb_komentar`
--
ALTER TABLE `tb_komentar`
  ADD CONSTRAINT `tb_komentar_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `tb_image` (`image_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_komentar_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `tb_image` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_like`
--
ALTER TABLE `tb_like`
  ADD CONSTRAINT `tb_like_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `tb_image` (`image_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
