-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 21, 2022 at 02:43 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employeeleavedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(55) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `fullname`, `email`, `updationDate`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'Walid Ben Janet', 'admin@mail.com', '2022-05-26 18:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomClasse` varchar(200) DEFAULT NULL,
  `Description` mediumtext,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`id`, `NomClasse`, `Description`, `CreationDate`) VALUES
(15, 'DSI23', 'Development Service Informatique', '2022-05-25 19:17:03'),
(16, 'TI', '1 ERE', '2022-05-25 20:07:52'),
(18, '2MDW', 'MUTLTIMEDIA', '2022-05-25 20:21:04'),
(19, 'RSI', 'REASEAUX', '2022-05-26 08:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomClub` varchar(200) DEFAULT NULL,
  `Description` mediumtext,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`id`, `NomClub`, `Description`, `CreationDate`) VALUES
(20, 'Tech-Orange', 'Orange tech club', '2022-05-27 10:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomMatiere` varchar(25) DEFAULT NULL,
  `Description` mediumtext,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matiere`
--

INSERT INTO `matiere` (`id`, `NomMatiere`, `Description`, `CreationDate`) VALUES
(2, 'POO', 'Programation orienté object', '2020-11-06 13:16:09'),
(7, 'Angular', 'Framework', '2021-03-03 10:48:37'),
(14, '2D Graphic', 'Graphic 2D', '2022-05-25 19:43:39'),
(18, 'PHP', 'Developpement Coté serveur', '2022-05-26 22:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `rattrapage`
--

DROP TABLE IF EXISTS `rattrapage`;
CREATE TABLE IF NOT EXISTS `rattrapage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomMatiere` varchar(200) DEFAULT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` mediumtext,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `NomClasse` varchar(200) DEFAULT NULL,
  `NomSalle` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserEmail` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rattrapage`
--

INSERT INTO `rattrapage` (`id`, `NomMatiere`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `AdminRemarkDate`, `Status`, `IsRead`, `empid`, `NomClasse`, `NomSalle`) VALUES
(42, '2D Graphic', '2020-03-05', '2020-03-12', 'hhhhhhhhhhhhhhhhhhhhhhhhhhnhhhhhhhhhhhhhhhhhhhhhhhhhh', '2022-05-26 11:00:55', 'hhhhhhhhhhhhhhhhhhhhhh', '2022-05-26 21:26:29 ', 1, 1, 9, '2MDW', 'A1'),
(46, 'POO', '2020-03-05', '2020-03-05', 'maladie', '2022-05-26 20:01:30', 'ACCEPTé', '2022-05-27 1:32:45 ', 1, 1, 9, 'DSI23', 'A002'),
(47, 'POO', '2020-03-06', '2020-03-13', 'i9bel ya walid', '2022-05-27 08:30:37', 'NON', '2022-05-27 14:07:28 ', 2, 1, 9, 'DSI23', ''),
(48, 'POO', '2020-03-05', '2020-03-05', 'AAA\r\n', '2022-05-28 10:13:59', NULL, NULL, 0, 1, 9, 'DSI23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservationprojecteur`
--

DROP TABLE IF EXISTS `reservationprojecteur`;
CREATE TABLE IF NOT EXISTS `reservationprojecteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomMatiere` varchar(200) DEFAULT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `NomClasse` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserEmail` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservationprojecteur`
--

INSERT INTO `reservationprojecteur` (`id`, `NomMatiere`, `ToDate`, `FromDate`, `PostingDate`, `AdminRemarkDate`, `Status`, `IsRead`, `empid`, `NomClasse`) VALUES
(49, 'POO', '2020-03-05', '2020-03-12', '2022-05-28 10:58:15', '2022-05-28 16:35:08 ', 1, 1, 9, 'DSI23'),
(50, 'Angular', '2020-03-12', '2020-04-02', '2022-05-28 11:14:36', '2022-05-28 16:45:01 ', 2, 1, 9, 'TI'),
(51, '2D Graphic', '2020-03-05', '2020-03-05', '2022-05-28 12:17:31', '2022-05-28 17:51:55 ', 1, 1, 9, 'TI'),
(52, 'POO', '2020-03-19', '2020-04-02', '2022-05-28 12:34:29', NULL, 0, 1, 9, 'RSI'),
(53, 'POO', '2020-03-13', '2020-03-26', '2022-06-08 11:25:47', NULL, 0, 1, 9, 'DSI23');

-- --------------------------------------------------------

--
-- Table structure for table `reservationtp`
--

DROP TABLE IF EXISTS `reservationtp`;
CREATE TABLE IF NOT EXISTS `reservationtp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomClub` varchar(200) DEFAULT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserEmail` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservationtp`
--

INSERT INTO `reservationtp` (`id`, `NomClub`, `Description`, `PostingDate`, `AdminRemarkDate`, `Status`, `IsRead`, `empid`) VALUES
(48, 'Tech-Orange', 'hello', '2022-05-28 09:28:51', NULL, 1, 1, 9),
(49, 'Tech-Orange', 'aaa', '2022-05-28 09:35:17', '2022-05-28 18:25:00 ', 2, 1, 9),
(51, 'Tech-Orange', 'aaa', '2022-05-28 12:58:18', NULL, 0, 1, 9),
(52, 'Tech-Orange', 'TEST', '2022-06-06 10:46:24', NULL, 0, 0, 9),
(53, 'Tech-Orange', 'AAA', '2022-06-08 11:23:56', NULL, 0, 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomSalle` varchar(200) DEFAULT NULL,
  `Description` mediumtext,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`id`, `NomSalle`, `Description`, `CreationDate`) VALUES
(20, 'A002', 'Nord de l\'institute', '2022-05-26 17:42:10'),
(21, 'A001', 'Nord de l\'institude', '2022-05-26 18:09:37'),
(22, 'A003', 'Nord Du l\'institue ', '2022-05-26 22:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

DROP TABLE IF EXISTS `tbldepartments`;
CREATE TABLE IF NOT EXISTS `tbldepartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `DepartmentCode` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `DepartmentCode`, `CreationDate`) VALUES
(2, 'Technologue', 'IT', 'IT807', '2020-11-01 07:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

DROP TABLE IF EXISTS `tblemployees`;
CREATE TABLE IF NOT EXISTS `tblemployees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EmpId` varchar(100) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Country` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`id`, `EmpId`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `City`, `Country`, `Phonenumber`, `Status`, `RegDate`) VALUES
(9, 'AH', 'ahmed', 'ahmed', 'ahmed@gmail.com', '202cb962ac59075b964b07152d234b70', 'Male', '2022-05-17', 'Information Technology', 'OFF', 'OFF', 'TUNISIA', '111', 1, '2022-05-18 19:07:29'),
(13, 'ch', 'chourouk', 'chourouk', 'chourouk@gmail.com', '202cb962ac59075b964b07152d234b70', 'Other', '2022-05-19', 'Technologue', '123', '123', '123', '123', 1, '2022-05-28 14:52:46');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
