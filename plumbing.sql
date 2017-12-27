-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: plumbing
-- ------------------------------------------------------
-- Server version	5.7.11-0ubuntu6

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backend_access_log`
--

DROP TABLE IF EXISTS `backend_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_access_log`
--

LOCK TABLES `backend_access_log` WRITE;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` VALUES (1,1,'127.0.0.1','2017-12-24 10:16:28','2017-12-24 10:16:28'),(2,1,'127.0.0.1','2017-12-26 00:16:03','2017-12-26 00:16:03');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_groups`
--

DROP TABLE IF EXISTS `backend_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_groups`
--

LOCK TABLES `backend_user_groups` WRITE;
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` VALUES (1,'Owners',NULL,'2017-12-21 22:34:04','2017-12-21 22:34:04','owners','Default group for website owners.',0);
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_preferences`
--

DROP TABLE IF EXISTS `backend_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_preferences`
--

LOCK TABLES `backend_user_preferences` WRITE;
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_throttle`
--

DROP TABLE IF EXISTS `backend_user_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_throttle`
--

LOCK TABLES `backend_user_throttle` WRITE;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` VALUES (1,1,'127.0.0.1',0,NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users`
--

DROP TABLE IF EXISTS `backend_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users`
--

LOCK TABLES `backend_users` WRITE;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` VALUES (1,'Admin','Person','admin','bashconsole@gmail.com','$2y$10$PApg9oY/psnfMjeo/QYW7eIe4oehF7MnYHBUwvYfzIwR.Y59CYlz.',NULL,'$2y$10$uq2Y14DXvPZxUfKIQmIy4uvmJjM1MwY2.KpBnSzdBj//ufMKp1pce',NULL,'',1,NULL,'2017-12-26 00:16:03','2017-12-21 22:34:04','2017-12-26 00:16:03',1);
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users_groups`
--

DROP TABLE IF EXISTS `backend_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users_groups`
--

LOCK TABLES `backend_users_groups` WRITE;
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` VALUES (1,1);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_data`
--

DROP TABLE IF EXISTS `cms_theme_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_data`
--

LOCK TABLES `cms_theme_data` WRITE;
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
INSERT INTO `cms_theme_data` VALUES (1,'laratify-octobercms-octaskin-master','{\"website_name\":\"Plumbing AB\",\"website_author\":\"bashconsole\",\"website_url\":\"http:\\/\\/plumbing.bashconsole.org\",\"description\":\"Modern and Clean responsive design.\",\"keywords\":\"october,octobercms,plumbing\",\"load_google_fonts\":\"1\",\"google_font_family\":\"Roboto+Slab:300,400,700|Raleway:300,300i,400,400i,700,700i\",\"load_fontawesome\":\"1\",\"load_material_icons\":\"1\",\"load_stroke7_icons\":\"1\",\"load_jQuery\":\"1\",\"jQuery_version\":\"2.2.4\",\"load_octobercms_framework\":\"1\",\"primary_color\":\"#ff5722\",\"secondary_color\":\"#2196f3\",\"navigation_background_color\":\"#ff5722\",\"navigation_text_color\":\"#ffffff\",\"slideshow_background_color\":\"#455a64\",\"slideshow_text_color\":\"#ffffff\",\"header_background_color\":\"#37474f\",\"header_text_color\":\"#ffffff\",\"feature_background_color\":\"#ffffff\",\"feature_text_color\":\"#686868\",\"utility_background_color\":\"#eceff1\",\"utility_text_color\":\"#686868\",\"mainpage_background_color\":\"#ffffff\",\"mainpage_text_color\":\"#686868\",\"bottom_background_color\":\"#eceff1\",\"bottom_text_color\":\"#686868\",\"extension_background_color\":\"#ffffff\",\"extension_text_color\":\"#686868\",\"footer_background_color\":\"#455a64\",\"footer_text_color\":\"#b0bec5\",\"copyright_background_color\":\"#37474f\",\"copyright_text_color\":\"#78909c\",\"load_animate_css\":\"1\",\"load_wow_js\":\"1\",\"load_owl_carousel\":\"1\",\"custom_css\":\"\",\"custom_js\":\"\"}','2017-12-24 10:49:36','2017-12-26 22:10:54');
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_logs`
--

DROP TABLE IF EXISTS `cms_theme_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `old_content` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_logs`
--

LOCK TABLES `cms_theme_logs` WRITE;
/*!40000 ALTER TABLE `cms_theme_logs` DISABLE KEYS */;
INSERT INTO `cms_theme_logs` VALUES (1,'update','laratify-octobercms-octaskin-master','pages/contact.htm','pages/contact.htm','title = \"Contact\"\nurl = \"/contact\"\nlayout = \"octaskin\"\nis_hidden = 0\n\n[contactform]\n==\n<section id=\"lt-header\" class=\"lt-section lt-section-fullwidth section\">\r\n  <div class=\"lt-container container\">\r\n    <div class=\"lt-content lt-header-content\">\r\n      {% partial \"pages-contact/header\" %}\r\n    </div>\r\n  </div>\r\n</section>\r\n\r\n<section id=\"lt-mainpage\" class=\"lt-section section\">\r\n  <div class=\"lt-container container\">\r\n    <div class=\"lt-content lt-mainpage-content\">\r\n      {% partial \"pages-contact/mainpage\" %}\r\n    </div>\r\n  </div>\r\n</section>','title = \"Contact\"\nurl = \"/contact\"\nlayout = \"octaskin\"\nis_hidden = 0\n==\n\n<section id=\"lt-header\" class=\"lt-section lt-section-fullwidth section\">\n  <div class=\"lt-container container\">\n    <div class=\"lt-content lt-header-content\">\n      {% partial \"pages-contact/header\" %}\n    </div>\n  </div>\n</section>\n\n<section id=\"lt-mainpage\" class=\"lt-section section\">\n  <div class=\"lt-container container\">\n    <div class=\"lt-content lt-mainpage-content\">\n      {% partial \"pages-contact/mainpage\" %}\n    </div>\n  </div>\n</section>',1,'2017-12-26 22:32:07','2017-12-26 22:32:07');
/*!40000 ALTER TABLE `cms_theme_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deferred_bindings`
--

DROP TABLE IF EXISTS `deferred_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deferred_bindings`
--

LOCK TABLES `deferred_bindings` WRITE;
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `janvince_smallcontactform_messages`
--

DROP TABLE IF EXISTS `janvince_smallcontactform_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `janvince_smallcontactform_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `form_data` text COLLATE utf8_unicode_ci,
  `new_message` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remote_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `janvince_smallcontactform_messages_remote_ip_index` (`remote_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janvince_smallcontactform_messages`
--

LOCK TABLES `janvince_smallcontactform_messages` WRITE;
/*!40000 ALTER TABLE `janvince_smallcontactform_messages` DISABLE KEYS */;
INSERT INTO `janvince_smallcontactform_messages` VALUES (1,'test message',NULL,'test message','{\"Message\":\"test message\"}',1,'2017-12-26 22:35:12','2017-12-26 22:35:12','127.0.0.1'),(2,'my test final message',NULL,'my test final message','{\"Message\":\"my test final message\"}',1,'2017-12-26 22:36:50','2017-12-26 22:36:50','127.0.0.1'),(3,'ajax test message',NULL,'ajax test message','{\"Message\":\"ajax test message\"}',1,'2017-12-26 22:39:42','2017-12-26 22:39:42','127.0.0.1');
/*!40000 ALTER TABLE `janvince_smallcontactform_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `martin_forms_records`
--

DROP TABLE IF EXISTS `martin_forms_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `martin_forms_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '(Empty)',
  `form_data` text COLLATE utf8_unicode_ci,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `martin_forms_records`
--

