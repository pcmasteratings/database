-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 12, 2015 at 01:26 PM
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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` longtext NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `title`, `description`, `sequence`) VALUES
(1, 'Frame rate', '', 1),
(2, 'Resolution', '', 2),
(3, 'Mods', '', 3),
(4, 'Online', '', 4),
(5, 'Bugs', '', 5),
(6, 'Settings', '', 6),
(7, 'Controls', '', 7),
(8, 'Hardware support', '', 8),
(9, 'DRM', '', 9);

-- --------------------------------------------------------

--
-- Table structure for table `category_option`
--

DROP TABLE IF EXISTS `category_option`;
CREATE TABLE IF NOT EXISTS `category_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `comment` longtext NOT NULL,
  `value` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120 ;

--
-- Dumping data for table `category_option`
--

INSERT INTO `category_option` (`id`, `category_id`, `description`, `comment`, `value`, `sequence`, `parent_id`) VALUES
(50, 1, 'Artificial frame rate cap', '', 0, 1, NULL),
(51, 1, '<= 30 FPS', '', -6, 1, 50),
(52, 1, '<= 60 FPS', '', -4, 2, 50),
(53, 1, '<= 120 FPS', '', -2, 3, 50),
(54, 1, 'Physics tied to frame rate', '', -2, 2, NULL),
(55, 1, 'Frame rate cap circumventable', '', 2, 3, NULL),
(56, 1, 'No frame rate cap', '', 0, 4, NULL),
(57, 1, 'Frame rate stability issues', '', 0, 5, NULL),
(58, 1, 'Major', '', -4, 1, 57),
(59, 1, 'Moderate', '', -2, 2, 57),
(60, 2, 'Resolution limited', '', 0, 1, NULL),
(61, 2, '<= 1080p', '', -4, 1, 60),
(62, 2, '<= 1440p', '', -2, 2, 60),
(63, 2, 'Tech-based', '', 0, 3, 60),
(64, 2, 'No resolution limit', '', 0, 2, NULL),
(65, 2, 'Aspect ratio locked', '', -2, 3, NULL),
(66, 2, 'VR Support', '', 2, 4, NULL),
(67, 2, 'Ultra-widescreen scaling issues', '', -3, 5, NULL),
(68, 2, 'Ultra-widescreen disabled', '', -4, 6, NULL),
(69, 2, 'Resolution limitations circumventable', '', 2, 7, NULL),
(70, 3, 'Active disabling of mods', '', -10, 1, NULL),
(71, 3, 'Modding tools provided', '', 6, 2, NULL),
(72, 3, 'Level editor provided', '', 4, 3, NULL),
(73, 3, 'Game assets easily moddable', '', 2, 4, NULL),
(74, 4, 'Dedicated servers available', '', 4, 1, NULL),
(75, 4, 'Server reliability issues', '', 0, 2, NULL),
(76, 4, 'Server reliability issues that game depends on to function at all', '', -5, 3, NULL),
(77, 4, 'Rentable custom servers', '', 2, 4, NULL),
(78, 4, 'No LAN support', '', -5, 5, NULL),
(79, 4, 'Major', '', -10, 1, 75),
(80, 4, 'Moderate', '', -6, 2, 75),
(81, 4, 'Minor', '', -2, 3, 75),
(82, 5, 'Major (game-breaking)', '', -20, 1, 85),
(83, 5, 'Moderate', '', -10, 2, 85),
(84, 5, 'Minor', '', -2, 3, 85),
(85, 5, 'Bugs', '', 0, 1, NULL),
(86, 5, 'Stability', '', 0, 2, NULL),
(87, 5, 'Major', '', -20, 1, 86),
(88, 5, 'Moderate', '', -10, 2, 86),
(90, 5, 'Minor', '', -2, 3, 86),
(91, 6, 'No subtitles', '', -4, 1, NULL),
(92, 6, 'General settings availability', '', 0, 2, NULL),
(93, 7, 'Specialized controller support', '', 2, 3, NULL),
(94, 7, 'Lacks expected controller support', '', -4, 4, NULL),
(95, 6, 'Nonexistent', '', -6, 0, 92),
(96, 6, 'Poor', '', -4, 2, 92),
(97, 6, 'Acceptable', '', 0, 3, 92),
(98, 6, 'Glorious', '', 2, 4, 92),
(99, 8, 'Poorly optimized for particular video card brand(s)', '', -5, 1, NULL),
(100, 8, 'Poorly optimized for particular render path', '', -5, 2, NULL),
(101, 8, 'Poorly optimized for particular processor brand(s)', '', -5, 3, NULL),
(102, 8, 'Extremely well optimized', '', 2, 4, NULL),
(103, 7, 'No mouse support', '', -6, 1, NULL),
(104, 7, 'General control customizability', '', 0, 2, NULL),
(105, 7, 'Nonexistent', '', -6, 1, 104),
(106, 7, 'Poor', '', -4, 2, 104),
(107, 7, 'Acceptable', '', 0, 3, 104),
(108, 7, 'Glorious', '', 2, 4, 104),
(109, 9, 'Limited activations', '', 0, 1, NULL),
(110, 9, 'Recoverable', '', -6, 1, 109),
(111, 9, 'Unrecoverable ', '', -10, 2, 109),
(112, 9, 'DRM-free option', '', 5, 2, NULL),
(113, 9, 'Disc check', '', -2, 3, NULL),
(114, 9, 'Online check-in', '', 0, 4, NULL),
(115, 9, 'Offline available', '', -2, 1, 114),
(116, 9, 'No offline available', '', -6, 2, 114),
(117, 9, 'Constant on-line unnecessarily required', '', -8, 5, NULL),
(118, 9, 'Unreliable DRM servers', '', -4, 6, NULL),
(119, 9, 'Offline DRM servers', '', -50, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
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
-- Table structure for table `contest_queue`
--

DROP TABLE IF EXISTS `contest_queue`;
CREATE TABLE IF NOT EXISTS `contest_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `game_id` bigint(20) NOT NULL,
  `platform_id` bigint(20) NOT NULL,
  `message` longtext NOT NULL,
  `resolved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `platform_id` (`platform_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
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
  `admin_lock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `bg_id` (`gb_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `developer_id` (`developer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=146 ;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `name`, `title`, `description`, `publisher_id`, `developer_id`, `gb_id`, `gb_url`, `gb_image`, `gb_thumb`, `admin_lock`) VALUES
(121, 'deus_ex_2000', 'Deus Ex', 'A celebrated cyberpunk-themed first-person role-playing game, Deus Ex puts players behind the shades of JC Denton--an operative thrust into a world of byzantine global conspiracies.', NULL, NULL, 17533, 'http://www.giantbomb.com/api/game/3030-17533/', 'http://static.giantbomb.com/uploads/scale_medium/0/5480/608405-dxcover_1.jpg', 'http://static.giantbomb.com/uploads/screen_medium/0/5480/608405-dxcover_1.jpg', 0),
(139, 'deus_ex_invisible_war_2003', 'Deus Ex: Invisible War', 'The sequel to one of the most acclaimed PC games of all time, Deus Ex: Invisible War throws you into a divided world, where multiple factions wish to take advantage of your cybernetic abilities. Playing as Alex D., you make your own path through corrupt leaders and worldwide conspiracies.', NULL, NULL, 9883, 'http://www.giantbomb.com/api/game/3030-9883/', 'http://static.giantbomb.com/uploads/scale_medium/1/15693/622641-528588_50970_front_1_.jpg', 'http://static.giantbomb.com/uploads/screen_medium/1/15693/622641-528588_50970_front_1_.jpg', 0),
(140, 'deus_ex_human_revolution_2011', 'Deus Ex: Human Revolution', 'Human Revolution is the third game in the Deus Ex series, a prequel where players take control of augmented security officer Adam Jensen, and investigate attacks against Sarif Industries, a leader in augmentation technology.', NULL, NULL, 21358, 'http://www.giantbomb.com/api/game/3030-21358/', 'http://static.giantbomb.com/uploads/scale_medium/8/87790/1974385-box_deusexhr.png', 'http://static.giantbomb.com/uploads/screen_medium/8/87790/1974385-box_deusexhr.png', 0),
(141, 'deus_ex_human_revolution_directors_cut_2013', 'Deus Ex: Human Revolution Director''s Cut', 'The Director''s Cut of Deus Ex: Human Revolution features redone boss battles, improved graphics, A.I. and combat, and all DLC released for the original game. The Wii U version makes use of the controller''s screen to allow new features like map notes.', NULL, NULL, 42021, 'http://www.giantbomb.com/api/game/3030-42021/', 'http://static.giantbomb.com/uploads/scale_medium/8/82063/2464567-dehrdcclean.jpg', 'http://static.giantbomb.com/uploads/screen_medium/8/82063/2464567-dehrdcclean.jpg', 0),
(142, 'deus_ex_the_fall_2013', 'Deus Ex: The Fall', 'The fourth Deus Ex game, revealed a week before E3 2013 to be an iOS game that aims to recreate a true Deus Ex game on mobile devices and is built from the ground up for them.', NULL, NULL, 42841, 'http://www.giantbomb.com/api/game/3030-42841/', 'http://static.giantbomb.com/uploads/scale_medium/8/82063/2491944-deusexthefalllogo.jpg', 'http://static.giantbomb.com/uploads/screen_medium/8/82063/2491944-deusexthefalllogo.jpg', 0),
(143, 'mass_effect_2007', 'Mass Effect', 'When humanity is still a newcomer on the futuristic galactic stage, it''s up to the charismatic Commander Shepard to investigate the actions of a rogue agent in the first chapter of the Mass Effect trilogy.', NULL, NULL, 16909, 'http://www.giantbomb.com/api/game/3030-16909/', 'http://static.giantbomb.com/uploads/scale_medium/8/82063/2577246-me1.jpg', 'http://static.giantbomb.com/uploads/screen_medium/8/82063/2577246-me1.jpg', 0),
(144, 'mass_effect_2_2010', 'Mass Effect 2', 'After a violent death by an unknown force and a timely reanimation by the human supremacist organization Cerberus, Commander Shepard must assemble a new squad in the seedier side of the galaxy for a suicide mission in the second installment of the "Mass Effect" trilogy.', NULL, NULL, 21590, 'http://www.giantbomb.com/api/game/3030-21590/', 'http://static.giantbomb.com/uploads/scale_medium/8/82063/2577248-me2.jpg', 'http://static.giantbomb.com/uploads/screen_medium/8/82063/2577248-me2.jpg', 0),
(145, 'mass_effect_3_2012', 'Mass Effect 3', 'When Earth begins to fall in an ancient cycle of destruction, Commander Shepard must unite the forces of the galaxy to stop the Reapers in the infamous final chapter of the first Mass Effect trilogy.', NULL, NULL, 29935, 'http://www.giantbomb.com/api/game/3030-29935/', 'http://static.giantbomb.com/uploads/scale_medium/8/87790/2126447-box_me3.png', 'http://static.giantbomb.com/uploads/screen_medium/8/87790/2126447-box_me3.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `game_category_ratings`
--

DROP TABLE IF EXISTS `game_category_ratings`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pcmratings`.`game_category_ratings` AS select `g`.`id` AS `id`,`g`.`name` AS `name`,`gp`.`name` AS `platform`,`rcv`.`rating_category_id` AS `rating_category_id`,round(avg(`rcv`.`original_value`),0) AS `rating`,(select `rco`.`description` from `pcmratings`.`rating_category_options` `rco` where ((`rco`.`rating_category_id` = `rcv`.`rating_category_id`) and (`rco`.`value` <= round(avg(`rcv`.`original_value`),0))) order by `rco`.`value` desc limit 0,1) AS `rating_description` from (((`pcmratings`.`games` `g` left join `pcmratings`.`game_platforms` `gp` on((1 = 1))) left join `pcmratings`.`rating_headers` `rh` on(((`g`.`id` = `rh`.`game_id`) and (`rh`.`game_platform_id` = `gp`.`id`)))) join `pcmratings`.`rating_category_values` `rcv` on((`rcv`.`rating_header_id` = `rh`.`id`))) group by `g`.`id`,`g`.`name`,`rcv`.`rating_category_id`,`gp`.`name`;
-- Error reading data: (#1356 - View 'pcmratings.game_category_ratings' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them)

-- --------------------------------------------------------

--
-- Table structure for table `game_link`
--

DROP TABLE IF EXISTS `game_link`;
CREATE TABLE IF NOT EXISTS `game_link` (
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
-- Table structure for table `game_link_type`
--

DROP TABLE IF EXISTS `game_link_type`;
CREATE TABLE IF NOT EXISTS `game_link_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` longtext NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `game_platform`
--

DROP TABLE IF EXISTS `game_platform`;
CREATE TABLE IF NOT EXISTS `game_platform` (
  `game_id` bigint(20) NOT NULL,
  `platform_id` bigint(20) NOT NULL,
  PRIMARY KEY (`game_id`,`platform_id`),
  KEY `platform_id` (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `game_platform`
--

INSERT INTO `game_platform` (`game_id`, `platform_id`) VALUES
(121, 3),
(139, 3),
(140, 3),
(141, 3),
(142, 3),
(143, 3),
(144, 3),
(145, 3),
(121, 5),
(140, 5),
(141, 5);

-- --------------------------------------------------------

--
-- Table structure for table `game_ratings`
--

DROP TABLE IF EXISTS `game_ratings`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pcmratings`.`game_ratings` AS select `g`.`id` AS `id`,`g`.`name` AS `name`,`gp`.`name` AS `platform`,count(`rh`.`id`) AS `rating_count`,avg(`rh`.`score`) AS `score`,(select `pcmratings`.`ratings`.`initial` from `pcmratings`.`ratings` where (`pcmratings`.`ratings`.`threshold` <= avg(`rh`.`score`)) order by `pcmratings`.`ratings`.`threshold` desc limit 0,1) AS `rating` from ((`pcmratings`.`games` `g` left join `pcmratings`.`rating_headers` `rh` on((`g`.`id` = `rh`.`game_id`))) left join `pcmratings`.`game_platforms` `gp` on((`gp`.`id` = `rh`.`game_platform_id`))) group by `g`.`id`,`gp`.`name`;
-- Error reading data: (#1356 - View 'pcmratings.game_ratings' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them)

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `datetime`, `user_id`, `content`, `tags`) VALUES
(1, 'Test news article', '2015-07-12 09:01:40', 1, 'The best way to communicate is compatible. Compatible communication is listening with open ears and an open mind, and not being fearful or judgemental about what you''re hearing. The magic Indian is a mysterious spiritual force, and we''re going to Cathedral Rock, and that''s the vortex of the heart.		', '');

-- --------------------------------------------------------

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
CREATE TABLE IF NOT EXISTS `platform` (
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
-- Dumping data for table `platform`
--

INSERT INTO `platform` (`id`, `name`, `title`, `description`, `gb_id`) VALUES
(3, 'windows', 'Windows', 'Windows', 94),
(4, 'linux', 'Linux', 'Linux', 152),
(5, 'mac', 'Mac', 'Mac', 17);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initial` char(2) NOT NULL,
  `title` text NOT NULL,
  `description` longtext NOT NULL,
  `threshold` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `initial` (`initial`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `initial`, `title`, `description`, `threshold`) VALUES
(1, 'p', 'Peasantry', 'An insult to the PC gaming community', -2147483647),
(2, 'c', 'Compromised', '', -50),
(3, 'm', 'Mediocre', 'Some poor choices', -30),
(4, 'r', 'Righteous', 'A respectable effort', -10),
(5, 'g', 'Glorious', 'Goes above and beyond expectations', 10),
(6, 'rp', 'Rating Pending', 'Not been rated yet', -2147483648);

-- --------------------------------------------------------

--
-- Table structure for table `rating_header`
--

DROP TABLE IF EXISTS `rating_header`;
CREATE TABLE IF NOT EXISTS `rating_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL,
  `platform_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `comments` longtext NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `game_id_2` (`game_id`,`platform_id`),
  KEY `game_id` (`game_id`),
  KEY `platform_id` (`platform_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `rating_header`
--

INSERT INTO `rating_header` (`id`, `game_id`, `platform_id`, `created`, `updated`, `comments`, `score`) VALUES
(11, 140, 3, '2015-07-11 11:33:53', '2015-07-12 13:09:25', '', -2),
(12, 139, 3, '2015-07-11 11:45:35', '2015-07-12 13:23:25', '', -6);

-- --------------------------------------------------------

--
-- Table structure for table `rating_value`
--

DROP TABLE IF EXISTS `rating_value`;
CREATE TABLE IF NOT EXISTS `rating_value` (
  `rating_header_id` bigint(20) NOT NULL,
  `category_option_id` bigint(20) NOT NULL,
  `original_value` int(11) NOT NULL,
  `do_not_score` tinyint(1) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  PRIMARY KEY (`rating_header_id`,`category_option_id`),
  KEY `category_option_id` (`category_option_id`),
  KEY `rating_header_id` (`rating_header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating_value`
--

INSERT INTO `rating_value` (`rating_header_id`, `category_option_id`, `original_value`, `do_not_score`, `comments`) VALUES
(12, 56, 0, 0, ''),
(12, 60, 0, 0, ''),
(12, 61, -4, 0, ''),
(12, 67, -3, 0, ''),
(12, 92, 0, 0, ''),
(12, 97, 0, 0, ''),
(12, 104, 0, 0, ''),
(12, 107, 0, 0, ''),
(12, 112, 5, 0, ''),
(12, 113, -2, 0, ''),
(12, 114, 0, 0, ''),
(12, 115, -2, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `rig`
--

DROP TABLE IF EXISTS `rig`;
CREATE TABLE IF NOT EXISTS `rig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rig_attribute`
--

DROP TABLE IF EXISTS `rig_attribute`;
CREATE TABLE IF NOT EXISTS `rig_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rig_attribute_value`
--

DROP TABLE IF EXISTS `rig_attribute_value`;
CREATE TABLE IF NOT EXISTS `rig_attribute_value` (
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
  `moderator` tinyint(1) NOT NULL DEFAULT '0',
  `probation` tinyint(1) NOT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reddit_id` (`reddit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `reddit_id`, `trusted`, `admin`, `moderator`, `probation`, `banned`) VALUES
(1, 'sanmadjack', '', '3634o', 0, 1, 0, 0, 0),
(2, 'timeslapsey', '', 'e0rwq', 0, 1, 0, 0, 0),
(3, 'lonmoer', '', '3h3mm', 0, 0, 0, 0, 0),
(4, 'BallisticGE0RGE', '', '68p5g', 0, 0, 0, 0, 0),
(5, 'NorthcodeCH', '', 'gdanv', 0, 0, 0, 0, 0),
(6, 'macnetic', '', 'ep1zs', 0, 0, 0, 0, 0),
(7, 'nirkbirk', '', '700sv', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_access`
--

DROP TABLE IF EXISTS `user_access`;
CREATE TABLE IF NOT EXISTS `user_access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `ipv4_address` varchar(20) NOT NULL,
  `user_access_type_id` bigint(20) NOT NULL,
  `access` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_access_type_id` (`user_access_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_access_type`
--

DROP TABLE IF EXISTS `user_access_type`;
CREATE TABLE IF NOT EXISTS `user_access_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_attribute`
--

DROP TABLE IF EXISTS `user_attribute`;
CREATE TABLE IF NOT EXISTS `user_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_attribute_value`
--

DROP TABLE IF EXISTS `user_attribute_value`;
CREATE TABLE IF NOT EXISTS `user_attribute_value` (
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
-- Table structure for table `user_review`
--

DROP TABLE IF EXISTS `user_review`;
CREATE TABLE IF NOT EXISTS `user_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(20) NOT NULL,
  `platform_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `rig_id` bigint(20) DEFAULT NULL,
  `rating_id` bigint(20) NOT NULL,
  `review` longtext NOT NULL,
  `upvotes` bigint(20) NOT NULL,
  `downvotes` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `platform_id` (`platform_id`),
  KEY `user_id` (`user_id`),
  KEY `rig_id` (`rig_id`),
  KEY `rating_id` (`rating_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user_review`
--

INSERT INTO `user_review` (`id`, `game_id`, `platform_id`, `user_id`, `rig_id`, `rating_id`, `review`, `upvotes`, `downvotes`) VALUES
(9, 121, 5, 1, NULL, 2, 'TEST', 0, 0),
(10, 140, 3, 1, NULL, 3, 'The best way to communicate is compatible. Compatible communication is listening with open ears and an open mind, and not being fearful or judgemental about what you''re hearing. It''s OK to get Rib-grease on your face, because you''re allowing people to see that you''re proud of these ribs.	', 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_option`
--
ALTER TABLE `category_option`
  ADD CONSTRAINT `category_option_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `category_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_option_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`developer_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `game_link`
--
ALTER TABLE `game_link`
  ADD CONSTRAINT `game_link_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `game_link_ibfk_2` FOREIGN KEY (`game_link_type_id`) REFERENCES `game_link_type` (`id`);

--
-- Constraints for table `game_platform`
--
ALTER TABLE `game_platform`
  ADD CONSTRAINT `game_platform_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `game_platform_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `rating_header`
--
ALTER TABLE `rating_header`
  ADD CONSTRAINT `rating_header_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  ADD CONSTRAINT `rating_header_ibfk_3` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`);

--
-- Constraints for table `rating_value`
--
ALTER TABLE `rating_value`
  ADD CONSTRAINT `rating_value_ibfk_3` FOREIGN KEY (`category_option_id`) REFERENCES `category_option` (`id`),
  ADD CONSTRAINT `rating_value_ibfk_1` FOREIGN KEY (`rating_header_id`) REFERENCES `rating_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rig`
--
ALTER TABLE `rig`
  ADD CONSTRAINT `rig_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `rig_attribute_value`
--
ALTER TABLE `rig_attribute_value`
  ADD CONSTRAINT `rig_attribute_value_ibfk_1` FOREIGN KEY (`rig_id`) REFERENCES `rig` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rig_attribute_value_ibfk_2` FOREIGN KEY (`rig_attribute_id`) REFERENCES `rig_attribute` (`id`);

--
-- Constraints for table `user_access`
--
ALTER TABLE `user_access`
  ADD CONSTRAINT `user_access_ibfk_2` FOREIGN KEY (`user_access_type_id`) REFERENCES `user_access_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_access_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_attribute_value`
--
ALTER TABLE `user_attribute_value`
  ADD CONSTRAINT `user_attribute_value_ibfk_1` FOREIGN KEY (`user_attribute_id`) REFERENCES `user_attribute` (`id`),
  ADD CONSTRAINT `user_attribute_value_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_review`
--
ALTER TABLE `user_review`
  ADD CONSTRAINT `user_review_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  ADD CONSTRAINT `user_review_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`),
  ADD CONSTRAINT `user_review_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_review_ibfk_4` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`id`),
  ADD CONSTRAINT `user_review_ibfk_5` FOREIGN KEY (`rig_id`) REFERENCES `rig` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
