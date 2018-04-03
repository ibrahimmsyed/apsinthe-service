-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2018 at 07:31 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `born_trackr`
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `converge_id` varchar(40) DEFAULT NULL,
  `jobtype` varchar(100) DEFAULT NULL,
  `complexity` varchar(100) DEFAULT NULL,
  `scheduled_start_date` date NOT NULL,
  `scheduled_end_date` date NOT NULL,
  `task_status` int(5) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `pocs` varchar(100) DEFAULT NULL,
  `job_comments` varchar(255) DEFAULT NULL,
  `scheduled_hours` decimal(4,2) UNSIGNED DEFAULT NULL,
  `total_no_of_functionalities` int(5) DEFAULT NULL,
  `functionality_details` varchar(255) DEFAULT NULL,
  `edit_reason` varchar(255) DEFAULT NULL,
  `actual_start_time` date NOT NULL,
  `actual_end_time` date NOT NULL,
  `actual_hours` decimal(4,2) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `uid`, `converge_id`, `jobtype`, `complexity`, `scheduled_start_date`, `scheduled_end_date`, `task_status`, `publisher`, `pocs`, `job_comments`, `scheduled_hours`, `total_no_of_functionalities`, `functionality_details`, `edit_reason`, `actual_start_time`, `actual_end_time`, `actual_hours`, `token`, `updated_at`) VALUES
