-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk uts
CREATE DATABASE IF NOT EXISTS `uts` /*!40100 DEFAULT CHARACTER SET*/ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `uts`;

-- membuang struktur untuk table uts.suhu
CREATE TABLE IF NOT EXISTS `suhu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suhu` int NOT NULL,
  `humid` int NOT NULL,
  `kecerahan` int NOT NULL,
  `timestamp` datetime NOT NULL,
  `month_year` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT;

-- Membuang data untuk tabel uts.suhu: ~2 rows (lebih kurang)
INSERT INTO `suhu` (`id`, `suhu`, `humid`, `kecerahan`, `timestamp`, `month_year`) VALUES
	(1, 36, 35, 25, '2018-09-18 07:23:48', '09-2018'),
	(2, 36, 36, 27, '2011-05-02 12:49:34', '05-2011');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
