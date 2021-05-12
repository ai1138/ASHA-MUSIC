-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 12, 2021 at 06:16 AM
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
-- Database: `asha`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `album_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `artist_id` int(255) NOT NULL,
  `release_date` date NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `artist_id` (`artist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`album_id`, `name`, `artist_id`, `release_date`) VALUES
(3, 'Growing Pains Vol. 1', 5, '2020-10-24');

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE IF NOT EXISTS `artist` (
  `artist_id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `artist_name`, `first_name`, `last_name`, `email`, `password`, `date_of_birth`) VALUES
(5, 'Abed Islam', 'Abed', 'Islam', 'utshob5@gmail.com', 'sheikaisgreat', '2021-05-04'),
(6, 'MC Haq', 'Afnan', 'Haq', 'afanhaq@gmail.com', 'afnanisgreat', '2000-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `listener`
--

DROP TABLE IF EXISTS `listener`;
CREATE TABLE IF NOT EXISTS `listener` (
  `listener_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`listener_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `listener`
--

INSERT INTO `listener` (`listener_id`, `first_name`, `last_name`, `email`, `password`, `date_of_birth`) VALUES
(1, 'Sheika ', 'Islam', 'si965@nyu.edu', 'ilubismail', '2020-10-01'),
(2, 'Afnan', 'Haq', 'afanhaq@gmail.com', 'afnanisgreat', '2000-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
CREATE TABLE IF NOT EXISTS `playlist` (
  `playlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `listener_id` int(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `listener_id` (`listener_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `playlist_song`
--

DROP TABLE IF EXISTS `playlist_song`;
CREATE TABLE IF NOT EXISTS `playlist_song` (
  `playlist_song_id` int(11) NOT NULL AUTO_INCREMENT,
  `song_id` int(255) NOT NULL,
  `playlist_id` int(255) NOT NULL,
  PRIMARY KEY (`playlist_song_id`),
  KEY `song_id` (`song_id`),
  KEY `playlist_id` (`playlist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
CREATE TABLE IF NOT EXISTS `song` (
  `song_id` int(11) NOT NULL AUTO_INCREMENT,
  `song_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `artist_id` varchar(255) NOT NULL,
  `album_id` varchar(255) NOT NULL,
  `release date` date NOT NULL,
  `image_name` varchar(255) NOT NULL,
  PRIMARY KEY (`song_id`),
  KEY `artist_id` (`artist_id`),
  KEY `album_id` (`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
