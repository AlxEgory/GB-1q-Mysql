-- MySQL dump 10.13  Distrib 8.0.26, for macos11.3 (x86_64)
--
-- Host: localhost    Database: listorg
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `date_lic`
--

DROP TABLE IF EXISTS `date_lic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date_lic` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `org_id` bigint unsigned NOT NULL COMMENT 'Ссылка на организацию',
  `date_lic` date NOT NULL COMMENT 'Дата ликвидации субьекта',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `date_lic_org` (`org_id`),
  CONSTRAINT `date_lic_org` FOREIGN KEY (`org_id`) REFERENCES `org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Даты ликвидации субъекта';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_lic`
--

LOCK TABLES `date_lic` WRITE;
/*!40000 ALTER TABLE `date_lic` DISABLE KEYS */;
INSERT INTO `date_lic` VALUES (1,2,'1998-07-26','2018-05-05 10:47:28','2021-10-15 17:24:47'),(4,8,'2019-04-11','2015-11-23 22:24:52','2021-10-15 15:52:13'),(5,10,'1994-01-17','1974-09-12 21:03:52','2021-10-15 15:52:15'),(6,3,'2010-04-05','1998-02-06 06:32:41','2021-10-15 15:53:18'),(9,7,'1974-05-28','1998-08-21 08:18:10','2021-10-15 15:53:20');
/*!40000 ALTER TABLE `date_lic` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_lic_ins` AFTER INSERT ON `date_lic` FOR EACH ROW BEGIN 
	UPDATE org SET 
		status = 'LIC'
	WHERE id = NEW.org_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_lic_upd` AFTER UPDATE ON `date_lic` FOR EACH ROW BEGIN 
	UPDATE org SET 
		status = 'OPER'
	WHERE id = OLD.org_id;
	UPDATE org SET 
		status = 'LIC'
	WHERE id = NEW.org_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_lic_del` AFTER DELETE ON `date_lic` FOR EACH ROW BEGIN 
	UPDATE org SET 
		status = 'OPER'
	WHERE id = OLD.org_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `fl`
--

DROP TABLE IF EXISTS `fl`;
/*!50001 DROP VIEW IF EXISTS `fl`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fl` AS SELECT 
 1 AS `last_name`,
 1 AS `first_name`,
 1 AS `second_name`,
 1 AS `inn`,
 1 AS `status`,
 1 AS `ogrn`,
 1 AS `date_reg`,
 1 AS `okved_fl`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fl_profile`
--

DROP TABLE IF EXISTS `fl_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_profile` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `org_id` bigint unsigned NOT NULL COMMENT 'Ссылка на организацию',
  `first_name` varchar(100) NOT NULL COMMENT 'Имя физического лица',
  `second_name` varchar(100) NOT NULL COMMENT 'Отчество физического лица',
  `last_name` varchar(100) NOT NULL COMMENT 'Фамилия физического лица',
  `ogrn` varchar(13) NOT NULL COMMENT 'ОГРН физического лица',
  `okved_fl` varchar(11) NOT NULL COMMENT 'Основной ЭКВЭД компании',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ogrn` (`ogrn`),
  KEY `fl_profile_org` (`org_id`),
  KEY `fl_profile_okved_tab` (`okved_fl`),
  CONSTRAINT `fl_profile_okved_tab` FOREIGN KEY (`okved_fl`) REFERENCES `okved_tab` (`okved`),
  CONSTRAINT `fl_profile_org` FOREIGN KEY (`org_id`) REFERENCES `org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профиль физического лица лица';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_profile`
--

LOCK TABLES `fl_profile` WRITE;
/*!40000 ALTER TABLE `fl_profile` DISABLE KEYS */;
INSERT INTO `fl_profile` VALUES (1,1,'Иван','Иванович','Иванов','5738375894753','59','2021-10-15 19:12:09','2021-10-15 19:12:09'),(2,2,'Петр','Петрович','Петров','7654389244554','31','2021-10-15 19:13:27','2021-10-15 19:14:52'),(3,5,'Сергей','Сергеевич','Сергеев','7567823652532','59','2021-10-15 19:15:51','2021-10-15 19:15:51'),(4,6,'Иван','Сергеевич','Петров','7567835815953','58','2021-10-15 19:16:46','2021-10-15 19:16:46'),(5,8,'Сергей','Петрович','Иванов','6534638663554','23','2021-10-15 21:10:06','2021-10-15 21:10:06'),(6,9,'Петр','Иванович','Сергеев','7484783472344','81','2021-10-15 21:13:15','2021-10-15 21:13:15'),(7,10,'Иван','Петрович','Сергеев','5325235325354','83','2021-10-15 21:14:44','2021-10-15 21:14:44');
/*!40000 ALTER TABLE `fl_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oktmo_tab`
--

DROP TABLE IF EXISTS `oktmo_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oktmo_tab` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `oktmo` varchar(11) NOT NULL COMMENT 'Номер ОКТМО',
  `oktmo_desc` varchar(255) NOT NULL COMMENT 'Описание ОКТМО',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `oktmo` (`oktmo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Перечень ОКТМО';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oktmo_tab`
--

LOCK TABLES `oktmo_tab` WRITE;
/*!40000 ALTER TABLE `oktmo_tab` DISABLE KEYS */;
INSERT INTO `oktmo_tab` VALUES (1,'49111246306','Quibusdam quasi tenetur minima quaerat et possimus. Enim perferendis illum qui veritatis est sit cumque. Qui sit ex qui molestiae eum. Fugit aut maiores delectus quasi minima.','1994-02-03 13:37:44','1992-10-28 06:32:49'),(2,'46669596816','Ducimus occaecati quae et quos. In veniam possimus eum voluptas. Mollitia blanditiis molestiae labore et fugiat. Voluptas eligendi impedit voluptatem debitis.','1999-12-18 18:56:13','1992-01-16 15:33:49'),(3,'47181935356','Maiores amet corporis enim fugiat culpa alias odit. Doloribus a facilis suscipit ut. Quos suscipit dolorem dolore qui.','2006-09-05 21:40:39','1982-12-20 21:28:04'),(4,'49489022622','Voluptatum voluptas sit voluptas quia voluptas vitae. Blanditiis quis ut labore quia fugiat.','2007-11-25 20:46:21','1972-05-23 08:03:54'),(5,'47416698067','Sit et et non dolorum. Facere ratione praesentium quia. Ipsam eum expedita qui repellendus quaerat perferendis. Non ut illum et occaecati expedita itaque fugit aperiam.','2013-02-06 21:20:08','1994-10-15 07:32:43'),(6,'45395314328','Officiis in fugit ipsum vero omnis debitis ipsa. Ipsum modi ut soluta officia sit. In aut ut est autem doloremque. Rem labore et ullam ut.','1998-12-05 07:49:03','2007-09-11 14:57:04'),(7,'47573218812','Aut alias id aperiam veritatis et officia ut. Qui placeat et ad optio illum maiores. Quas quod cumque reiciendis iste doloribus provident aliquam. Qui rem incidunt aperiam debitis.','2003-08-11 14:08:21','1997-05-14 06:30:28'),(8,'46368269088','Culpa aut voluptatum qui eos error. Nemo nobis saepe aut est. Rerum harum esse numquam a rerum non repellat. Numquam libero dolorem libero explicabo.','2016-03-29 17:30:16','1972-09-20 11:58:34'),(9,'46917834889','Consequatur et nulla minima aliquam. Autem autem architecto dolore dolores accusantium voluptatem quaerat. Unde nostrum culpa quisquam est. Culpa officia ut quaerat laborum.','2001-09-20 18:56:35','1982-11-30 06:44:20'),(10,'46058970996','Et esse sint illum laboriosam accusantium et eos. Debitis voluptatem voluptate eos ut voluptatem. Error sequi quos similique dolores. Id aut temporibus impedit sint.','1971-04-09 18:12:28','2004-07-26 12:59:06');
/*!40000 ALTER TABLE `oktmo_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okved_tab`
--

DROP TABLE IF EXISTS `okved_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `okved_tab` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `okved` varchar(11) NOT NULL COMMENT 'Номер ОКВЭД',
  `okved_desc` varchar(255) NOT NULL COMMENT 'Описание ОКВЭД',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `okved` (`okved`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Перечень ОКВЭД';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okved_tab`
--

LOCK TABLES `okved_tab` WRITE;
/*!40000 ALTER TABLE `okved_tab` DISABLE KEYS */;
INSERT INTO `okved_tab` VALUES (1,'83','Qui illum sed consequatur.','1980-05-03 15:12:18','2013-02-04 22:39:39'),(2,'23','Hic commodi voluptas velit optio et ipsum.','1972-11-24 08:56:58','1974-04-27 13:49:13'),(3,'31','Reprehenderit maxime esse ut odit.','2010-04-03 13:32:41','2016-05-30 23:22:27'),(4,'69','Et voluptatibus voluptas nulla ratione veniam similique.','1974-02-12 01:09:12','1988-06-10 20:25:00'),(5,'50','Et consectetur ea sapiente explicabo voluptates expedita fuga laborum.','1982-03-02 08:38:13','2019-08-18 07:31:52'),(6,'70','Molestiae quaerat molestiae ullam tempore ipsa.','2008-04-23 23:12:34','1974-01-30 17:26:13'),(7,'59','Deserunt repudiandae est autem quidem sed.','1973-09-24 20:33:08','1994-01-18 04:04:05'),(8,'58','Omnis fugit vel fugit quasi repellat officiis laudantium.','1992-05-30 03:13:04','1980-05-23 08:55:34'),(9,'60','Quaerat distinctio aliquid ut ab.','2002-11-22 22:03:10','2007-05-07 09:37:43'),(10,'81','Dolor tempora illo veniam sunt vitae.','1996-04-17 00:13:35','1992-10-25 21:32:21');
/*!40000 ALTER TABLE `okved_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `inn` varchar(12) NOT NULL COMMENT 'ИНН компании',
  `type_org` enum('UL','FL') NOT NULL COMMENT 'Вид субъекта: Юридическое или Физическое лицо ',
  `date_reg` date NOT NULL COMMENT 'Дата регистрации субьекта',
  `status` enum('OPER','LIC') DEFAULT NULL COMMENT 'Статус субъекта: действующее или ликвидированное ',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `inn` (`inn`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица организаций';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org`
--

LOCK TABLES `org` WRITE;
/*!40000 ALTER TABLE `org` DISABLE KEYS */;
INSERT INTO `org` VALUES (1,'473207581538','FL','2006-08-27','OPER','1983-03-31 18:00:44','2021-10-15 17:24:47'),(2,'727145077389','FL','2009-01-29','LIC','2015-02-08 08:03:33','2021-10-15 17:24:47'),(3,'5252726368','UL','1988-08-03','LIC','1971-02-06 19:44:33','2021-10-11 10:36:00'),(4,'6457947167','UL','2001-05-04','OPER','1991-05-29 00:21:12','2021-10-11 08:12:03'),(5,'573148310830','FL','2003-02-27','OPER','1973-05-15 08:39:27','2021-10-11 08:56:06'),(6,'479311352625','FL','2014-07-11','OPER','1996-07-31 07:59:49','2021-10-11 08:56:06'),(7,'6170045295','UL','2000-12-15','LIC','1995-01-13 12:00:00','2021-10-11 08:12:03'),(8,'545438632833','FL','1996-05-18','LIC','1998-03-14 04:20:36','2021-10-11 08:56:06'),(9,'577504848993','FL','2008-05-01','OPER','1993-09-15 08:15:08','2021-10-11 08:56:06'),(10,'725383213368','FL','2014-12-19','LIC','1984-10-17 14:35:00','2021-10-11 08:56:06');
/*!40000 ALTER TABLE `org` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_inn_ins` BEFORE INSERT ON `org` FOR EACH ROW BEGIN 
	CALL check_inn (NEW.inn, NEW.type_org);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_inn_upd` BEFORE UPDATE ON `org` FOR EACH ROW BEGIN 
	CALL check_inn (NEW.inn, NEW.type_org);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reg_fss_ul`
--

DROP TABLE IF EXISTS `reg_fss_ul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reg_fss_ul` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `org_id` bigint unsigned NOT NULL COMMENT 'Ссылка на организацию',
  `number_fss` varchar(15) NOT NULL COMMENT 'Регистрациооный номер в ФСС',
  `name_fss` varchar(255) NOT NULL COMMENT 'Наименование органа ФСС',
  `date_fss` date NOT NULL COMMENT 'Дата регистрации в ФСС',
  `number_egrul` varchar(13) NOT NULL COMMENT 'Номер записи в ЕГРЮЛ',
  `date_egrul` date NOT NULL COMMENT 'Дата записи в ЕГРЮЛ',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `number_fss` (`number_fss`),
  UNIQUE KEY `number_egrul` (`number_egrul`),
  UNIQUE KEY `number_fss_2` (`number_fss`),
  KEY `reg_fss_ul_org` (`org_id`),
  CONSTRAINT `reg_fss_ul_org` FOREIGN KEY (`org_id`) REFERENCES `org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Регистрационные данные компании в Фонде социального страхования';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_fss_ul`
--

LOCK TABLES `reg_fss_ul` WRITE;
/*!40000 ALTER TABLE `reg_fss_ul` DISABLE KEYS */;
INSERT INTO `reg_fss_ul` VALUES (1,3,'630503544863051','Филиал №5 Государственного учреждения - Самарского регионального отделения Фонда социального страхования Российской Федерации','2012-01-20','2196313385222','2012-03-20','2021-10-15 22:21:20','2021-10-15 22:26:24'),(2,4,'780400737278041','Филиал №4 Санкт-Петербургского регионального отделения Фонда социального страхования Российской Федерации','2013-07-20','2207803542440','2013-07-20','2021-10-15 22:23:49','2021-10-15 22:26:24'),(3,7,'010080190601001','Государственное учреждение - региональное отделение Фонда социального страхования Российской Федерации по Республике Адыгея','2016-08-16','2050100518785','2016-08-20','2021-10-15 22:24:57','2021-10-15 22:26:24');
/*!40000 ALTER TABLE `reg_fss_ul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_pfr_ul`
--

DROP TABLE IF EXISTS `reg_pfr_ul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reg_pfr_ul` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `org_id` bigint unsigned NOT NULL COMMENT 'Ссылка на организацию',
  `number_pfr` varchar(12) NOT NULL COMMENT 'Регистрациооный номер в ПФР',
  `name_pfr` varchar(255) NOT NULL COMMENT 'Наименование органа ПФР',
  `date_pfr` date NOT NULL COMMENT 'Дата регистрации в ПФР',
  `number_egrul` varchar(13) NOT NULL COMMENT 'Номер записи в ЕГРЮЛ',
  `date_egrul` date NOT NULL COMMENT 'Дата записи в ЕГРЮЛ',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `number_pfr` (`number_pfr`),
  UNIQUE KEY `number_egrul` (`number_egrul`),
  KEY `reg_pfr_ul_org` (`org_id`),
  CONSTRAINT `reg_pfr_ul_org` FOREIGN KEY (`org_id`) REFERENCES `org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Регистрационные данные компании а Пенсионном фонде РФ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_pfr_ul`
--

LOCK TABLES `reg_pfr_ul` WRITE;
/*!40000 ALTER TABLE `reg_pfr_ul` DISABLE KEYS */;
INSERT INTO `reg_pfr_ul` VALUES (1,7,'001003050124','Государственное учреждение - Управление Пенсионного фонда Российской Федерации в Кошехабльском районе Республики Адыгея','2011-12-20','2050100509688','2011-12-20','2021-10-15 22:27:49','2021-10-15 22:28:02'),(2,4,'087803030518','Государственное учреждение - Главное Управление Пенсионного фонда РФ №2 Управление №7 по г. Москве и Московской области муниципальный район Можайский г.Москвы','2011-02-20','7197746430534','2011-02-20','2021-10-15 22:29:34','2021-10-15 22:29:48'),(3,3,'033060013520','Управление Пенсионного фонда РФ в Усть-Лабинском районе Краснодарского края','2010-11-20','2102356010800','2010-11-20','2021-10-15 22:31:09','2021-10-15 22:31:09');
/*!40000 ALTER TABLE `reg_pfr_ul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ul`
--

DROP TABLE IF EXISTS `ul`;
/*!50001 DROP VIEW IF EXISTS `ul`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ul` AS SELECT 
 1 AS `forma`,
 1 AS `name`,
 1 AS `inn`,
 1 AS `kpp`,
 1 AS `address`,
 1 AS `phone`,
 1 AS `email`,
 1 AS `date_reg`,
 1 AS `status`,
 1 AS `ogrn`,
 1 AS `oktmo_ul`,
 1 AS `okved_ul`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ul_managment`
--

DROP TABLE IF EXISTS `ul_managment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ul_managment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `org_id` bigint unsigned NOT NULL COMMENT 'Ссылка на организацию',
  `first_name` varchar(100) NOT NULL COMMENT 'Имя руководителя',
  `second_name` varchar(100) NOT NULL COMMENT 'Отчество руководителя',
  `last_name` varchar(100) NOT NULL COMMENT 'Фамилия руководителя',
  `inn_mn` varchar(12) NOT NULL COMMENT 'ИНН руководителя',
  `managment_name` varchar(100) NOT NULL COMMENT 'Должность руководителя',
  `date_mn` date NOT NULL COMMENT 'Дата назначения на должность',
  `status` enum('ACT','HIS') DEFAULT NULL COMMENT 'Статус руководителя: текущий или бывший ',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `ul_managment_org` (`org_id`),
  CONSTRAINT `ul_managment_org` FOREIGN KEY (`org_id`) REFERENCES `org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Руководители юридического лица';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ul_managment`
--

LOCK TABLES `ul_managment` WRITE;
/*!40000 ALTER TABLE `ul_managment` DISABLE KEYS */;
INSERT INTO `ul_managment` VALUES (1,1,'Cedrick','Carleton','Becker','569541779345','director','2006-11-14','ACT','2016-06-21 22:37:07','1984-06-08 20:36:33'),(2,2,'Jolie','Hilbert','Connelly','591474622486','director','1974-03-30','ACT','1980-12-30 16:37:48','2021-10-15 17:46:31'),(3,3,'Felipa','Sean','Nienow','592501712449','director','1976-05-25','ACT','1982-08-29 13:17:59','2021-10-15 17:46:31'),(4,4,'Porter','Jacques','Orn','596635232631','director','1978-12-26','ACT','1983-05-05 13:33:09','2021-10-15 17:46:31'),(5,5,'Felicity','Jordan','Langworth','576106502393','director','1995-12-22','ACT','2010-05-22 04:07:34','2021-10-15 17:46:31'),(6,6,'Ralph','Justus','Buckridge','510334307698','director','2020-04-14','ACT','1981-12-03 01:55:27','2021-10-15 17:46:31'),(7,7,'Guiseppe','Jaren','Bergnaum','573083065122','director','2010-04-30','ACT','1984-05-29 13:12:01','2021-10-15 17:46:31'),(8,8,'Enos','Alexander','Doyle','566954857063','director','2002-10-28','ACT','1995-01-11 07:27:35','1972-03-28 21:44:00'),(9,9,'Vallie','Ignatius','Langworth','519601869534','director','1983-10-09','ACT','1975-02-11 00:21:17','1974-08-08 04:10:28'),(10,10,'Miracle','Timmy','Schulist','543055037128','director','2007-04-12','ACT','2021-03-26 04:11:46','1993-10-09 20:49:49');
/*!40000 ALTER TABLE `ul_managment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ul_profile`
--

DROP TABLE IF EXISTS `ul_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ul_profile` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `org_id` bigint unsigned NOT NULL COMMENT 'Ссылка на организацию',
  `name` varchar(255) NOT NULL COMMENT 'Наименование компании',
  `forma` varchar(7) NOT NULL COMMENT 'Организационно-правовая форма компании',
  `ogrn` varchar(13) NOT NULL COMMENT 'ОГРН компании',
  `kpp` varchar(9) NOT NULL COMMENT 'КПП компании',
  `oktmo_ul` varchar(11) NOT NULL COMMENT 'ОКТМО компании',
  `okved_ul` varchar(11) NOT NULL COMMENT 'Основной ЭКВЭД компании',
  `address` varchar(255) NOT NULL COMMENT 'Адрес компании',
  `phone` char(11) NOT NULL COMMENT 'Телефон',
  `email` varchar(100) NOT NULL COMMENT 'Электронная почта',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ogrn` (`ogrn`),
  KEY `ul_profile_org` (`org_id`),
  KEY `ul_profile_oktmo_tab` (`oktmo_ul`),
  KEY `ul_profile_okved_tab` (`okved_ul`),
  CONSTRAINT `ul_profile_oktmo_tab` FOREIGN KEY (`oktmo_ul`) REFERENCES `oktmo_tab` (`oktmo`),
  CONSTRAINT `ul_profile_okved_tab` FOREIGN KEY (`okved_ul`) REFERENCES `okved_tab` (`okved`),
  CONSTRAINT `ul_profile_org` FOREIGN KEY (`org_id`) REFERENCES `org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профиль юридического лица';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ul_profile`
--

LOCK TABLES `ul_profile` WRITE;
/*!40000 ALTER TABLE `ul_profile` DISABLE KEYS */;
INSERT INTO `ul_profile` VALUES (1,3,'Ромашка','ООО','4537852756375','773895286','49489022622','23','г. Москва,ул. Советская, д. 34','84957563783','mail@mail.ru','2021-10-15 18:01:12','2021-10-15 19:00:40'),(2,4,'Альфа','АО','4588423895275','773434928','45395314328','70','г. Москва, ул. Ленина, д. 43','84953249844','alfa@mail.ru','2021-10-15 19:00:05','2021-10-15 19:01:16'),(3,7,'Бета','АО','4576259385387','773587514','49489022622','69','г. Москва, ул. Ленина, д. 48','84953249845','beta@mail.ru','2021-10-15 19:00:05','2021-10-15 19:01:16');
/*!40000 ALTER TABLE `ul_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ul_shareholders`
--

DROP TABLE IF EXISTS `ul_shareholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ul_shareholders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `org_id` bigint unsigned NOT NULL COMMENT 'Ссылка на организацию',
  `first_name` varchar(100) NOT NULL COMMENT 'Имя влательца',
  `second_name` varchar(100) NOT NULL COMMENT 'Отчество владельца',
  `last_name` varchar(100) NOT NULL COMMENT 'Фамилия владельца',
  `inn_sh` varchar(12) NOT NULL COMMENT 'ИНН владельца',
  `proc_share` decimal(3,2) unsigned NOT NULL COMMENT 'Процент доли в организации',
  `sum_share` decimal(11,2) unsigned NOT NULL COMMENT 'Сумма доли в организации в рублях',
  `date_sh` date NOT NULL COMMENT 'Дата регистрации вланиия доли',
  `status` enum('ACT','HIS') DEFAULT NULL COMMENT 'Статус владельца: текущий или бывший ',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `ul_shareholders_org` (`org_id`),
  CONSTRAINT `ul_shareholders_org` FOREIGN KEY (`org_id`) REFERENCES `org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Учредители юридического лица';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ul_shareholders`
--

LOCK TABLES `ul_shareholders` WRITE;
/*!40000 ALTER TABLE `ul_shareholders` DISABLE KEYS */;
INSERT INTO `ul_shareholders` VALUES (1,1,'Joey','Myrl','Rempel','505882208173',9.99,10000.00,'2020-07-15','ACT','2013-05-07 23:39:28','1996-03-20 15:11:01'),(2,2,'Adah','Foster','Graham','562007674187',9.99,10000.00,'2015-08-10','HIS','2010-07-29 14:44:19','1987-03-11 03:03:34'),(3,3,'Davin','Carroll','Jakubowski','512203358470',9.99,10000.00,'2016-11-21','ACT','2002-11-17 23:02:30','1972-04-28 07:56:11'),(4,4,'Lorenz','Elbert','Rowe','520715071804',9.99,10000.00,'1983-10-06','HIS','1977-05-14 10:48:55','2003-06-20 23:03:43'),(5,5,'Brenden','Humberto','Wiegand','506517691987',9.99,10000.00,'1988-11-22','HIS','1996-03-01 23:16:39','2003-03-31 06:34:37'),(6,6,'Polly','Julien','Leffler','515003064771',9.99,10000.00,'1974-03-19','HIS','1971-04-22 05:17:37','1999-10-24 12:38:47'),(7,7,'Virgil','Cleo','Cassin','532513256961',9.99,10000.00,'1991-09-08','HIS','1989-03-04 16:15:25','1995-10-30 08:28:05'),(8,8,'Gladys','Henderson','Gleason','545841135395',9.99,10000.00,'1988-09-25','ACT','1994-09-17 08:20:51','1991-08-31 08:09:52'),(9,9,'Mathilde','Shad','Crist','515380738520',9.99,10000.00,'2008-09-11','ACT','1976-11-03 00:08:39','2014-10-11 18:06:31'),(10,10,'Lindsay','Fernando','Cartwright','525543904801',9.99,10000.00,'2019-11-30','ACT','1970-06-18 20:03:59','2000-05-10 15:29:25');
/*!40000 ALTER TABLE `ul_shareholders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'listorg'
--
/*!50003 DROP PROCEDURE IF EXISTS `check_inn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_inn`(IN new_inn VARCHAR(12),IN new_type_org VARCHAR(12))
BEGIN
  	IF NOT (REGEXP_LIKE(new_inn, '^[0-9]{12}$') AND new_type_org = 'FL') 
  	AND NOT (REGEXP_LIKE(new_inn, '^[0-9]{10}$') AND new_type_org = 'UL')  		
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Не верный формат формат ИНН';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_x` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_x`(IN value INT)
BEGIN
  SET @x = value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `fl`
--

/*!50001 DROP VIEW IF EXISTS `fl`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fl` AS select `fp`.`last_name` AS `last_name`,`fp`.`first_name` AS `first_name`,`fp`.`second_name` AS `second_name`,`o`.`inn` AS `inn`,`o`.`status` AS `status`,`fp`.`ogrn` AS `ogrn`,`o`.`date_reg` AS `date_reg`,`fp`.`okved_fl` AS `okved_fl` from (`org` `o` left join `fl_profile` `fp` on((`o`.`id` = `fp`.`org_id`))) where (`o`.`type_org` = 'FL') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ul`
--

/*!50001 DROP VIEW IF EXISTS `ul`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ul` AS select `up`.`forma` AS `forma`,`up`.`name` AS `name`,`o`.`inn` AS `inn`,`up`.`kpp` AS `kpp`,`up`.`address` AS `address`,`up`.`phone` AS `phone`,`up`.`email` AS `email`,`o`.`date_reg` AS `date_reg`,`o`.`status` AS `status`,`up`.`ogrn` AS `ogrn`,`up`.`oktmo_ul` AS `oktmo_ul`,`up`.`okved_ul` AS `okved_ul` from (`org` `o` left join `ul_profile` `up` on((`o`.`id` = `up`.`org_id`))) where (`o`.`type_org` = 'UL') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-15 23:13:05
