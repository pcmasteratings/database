-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 06, 2015 at 03:06 PM
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

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `description` longtext NOT NULL,
  `bg_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `bg_id` (`bg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` longtext NOT NULL,
  `description` longtext NOT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `developer_id` bigint(20) DEFAULT NULL,
  `gb_id` bigint(20) NOT NULL,
  `gb_url` text NOT NULL,
  `gb_image` text NOT NULL,
  `gb_thumb` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `bg_id` (`gb_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `developer_id` (`developer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `name`, `title`, `description`, `publisher_id`, `developer_id`, `gb_id`, `gb_url`, `gb_image`, `gb_thumb`) VALUES
(79, 'deus_ex', 'Deus Ex', '', NULL, NULL, 0, '', 'http://static.giantbomb.com/uploads/scale_medium/0/5480/608405-dxcover_1.jpg', 'http://static.giantbomb.com/uploads/screen_medium/0/5480/608405-dxcover_1.jpg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `game_category_ratings`
--
DROP VIEW IF EXISTS `game_category_ratings`;
CREATE TABLE IF NOT EXISTS `game_category_ratings` (
`id` bigint(20)
,`name` varchar(255)
,`platform` varchar(255)
,`rating_category_id` bigint(20)
,`rating` decimal(11,0)
,`rating_description` longtext
);
-- --------------------------------------------------------

--
-- Table structure for table `game_links`
--

DROP TABLE IF EXISTS `game_links`;
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

DROP TABLE IF EXISTS `game_link_types`;
CREATE TABLE IF NOT EXISTS `game_link_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` longtext NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `game_platforms`
--

DROP TABLE IF EXISTS `game_platforms`;
CREATE TABLE IF NOT EXISTS `game_platforms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `description` mediumtext NOT NULL,
  `gb_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gb_id` (`gb_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `game_platforms`
--

INSERT INTO `game_platforms` (`id`, `name`, `title`, `description`, `gb_id`) VALUES
(3, 'windows', 'Windows', 'Windows', 1),
(4, 'linux', 'Linux', 'Linux', 2),
(5, 'mac', 'Mac', 'Mac', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `game_ratings`
--
DROP VIEW IF EXISTS `game_ratings`;
CREATE TABLE IF NOT EXISTS `game_ratings` (
`id` bigint(20)
,`name` varchar(255)
,`platform` varchar(255)
,`rating_count` bigint(21)
,`score` decimal(14,4)
,`rating` varchar(1)
);
-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `datetime` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `content` text NOT NULL,
  `tags` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initial` char(1) NOT NULL,
  `title` text NOT NULL,
  `description` longtext NOT NULL,
  `threshold` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `initial` (`initial`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `initial`, `title`, `description`, `threshold`) VALUES
(1, 'p', 'Peasantry', 'Peasantry', 0),
(2, 'c', 'Compromised', 'Compromised', 40),
(3, 'm', 'Mediocre', 'Mediocre', 60),
(4, 'r', 'Righteous', 'Righteous', 80),
(5, 'g', 'Glorious', 'Glorious', 100);

-- --------------------------------------------------------

--
-- Table structure for table `rating_categories`
--

DROP TABLE IF EXISTS `rating_categories`;
CREATE TABLE IF NOT EXISTS `rating_categories` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` longtext NOT NULL,
  `weight` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `rating_categories`
--

INSERT INTO `rating_categories` (`ID`, `title`, `description`, `weight`, `sequence`) VALUES
(1, 'Frame rate', '', 4, 1),
(2, 'Resolution', '', 3, 2),
(3, 'Mod support', '', 3, 3),
(4, 'Online (multiplayer games)', '', 5, 4),
(5, 'Bugs and glitches', '', 7, 5),
(6, 'Settings', '', 6, 6),
(7, 'Controls', '', 7, 7),
(8, 'Hardware support', '', 5, 8),
(9, 'DRM', '', 5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `rating_category_options`
--

DROP TABLE IF EXISTS `rating_category_options`;
CREATE TABLE IF NOT EXISTS `rating_category_options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rating_category_id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rating_category_id` (`rating_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `rating_category_options`
--

INSERT INTO `rating_category_options` (`id`, `rating_category_id`, `description`, `value`) VALUES
(1, 1, 'Capped at 30FPS, frequent major FPS drops, tied to physics (i.e. changing frame rate changes game speed too)', 0),
(2, 1, 'Capped at 30FPS, frequent minor FPS drops, tied to physics (i.e. changing frame rate changes game speed too)', 1),
(3, 1, 'Capped at 60FPS, mostly stable\r\n', 2),
(4, 1, 'Capped at 120FPS\r\n', 3),
(5, 1, 'Limitless', 4),
(6, 2, 'Does not support 1080p\r\n', 0),
(7, 2, 'Supports up to 1080p\r\n', 1),
(8, 2, 'Supports up to 1440p\r\n', 2),
(9, 2, 'Supports up to 1440p, multi-monitor support through workaround\r\n', 3),
(10, 2, 'Limitless resolution, easy multi-monitor support, VR, DSR/VSR\r\n', 4),
(11, 3, 'Not moddable', 0),
(12, 3, 'Very difficult to mod, possible bans for using mods', 1),
(13, 3, 'Somewhat moddable, neutral on modding', 2),
(14, 3, 'Developer endorses mods, somewhat moddable\r\n', 3),
(15, 3, 'Official tools provided by developer, very moddable\r\n', 4),
(16, 4, 'Unreliable servers, Not enough capacity for playerbase\r\n', 0),
(17, 4, 'Server issues at daily peak times\r\n', 1),
(18, 4, 'Server issues at extra high volume (sales and such)\r\n', 2),
(19, 4, 'dedicated servers, rentable custom servers (e.g. BF4)\r\n', 3),
(20, 4, 'Reliable servers that support the playerbase, custom server support, LAN support\r\n', 4),
(21, 5, 'Game breaking glitches\r\n', 0),
(22, 5, 'Severe glitches, Missions/quests may be broken\r\n', 1),
(23, 5, 'Many frustrating glitches, not game breaking\r\n', 2),
(24, 5, 'Few, minor glitches\r\n', 3),
(25, 5, 'Almost none or no glitches, rare and very minor\r\n', 4),
(26, 6, 'Game has virtually no settings\r\n', 0),
(27, 6, 'Game settings do not live up to the expected minimum for game\r\n', 1),
(28, 6, 'Game has the expected minimum of settings for game\r\n', 2),
(29, 6, 'Game has great basic settings, as well as some advanced settings\r\n', 3),
(30, 6, 'Game has settings that allow for tweaking of virtually anything anybody could ever want to tweak for that game', 4),
(31, 7, 'Un-configurable controls, locked input device (e.g. keyboard controls not implemented in console port)', 0),
(32, 7, 'Sensitivity, inverted, raw input mouse options, keyboard + mouse and gamepad support\r\n', 1),
(33, 7, 'Keyboard + mouse control mapping, automatic input switching, gamepad control presets\r\n', 2),
(34, 7, 'All input devices remappable, other input devices supported (Wheel, HOTAS, that kind)\r\n', 3),
(35, 7, 'All input devices remappable, other input devices supported (Wheel, HOTAS, that kind), support for different keyboard layouts, alternate controls, sensitivity, inverted, raw input mouse options, automatic input switching\r\n', 4),
(36, 8, 'Runs terribly on all hardware\r\n', 0),
(37, 8, 'Runs slightly better on one brand over others, still runs pretty bad\r\n', 1),
(38, 8, 'Optimized for a specific brand over others, brand-specific features\r\n', 2),
(39, 8, 'Runs slightly better on one brand over others, generally runs well\r\n', 3),
(40, 8, 'Game runs equally well on similar hardware across brands\r\n', 4),
(41, 9, 'Limited unrecoverable activations, constant online connection required, unreliable DRM servers\r\n', 0),
(42, 9, 'limited recoverable installs, online check-ins\r\n', 1),
(43, 9, 'Unlimited installs, online check-ins\r\n', 2),
(44, 9, 'Unlimited installs, available offline\r\n', 3),
(45, 9, 'No DRM\r\n', 4);

-- --------------------------------------------------------

--
-- Table structure for table `rating_category_values`
--

DROP TABLE IF EXISTS `rating_category_values`;
CREATE TABLE IF NOT EXISTS `rating_category_values` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rating_header_id` bigint(20) NOT NULL,
  `rating_category_id` bigint(20) NOT NULL,
  `rating_category_option_id` bigint(20) NOT NULL,
  `original_value` int(11) NOT NULL,
  `original_weighted_value` int(11) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ratings_header_id` (`rating_header_id`),
  KEY `rating_category_id` (`rating_category_id`),
  KEY `rating_category_option_id` (`rating_category_option_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `rating_category_values`
--

INSERT INTO `rating_category_values` (`id`, `rating_header_id`, `rating_category_id`, `rating_category_option_id`, `original_value`, `original_weighted_value`, `comments`) VALUES
(1, 4, 1, 1, 0, 0, ''),
(2, 4, 2, 6, 0, 0, ''),
(3, 4, 3, 11, 0, 0, ''),
(4, 4, 4, 16, 0, 0, ''),
(5, 4, 5, 21, 0, 0, ''),
(6, 4, 6, 26, 0, 0, ''),
(7, 4, 7, 31, 0, 0, ''),
(8, 4, 8, 36, 0, 0, ''),
(9, 4, 9, 41, 0, 0, ''),
(10, 5, 1, 5, 4, 16, ''),
(11, 5, 2, 10, 4, 12, ''),
(12, 5, 3, 15, 4, 12, ''),
(13, 5, 4, 20, 4, 20, ''),
(14, 5, 5, 25, 4, 28, ''),
(15, 5, 6, 30, 4, 24, ''),
(16, 5, 7, 35, 4, 28, ''),
(17, 5, 8, 40, 4, 20, ''),
(18, 5, 9, 45, 4, 20, ''),
(22, 7, 1, 2, 1, 4, ''),
(23, 7, 2, 8, 2, 6, ''),
(24, 7, 3, 12, 1, 3, ''),
(25, 7, 4, 19, 3, 15, ''),
(26, 7, 5, 23, 2, 14, ''),
(27, 7, 6, 30, 4, 24, ''),
(28, 7, 7, 32, 1, 7, ''),
(29, 7, 8, 38, 2, 10, ''),
(30, 7, 9, 42, 1, 5, ''),
(31, 8, 1, 2, 1, 4, ''),
(32, 8, 2, 8, 2, 6, ''),
(33, 8, 3, 14, 3, 9, ''),
(34, 8, 4, 20, 4, 20, ''),
(35, 8, 5, 24, 3, 21, ''),
(36, 8, 6, 28, 2, 12, ''),
(37, 8, 7, 32, 1, 7, ''),
(38, 8, 8, 36, 0, 0, ''),
(39, 8, 9, 42, 1, 5, ''),
(40, 9, 1, 2, 1, 4, ''),
(41, 9, 2, 8, 2, 6, ''),
(42, 9, 3, 12, 1, 3, ''),
(43, 9, 4, 20, 4, 20, ''),
(44, 9, 5, 23, 2, 14, ''),
(45, 9, 6, 30, 4, 24, ''),
(46, 9, 7, 32, 1, 7, ''),
(47, 9, 8, 38, 2, 10, ''),
(48, 9, 9, 42, 1, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `rating_headers`
--

DROP TABLE IF EXISTS `rating_headers`;
CREATE TABLE IF NOT EXISTS `rating_headers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `game_platform_id` bigint(20) NOT NULL,
  `rig_id` bigint(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `upvotes` bigint(20) NOT NULL DEFAULT '0',
  `downvotes` bigint(20) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `user_id` (`user_id`),
  KEY `rig_id` (`rig_id`),
  KEY `game_platform_id` (`game_platform_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `rating_headers`
--

INSERT INTO `rating_headers` (`id`, `game_id`, `user_id`, `game_platform_id`, `rig_id`, `created`, `upvotes`, `downvotes`, `comments`, `score`) VALUES
(4, 79, 1, 4, NULL, '2015-07-03 16:02:49', 0, 0, '', 0),
(5, 79, 1, 3, NULL, '2015-07-03 16:08:04', 0, 0, '', 180),
(7, 79, 1, 5, NULL, '2015-07-03 18:59:34', 0, 0, '', 88),
(8, 79, 1, 4, NULL, '2015-07-03 19:04:36', 0, 0, '', 84),
(9, 79, 1, 5, NULL, '2015-07-03 19:04:59', 0, 0, '', 93);

-- --------------------------------------------------------

--
-- Table structure for table `rigs`
--

DROP TABLE IF EXISTS `rigs`;
CREATE TABLE IF NOT EXISTS `rigs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rig_attributes`
--

DROP TABLE IF EXISTS `rig_attributes`;
CREATE TABLE IF NOT EXISTS `rig_attributes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rig_attribute_values`
--

DROP TABLE IF EXISTS `rig_attribute_values`;
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

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `reddit_id` varchar(32) NOT NULL,
  `trusted` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reddit_id` (`reddit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `reddit_id`, `trusted`, `admin`, `banned`) VALUES
(1, 'sanmadjack', '', '3634o', 0, 1, 0),
(2, 'timeslapsey', '', 'e0rwq', 0, 1, 0),
(3, 'lonmoer', '', '3h3mm', 0, 0, 0),
(4, 'BallisticGE0RGE', '', '68p5g', 0, 0, 0),
(5, 'NorthcodeCH', '', 'gdanv', 0, 0, 0),
(6, 'macnetic', '', 'ep1zs', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_attributes`
--

DROP TABLE IF EXISTS `user_attributes`;
CREATE TABLE IF NOT EXISTS `user_attributes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_attribute_values`
--

DROP TABLE IF EXISTS `user_attribute_values`;
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
-- Table structure for table `user_reviews`
--

DROP TABLE IF EXISTS `user_reviews`;
CREATE TABLE IF NOT EXISTS `user_reviews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL,
  `platform_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `rig_id` bigint(20) NOT NULL,
  `rating` bigint(20) NOT NULL,
  `review` longtext NOT NULL,
  `upvotes` bigint(20) NOT NULL,
  `downvotes` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `platform_id` (`platform_id`),
  KEY `user_id` (`user_id`),
  KEY `rating` (`rating`),
  KEY `rig_id` (`rig_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_reviews`
--

INSERT INTO `user_reviews` (`id`, `game_id`, `platform_id`, `user_id`, `rig_id`, `rating`, `review`, `upvotes`, `downvotes`) VALUES
(3, 79, 3, 1, 0, 5, 'Did you feel that? Look at me - I''m not out of breath anymore! You suck the oysters up and you always keep some on your face to let the oysters know that you''re proud of em. Its like a symbology of this of your mouth is eating food, from your mouth to your heart, is your freedom and your independence and your identity.		', 0, 0),
(4, 79, 4, 1, 0, 1, 'All men are failed women at birth. You know when you get the outside genitalia, its like "Oh my god what have they done to me?". All men are failed women at birth. You know when you get the outside genitalia, its like "Oh my god what have they done to me?".		', 0, 0),
(5, 79, 5, 1, 0, 1, 'Go with the feeling of the nature. Take it easy. Know why you''re here. And remeber to balance your internal energy with the environment. I would like to give you a backstage pass to my imagination. It depends on your ability to take a risk on eating something when you dont know what it is. Thats why I enjoy eating in the dark.		', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_weights`
--

DROP TABLE IF EXISTS `user_weights`;
CREATE TABLE IF NOT EXISTS `user_weights` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rating_category_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_id` (`rating_category_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for view `game_category_ratings`
--
DROP TABLE IF EXISTS `game_category_ratings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `game_category_ratings` AS select `g`.`id` AS `id`,`g`.`name` AS `name`,`gp`.`name` AS `platform`,`rcv`.`rating_category_id` AS `rating_category_id`,round(avg(`rcv`.`original_value`),0) AS `rating`,(select `rco`.`description` from `rating_category_options` `rco` where ((`rco`.`rating_category_id` = `rcv`.`rating_category_id`) and (`rco`.`value` <= round(avg(`rcv`.`original_value`),0))) order by `rco`.`value` desc limit 0,1) AS `rating_description` from (((`games` `g` left join `game_platforms` `gp` on((1 = 1))) left join `rating_headers` `rh` on(((`g`.`id` = `rh`.`game_id`) and (`rh`.`game_platform_id` = `gp`.`id`)))) join `rating_category_values` `rcv` on((`rcv`.`rating_header_id` = `rh`.`id`))) group by `g`.`id`,`g`.`name`,`rcv`.`rating_category_id`,`gp`.`name`;

-- --------------------------------------------------------

--
-- Structure for view `game_ratings`
--
DROP TABLE IF EXISTS `game_ratings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `game_ratings` AS select `g`.`id` AS `id`,`g`.`name` AS `name`,`gp`.`name` AS `platform`,count(`rh`.`id`) AS `rating_count`,avg(`rh`.`score`) AS `score`,(select `ratings`.`initial` from `ratings` where (`ratings`.`threshold` <= avg(`rh`.`score`)) order by `ratings`.`threshold` desc limit 0,1) AS `rating` from ((`games` `g` left join `rating_headers` `rh` on((`g`.`id` = `rh`.`game_id`))) left join `game_platforms` `gp` on((`gp`.`id` = `rh`.`game_platform_id`))) group by `g`.`id`,`gp`.`name`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `games_ibfk_2` FOREIGN KEY (`developer_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `game_links`
--
ALTER TABLE `game_links`
  ADD CONSTRAINT `game_links_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `game_links_ibfk_2` FOREIGN KEY (`game_link_type_id`) REFERENCES `game_link_types` (`id`);

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
  ADD CONSTRAINT `rating_category_values_ibfk_2` FOREIGN KEY (`rating_category_id`) REFERENCES `rating_categories` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_category_values_ibfk_4` FOREIGN KEY (`rating_category_option_id`) REFERENCES `rating_category_options` (`id`);

--
-- Constraints for table `rating_headers`
--
ALTER TABLE `rating_headers`
  ADD CONSTRAINT `rating_headers_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `rating_headers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `rating_headers_ibfk_3` FOREIGN KEY (`rig_id`) REFERENCES `rigs` (`id`),
  ADD CONSTRAINT `rating_headers_ibfk_4` FOREIGN KEY (`game_platform_id`) REFERENCES `game_platforms` (`id`);

--
-- Constraints for table `rigs`
--
ALTER TABLE `rigs`
  ADD CONSTRAINT `rigs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `rig_attribute_values`
--
ALTER TABLE `rig_attribute_values`
  ADD CONSTRAINT `rig_attribute_values_ibfk_1` FOREIGN KEY (`rig_id`) REFERENCES `rigs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rig_attribute_values_ibfk_2` FOREIGN KEY (`rig_attribute_id`) REFERENCES `rig_attributes` (`id`);

--
-- Constraints for table `user_attribute_values`
--
ALTER TABLE `user_attribute_values`
  ADD CONSTRAINT `user_attribute_values_ibfk_1` FOREIGN KEY (`user_attribute_id`) REFERENCES `user_attributes` (`id`),
  ADD CONSTRAINT `user_attribute_values_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_reviews`
--
ALTER TABLE `user_reviews`
  ADD CONSTRAINT `user_reviews_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `user_reviews_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `game_platforms` (`id`),
  ADD CONSTRAINT `user_reviews_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_reviews_ibfk_4` FOREIGN KEY (`rating`) REFERENCES `ratings` (`id`);

--
-- Constraints for table `user_weights`
--
ALTER TABLE `user_weights`
  ADD CONSTRAINT `user_weights_ibfk_1` FOREIGN KEY (`rating_category_id`) REFERENCES `rating_categories` (`ID`),
  ADD CONSTRAINT `user_weights_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
