-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2021 at 06:58 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lucthrm`
--
CREATE DATABASE IF NOT EXISTS `lucthrm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lucthrm`;

-- --------------------------------------------------------

--
-- Table structure for table `all_leaves`
--

CREATE TABLE `all_leaves` (
  `name` text NOT NULL,
  `type1` text NOT NULL,
  `number` int(30) NOT NULL,
  `duration` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `all_leaves`
--

INSERT INTO `all_leaves` (`name`, `type1`, `number`, `duration`) VALUES
('tsekisoelliot1535@gmail.com', 'SNR Lecture', 2, 'Five weeks');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `date` date NOT NULL,
  `timein` datetime(6) NOT NULL,
  `timeout` datetime(6) NOT NULL,
  `note` text NOT NULL,
  `lastnote` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`date`, `timein`, `timeout`, `note`, `lastnote`) VALUES
('2021-03-09', '2021-03-11 11:26:52.000000', '2021-03-18 11:26:52.000000', 'Arrived on time', 'Late submissions');

-- --------------------------------------------------------

--
-- Table structure for table `clocked`
--

CREATE TABLE `clocked` (
  `name` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `name` text NOT NULL,
  `type` text NOT NULL,
  `amount` int(30) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `compony`
--

CREATE TABLE `compony` (
  `name` text NOT NULL,
  `address` text NOT NULL,
  `type` text NOT NULL,
  `country` text NOT NULL,
  `zone` text NOT NULL,
  `parent` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `compony`
--

INSERT INTO `compony` (`name`, `address`, `type`, `country`, `zone`, `parent`) VALUES
('Pretoria Branch', 'MNL 1st floor, 232', 'Marketing ', 'S.A', '12222', 'DDD');

-- --------------------------------------------------------

--
-- Table structure for table `dependents`
--

CREATE TABLE `dependents` (
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `relationship` text NOT NULL,
  `birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dependents`
--

INSERT INTO `dependents` (`name`, `email`, `relationship`, `birth`) VALUES
('Tsekiso', 'tsekisoelliot1535@gmail.com', 'Married', '2021-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `name` text NOT NULL,
  `qualification` text NOT NULL,
  `institute` text NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `empleave`
--

CREATE TABLE `empleave` (
  `name` text NOT NULL,
  `type` text NOT NULL,
  `sdate` date NOT NULL,
  `edate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `empleave`
--

INSERT INTO `empleave` (`name`, `type`, `sdate`, `edate`) VALUES
('tsekisoelliot@gmail.com', 'SNR Lecture', '2021-03-03', '2021-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `name` text NOT NULL,
  `occupation` text NOT NULL,
  `position` text NOT NULL,
  `duration` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `name` text NOT NULL,
  `accrue` text NOT NULL,
  `carried` text NOT NULL,
  `number` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`name`, `accrue`, `carried`, `number`) VALUES
('SNR Lecture', 'yes', 'No', 2020009);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `name`, `email`, `pass`) VALUES
(901009000, 'Mpho', 'mpho@gmail.com', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `rejects`
--

CREATE TABLE `rejects` (
  `name` text NOT NULL,
  `type1` text NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rejects`
--

INSERT INTO `rejects` (`name`, `type1`, `start`, `end`) VALUES
('tsekisoelliot1535@gmail.com', 'SNR Lecture', '2021-03-03', '2021-03-31');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `name` text NOT NULL,
  `type1` text NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `name` text NOT NULL,
  `type` text NOT NULL,
  `amount` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salarytypes`
--

CREATE TABLE `salarytypes` (
  `code` text NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salarytypes`
--

INSERT INTO `salarytypes` (`code`, `name`) VALUES
('BBC009', 'Faculty Managers');

-- --------------------------------------------------------

--
-- Table structure for table `terminations`
--

CREATE TABLE `terminations` (
  `email` varchar(30) NOT NULL,
  `type` text NOT NULL,
  `date` date NOT NULL,
  `carried` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `level` text NOT NULL,
  `pass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `level`, `pass`) VALUES
(901009000, 'Tsekiso', 'tsekisoelliot1535@gmail.com', 'IT Head', '1111'),
(9012333, 'khatau', 'kt@gmail.com', 'Lecture', 'kt@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `workweek`
--

CREATE TABLE `workweek` (
  `day` text NOT NULL,
  `status` text NOT NULL,
  `country` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
