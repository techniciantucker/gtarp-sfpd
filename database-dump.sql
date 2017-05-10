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
-- Export de la structure de la table rp_server. items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table rp_server. skin
CREATE TABLE IF NOT EXISTS `skin` (
  `identifier` varchar(120) DEFAULT NULL,
  `skin_name` varchar(50) DEFAULT NULL,
  `head` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hair_txt` int(11) NOT NULL DEFAULT '0',
  `tshirt` int(11) NOT NULL DEFAULT '0',
  `tshirt_txt` int(11) NOT NULL DEFAULT '0',
  `jacket` int(11) NOT NULL DEFAULT '0',
  `jacket_txt` int(11) NOT NULL DEFAULT '0',
  `pant` int(11) NOT NULL DEFAULT '0',
  `pant_txt` int(11) NOT NULL DEFAULT '0',
  `shoe` int(11) NOT NULL DEFAULT '0',
  `shoe_txt` int(11) NOT NULL DEFAULT '0',
  `glove` int(11) NOT NULL DEFAULT '0',
  `glove_txt` int(11) NOT NULL DEFAULT '0',
  `percing` int(11) NOT NULL DEFAULT '0',
  `percing_txt` int(11) NOT NULL DEFAULT '0',
  `glasses` int(11) NOT NULL DEFAULT '0',
  `glasses_txt` int(11) NOT NULL DEFAULT '0',
  `helmet` int(11) NOT NULL DEFAULT '0',
  `helmet_txt` int(11) NOT NULL DEFAULT '0',
  `accessory1` int(11) NOT NULL DEFAULT '0',
  `accessory1_txt` int(11) NOT NULL DEFAULT '0',
  `accessory2` int(11) NOT NULL DEFAULT '0',
  `accessory2_txt` int(11) NOT NULL DEFAULT '0',
  `accessory3` int(11) NOT NULL DEFAULT '0',
  `accessory3_txt` int(11) NOT NULL DEFAULT '0',
  `accessory4` int(11) NOT NULL DEFAULT '0',
  `accessory4_txt` int(11) NOT NULL DEFAULT '0',
  `mask` int(11) NOT NULL DEFAULT '0',
  `mask_txt` int(11) NOT NULL DEFAULT '0'
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
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `bankbalance` int(32) DEFAULT '0',
  `last_seen_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isFirstConnection` int(11) DEFAULT '1',
  `lastpos` varchar(255) DEFAULT '{-887.48388671875, -2311.68872070313,  -3.50776553153992, 142.503463745117}',
  `phone_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table rp_server. user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `user_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table rp_server. user_message
CREATE TABLE IF NOT EXISTS `user_message` (
  `owner_id` varchar(50) NOT NULL,
  `receiver_id` varchar(50) NOT NULL,
  `msg` varchar(120) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `has_read` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table rp_server. user_phonelist
CREATE TABLE IF NOT EXISTS `user_phonelist` (
  `owner_id` varchar(50) NOT NULL,
  `contact_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table rp_server. user_vehicle
CREATE TABLE IF NOT EXISTS `user_vehicle` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `vehicle_name` varchar(60) DEFAULT NULL,
  `vehicle_model` varchar(60) DEFAULT NULL,
  `vehicle_price` int(60) DEFAULT NULL,
  `vehicle_plate` varchar(60) DEFAULT NULL,
  `vehicle_state` varchar(60) DEFAULT NULL,
  `vehicle_colorprimary` varchar(60) DEFAULT NULL,
  `vehicle_colorsecondary` varchar(60) DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(60) NOT NULL,
  `vehicle_wheelcolor` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