(1, 2, 'sathish', 'new build', '2', '2018-02-01', '2018-02-11', 0, 'CVS', 'Adam', NULL, '4.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$lZ3YXhpq$eD1opEemkzUNzSWWx0/qR1', '2018-02-14 15:12:41'),
(2, 2, '04_cvs_D0000', 'new build', '2', '2018-02-07', '2018-02-11', 1, 'CVS', 'Adam', NULL, '4.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$97QJjElE$TiIx7M.BGd9a0AoEEsk0B.', '2018-02-14 13:41:10'),
(3, 2, '04_cvs_D0000', 'new build', '2', '2018-02-07', '2018-02-11', 2, 'CVS', 'Adam', NULL, '4.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$97QJjElE$TiIx7M.BGd9a0AoEEsk0B.', '2018-02-14 13:41:10'),
(4, 2, 'sathish', 'new build', '2', '2018-02-01', '2018-02-11', 3, 'CVS', 'Adam', NULL, '4.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$lZ3YXhpq$eD1opEemkzUNzSWWx0/qR1', '2018-02-14 15:12:50'),
(5, 2, '04_cvs_D0000', 'new build', '2', '2018-02-07', '2018-02-11', 1, 'CVS', 'Adam', NULL, '4.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$2zVydAgV$7GHtV1pofpYGRWxC1qCUq.', '2018-02-14 13:41:10'),
(6, 2, '01_000_PNG', 'Refresh', '3', '2018-02-07', '2018-02-11', 2, 'WM', 'BILL', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$2zVydAgV$7GHtV1pofpYGRWxC1qCUq.', '2018-02-14 13:41:10'),
(7, 2, '01_000_PNG', 'Refresh', '3', '2018-02-07', '2018-02-11', 3, 'WM', 'BILL', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$2zVydAgV$7GHtV1pofpYGRWxC1qCUq.', '2018-02-14 13:41:10'),
(8, 2, '01_000_PNG', 'Refresh', '3', '2018-02-07', '2018-02-11', 1, 'WM', 'BILL', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$2zVydAgV$7GHtV1pofpYGRWxC1qCUq.', '2018-02-14 13:41:10'),
(9, 2, 'Logan', 'Refresh', '3', '2018-02-07', '2018-02-11', 2, 'WM', 'BILL', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$2zVydAgV$7GHtV1pofpYGRWxC1qCUq.', '2018-02-14 13:41:10'),
(10, 2, 'Logan', 'Refresh', '3', '2018-02-07', '2018-02-11', 3, 'WM', 'BILL', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$2zVydAgV$7GHtV1pofpYGRWxC1qCUq.', '2018-02-14 13:41:10'),
(11, 2, 'aaaLaogan', 'Refresh', '3', '2018-02-07', '2018-02-11', 0, 'WM', 'BILL', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$d3CN1mD.$V0kebc3dl4lerOjog9VVR.', '2018-02-14 21:11:14'),
(12, 2, 'aaaLaogan', 'Refresh', '3', '2018-02-07', '2018-02-11', 0, 'WM', 'Logan', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$d3CN1mD.$V0kebc3dl4lerOjog9VVR.', '2018-02-14 21:11:42'),
(13, 2, 'aaaLaogan', 'Refresh', '3', '2018-02-07', '2018-02-11', 0, 'WM', 'Logan', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$d3CN1mD.$V0kebc3dl4lerOjog9VVR.', '2018-02-14 21:12:08'),
(14, 2, 'aaaLaogan', 'Refresh', '3', '2018-02-07', '2018-02-11', 0, 'WM', 'Logan', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$d3CN1mD.$V0kebc3dl4lerOjog9VVR.', '2018-02-14 21:20:45'),
(15, 2, 'aaaLaogan', 'Refresh', '3', '2018-02-07', '2018-02-11', 0, 'WM', 'Logan', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$d3CN1mD.$V0kebc3dl4lerOjog9VVR.', '2018-02-14 21:20:51'),
(16, 2, 'aaaLaogan', 'Refresh', '3', '2018-02-07', '2018-02-11', 0, 'WM', 'Logan', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$d3CN1mD.$V0kebc3dl4lerOjog9VVR.', '2018-02-14 21:22:19'),
(17, 2, 'aaaLaogan', 'Refresh', '3', '2018-02-07', '2018-02-11', 0, 'WM', 'Logan', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$d3CN1mD.$V0kebc3dl4lerOjog9VVR.', '2018-02-14 21:25:27'),
(18, 2, 'aaaLaogan', 'Refresh', '3', '2018-02-07', '2018-02-11', 0, 'WM', 'Shameem', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$pAVxhSmc$5tvNbHwSDfEK1/pv8RaI30', '2018-02-14 22:44:43'),
(19, 2, '01_000_PNG', 'Refresh', '3', '2018-02-07', '2018-02-11', NULL, 'WM', 'BILL', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$j1.AXhn7$n/Mt5OpsXXRXFR1qA6GaQ.', '2018-02-14 22:48:18'),
(20, 2, 'aaaLaogan', 'Refresh', '3', '2018-02-07', '2018-02-11', 5, 'WM', 'Shameem', NULL, '24.00', NULL, NULL, NULL, '0000-00-00', '0000-00-00', NULL, '$1$26lLkagn$jIy./qWWU8Mge30Pr90yv.', '2018-02-20 19:24:22');

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE `userprofile` (
  `UID` int(11) NOT NULL,
  `EMP_ID` varchar(20) NOT NULL,
  `PASSWORD` char(255) NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  `LNAME` varchar(20) NOT NULL,
  `GENDER` char(7) NOT NULL,
  `DOB` date NOT NULL,
  `DOJ` date NOT NULL,
  `EMAIL_ID` varchar(100) NOT NULL,
  `DESIGNATION` varchar(40) NOT NULL,
  `TEAM` varchar(40) NOT NULL,
  `DEPT` varchar(40) DEFAULT NULL,
  `DIVISION` varchar(40) NOT NULL,
  `CONTACT_NO` varchar(14) NOT NULL,
  `EMERGENCY_CONTACT_NO` varchar(14) NOT NULL,
  `ROLE` int(3) NOT NULL,
  `PROFILE_PIC` varchar(100) DEFAULT NULL,
  `TOKEN_ID` varchar(255) DEFAULT NULL,
  `LAST_SEEN` datetime DEFAULT NULL,
  `SHIFT_TYPE` varchar(5) DEFAULT NULL,
  `expired_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`UID`, `EMP_ID`, `PASSWORD`, `FNAME`, `LNAME`, `GENDER`, `DOB`, `DOJ`, `EMAIL_ID`, `DESIGNATION`, `TEAM`, `DEPT`, `DIVISION`, `CONTACT_NO`, `EMERGENCY_CONTACT_NO`, `ROLE`, `PROFILE_PIC`, `TOKEN_ID`, `LAST_SEEN`, `SHIFT_TYPE`, `expired_at`, `updated_at`) VALUES
(1, 'IN002', '$1$qp88ToDi$is6qgzM6vdSZNk.xal4qj/', 'Sathish Kumar', 'Krishnamoorthy', 'Male', '1991-06-27', '2016-09-26', 'sathish.krishnamoorthy@borngroup.com', 'Front End Developer', 'Triad', 'FED', 'Digital', '8056220084', '8056220084', 2, NULL, '$1$69pufmP6$vWQs4I..5om0lg776T22v1', '2018-02-28 01:22:04', 'PST', '2018-02-28 13:22:06', '2018-02-28 01:22:06'),
(2, 'IN001', '$1$qp88ToDi$is6qgzM6vdSZNk.xal4qj/', 'Admin', 'Test', 'Male', '1991-02-05', '2018-02-01', 'admin@borngroup.com', 'Project manager', 'Triad', 'Fed', 'Digital', '9999900000', '9999900000', 0, NULL, '$1$47FJoNqI$Azf4T6aUg6Tf0GzDraUPi0', '2018-02-27 23:15:24', 'EST', '2018-02-28 11:15:24', '2018-02-27 07:42:25'),
(3, 'IN004', '$1$qp88ToDi$is6qgzM6vdSZNk.xal4qj/', 'Sample', 'Lname', '', '0000-00-00', '0000-00-00', '', '', '', NULL, '', '', '', 0, NULL, NULL, NULL, NULL, '2018-02-27 23:53:12', '2018-02-27 23:53:12'),
(5, 'IN857', '$1$qp88ToDi$is6qgzM6vdSZNk.xal4qj/', 'SathishK', 'Lname', 'Male', '1991-06-27', '1991-06-27', '', 'Employee', 'Triad', NULL, '', '1', '', 0, NULL, '$1$WQDOEf2T$pSj64kGakD4zsEmE5FpNc1', '2018-02-28 01:24:44', NULL, '2018-02-28 13:30:43', '2018-02-28 01:30:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD PRIMARY KEY (`UID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `userprofile`
--
ALTER TABLE `userprofile`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
