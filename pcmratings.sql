-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 27, 2015 at 03:07 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pcmratings`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE IF NOT EXISTS `games` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` longtext NOT NULL,
  `description` longtext NOT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `developer_id` bigint(20) DEFAULT NULL,
  `port` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `developer_id` (`developer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `title`, `description`, `publisher_id`, `developer_id`, `port`) VALUES
(1, 'TEST', '', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `game_links`
--

CREATE TABLE IF NOT EXISTS `game_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL,
  `game_link_type_id` bigint(20) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `game_link_type_id` (`game_link_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `game_link_types`
--

CREATE TABLE IF NOT EXISTS `game_link_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` longtext NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `datetime` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `text` text NOT NULL,
  `tags` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating_categories`
--

CREATE TABLE IF NOT EXISTS `rating_categories` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` longtext NOT NULL,
  `weight` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating_category_options`
--

CREATE TABLE IF NOT EXISTS `rating_category_options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rating_category_id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rating_category_id` (`rating_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating_category_values`
--

CREATE TABLE IF NOT EXISTS `rating_category_values` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rating_header_id` bigint(20) NOT NULL,
  `rating_category_id` bigint(20) NOT NULL,
  `value` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `review` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ratings_header_id` (`rating_header_id`),
  KEY `rating_category_id` (`rating_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating_headers`
--

CREATE TABLE IF NOT EXISTS `rating_headers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `rig_id` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `upvotes` bigint(20) NOT NULL,
  `downvotes` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`),
  KEY `rig_id` (`rig_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rigs`
--

CREATE TABLE IF NOT EXISTS `rigs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rig_attributes`
--

CREATE TABLE IF NOT EXISTS `rig_attributes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rig_attribute_values`
--

CREATE TABLE IF NOT EXISTS `rig_attribute_values` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rig_id` bigint(20) NOT NULL,
  `rig_attribute_id` bigint(20) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rig_id` (`rig_id`),
  KEY `rig_attribute_id` (`rig_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_attributes`
--

CREATE TABLE IF NOT EXISTS `user_attributes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_attribute_values`
--

CREATE TABLE IF NOT EXISTS `user_attribute_values` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_attribute_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_attribute_id` (`user_attribute_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_weights`
--

CREATE TABLE IF NOT EXISTS `user_weights` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rating_category_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_id` (`rating_category_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_2` FOREIGN KEY (`developer_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `game_links`
--
ALTER TABLE `game_links`
  ADD CONSTRAINT `game_links_ibfk_2` FOREIGN KEY (`game_link_type_id`) REFERENCES `game_link_types` (`id`),
  ADD CONSTRAINT `game_links_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `rating_category_options`
--
ALTER TABLE `rating_category_options`
  ADD CONSTRAINT `rating_category_options_ibfk_1` FOREIGN KEY (`rating_category_id`) REFERENCES `rating_categories` (`ID`);

--
-- Constraints for table `rating_category_values`
--
ALTER TABLE `rating_category_values`
  ADD CONSTRAINT `rating_category_values_ibfk_1` FOREIGN KEY (`rating_header_id`) REFERENCES `rating_headers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_category_values_ibfk_2` FOREIGN KEY (`rating_category_id`) REFERENCES `rating_categories` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_headers`
--
ALTER TABLE `rating_headers`
  ADD CONSTRAINT `rating_headers_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `rating_headers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `rating_headers_ibfk_3` FOREIGN KEY (`rig_id`) REFERENCES `rigs` (`id`);

--
-- Constraints for table `rigs`
--
ALTER TABLE `rigs`
  ADD CONSTRAINT `rigs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `rig_attribute_values`
--
ALTER TABLE `rig_attribute_values`
  ADD CONSTRAINT `rig_attribute_values_ibfk_2` FOREIGN KEY (`rig_attribute_id`) REFERENCES `rig_attributes` (`id`),
  ADD CONSTRAINT `rig_attribute_values_ibfk_1` FOREIGN KEY (`rig_id`) REFERENCES `rigs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_attribute_values`
--
ALTER TABLE `user_attribute_values`
  ADD CONSTRAINT `user_attribute_values_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_attribute_values_ibfk_1` FOREIGN KEY (`user_attribute_id`) REFERENCES `user_attributes` (`id`);

--
-- Constraints for table `user_weights`
--
ALTER TABLE `user_weights`
  ADD CONSTRAINT `user_weights_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_weights_ibfk_1` FOREIGN KEY (`rating_category_id`) REFERENCES `rating_categories` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
