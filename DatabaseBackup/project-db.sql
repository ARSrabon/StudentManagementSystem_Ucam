-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2016 at 04:09 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `project-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE IF NOT EXISTS `authorities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `authority_lvl` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`id`, `user_id`, `authority_lvl`) VALUES
(1, 8, 99);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `credit` float NOT NULL,
  `dept_id` int(11) NOT NULL,
  `offered_semester` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `code`, `title`, `credit`, `dept_id`, `offered_semester`) VALUES
(31, 'ENG 005', 'Spoken English', 3, 1, 1),
(33, 'ENG 101', 'English I ', 3, 1, 1),
(34, 'MATH 003', 'Elementary Calculus ', 3, 1, 1),
(35, 'CSI 121', 'Structured Programming Language', 3, 1, 1),
(36, 'CSI 122', 'Structured Programming Language Lab', 1, 1, 1),
(37, 'CSI 219', 'Discrete Mathematics ', 3, 1, 2),
(38, 'CSI 124', 'Advanced Programming Lab', 1, 1, 2),
(39, 'MATH 151', 'Differential and Integral Calculus', 3, 1, 2),
(40, 'CSE 226', 'Digital Logic Design', 1, 1, 2),
(41, 'PHY 105', 'Physics', 3, 1, 3),
(42, 'PHY 106', 'Physics Lab ', 1, 1, 3),
(43, 'CSI 217', 'Data Structure ', 3, 1, 3),
(44, 'CSI 218', 'Data Structure Lab', 1, 1, 3),
(45, 'CSE 113', 'Electrical Circuits ', 3, 1, 3),
(46, 'CSI 227', 'Algorithms', 3, 1, 4),
(47, 'CSI 228', 'Algorithms Lab ', 1, 1, 4),
(48, 'MATH 187', 'Fourier and Laplace', 3, 1, 4),
(49, 'CSE 124', 'Electronics Lab ', 1, 1, 4),
(50, 'CSI 229', 'Numerical Methods ', 3, 1, 4),
(51, 'CSI 211', 'Object Oriented Programming', 3, 1, 5),
(52, 'CSI 212', 'Object Oriented Programming', 1, 1, 5),
(53, 'CSE 313', 'Computer Architecture ', 3, 1, 5),
(54, 'CSI 233', 'Theory of Computing', 3, 1, 5),
(55, 'CSE 236', 'Assembly Programming Lab', 1, 1, 5),
(56, 'CSI 309', 'Operating System Concepts', 3, 1, 5),
(57, 'CSI 310', 'Operating System Concepts Lab', 1, 1, 1),
(58, 'CSE 315', 'Data Communication ', 3, 1, 1),
(59, 'CSI 221', 'Database Management Systems', 3, 1, 1),
(60, 'CSI 222', 'Database Management Systems Lab', 1, 1, 1),
(61, 'STAT 205', 'Probability and Statistics', 3, 1, 1),
(62, 'CSI 411', 'Compiler', 3, 1, 1),
(63, 'CSE 323', 'Computer Networks ', 3, 1, 1),
(64, 'CSE 324', 'Computer Networks Lab', 1, 1, 1),
(65, 'CSI 311', 'System Analysis and Design', 3, 1, 1),
(66, 'CSI 312', 'System Analysis and Design Lab', 1, 1, 1),
(67, 'CSI 341', 'Artificial Intelligence ', 3, 1, 1),
(68, 'CSI 342', 'Artificial Intelligence Lab', 1, 1, 1),
(69, 'CSE 426', 'Microprocessor, Microcontroller and Interfacing La', 1, 1, 1),
(70, 'CSI 321', 'Software Engineering ', 3, 1, 1),
(71, 'CSI 322', 'Software Engineering Lab', 1, 1, 1),
(72, 'CSE 400', 'Thesis / Project', 2, 1, 1),
(73, 'CSE 430', 'Digital System Design Lab', 1, 1, 1),
(74, 'CSE 400', 'Project / Thesis', 2, 1, 1),
(75, 'CSI 415', 'Pattern Recognition ', 3, 1, 1),
(76, 'CSI 416', 'Pattern Recognition Lab', 1, 1, 1),
(77, 'CSI 421', 'Computer Graphics ', 3, 1, 1),
(78, 'CSI 422', 'Computer Graphics Lab', 1, 1, 1),
(79, 'CSI 423', 'Simulation & Modeling', 3, 1, 1),
(80, 'CSI 424', 'Simulation & Modeling Lab', 1, 1, 1),
(81, 'CSI 448', 'Multimedia Systems Design Lab', 1, 1, 1),
(82, 'CSE 427', 'VLSI Design ', 3, 1, 1),
(83, 'CSE 428', 'VLSI Design Lab', 1, 1, 1),
(84, 'CSE 471', 'Advanced Object Oriented Programming', 3, 1, 1),
(85, 'CSE 453', 'Optical Fiber Communication', 3, 1, 1),
(86, 'CSE 457', 'Mobile Cellular Communication', 3, 1, 1),
(87, 'CSE 461', 'Wireless Communication ', 3, 1, 1),
(88, 'CSE 463', 'E-Commerce', 3, 1, 1),
(89, 'CSE 467', 'Advanced DBMS ', 3, 1, 1),
(90, 'CSE 469', 'Project Management ', 3, 1, 1),
(91, 'CSE 473', 'Advanced Network Services', 3, 1, 1),
(92, 'CSE 477', 'Network Security ', 3, 1, 1),
(93, 'CSE 481', 'Mobile Application Development', 3, 1, 1),
(94, 'CSE 487', 'Cloud Computing ', 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `code`, `title`) VALUES
(1, 'CSE', 'Computer Science And Engineering'),
(2, 'EEE', 'Electrical Electronics Engineering'),
(3, 'BBA', 'Bachelor of Business Administration');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE IF NOT EXISTS `designations` (
  `id` int(11) NOT NULL,
  `designation` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `designation`) VALUES
