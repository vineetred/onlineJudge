-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Nov 12, 2016 at 10:29 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `onlineJudge`
--

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE `problems` (
  `PID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `problemPath` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `testCasePath` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store Problems';

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `SID` int(255) NOT NULL,
  `PID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verdict` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Password field',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name',
  `score` int(255) DEFAULT NULL,
  `accuracy` decimal(65,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `password`, `name`, `score`, `accuracy`) VALUES
('agdhruv', 'xyz', 'Dhruv Agarwal', 0, '0'),
('vineet', '123', 'Vineet Reddy', 0, '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UID`(32));