LOCK TABLES `martin_forms_records` WRITE;
/*!40000 ALTER TABLE `martin_forms_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `martin_forms_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2013_10_01_000001_Db_Deferred_Bindings',1),('2013_10_01_000002_Db_System_Files',1),('2013_10_01_000003_Db_System_Plugin_Versions',1),('2013_10_01_000004_Db_System_Plugin_History',1),('2013_10_01_000005_Db_System_Settings',1),('2013_10_01_000006_Db_System_Parameters',1),('2013_10_01_000007_Db_System_Add_Disabled_Flag',1),('2013_10_01_000008_Db_System_Mail_Templates',1),('2013_10_01_000009_Db_System_Mail_Layouts',1),('2014_10_01_000010_Db_Jobs',1),('2014_10_01_000011_Db_System_Event_Logs',1),('2014_10_01_000012_Db_System_Request_Logs',1),('2014_10_01_000013_Db_System_Sessions',1),('2015_10_01_000014_Db_System_Mail_Layout_Rename',1),('2015_10_01_000015_Db_System_Add_Frozen_Flag',1),('2015_10_01_000016_Db_Cache',1),('2015_10_01_000017_Db_System_Revisions',1),('2015_10_01_000018_Db_FailedJobs',1),('2016_10_01_000019_Db_System_Plugin_History_Detail_Text',1),('2016_10_01_000020_Db_System_Timestamp_Fix',1),('2013_10_01_000001_Db_Backend_Users',2),('2013_10_01_000002_Db_Backend_User_Groups',2),('2013_10_01_000003_Db_Backend_Users_Groups',2),('2013_10_01_000004_Db_Backend_User_Throttle',2),('2014_01_04_000005_Db_Backend_User_Preferences',2),('2014_10_01_000006_Db_Backend_Access_Log',2),('2014_10_01_000007_Db_Backend_Add_Description_Field',2),('2015_10_01_000008_Db_Backend_Add_Superuser_Flag',2),('2016_10_01_000009_Db_Backend_Timestamp_Fix',2),('2014_10_01_000001_Db_Cms_Theme_Data',3),('2016_10_01_000002_Db_Cms_Timestamp_Fix',3),('2017_10_01_000003_Db_Cms_Theme_Logs',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_attributes`
--

DROP TABLE IF EXISTS `rainlab_translate_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute_data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_attributes_locale_index` (`locale`),
  KEY `rainlab_translate_attributes_model_id_index` (`model_id`),
  KEY `rainlab_translate_attributes_model_type_index` (`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_attributes`
--

LOCK TABLES `rainlab_translate_attributes` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_translate_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_indexes`
--

DROP TABLE IF EXISTS `rainlab_translate_indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_indexes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_indexes_locale_index` (`locale`),
  KEY `rainlab_translate_indexes_model_id_index` (`model_id`),
  KEY `rainlab_translate_indexes_model_type_index` (`model_type`),
  KEY `rainlab_translate_indexes_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_indexes`
--

LOCK TABLES `rainlab_translate_indexes` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_indexes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_translate_indexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_locales`
--

DROP TABLE IF EXISTS `rainlab_translate_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_locales_code_index` (`code`),
  KEY `rainlab_translate_locales_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_locales`
--

LOCK TABLES `rainlab_translate_locales` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_locales` DISABLE KEYS */;
INSERT INTO `rainlab_translate_locales` VALUES (1,'en','English',1,1,1);
/*!40000 ALTER TABLE `rainlab_translate_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_translate_messages`
--

DROP TABLE IF EXISTS `rainlab_translate_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_translate_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_messages_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_translate_messages`
--

LOCK TABLES `rainlab_translate_messages` WRITE;
/*!40000 ALTER TABLE `rainlab_translate_messages` DISABLE KEYS */;
INSERT INTO `rainlab_translate_messages` VALUES (1,'emal','{\"x\":\"Emal\"}'),(2,'message','{\"x\":\"Message\"}'),(3,'email','{\"x\":\"Email\"}');
/*!40000 ALTER TABLE `rainlab_translate_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_event_logs`
--

DROP TABLE IF EXISTS `system_event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_event_logs`
--

LOCK TABLES `system_event_logs` WRITE;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
INSERT INTO `system_event_logs` VALUES (1,'error','exception \'RuntimeException\' with message \'The source file \"/var/www/october/plumbing/themes/laratify-octobercms-octaskin-master/assets/js/bootstrap.min.js\" does not exist.\' in /var/www/october/plumbing/vendor/kriswallsmith/assetic/src/Assetic/Asset/FileAsset.php:73\nStack trace:\n#0 /var/www/october/plumbing/vendor/kriswallsmith/assetic/src/Assetic/Asset/AssetCache.php(112): Assetic\\Asset\\FileAsset->getLastModified()\n#1 /var/www/october/plumbing/vendor/kriswallsmith/assetic/src/Assetic/Factory/AssetFactory.php(255): Assetic\\Asset\\AssetCache->getLastModified()\n#2 /var/www/october/plumbing/modules/system/classes/CombineAssets.php(369): Assetic\\Factory\\AssetFactory->getLastModified(Object(Assetic\\Asset\\AssetCollection))\n#3 /var/www/october/plumbing/modules/system/classes/CombineAssets.php(182): System\\Classes\\CombineAssets->prepareRequest(Array, \'/var/www/octobe...\')\n#4 /var/www/october/plumbing/modules/cms/classes/Controller.php(1166): System\\Classes\\CombineAssets::combine(Array, \'/var/www/octobe...\')\n#5 /var/www/october/plumbing/modules/cms/twig/Extension.php(187): Cms\\Classes\\Controller->themeUrl(Array)\n#6 /var/www/october/plumbing/storage/cms/twig/c7/c7a970de08142f09a55739086e8a8e5a7c39beea2f2c2b00366eb108842136ee.php(29): Cms\\Twig\\Extension->themeFilter(Array)\n#7 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(432): __TwigTemplate_6fc333ded1683caa534b7b232bc7cd2b5ec12d8e52aa29438fdfabc19b74812f->doDisplay(Array, Array)\n#8 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#9 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#10 /var/www/october/plumbing/modules/cms/classes/Controller.php(912): Twig_Template->render(Array)\n#11 /var/www/october/plumbing/modules/cms/twig/Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'pages-contact/m...\', Array)\n#12 /var/www/october/plumbing/storage/cms/twig/40/409e677ced7da39ed7255f9d57d76701e68986f36c8c4feb4df2d6f47bf428b1.php(38): Cms\\Twig\\Extension->partialFunction(\'pages-contact/m...\', Array)\n#13 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(432): __TwigTemplate_7c10499212ffdde1bd1776a21a1ac83520d975e06a2f08464cfefb9025106533->doDisplay(Array, Array)\n#14 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#15 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#16 /var/www/october/plumbing/modules/cms/classes/Controller.php(366): Twig_Template->render(Array)\n#17 /var/www/october/plumbing/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#18 /var/www/october/plumbing/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact\')\n#19 [internal function]: Cms\\Classes\\CmsController->run(\'contact\')\n#20 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#21 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#22 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#23 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#29 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#30 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#31 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#39 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#42 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#45 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#48 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#51 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#54 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#57 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#59 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#60 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#61 /var/www/october/plumbing/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#62 {main}\n\nNext exception \'Twig_Error_Runtime\' with message \'An exception has been thrown during the rendering of a template (\"The source file \"/var/www/october/plumbing/themes/laratify-octobercms-octaskin-master/assets/js/bootstrap.min.js\" does not exist.\") in \"/var/www/october/plumbing/themes/laratify-octobercms-octaskin-master/partials/pages-contact/mainpage.htm\" at line 9.\' in /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php:447\nStack trace:\n#0 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#2 /var/www/october/plumbing/modules/cms/classes/Controller.php(912): Twig_Template->render(Array)\n#3 /var/www/october/plumbing/modules/cms/twig/Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'pages-contact/m...\', Array)\n#4 /var/www/october/plumbing/storage/cms/twig/40/409e677ced7da39ed7255f9d57d76701e68986f36c8c4feb4df2d6f47bf428b1.php(38): Cms\\Twig\\Extension->partialFunction(\'pages-contact/m...\', Array)\n#5 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(432): __TwigTemplate_7c10499212ffdde1bd1776a21a1ac83520d975e06a2f08464cfefb9025106533->doDisplay(Array, Array)\n#6 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#7 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#8 /var/www/october/plumbing/modules/cms/classes/Controller.php(366): Twig_Template->render(Array)\n#9 /var/www/october/plumbing/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#10 /var/www/october/plumbing/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact\')\n#11 [internal function]: Cms\\Classes\\CmsController->run(\'contact\')\n#12 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#13 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#14 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#15 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#17 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#21 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#22 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#23 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#24 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#31 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#37 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#40 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#43 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#46 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#49 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#51 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 /var/www/october/plumbing/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 {main}',NULL,'2017-12-26 20:22:26','2017-12-26 20:22:26'),(2,'error','exception \'October\\Rain\\Exception\\SystemException\' with message \'Class name is not registered for the component \"JanVince\\SmallContactForm\\Components\\SmallContactForm\". Check the component plugin.\' in /var/www/october/plumbing/modules/cms/classes/ComponentManager.php:200\nStack trace:\n#0 /var/www/october/plumbing/modules/cms/classes/Controller.php(881): Cms\\Classes\\ComponentManager->makeComponent(\'JanVince\\\\SmallC...\', Object(Cms5a429a47c8338887699704_ae633589d620eb4da404e7e2f87070b6Class), Array)\n#1 /var/www/october/plumbing/modules/cms/twig/Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'pages-contact/m...\', Array)\n#2 /var/www/october/plumbing/storage/cms/twig/40/409e677ced7da39ed7255f9d57d76701e68986f36c8c4feb4df2d6f47bf428b1.php(38): Cms\\Twig\\Extension->partialFunction(\'pages-contact/m...\', Array)\n#3 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(432): __TwigTemplate_7c10499212ffdde1bd1776a21a1ac83520d975e06a2f08464cfefb9025106533->doDisplay(Array, Array)\n#4 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#5 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#6 /var/www/october/plumbing/modules/cms/classes/Controller.php(366): Twig_Template->render(Array)\n#7 /var/www/october/plumbing/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#8 /var/www/october/plumbing/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact\')\n#9 [internal function]: Cms\\Classes\\CmsController->run(\'contact\')\n#10 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#11 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#12 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#13 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#15 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#17 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#19 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#20 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#21 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#22 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#24 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#26 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#28 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#29 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#32 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#35 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#38 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#41 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#44 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#47 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#49 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#50 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#51 /var/www/october/plumbing/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#52 {main}\n\nNext exception \'Twig_Error_Runtime\' with message \'An exception has been thrown during the rendering of a template (\"Class name is not registered for the component \"JanVince\\SmallContactForm\\Components\\SmallContactForm\". Check the component plugin.\") in \"/var/www/october/plumbing/themes/laratify-octobercms-octaskin-master/pages/contact.htm\" at line 12.\' in /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php:447\nStack trace:\n#0 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#2 /var/www/october/plumbing/modules/cms/classes/Controller.php(366): Twig_Template->render(Array)\n#3 /var/www/october/plumbing/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 /var/www/october/plumbing/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'contact\')\n#6 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#7 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#15 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#16 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#31 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#34 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#37 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#40 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 /var/www/october/plumbing/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}',NULL,'2017-12-26 21:19:00','2017-12-26 21:19:00'),(3,'error','exception \'October\\Rain\\Exception\\SystemException\' with message \'Class name is not registered for the component \"JanVince\\SmallContactForm\\Components\\SmallContactForm\". Check the component plugin.\' in /var/www/october/plumbing/modules/cms/classes/ComponentManager.php:200\nStack trace:\n#0 /var/www/october/plumbing/modules/cms/classes/Controller.php(881): Cms\\Classes\\ComponentManager->makeComponent(\'JanVince\\\\SmallC...\', Object(Cms5a429a47c8338887699704_ae633589d620eb4da404e7e2f87070b6Class), Array)\n#1 /var/www/october/plumbing/modules/cms/twig/Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'pages-contact/m...\', Array)\n#2 /var/www/october/plumbing/storage/cms/twig/40/409e677ced7da39ed7255f9d57d76701e68986f36c8c4feb4df2d6f47bf428b1.php(38): Cms\\Twig\\Extension->partialFunction(\'pages-contact/m...\', Array)\n#3 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(432): __TwigTemplate_7c10499212ffdde1bd1776a21a1ac83520d975e06a2f08464cfefb9025106533->doDisplay(Array, Array)\n#4 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#5 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#6 /var/www/october/plumbing/modules/cms/classes/Controller.php(366): Twig_Template->render(Array)\n#7 /var/www/october/plumbing/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#8 /var/www/october/plumbing/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact\')\n#9 [internal function]: Cms\\Classes\\CmsController->run(\'contact\')\n#10 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#11 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#12 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#13 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#15 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#17 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#19 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#20 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#21 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#22 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#24 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#26 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#28 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#29 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#32 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#35 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#38 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#41 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#44 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#47 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#49 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#50 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#51 /var/www/october/plumbing/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#52 {main}\n\nNext exception \'Twig_Error_Runtime\' with message \'An exception has been thrown during the rendering of a template (\"Class name is not registered for the component \"JanVince\\SmallContactForm\\Components\\SmallContactForm\". Check the component plugin.\") in \"/var/www/october/plumbing/themes/laratify-octobercms-octaskin-master/pages/contact.htm\" at line 12.\' in /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php:447\nStack trace:\n#0 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#2 /var/www/october/plumbing/modules/cms/classes/Controller.php(366): Twig_Template->render(Array)\n#3 /var/www/october/plumbing/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 /var/www/october/plumbing/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'contact\')\n#6 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#7 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#15 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#16 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#31 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#34 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#37 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#40 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 /var/www/october/plumbing/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}',NULL,'2017-12-26 21:19:13','2017-12-26 21:19:13'),(4,'error','exception \'Cms\\Classes\\CmsException\' with message \'The partial \'contactForm\' is not found.\' in /var/www/october/plumbing/modules/cms/classes/Controller.php:852\nStack trace:\n#0 /var/www/october/plumbing/modules/cms/twig/Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'contactForm\', Array)\n#1 /var/www/october/plumbing/storage/cms/twig/40/409e677ced7da39ed7255f9d57d76701e68986f36c8c4feb4df2d6f47bf428b1.php(38): Cms\\Twig\\Extension->partialFunction(\'contactForm\', Array)\n#2 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(432): __TwigTemplate_7c10499212ffdde1bd1776a21a1ac83520d975e06a2f08464cfefb9025106533->doDisplay(Array, Array)\n#3 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#4 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#5 /var/www/october/plumbing/modules/cms/classes/Controller.php(366): Twig_Template->render(Array)\n#6 /var/www/october/plumbing/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#7 /var/www/october/plumbing/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact\')\n#8 [internal function]: Cms\\Classes\\CmsController->run(\'contact\')\n#9 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#10 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#12 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 /var/www/october/plumbing/plugins/rainlab/translate/classes/LocaleMiddleware.php(24): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 [internal function]: RainLab\\Translate\\Classes\\LocaleMiddleware->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#16 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#17 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#21 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#22 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#23 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#24 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#31 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#37 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#40 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#43 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#46 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#49 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#51 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 /var/www/october/plumbing/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 {main}\n\nNext exception \'Twig_Error_Runtime\' with message \'An exception has been thrown during the rendering of a template (\"The partial \'contactForm\' is not found.\") in \"/var/www/october/plumbing/themes/laratify-octobercms-octaskin-master/pages/contact.htm\" at line 12.\' in /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php:447\nStack trace:\n#0 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 /var/www/october/plumbing/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#2 /var/www/october/plumbing/modules/cms/classes/Controller.php(366): Twig_Template->render(Array)\n#3 /var/www/october/plumbing/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 /var/www/october/plumbing/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'contact\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'contact\')\n#6 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#7 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 /var/www/october/plumbing/plugins/rainlab/translate/classes/LocaleMiddleware.php(24): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 [internal function]: RainLab\\Translate\\Classes\\LocaleMiddleware->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#13 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#14 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#16 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(69): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#18 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#19 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#20 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(675): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#28 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#31 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#34 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#37 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#40 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#43 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#46 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 /var/www/october/plumbing/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#50 /var/www/october/plumbing/index.php(44): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#51 {main}',NULL,'2017-12-26 22:33:24','2017-12-26 22:33:24'),(5,'warning','SMALL CONTACT FORM WARNING: Found a non-defined field in sent data! Field name: Your_email and value: zubivsky@gmail.com',NULL,'2017-12-26 22:35:12','2017-12-26 22:35:12'),(6,'error','SMALL CONTACT FORM ERROR: Email to send autoreply is not valid!\n Data: {\"_handler\":{\"value\":\"contactForm::onFormSend\",\"error\":\"\"},\"_session_key\":{\"value\":\"mAzp0SzQ5ulsYkNDLGQMkg9vxl1tWM0s4WLXS9Bs\",\"error\":\"\"},\"_token\":{\"value\":\"mOgWGJZuAHFY3bdUI6GhdEnMphZOVNumaQOpB0TD\",\"error\":\"\"},\"Your_email\":{\"value\":\"zubivsky@gmail.com\",\"error\":\"\"},\"Message\":{\"value\":\"test message\",\"error\":\"\"}}',NULL,'2017-12-26 22:35:12','2017-12-26 22:35:12'),(7,'warning','SMALL CONTACT FORM WARNING: Found a non-defined field in sent data! Field name: Your_email and value: zubovsky@gmail.com',NULL,'2017-12-26 22:36:49','2017-12-26 22:36:49'),(8,'error','SMALL CONTACT FORM ERROR: Email to send autoreply is not valid!\n Data: {\"_handler\":{\"value\":\"contactForm::onFormSend\",\"error\":\"\"},\"_session_key\":{\"value\":\"3l3aaVjIBfoyZCIPkXN6Qfh4opX4xSjkMG08xeL4\",\"error\":\"\"},\"_token\":{\"value\":\"mOgWGJZuAHFY3bdUI6GhdEnMphZOVNumaQOpB0TD\",\"error\":\"\"},\"Your_email\":{\"value\":\"zubovsky@gmail.com\",\"error\":\"\"},\"Message\":{\"value\":\"my test final message\",\"error\":\"\"}}',NULL,'2017-12-26 22:36:50','2017-12-26 22:36:50'),(9,'warning','SMALL CONTACT FORM WARNING: Found a non-defined field in sent data! Field name: Your_email and value: bashconsole@gmail.com',NULL,'2017-12-26 22:39:42','2017-12-26 22:39:42'),(10,'error','SMALL CONTACT FORM ERROR: Contact form data have no email to send autoreply message!',NULL,'2017-12-26 22:39:42','2017-12-26 22:39:42');
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_files`
--

DROP TABLE IF EXISTS `system_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_files`
--

LOCK TABLES `system_files` WRITE;
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_layouts`
--

DROP TABLE IF EXISTS `system_mail_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_layouts`
--

LOCK TABLES `system_mail_layouts` WRITE;
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` VALUES (1,'Default','default','<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n    </body>\n</html>','{{ content|raw }}','a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}',1,'2017-12-21 22:34:04','2017-12-21 22:34:04'),(2,'System','system','<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>','{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}',1,'2017-12-21 22:34:04','2017-12-21 22:34:04');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_templates`
--

DROP TABLE IF EXISTS `system_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_templates`
--

LOCK TABLES `system_mail_templates` WRITE;
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
INSERT INTO `system_mail_templates` VALUES (1,'backend::mail.invite',NULL,'Invitation for newly created administrators.',NULL,NULL,2,0,'2017-12-26 21:07:38','2017-12-26 21:07:38'),(2,'backend::mail.restore',NULL,'Password reset instructions for backend-end administrators.',NULL,NULL,2,0,'2017-12-26 21:07:38','2017-12-26 21:07:38'),(4,'martin.forms::mail.notification',NULL,'Notify when a form is submited',NULL,NULL,1,0,'2017-12-26 21:07:38','2017-12-26 21:07:38'),(5,'martin.forms::mail.autoresponse',NULL,'Auto-Response when a form is submited',NULL,NULL,1,0,'2017-12-26 21:07:38','2017-12-26 21:07:38'),(6,'janvince.smallcontactform::mail.autoreply',NULL,'Form autoreply message (English)',NULL,NULL,1,0,'2017-12-26 21:07:38','2017-12-26 21:07:38'),(7,'janvince.smallcontactform::mail.notification',NULL,'Form notification message (English)',NULL,NULL,1,0,'2017-12-26 21:07:38','2017-12-26 21:07:38');
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_parameters`
--

DROP TABLE IF EXISTS `system_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_parameters`
--

LOCK TABLES `system_parameters` WRITE;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` VALUES (1,'system','update','count','0'),(2,'system','update','retry','1514341684'),(3,'cms','theme','active','\"laratify-octobercms-octaskin-master\"');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_history`
--

DROP TABLE IF EXISTS `system_plugin_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_history`
--

LOCK TABLES `system_plugin_history` WRITE;
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` VALUES (1,'October.Demo','comment','1.0.1','First version of Demo','2017-12-21 22:34:04'),(2,'JanVince.SmallContactForm','script','1.0.0','scf_tables.php','2017-12-24 23:54:23'),(3,'JanVince.SmallContactForm','comment','1.0.0','First version of Small Contact Form plugin','2017-12-24 23:54:23'),(4,'JanVince.SmallContactForm','script','1.0.1','Fix in README.md','2017-12-24 23:54:23'),(5,'JanVince.SmallContactForm','comment','1.0.1','Fix form hiding after successful send','2017-12-24 23:54:23'),(6,'JanVince.SmallContactForm','comment','1.0.2','Fix some typos and add LICENCE file (thanks Szabó Gergő)','2017-12-24 23:54:23'),(7,'JanVince.SmallContactForm','script','1.1.0','Added permission to delete records','2017-12-24 23:54:23'),(8,'JanVince.SmallContactForm','comment','1.1.0','Added function to delete records in Messages list','2017-12-24 23:54:23'),(9,'JanVince.SmallContactForm','comment','1.2.0','Added dashboard report widgets (Stats and New messages)','2017-12-24 23:54:23'),(10,'JanVince.SmallContactForm','comment','1.2.1','Mail templates now render values with {{ values|raw }}','2017-12-24 23:54:23'),(11,'JanVince.SmallContactForm','comment','1.2.2','Mail templates convert new lines to <br> with {{ values|raw|nl2br }}','2017-12-24 23:54:23'),(12,'JanVince.SmallContactForm','comment','1.2.3','Fields mapping moved to separate tab *Columns mapping*','2017-12-24 23:54:23'),(13,'JanVince.SmallContactForm','comment','1.2.4','Updated README.md with assets usage example','2017-12-24 23:54:23'),(14,'JanVince.SmallContactForm','script','1.2.5','And Messages list column to show senders IP address (invisible by default)','2017-12-24 23:54:23'),(15,'JanVince.SmallContactForm','script','1.2.5','scf_tables_02.php','2017-12-24 23:54:24'),(16,'JanVince.SmallContactForm','comment','1.2.5','Added IP protection function (limit too many submits from one IP address)','2017-12-24 23:54:24'),(17,'JanVince.SmallContactForm','comment','1.2.6','Fixed IP protection error message','2017-12-24 23:54:24'),(18,'JanVince.SmallContactForm','comment','1.2.7','Changed remote_ip column type to string','2017-12-24 23:54:24'),(19,'JanVince.SmallContactForm','comment','1.2.8','Added option to use placeholders instead of labels','2017-12-24 23:54:24'),(20,'JanVince.SmallContactForm','script','1.3.0','Fixed some typos','2017-12-24 23:54:25'),(21,'JanVince.SmallContactForm','comment','1.3.0','Added translation support for Rainlab Translate plugin','2017-12-24 23:54:25'),(22,'JanVince.SmallContactForm','comment','1.3.1','Added default value for getTranslated() method','2017-12-24 23:54:25'),(23,'JanVince.SmallContactForm','comment','1.3.2','Added custom send button wrapper class','2017-12-24 23:54:25'),(24,'JanVince.SmallContactForm','comment','1.4.0','Added redirect option after successful submit (internal and external URL)','2017-12-24 23:54:25'),(25,'JanVince.SmallContactForm','comment','1.4.1','Minor UI fix (thanks Szabó Gergő)','2017-12-24 23:54:25'),(26,'JanVince.SmallContactForm','comment','1.4.2','Added support for default translated mail templates (Czech and English for now)','2017-12-24 23:54:25'),(27,'JanVince.SmallContactForm','comment','1.4.3','Fixed translation of mail templates description in Settings > Mail templates','2017-12-24 23:54:25'),(28,'JanVince.SmallContactForm','comment','1.4.4','Fixed array of enabledLocales','2017-12-24 23:54:25'),(29,'JanVince.SmallContactForm','script','1.4.5','Added default EN locale to enabled locales array','2017-12-24 23:54:25'),(30,'JanVince.SmallContactForm','comment','1.4.5','Fixed email template check','2017-12-24 23:54:25'),(31,'JanVince.SmallContactForm','comment','1.4.6','Removed field type restriction for Fields mapping','2017-12-24 23:54:25'),(32,'JanVince.SmallContactForm','comment','1.4.7','Removed hardcoded date format for created_at column in messages list, updated README and added hungarian language (thanks Szabó Gergő for all this)','2017-12-24 23:54:25'),(33,'JanVince.SmallContactForm','script','1.4.8','Added checkbox field type','2017-12-24 23:54:25'),(34,'JanVince.SmallContactForm','script','1.4.8','Scoreboard last message time format (thanks Szabó Gergő)','2017-12-24 23:54:25'),(35,'JanVince.SmallContactForm','comment','1.4.8','Changes to allow multiple use of contact form (form and message blocks has now unique IDs)','2017-12-24 23:54:25'),(36,'JanVince.SmallContactForm','comment','1.4.9','Added scoreboard button to quickly open form settings','2017-12-24 23:54:26'),(37,'JanVince.SmallContactForm','comment','1.4.10','Fixed typo in lang filename','2017-12-24 23:54:26'),(38,'JanVince.SmallContactForm','script','1.4.11','Updated default autoreply mail templates to include fieldsDetail array','2017-12-24 23:54:26'),(39,'JanVince.SmallContactForm','script','1.4.11','Added function to detect non-defined fields in sent data','2017-12-24 23:54:26'),(40,'JanVince.SmallContactForm','script','1.4.11','Updated README.md file','2017-12-24 23:54:26'),(41,'JanVince.SmallContactForm','comment','1.4.11','Added \"fieldsDetails\" array to all email templates to have access to field labels, types and more','2017-12-24 23:54:26'),(42,'JanVince.SmallContactForm','script','1.5.0','Fixed some typos','2017-12-24 23:54:26'),(43,'JanVince.SmallContactForm','script','1.5.0','Updated README.md file','2017-12-24 23:54:27'),(44,'JanVince.SmallContactForm','comment','1.5.0','Added some component hacking options (override autoreply and notification emails and template, disable fields)','2017-12-24 23:54:27'),(45,'JanVince.SmallContactForm','comment','1.5.1','Fixed flash message visibility when where are some errors','2017-12-24 23:54:27'),(46,'JanVince.SmallContactForm','comment','1.5.2','Fixed flash error for IP protection visibility','2017-12-24 23:54:27'),(47,'JanVince.SmallContactForm','comment','1.5.3','Added option for notification emails to have FROM address set from contact form email field','2017-12-24 23:54:27'),(48,'JanVince.SmallContactForm','comment','1.5.4','Added option to mark selected messages as read','2017-12-24 23:54:27'),(49,'JanVince.SmallContactForm','comment','1.5.5','Changed JSON type for repeater DB column','2017-12-24 23:54:27'),(50,'JanVince.SmallContactForm','comment','1.5.6','Removed value attribute in textarea field','2017-12-24 23:54:27'),(51,'JanVince.SmallContactForm','comment','1.5.7','Added component alias to id attributes for multi-form usage','2017-12-24 23:54:27'),(52,'JanVince.SmallContactForm','comment','1.5.8','Fixed typo in lang files','2017-12-24 23:54:27'),(53,'DevINX.ContactUs','comment','1.0.0','First Version','2017-12-26 00:16:42'),(54,'DevINX.ContactUs','comment','1.0.1','Bug fix while in settings','2017-12-26 00:16:42'),(55,'DevINX.ContactUs','comment','1.0.2','Bug fix - the configuration text displayed HTML and not rendered HTML','2017-12-26 00:16:42'),(56,'Martin.Forms','script','1.0.0','create_records_table.php','2017-12-26 00:27:07'),(57,'Martin.Forms','comment','1.0.0','First version of Magic Forms','2017-12-26 00:27:07'),(58,'Martin.Forms','comment','1.0.1','Added CSRF protection','2017-12-26 00:27:08'),(59,'Martin.Forms','comment','1.1.0','Added reCAPTCHA','2017-12-26 00:27:08'),(60,'Martin.Forms','comment','1.1.1','Fix when using reCAPTCHA + allowed fields','2017-12-26 00:27:08'),(61,'Martin.Forms','script','1.1.2','Search inside stored data','2017-12-26 00:27:08'),(62,'Martin.Forms','script','1.1.2','Organize your forms on custom groups','2017-12-26 00:27:08'),(63,'Martin.Forms','script','1.1.2','add_group_field.php','2017-12-26 00:27:08'),(64,'Martin.Forms','comment','1.1.2','Filter forms records','2017-12-26 00:27:08'),(65,'Martin.Forms','comment','1.2.0','Export stored data in CSV format','2017-12-26 00:27:08'),(66,'Martin.Forms','script','1.2.1','Added Turkish language','2017-12-26 00:27:08'),(67,'Martin.Forms','comment','1.2.1','Auto-response email on form submit','2017-12-26 00:27:09'),(68,'Martin.Forms','comment','1.2.2','Override notifications and auto-response email subjects','2017-12-26 00:27:09'),(69,'Martin.Forms','script','1.2.3','Fixed Empty AJAX Form template','2017-12-26 00:27:09'),(70,'Martin.Forms','script','1.2.3','Support for Translate plugin','2017-12-26 00:27:09'),(71,'Martin.Forms','script','1.2.3','Added plugin documentation','2017-12-26 00:27:09'),(72,'Martin.Forms','comment','1.2.3','New option to reset form after successfully submit','2017-12-26 00:27:09'),(73,'Martin.Forms','comment','1.2.4','Added detailed reCAPTCHA help','2017-12-26 00:27:09'),(74,'Martin.Forms','comment','1.3.0','AJAX file uploads','2017-12-26 00:27:09'),(75,'Martin.Forms','comment','1.3.1','Added lang pt-br','2017-12-26 00:27:09'),(76,'Martin.Forms','comment','1.3.2','Fixed multiples reCAPTCHAs on same page','2017-12-26 00:27:09'),(77,'Martin.Forms','script','1.3.3','Updated documentations','2017-12-26 00:27:10'),(78,'Martin.Forms','comment','1.3.3','Fixed record detail page when form data contains an array','2017-12-26 00:27:10'),(79,'Martin.Forms','comment','1.3.4','New \"Anonymize IP\" option','2017-12-26 00:27:10'),(80,'Martin.Forms','comment','1.3.5','New option \"Redirect on successful submit\"','2017-12-26 00:27:10'),(81,'Martin.Forms','script','1.3.6','Support Translate plugin on reCAPTCHA','2017-12-26 00:27:10'),(82,'Martin.Forms','script','1.3.6','reCAPTCHA validation enhancements','2017-12-26 00:27:10'),(83,'Martin.Forms','comment','1.3.6','French translation','2017-12-26 00:27:10'),(84,'Martin.Forms','script','1.3.7','Show uploads as list','2017-12-26 00:27:10'),(85,'Martin.Forms','comment','1.3.7','Displaying errors with fields (inline errors)','2017-12-26 00:27:10'),(86,'Martin.Forms','comment','1.3.8','Fixed handling arrays (radio inputs) in notification email','2017-12-26 00:27:10'),(87,'Martin.Forms','script','1.3.9','Execute custom JavaScript on form success or error','2017-12-26 00:27:10'),(88,'Martin.Forms','comment','1.3.9','Use custom mail templates','2017-12-26 00:27:10'),(89,'Martin.Forms','comment','1.4.0','Added Events (please, refer to docs) [thanks to therealkevinard]','2017-12-26 00:27:10'),(90,'Martin.Forms','comment','1.4.1','New option \"Reply To\"','2017-12-26 00:27:10'),(91,'Martin.Forms','script','1.4.2','New option to sanitize form data (check security docs for more info)','2017-12-26 00:27:10'),(92,'Martin.Forms','script','1.4.2','Added option to send blind carbon copy in notifications email','2017-12-26 00:27:10'),(93,'Martin.Forms','comment','1.4.2','Escape HTML characters on the view records page [thanks to Andre]','2017-12-26 00:27:10'),(94,'Martin.Forms','script','1.4.3','Added \"Unread Records\" counter','2017-12-26 00:27:10'),(95,'Martin.Forms','script','1.4.3','Fixed errors when only BCC addresses are supplied','2017-12-26 00:27:10'),(96,'Martin.Forms','script','1.4.3','New setting \"hide navigation item\"','2017-12-26 00:27:11'),(97,'Martin.Forms','script','1.4.3','add_unread_field.php','2017-12-26 00:27:11'),(98,'Martin.Forms','comment','1.4.3','Fixes related to October Build 420','2017-12-26 00:27:11'),(99,'Martin.Forms','comment','1.4.4','Use custom partials for Success and Error messages','2017-12-26 00:27:11'),(100,'Martin.Forms','comment','1.4.4.1','Fix with notifications emails','2017-12-26 00:27:11'),(101,'Martin.Forms','script','1.4.5','Access submited data on auto-response email template','2017-12-26 00:27:11'),(102,'Martin.Forms','comment','1.4.5','Mail class code refactoring','2017-12-26 00:27:11'),(103,'Martin.Forms','comment','1.4.5.1','Store form data without escaping unicode [thanks to panakour]','2017-12-26 00:27:11'),(104,'Martin.Forms','script','1.4.6','Possibility to change the text on the remove file popup [thanks to ShiroeSama]','2017-12-26 00:27:11'),(105,'Martin.Forms','comment','1.4.6','New option to skip saving forms data on database.','2017-12-26 00:27:11'),(106,'Martin.Forms','comment','1.4.6.1','Changed database field from json to text to support MySQL 5.5','2017-12-26 00:27:11'),(107,'Watchlearn.Contact','comment','1.0.1','Initialize plugin.','2017-12-26 21:21:15'),(108,'RainLab.Translate','script','1.0.1','create_messages_table.php','2017-12-26 21:26:15'),(109,'RainLab.Translate','script','1.0.1','create_attributes_table.php','2017-12-26 21:26:16'),(110,'RainLab.Translate','script','1.0.1','create_locales_table.php','2017-12-26 21:26:16'),(111,'RainLab.Translate','comment','1.0.1','First version of Translate','2017-12-26 21:26:16'),(112,'RainLab.Translate','comment','1.0.2','Languages and Messages can now be deleted.','2017-12-26 21:26:16'),(113,'RainLab.Translate','comment','1.0.3','Minor updates for latest October release.','2017-12-26 21:26:16'),(114,'RainLab.Translate','comment','1.0.4','Locale cache will clear when updating a language.','2017-12-26 21:26:16'),(115,'RainLab.Translate','comment','1.0.5','Add Spanish language and fix plugin config.','2017-12-26 21:26:17'),(116,'RainLab.Translate','comment','1.0.6','Minor improvements to the code.','2017-12-26 21:26:17'),(117,'RainLab.Translate','comment','1.0.7','Fixes major bug where translations are skipped entirely!','2017-12-26 21:26:17'),(118,'RainLab.Translate','comment','1.0.8','Minor bug fixes.','2017-12-26 21:26:17'),(119,'RainLab.Translate','comment','1.0.9','Fixes an issue where newly created models lose their translated values.','2017-12-26 21:26:17'),(120,'RainLab.Translate','comment','1.0.10','Minor fix for latest build.','2017-12-26 21:26:17'),(121,'RainLab.Translate','comment','1.0.11','Fix multilingual rich editor when used in stretch mode.','2017-12-26 21:26:17'),(122,'RainLab.Translate','comment','1.1.0','Introduce compatibility with RainLab.Pages plugin.','2017-12-26 21:26:17'),(123,'RainLab.Translate','comment','1.1.1','Minor UI fix to the language picker.','2017-12-26 21:26:17'),(124,'RainLab.Translate','comment','1.1.2','Add support for translating Static Content files.','2017-12-26 21:26:17'),(125,'RainLab.Translate','comment','1.1.3','Improved support for the multilingual rich editor.','2017-12-26 21:26:17'),(126,'RainLab.Translate','comment','1.1.4','Adds new multilingual markdown editor.','2017-12-26 21:26:17'),(127,'RainLab.Translate','comment','1.1.5','Minor update to the multilingual control API.','2017-12-26 21:26:17'),(128,'RainLab.Translate','comment','1.1.6','Minor improvements in the message editor.','2017-12-26 21:26:17'),(129,'RainLab.Translate','comment','1.1.7','Fixes bug not showing content when first loading multilingual textarea controls.','2017-12-26 21:26:18'),(130,'RainLab.Translate','comment','1.2.0','CMS pages now support translating the URL.','2017-12-26 21:26:18'),(131,'RainLab.Translate','comment','1.2.1','Minor update in the rich editor and code editor language control position.','2017-12-26 21:26:18'),(132,'RainLab.Translate','comment','1.2.2','Static Pages now support translating the URL.','2017-12-26 21:26:18'),(133,'RainLab.Translate','comment','1.2.3','Fixes Rich Editor when inserting a page link.','2017-12-26 21:26:18'),(134,'RainLab.Translate','script','1.2.4','create_indexes_table.php','2017-12-26 21:26:19'),(135,'RainLab.Translate','comment','1.2.4','Translatable attributes can now be declared as indexes.','2017-12-26 21:26:19'),(136,'RainLab.Translate','comment','1.2.5','Adds new multilingual repeater form widget.','2017-12-26 21:26:19'),(137,'RainLab.Translate','comment','1.2.6','Fixes repeater usage with static pages plugin.','2017-12-26 21:26:19'),(138,'RainLab.Translate','comment','1.2.7','Fixes placeholder usage with static pages plugin.','2017-12-26 21:26:19'),(139,'RainLab.Translate','comment','1.2.8','Improvements to code for latest October build compatibility.','2017-12-26 21:26:19'),(140,'RainLab.Translate','comment','1.2.9','Fixes context for translated strings when used with Static Pages.','2017-12-26 21:26:19'),(141,'RainLab.Translate','comment','1.2.10','Minor UI fix to the multilingual repeater.','2017-12-26 21:26:20'),(142,'RainLab.Translate','comment','1.2.11','Fixes translation not working with partials loaded via AJAX.','2017-12-26 21:26:20'),(143,'RainLab.Translate','comment','1.2.12','Add support for translating the new grouped repeater feature.','2017-12-26 21:26:20'),(144,'RainLab.Translate','comment','1.3.0','Added search to the translate messages page.','2017-12-26 21:26:20'),(145,'RainLab.Translate','script','1.3.1','builder_table_update_rainlab_translate_locales.php','2017-12-26 21:26:20'),(146,'RainLab.Translate','script','1.3.1','seed_all_tables.php','2017-12-26 21:26:20'),(147,'RainLab.Translate','comment','1.3.1','Added reordering to languages','2017-12-26 21:26:20'),(148,'RainLab.Translate','comment','1.3.2','Improved compatibility with RainLab.Pages, added ability to scan Mail Messages for translatable variables.','2017-12-26 21:26:21'),(149,'RainLab.Translate','comment','1.3.3','Fix to the locale picker session handling in Build 420 onwards.','2017-12-26 21:26:21'),(150,'RainLab.Pages','comment','1.0.1','Implemented the static pages management and the Static Page component.','2017-12-26 21:26:21'),(151,'RainLab.Pages','comment','1.0.2','Fixed the page preview URL.','2017-12-26 21:26:21'),(152,'RainLab.Pages','comment','1.0.3','Implemented menus.','2017-12-26 21:26:21'),(153,'RainLab.Pages','comment','1.0.4','Implemented the content block management and placeholder support.','2017-12-26 21:26:21'),(154,'RainLab.Pages','comment','1.0.5','Added support for the Sitemap plugin.','2017-12-26 21:26:21'),(155,'RainLab.Pages','comment','1.0.6','Minor updates to the internal API.','2017-12-26 21:26:21'),(156,'RainLab.Pages','comment','1.0.7','Added the Snippets feature.','2017-12-26 21:26:21'),(157,'RainLab.Pages','comment','1.0.8','Minor improvements to the code.','2017-12-26 21:26:21'),(158,'RainLab.Pages','comment','1.0.9','Fixes issue where Snippet tab is missing from the Partials form.','2017-12-26 21:26:21'),(159,'RainLab.Pages','comment','1.0.10','Add translations for various locales.','2017-12-26 21:26:21'),(160,'RainLab.Pages','comment','1.0.11','Fixes issue where placeholders tabs were missing from Page form.','2017-12-26 21:26:21'),(161,'RainLab.Pages','comment','1.0.12','Implement Media Manager support.','2017-12-26 21:26:21'),(162,'RainLab.Pages','script','1.1.0','snippets_rename_viewbag_properties.php','2017-12-26 21:26:22'),(163,'RainLab.Pages','comment','1.1.0','Adds meta title and description to pages. Adds |staticPage filter.','2017-12-26 21:26:22'),(164,'RainLab.Pages','comment','1.1.1','Add support for Syntax Fields.','2017-12-26 21:26:22'),(165,'RainLab.Pages','comment','1.1.2','Static Breadcrumbs component now respects the hide from navigation setting.','2017-12-26 21:26:22'),(166,'RainLab.Pages','comment','1.1.3','Minor back-end styling fix.','2017-12-26 21:26:22'),(167,'RainLab.Pages','comment','1.1.4','Minor fix to the StaticPage component API.','2017-12-26 21:26:22'),(168,'RainLab.Pages','comment','1.1.5','Fixes bug when using syntax fields.','2017-12-26 21:26:22'),(169,'RainLab.Pages','comment','1.1.6','Minor styling fix to the back-end UI.','2017-12-26 21:26:22'),(170,'RainLab.Pages','comment','1.1.7','Improved menu item form to include CSS class, open in a new window and hidden flag.','2017-12-26 21:26:22'),(171,'RainLab.Pages','comment','1.1.8','Improved the output of snippet partials when saved.','2017-12-26 21:26:22'),(172,'RainLab.Pages','comment','1.1.9','Minor update to snippet inspector internal API.','2017-12-26 21:26:22'),(173,'RainLab.Pages','comment','1.1.10','Fixes a bug where selecting a layout causes permanent unsaved changes.','2017-12-26 21:26:22'),(174,'RainLab.Pages','comment','1.1.11','Add support for repeater syntax field.','2017-12-26 21:26:23'),(175,'RainLab.Pages','comment','1.2.0','Added support for translations, UI updates.','2017-12-26 21:26:23'),(176,'RainLab.Pages','comment','1.2.1','Use nice titles when listing the content files.','2017-12-26 21:26:23'),(177,'RainLab.Pages','comment','1.2.2','Minor styling update.','2017-12-26 21:26:23'),(178,'RainLab.Pages','comment','1.2.3','Snippets can now be moved by dragging them.','2017-12-26 21:26:23'),(179,'RainLab.Pages','comment','1.2.4','Fixes a bug where the cursor is misplaced when editing text files.','2017-12-26 21:26:23'),(180,'RainLab.Pages','comment','1.2.5','Fixes a bug where the parent page is lost upon changing a page layout.','2017-12-26 21:26:23'),(181,'RainLab.Pages','comment','1.2.6','Shared view variables are now passed to static pages.','2017-12-26 21:26:23'),(182,'RainLab.Pages','comment','1.2.7','Fixes issue with duplicating properties when adding multiple snippets on the same page.','2017-12-26 21:26:23'),(183,'RainLab.Pages','comment','1.2.8','Fixes a bug where creating a content block without extension doesn\'t save the contents to file.','2017-12-26 21:26:23'),(184,'RainLab.Pages','comment','1.2.9','Add conditional support for translating page URLs.','2017-12-26 21:26:23'),(185,'RainLab.Pages','comment','1.2.10','Streamline generation of URLs to use the new Cms::url helper.','2017-12-26 21:26:23'),(186,'RainLab.Pages','comment','1.2.11','Implements repeater usage with translate plugin.','2017-12-26 21:26:23'),(187,'RainLab.Pages','comment','1.2.12','Fixes minor issue when using snippets and switching the application locale.','2017-12-26 21:26:23'),(188,'RainLab.Pages','comment','1.2.13','Fixes bug when AJAX is used on a page that does not yet exist.','2017-12-26 21:26:24'),(189,'RainLab.Pages','comment','1.2.14','Add theme logging support for changes made to menus.','2017-12-26 21:26:24'),(190,'RainLab.Pages','comment','1.2.15','Back-end navigation sort order updated.','2017-12-26 21:26:24'),(191,'RainLab.Pages','comment','1.2.16','Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).','2017-12-26 21:26:24'),(192,'RainLab.Pages','comment','1.2.17','Changes locations of custom fields to secondary tabs instead of the primary Settings area. New menu search ability on adding menu items','2017-12-26 21:26:24'),(193,'RainLab.Pages','comment','1.2.18','Fixes cache-invalidation issues when RainLab.Translate is not installed. Added Greek & Simplified Chinese translations. Removed deprecated calls. Allowed saving HTML in snippet properties. Added support for the MediaFinder in menu items.','2017-12-26 21:26:24'),(194,'PanaKour.Translate','script','1.0.1','Make RainLab Static Menu Multilingual','2017-12-26 21:26:24'),(195,'PanaKour.Translate','comment','1.0.1','Initial version of translate plugin','2017-12-26 21:26:24'),(196,'Zainab.SimpleContact','comment','1.0.1','Initialize plugin.','2017-12-26 21:26:24'),(197,'Zainab.SimpleContact','script','1.0.2','builder_table_create_zainab_simplecontact_contact.php','2017-12-26 21:26:25'),(198,'Zainab.SimpleContact','comment','1.0.2','Created table zainab_simplecontact_contact','2017-12-26 21:26:25'),(199,'Zainab.SimpleContact','script','1.0.3','builder_table_update_zainab_simplecontact_contact.php','2017-12-26 21:26:26'),(200,'Zainab.SimpleContact','comment','1.0.3','Updated table zainab_simplecontact_contact','2017-12-26 21:26:26'),(201,'Zainab.SimpleContact','comment','1.0.4','Change Alias bug fixed','2017-12-26 21:26:26'),(202,'Zainab.SimpleContact','script','1.0.5','Language added -- Portuguese (Brazil)','2017-12-26 21:26:26'),(203,'Zainab.SimpleContact','comment','1.0.5','Dashboard widget added','2017-12-26 21:26:26'),(204,'Zainab.SimpleContact','comment','1.0.6','grecaptcha reset bug fixed','2017-12-26 21:26:26'),(205,'Zainab.SimpleContact','script','1.1.0','minor bugs fixed','2017-12-26 21:26:26'),(206,'Zainab.SimpleContact','comment','1.1.0','sql_modes NO_ZERO_IN_DATE,NO_ZERO_DATE fixed','2017-12-26 21:26:26'),(207,'Zainab.SimpleContact','script','1.1.1','minor bug fixed','2017-12-26 21:26:26'),(208,'Zainab.SimpleContact','comment','1.1.1','Language added -- Russian','2017-12-26 21:26:26'),(209,'Zainab.SimpleContact','script','2.0.0','Languages Added (Arabic, Chinese)','2017-12-26 21:26:26'),(210,'Zainab.SimpleContact','comment','2.0.0','Translate Plugin Dependency Added (RainLab.Translate)','2017-12-26 21:26:26'),(211,'Zainab.SimpleContact','script','2.0.1','Notification Email Updated','2017-12-26 21:26:26'),(212,'Zainab.SimpleContact','comment','2.0.1','Migration Bug Fixed','2017-12-26 21:26:26'),(213,'Zainab.SimpleContact','comment','2.0.2','Languages Added (Czech, Turkish)','2017-12-26 21:26:27'),(214,'Zainab.SimpleContact','comment','2.0.3','Language Added (French), fixed punctuation','2017-12-26 21:26:27');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_versions`
--

DROP TABLE IF EXISTS `system_plugin_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_versions`
--

LOCK TABLES `system_plugin_versions` WRITE;
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` VALUES (1,'October.Demo','1.0.1','2017-12-21 22:34:04',0,0),(2,'JanVince.SmallContactForm','1.5.8','2017-12-24 23:54:27',0,0),(3,'DevINX.ContactUs','1.0.2','2017-12-26 00:16:42',0,0),(4,'Martin.Forms','1.4.6.1','2017-12-26 00:27:12',0,0),(5,'Watchlearn.Contact','1.0.1','2017-12-26 21:21:15',0,0),(6,'RainLab.Translate','1.3.3','2017-12-26 21:26:21',0,0),(7,'RainLab.Pages','1.2.18','2017-12-26 21:26:24',0,0),(8,'PanaKour.Translate','1.0.1','2017-12-26 21:26:24',0,0),(9,'Zainab.SimpleContact','2.0.3','2017-12-26 21:26:27',0,0);
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_request_logs`
--

DROP TABLE IF EXISTS `system_request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_request_logs`
--

LOCK TABLES `system_request_logs` WRITE;
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
INSERT INTO `system_request_logs` VALUES (1,404,'http://plumbing.bashconsole.org/favicon.ico','[\"http:\\/\\/plumbing.bashconsole.org\\/contact\"]',1,'2017-12-26 22:33:24','2017-12-26 22:33:24');
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_revisions`
--

DROP TABLE IF EXISTS `system_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `revisionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_revisions`
--

LOCK TABLES `system_revisions` WRITE;
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (1,'janvince_smallcontactform_settings','{\"form_css_class\":\"\",\"form_success_msg\":\"Your message has been sent\",\"form_error_msg\":\"There was an error\",\"form_hide_after_success\":\"1\",\"form_use_placeholders\":\"0\",\"form_allow_ajax\":\"1\",\"form_allow_confirm_msg\":\"1\",\"form_send_confirm_msg\":\"\",\"add_assets\":\"0\",\"add_css_assets\":\"0\",\"add_js_assets\":\"0\",\"send_btn_wrapper_css\":\"\",\"send_btn_css_class\":\"btn-large waves-effect waves-light\",\"send_btn_text\":\"Send\",\"allow_redirect\":\"0\",\"redirect_url\":\"\",\"redirect_url_external\":\"0\",\"autoreply_email_field\":\"\",\"autoreply_name_field\":\"Message\",\"autoreply_message_field\":\"Message\",\"add_antispam\":\"0\",\"antispam_delay\":null,\"antispam_delay_error_msg\":\"\",\"antispam_label\":\"\",\"antispam_error_msg\":\"\",\"add_ip_protection\":\"0\",\"add_ip_protection_count\":null,\"add_ip_protection_error_too_many_submits\":\"\",\"allow_email_queue\":\"1\",\"allow_autoreply\":\"1\",\"email_address_from\":\"bashconsole@gmail.com\",\"email_address_from_name\":\"bashconsole@gmail.com\",\"email_subject\":\"bashconsole@gmail.com\",\"email_template\":\"\",\"allow_notifications\":\"1\",\"notification_address_from_form\":\"1\",\"notification_address_to\":\"bashconsole@gmail.com\",\"notification_template\":\"\",\"form_fields\":[{\"name\":\"Your email\",\"type\":\"text\",\"label\":\"Email\",\"field_styling\":\"0\",\"autofocus\":\"1\",\"wrapper_css\":\"\",\"field_css\":\"\",\"field_validation\":\"0\"},{\"name\":\"Message\",\"type\":\"text\",\"label\":\"Message\",\"field_styling\":\"0\",\"autofocus\":\"0\",\"wrapper_css\":\"\",\"field_css\":\"\",\"field_validation\":\"0\"}]}'),(2,'DevINX_ContactUs_settings','{\"recipient_email\":\"bashconsole@gmail.com\",\"recipient_name\":\"user\",\"subject\":\"test\",\"confirmation_text\":\"<p>confirmation text<\\/p>\",\"enable_captcha\":\"0\",\"site_key\":\"\",\"secret_key\":\"\",\"enable_server_captcha_validation\":\"0\",\"name_input\":\"Enter name\",\"email_input\":\"Enter email\",\"subject_input\":\"Enter subject\",\"message_input\":\"Enter message\",\"send_button\":\"Send\"}'),(3,'system_mail_settings','{\"send_mode\":\"sendmail\",\"sender_name\":\"Plumbing AB\",\"sender_email\":\"bashconsole@gmail.com\",\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\",\"smtp_address\":\"smtp.mailgun.org\",\"smtp_port\":\"587\",\"smtp_user\":\"\",\"smtp_password\":\"\",\"smtp_authorization\":\"0\",\"smtp_encryption\":\"tls\",\"mailgun_domain\":\"\",\"mailgun_secret\":\"\",\"mandrill_secret\":\"\",\"ses_key\":\"\",\"ses_secret\":\"\",\"ses_region\":\"\"}'),(4,'zainab_simple_contact_settings','{\"redirect_to_page\":\"1\",\"redirect_to_url\":\"\\/\",\"success_message\":\"Message was sent successfuly\",\"text_top_form\":\"\",\"recieve_notification\":\"1\",\"auto_reply\":\"1\",\"notification_email_address\":\"bashconsole@gmail.com\",\"recaptcha_enabled\":\"0\",\"site_key\":\"\",\"secret_key\":\"\"}'),(5,'system_log_settings','{\"log_events\":\"1\",\"log_requests\":\"1\",\"log_theme\":\"1\"}');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zainab_simplecontact_contact`
--

DROP TABLE IF EXISTS `zainab_simplecontact_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zainab_simplecontact_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_replied` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zainab_simplecontact_contact`
--

LOCK TABLES `zainab_simplecontact_contact` WRITE;
/*!40000 ALTER TABLE `zainab_simplecontact_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `zainab_simplecontact_contact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-27  2:45:24