(1, 'Professor emeritus'),
(2, 'Professor'),
(3, 'Associate professor'),
(4, 'Assistant professor'),
(5, 'Lecturer'),
(6, 'Assistant Lecturer'),
(7, 'Instructor');

-- --------------------------------------------------------

--
-- Table structure for table `drop_courses`
--

CREATE TABLE IF NOT EXISTS `drop_courses` (
  `id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approval_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE IF NOT EXISTS `faculties` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `join_date` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `user_id`, `dept_id`, `designation_id`, `join_date`) VALUES
(4, 25, 1, 5, 0),
(5, 27, 1, 5, 0),
(6, 28, 3, 5, 0),
(7, 29, 2, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `offered_courses`
--

CREATE TABLE IF NOT EXISTS `offered_courses` (
  `id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `section` varchar(3) NOT NULL,
  `room_timeslot_id` int(11) NOT NULL,
  `student_capacity` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offered_courses`
--

INSERT INTO `offered_courses` (`id`, `semester_id`, `course_id`, `faculty_id`, `section`, `room_timeslot_id`, `student_capacity`) VALUES
(1, 1, 31, 4, 'A', 1, 30),
(2, 1, 33, 4, 'A', 2, 30),
(3, 1, 34, 4, 'A', 5, 30),
(4, 3, 35, 5, 'A', 7, 30),
(5, 3, 36, 5, 'A', 6, 30),
(6, 3, 37, 7, 'A', 4, 20),
(7, 3, 38, 7, 'B', 5, 30);

-- --------------------------------------------------------

--
-- Table structure for table `prerequisit_courses`
--

CREATE TABLE IF NOT EXISTS `prerequisit_courses` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `prerequisit_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prerequisit_courses`
--

INSERT INTO `prerequisit_courses` (`id`, `course_id`, `prerequisit_id`) VALUES
(1, 33, 31),
(2, 38, 36),
(6, 39, 34),
(3, 46, 43),
(4, 47, 44),
(5, 48, 34);

-- --------------------------------------------------------

--
-- Table structure for table `registration_result`
--

CREATE TABLE IF NOT EXISTS `registration_result` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `offered_course_id` int(11) NOT NULL,
  `result` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration_result`
--

INSERT INTO `registration_result` (`id`, `student_id`, `offered_course_id`, `result`) VALUES
(1, 18, 1, 3),
(2, 18, 2, 2.66),
(3, 18, 3, 3.33),
(4, 17, 4, 0),
(5, 17, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_timeslots`
--

CREATE TABLE IF NOT EXISTS `room_timeslots` (
  `id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `day_1` varchar(4) NOT NULL,
  `day_2` varchar(4) NOT NULL,
  `timeslot` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_timeslots`
--

INSERT INTO `room_timeslots` (`id`, `room_no`, `day_1`, `day_2`, `timeslot`) VALUES
(1, 105, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(2, 105, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(3, 105, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(4, 105, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(5, 105, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(6, 105, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(7, 105, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(96, 106, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(97, 106, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(98, 106, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(99, 106, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(100, 106, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(101, 106, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(102, 106, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(103, 107, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(104, 107, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(105, 107, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(106, 107, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(107, 107, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(108, 107, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(109, 107, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(110, 108, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(111, 108, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(112, 108, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(113, 108, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(114, 108, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(115, 108, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(116, 108, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(117, 109, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(118, 109, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(119, 109, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(120, 109, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(121, 109, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(122, 109, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(123, 109, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(124, 110, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(125, 110, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(126, 110, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(127, 110, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(128, 110, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(129, 110, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(130, 110, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(131, 111, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(132, 111, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(133, 111, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(134, 111, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(135, 111, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(136, 111, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(137, 111, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(138, 112, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(139, 112, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(140, 112, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(141, 112, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(142, 112, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(143, 112, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(144, 112, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(145, 113, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(146, 113, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(147, 113, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(148, 113, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(149, 113, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(150, 113, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(151, 113, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(152, 114, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(153, 114, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(154, 114, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(155, 114, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(156, 114, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(157, 114, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(158, 114, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(159, 115, 'sun', 'tue', '11:20 AM - 12:40 PM'),
(160, 115, 'sun', 'tue', '8:30 AM - 9:50 AM'),
(161, 115, 'sun', 'tue', '9:55 AM - 11:15 AM'),
(162, 115, 'sun', 'tue', '12:45 PM - 2:05 PM'),
(163, 115, 'sun', 'tue', '2:10 PM - 3:30 PM'),
(164, 115, 'sun', 'tue', '3:35 PM - 4:55 PM'),
(165, 115, 'sun', 'tue', '5:00 PM - 6:20 PM'),
(166, 105, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(167, 105, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(168, 105, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(169, 105, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(170, 105, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(171, 105, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(172, 105, 'MON', 'WED', '5:00 PM - 6:20 PM'),
(173, 106, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(174, 106, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(175, 106, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(176, 106, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(177, 106, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(178, 106, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(179, 106, 'MON', 'WED', '5:00 PM - 6:20 PM'),
(180, 107, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(181, 107, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(182, 107, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(183, 107, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(184, 107, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(185, 107, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(186, 107, 'MON', 'WED', '5:00 PM - 6:20 PM'),
(187, 108, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(188, 108, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(189, 108, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(190, 108, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(191, 108, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(192, 108, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(193, 108, 'MON', 'WED', '5:00 PM - 6:20 PM'),
(194, 109, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(195, 109, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(196, 109, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(197, 109, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(198, 109, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(199, 109, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(200, 109, 'MON', 'WED', '5:00 PM - 6:20 PM'),
(201, 110, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(202, 110, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(203, 110, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(204, 110, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(205, 110, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(206, 110, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(207, 110, 'MON', 'WED', '5:00 PM - 6:20 PM'),
(208, 111, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(209, 111, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(210, 111, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(211, 111, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(212, 111, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(213, 111, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(214, 111, 'MON', 'WED', '5:00 PM - 6:20 PM'),
(215, 112, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(216, 112, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(217, 112, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(218, 112, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(219, 112, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(220, 112, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(221, 112, 'MON', 'WED', '5:00 PM - 6:20 PM'),
(222, 113, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(223, 113, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(224, 113, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(225, 113, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(226, 113, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(227, 113, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(228, 113, 'MON', 'WED', '5:00 PM - 6:20 PM'),
(229, 114, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(230, 114, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(231, 114, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(232, 114, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(233, 114, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(234, 114, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(235, 114, 'MON', 'WED', '5:00 PM - 6:20 PM'),
(236, 115, 'MON', 'WED', '11:20 AM - 12:40 PM'),
(237, 115, 'MON', 'WED', '8:30 AM - 9:50 AM'),
(238, 115, 'MON', 'WED', '9:55 AM - 11:15 AM'),
(239, 115, 'MON', 'WED', '12:45 PM - 2:05 PM'),
(240, 115, 'MON', 'WED', '2:10 PM - 3:30 PM'),
(241, 115, 'MON', 'WED', '3:35 PM - 4:55 PM'),
(242, 115, 'MON', 'WED', '5:00 PM - 6:20 PM');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE IF NOT EXISTS `semesters` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `code`, `name`, `status`) VALUES
(1, 'spring-161', 'Spring - 2016', 0),
(2, 'Summer-162', 'Summer-2016', 1),
(3, 'Fall-163', 'Fall-2016', 2);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `cgpa` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `student_id`, `dept_id`, `cgpa`) VALUES
(17, 24, 33, 1, 0),
(18, 26, 11123034, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `password`) VALUES
(8, 'cyborn', '13x', 'cyborn13x@gmail.com', 'cyborn13x', '1234'),
(24, '33', '33', '33@gg.hh', '33', '33'),
(25, '44', '44', '44@gg.hh', '44', '44'),
(26, 'Md. Abu Raihan', 'Srabon', 'm.arsrabon@gmail.com', 'msrabon', '1234'),
(27, 'Abir', 'Hossain', 'abirh@gmail.com', 'abirh', '1234'),
(28, 'Mirza ', 'Galib', 'mgalib@gmail.com', 'mgalib', '1234'),
(29, 'Tuhin', 'Miah', 'tuhin@live.com', 'tuhin', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`,`dept_id`), ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drop_courses`
--
ALTER TABLE `drop_courses`
  ADD PRIMARY KEY (`id`,`registration_id`,`approval_id`), ADD KEY `registration_id` (`registration_id`), ADD KEY `approval_id` (`approval_id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`,`dept_id`,`designation_id`), ADD UNIQUE KEY `user_id` (`user_id`), ADD KEY `designation_id` (`designation_id`), ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `offered_courses`
--
ALTER TABLE `offered_courses`
  ADD PRIMARY KEY (`id`,`semester_id`,`course_id`,`room_timeslot_id`,`faculty_id`), ADD KEY `faculty_id` (`faculty_id`), ADD KEY `semester_id` (`semester_id`), ADD KEY `course_id` (`course_id`), ADD KEY `room_timeslot_id` (`room_timeslot_id`);

--
-- Indexes for table `prerequisit_courses`
--
ALTER TABLE `prerequisit_courses`
  ADD PRIMARY KEY (`id`,`course_id`,`prerequisit_id`), ADD KEY `course_id` (`course_id`), ADD KEY `prerequisit_id` (`prerequisit_id`);

--
-- Indexes for table `registration_result`
--
ALTER TABLE `registration_result`
  ADD PRIMARY KEY (`id`,`student_id`,`offered_course_id`), ADD KEY `student_id` (`student_id`), ADD KEY `offered_course_id` (`offered_course_id`);

--
-- Indexes for table `room_timeslots`
--
ALTER TABLE `room_timeslots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`,`dept_id`) USING BTREE, ADD UNIQUE KEY `student_id` (`student_id`), ADD UNIQUE KEY `user_id` (`user_id`), ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorities`
--
ALTER TABLE `authorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `drop_courses`
--
ALTER TABLE `drop_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `offered_courses`
--
ALTER TABLE `offered_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `prerequisit_courses`
--
ALTER TABLE `prerequisit_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `registration_result`
--
ALTER TABLE `registration_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `room_timeslots`
--
ALTER TABLE `room_timeslots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=243;
--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
ADD CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `drop_courses`
--
ALTER TABLE `drop_courses`
ADD CONSTRAINT `drop_courses_ibfk_1` FOREIGN KEY (`registration_id`) REFERENCES `registration_result` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `drop_courses_ibfk_2` FOREIGN KEY (`approval_id`) REFERENCES `authorities` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `faculties`
--
ALTER TABLE `faculties`
ADD CONSTRAINT `faculties_ibfk_1` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON UPDATE NO ACTION,
ADD CONSTRAINT `faculties_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `faculties_ibfk_3` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `offered_courses`
--
ALTER TABLE `offered_courses`
ADD CONSTRAINT `offered_courses_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `offered_courses_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `offered_courses_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `offered_courses_ibfk_5` FOREIGN KEY (`room_timeslot_id`) REFERENCES `room_timeslots` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `prerequisit_courses`
--
ALTER TABLE `prerequisit_courses`
ADD CONSTRAINT `prerequisit_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `prerequisit_courses_ibfk_2` FOREIGN KEY (`prerequisit_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `registration_result`
--
ALTER TABLE `registration_result`
ADD CONSTRAINT `registration_result_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `registration_result_ibfk_2` FOREIGN KEY (`offered_course_id`) REFERENCES `offered_courses` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
