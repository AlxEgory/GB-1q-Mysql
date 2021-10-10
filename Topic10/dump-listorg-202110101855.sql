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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Даты ликвидации субъекта';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_lic`
--

LOCK TABLES `date_lic` WRITE;
/*!40000 ALTER TABLE `date_lic` DISABLE KEYS */;
INSERT INTO `date_lic` VALUES (1,1,'1998-07-26','2018-05-05 10:47:28','1990-04-25 15:18:43'),(2,2,'2019-02-17','2019-06-27 07:07:11','1986-09-25 15:37:16'),(3,3,'2000-08-22','2005-09-02 06:52:29','1994-03-09 19:26:32'),(4,4,'2019-04-11','2015-11-23 22:24:52','2019-12-17 23:10:11'),(5,5,'1994-01-17','1974-09-12 21:03:52','2003-05-17 00:39:38'),(6,6,'2010-04-05','1998-02-06 06:32:41','1973-03-06 00:25:13'),(7,7,'1980-09-10','2006-08-10 11:29:19','2018-03-15 21:32:09'),(8,8,'2008-06-16','1975-02-02 23:47:10','2006-06-30 13:58:46'),(9,9,'1974-05-28','1998-08-21 08:18:10','1999-03-16 22:08:06'),(10,10,'1989-09-25','2019-05-02 13:25:44','1976-04-28 00:37:43');
/*!40000 ALTER TABLE `date_lic` ENABLE KEYS */;
UNLOCK TABLES;

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
  `inn_mn` varchar(12) NOT NULL COMMENT 'ИНН физического лица',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профиль физического лица лица';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_profile`
--

LOCK TABLES `fl_profile` WRITE;
/*!40000 ALTER TABLE `fl_profile` DISABLE KEYS */;
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
INSERT INTO `org` VALUES (1,'47320758157','FL','2006-08-27','OPER','1983-03-31 18:00:44','1976-01-22 04:13:28'),(2,'72714507732','FL','2009-01-29','LIC','2015-02-08 08:03:33','1976-07-24 14:22:43'),(3,'52527263647','UL','1988-08-03','LIC','1971-02-06 19:44:33','1994-11-15 03:43:06'),(4,'64579471674','UL','2001-05-04','OPER','1991-05-29 00:21:12','2000-01-08 19:18:44'),(5,'57314831086','FL','2003-02-27','OPER','1973-05-15 08:39:27','1992-07-27 17:17:10'),(6,'47931135266','FL','2014-07-11','OPER','1996-07-31 07:59:49','2011-06-13 11:16:44'),(7,'61700452951','UL','2000-12-15','LIC','1995-01-13 12:00:00','2005-02-22 21:42:30'),(8,'54543863285','FL','1996-05-18','LIC','1998-03-14 04:20:36','1990-01-26 05:37:15'),(9,'57750484895','FL','2008-05-01','OPER','1993-09-15 08:15:08','1981-03-12 22:18:26'),(10,'72538321333','FL','2014-12-19','LIC','1984-10-17 14:35:00','1999-01-28 04:40:28');
/*!40000 ALTER TABLE `org` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `ul_managment` VALUES (1,1,'Cedrick','Carleton','Becker','569541779345','director','2006-11-14','ACT','2016-06-21 22:37:07','1984-06-08 20:36:33'),(2,2,'Jolie','Hilbert','Connelly','591474622486','director','1974-03-30','HIS','1980-12-30 16:37:48','1985-01-24 09:05:37'),(3,3,'Felipa','Sean','Nienow','592501712449','director','1976-05-25','HIS','1982-08-29 13:17:59','1984-12-19 00:51:14'),(4,4,'Porter','Jacques','Orn','596635232631','director','1978-12-26','HIS','1983-05-05 13:33:09','1988-01-10 11:16:51'),(5,5,'Felicity','Jordan','Langworth','576106502393','director','1995-12-22','HIS','2010-05-22 04:07:34','1977-09-06 05:16:27'),(6,6,'Ralph','Justus','Buckridge','510334307698','director','2020-04-14','HIS','1981-12-03 01:55:27','1973-12-10 09:20:02'),(7,7,'Guiseppe','Jaren','Bergnaum','573083065122','director','2010-04-30','HIS','1984-05-29 13:12:01','1974-10-24 03:15:41'),(8,8,'Enos','Alexander','Doyle','566954857063','director','2002-10-28','ACT','1995-01-11 07:27:35','1972-03-28 21:44:00'),(9,9,'Vallie','Ignatius','Langworth','519601869534','director','1983-10-09','ACT','1975-02-11 00:21:17','1974-08-08 04:10:28'),(10,10,'Miracle','Timmy','Schulist','543055037128','director','2007-04-12','ACT','2021-03-26 04:11:46','1993-10-09 20:49:49');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профиль юридического лица';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ul_profile`
--

LOCK TABLES `ul_profile` WRITE;
/*!40000 ALTER TABLE `ul_profile` DISABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-10 18:55:19
