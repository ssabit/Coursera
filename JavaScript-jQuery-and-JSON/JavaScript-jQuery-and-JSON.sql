-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2020 at 09:45 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `misc`
--

-- --------------------------------------------------------

--
-- Table structure for table `ages`
--

CREATE TABLE `ages` (
  `name` varchar(128) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ages`
--

INSERT INTO `ages` (`name`, `age`) VALUES
('Kellyanne', 13),
('Faye', 17),
('Reeva', 18),
('Campbel', 26);

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `profile_id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`profile_id`, `institution_id`, `rank`, `year`) VALUES
(11, 1, 3, 2022),
(11, 4, 2, 2021),
(11, 10, 1, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE `institution` (
  `institution_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `institution`
--

INSERT INTO `institution` (`institution_id`, `name`) VALUES
(6, 'Duke University'),
(7, 'Michigan State University'),
(8, 'Mississippi State University'),
(9, 'Montana State University'),
(5, 'Stanford University'),
(10, 'United International University'),
(4, 'University of Cambridge'),
(1, 'University of Michigan'),
(3, 'University of Oxford'),
(2, 'University of Virginia');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` text DEFAULT NULL,
  `last_name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `headline` text DEFAULT NULL,
  `summary` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profile_id`, `user_id`, `first_name`, `last_name`, `email`, `headline`, `summary`) VALUES
(11, 1, 'saad', 'sabit', 'sabit@gmail.com', 'Developer', 'Developer');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`) VALUES
(1, 'UMSI', 'umsi@umich.edu', '1a52e17fa899cf40fb04cfc42e6352f1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`profile_id`,`institution_id`),
  ADD KEY `education_ibfk_2` (`institution_id`);

--
-- Indexes for table `institution`
--
ALTER TABLE `institution`
  ADD PRIMARY KEY (`institution_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`),
  ADD KEY `position_ibfk_1` (`profile_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `profile_ibfk_2` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `email` (`email`),
  ADD KEY `password` (`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `institution`
--
ALTER TABLE `institution`
  MODIFY `institution_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `education_ibfk_2` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`institution_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `position_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
