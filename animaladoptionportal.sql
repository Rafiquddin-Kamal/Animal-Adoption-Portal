-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2025 at 09:18 AM
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
-- Database: `animaladoptionportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `adopted`
--

CREATE TABLE `adopted` (
  `adopt_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adoption`
--

CREATE TABLE `adoption` (
  `u_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `adopt_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE `animal` (
  `animal_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `species` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `timestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delcom`
--

CREATE TABLE `delcom` (
  `u_id` int(11) NOT NULL,
  `del_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delpost`
--

CREATE TABLE `delpost` (
  `u_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `del_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `donation_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `timestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posted`
--

CREATE TABLE `posted` (
  `u_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `photo` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recommendation`
--

CREATE TABLE `recommendation` (
  `u_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` tinyint(1) NOT NULL,
  `del_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `name`, `password`, `email`, `role`, `del_id`) VALUES
(1, 'admin', 'admin', 'admin@bracu.com', 1, 1),
(2, 'nishat', '1234', 'nishat@gmail.com', 0, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adopted`
--
ALTER TABLE `adopted`
  ADD KEY `u_id` (`u_id`),
  ADD KEY `animal_id` (`animal_id`),
  ADD KEY `adopt_id` (`adopt_id`);

--
-- Indexes for table `adoption`
--
ALTER TABLE `adoption`
  ADD PRIMARY KEY (`adopt_id`),
  ADD UNIQUE KEY `adopt_id` (`adopt_id`),
  ADD KEY `animal_id` (`animal_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`animal_id`),
  ADD UNIQUE KEY `animal_id` (`animal_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD UNIQUE KEY `comment_id` (`comment_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `delcom`
--
ALTER TABLE `delcom`
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `delpost`
--
ALTER TABLE `delpost`
  ADD KEY `animal_id` (`animal_id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`donation_id`),
  ADD UNIQUE KEY `donation_id` (`donation_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `posted`
--
ALTER TABLE `posted`
  ADD KEY `u_id` (`u_id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- Indexes for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD KEY `animal_id` (`animal_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `u_id` (`u_id`),
  ADD KEY `u_id_2` (`u_id`),
  ADD KEY `del_id` (`del_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adopted`
--
ALTER TABLE `adopted`
  ADD CONSTRAINT `adopted_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`),
  ADD CONSTRAINT `adopted_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`),
  ADD CONSTRAINT `adopted_ibfk_3` FOREIGN KEY (`adopt_id`) REFERENCES `adoption` (`adopt_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `adoption`
--
ALTER TABLE `adoption`
  ADD CONSTRAINT `adoption_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`),
  ADD CONSTRAINT `adoption_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);

--
-- Constraints for table `delcom`
--
ALTER TABLE `delcom`
  ADD CONSTRAINT `delcom_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delpost`
--
ALTER TABLE `delpost`
  ADD CONSTRAINT `delpost_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);

--
-- Constraints for table `posted`
--
ALTER TABLE `posted`
  ADD CONSTRAINT `posted_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`),
  ADD CONSTRAINT `posted_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`);

--
-- Constraints for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD CONSTRAINT `recommendation_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`),
  ADD CONSTRAINT `recommendation_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
