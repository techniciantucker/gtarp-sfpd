-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.14 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.4.0.5151
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Export de la structure de la base pour rp_server
CREATE DATABASE IF NOT EXISTS `rp_server` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rp_server`;

-- Export de la structure de la table rp_server. bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banned` varchar(50) NOT NULL DEFAULT '0',
  `banner` varchar(50) NOT NULL,
  `reason` varchar(150) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table rp_server. skin
CREATE TABLE IF NOT EXISTS `skin` (
  `identifier` varchar(120) DEFAULT NULL,
  `skin_name` varchar(50) DEFAULT NULL,
  `head` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `h2` int(11) NOT NULL DEFAULT '0',
  `tshirt` int(11) NOT NULL DEFAULT '0',
  `t2` int(11) NOT NULL DEFAULT '0',
  `jacket` int(11) NOT NULL DEFAULT '0',
  `j2` int(11) NOT NULL DEFAULT '0',
  `pants` int(11) NOT NULL DEFAULT '0',
  `p2` int(11) NOT NULL DEFAULT '0',
  `shoes` int(11) NOT NULL DEFAULT '0',
  `s2` int(11) NOT NULL DEFAULT '0',
  `gloves` int(11) NOT NULL DEFAULT '0',
  `g2` int(11) NOT NULL DEFAULT '0',
  `accessory1` int(11) NOT NULL DEFAULT '0',
  `aa` int(11) NOT NULL DEFAULT '0',
  `accessory2` int(11) NOT NULL DEFAULT '0',
  `ab` int(11) NOT NULL DEFAULT '0',
  `accessory3` int(11) NOT NULL DEFAULT '0',
  `ac` int(11) NOT NULL DEFAULT '0',
  `accessory4` int(11) NOT NULL DEFAULT '0',
  `ad` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table rp_server. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `money` double DEFAULT '0',
  `permission_level` int(11) DEFAULT '0',
  `group` varchar(50) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `isFirstConnection` int(11) DEFAULT '1',
  `lastpos` varchar(255) DEFAULT '{-887.48388671875, -2311.68872070313,  -3.50776553153992, 142.503463745117}',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
