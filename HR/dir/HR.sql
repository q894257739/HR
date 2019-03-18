-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: HR
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add nav',7,'add_nav'),(20,'Can change nav',7,'change_nav'),(21,'Can delete nav',7,'delete_nav'),(22,'Can add user',8,'add_user'),(23,'Can change user',8,'change_user'),(24,'Can delete user',8,'delete_user'),(25,'Can add goods',9,'add_goods'),(26,'Can change goods',9,'change_goods'),(27,'Can delete goods',9,'delete_goods'),(28,'Can add cart',10,'add_cart'),(29,'Can change cart',10,'change_cart'),(30,'Can delete cart',10,'delete_cart'),(31,'Can add collections',11,'add_collections'),(32,'Can change collections',11,'change_collections'),(33,'Can delete collections',11,'delete_collections'),(34,'Can add order',12,'add_order'),(35,'Can change order',12,'change_order'),(36,'Can delete order',12,'delete_order'),(37,'Can add order goods',13,'add_ordergoods'),(38,'Can change order goods',13,'change_ordergoods'),(39,'Can delete order goods',13,'delete_ordergoods');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(10,'app','cart'),(11,'app','collections'),(9,'app','goods'),(7,'app','nav'),(12,'app','order'),(13,'app','ordergoods'),(8,'app','user'),(2,'auth','group'),(4,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-17 09:37:29.344778'),(2,'auth','0001_initial','2019-03-17 09:37:30.134953'),(3,'admin','0001_initial','2019-03-17 09:37:30.308017'),(4,'admin','0002_logentry_remove_auto_add','2019-03-17 09:37:30.334111'),(5,'contenttypes','0002_remove_content_type_name','2019-03-17 09:37:30.461478'),(6,'auth','0002_alter_permission_name_max_length','2019-03-17 09:37:30.523365'),(7,'auth','0003_alter_user_email_max_length','2019-03-17 09:37:30.598171'),(8,'auth','0004_alter_user_username_opts','2019-03-17 09:37:30.615163'),(9,'auth','0005_alter_user_last_login_null','2019-03-17 09:37:30.677160'),(10,'auth','0006_require_contenttypes_0002','2019-03-17 09:37:30.683359'),(11,'auth','0007_alter_validators_add_error_messages','2019-03-17 09:37:30.703175'),(12,'auth','0008_alter_user_username_max_length','2019-03-17 09:37:30.785861'),(13,'sessions','0001_initial','2019-03-17 09:37:30.840900'),(14,'app','0001_initial','2019-03-17 09:38:04.577168'),(15,'app','0002_auto_20190317_0939','2019-03-17 09:39:50.436575'),(16,'app','0003_auto_20190317_1004','2019-03-17 10:05:04.261501'),(17,'app','0004_auto_20190317_1007','2019-03-17 10:08:01.423810'),(18,'app','0005_auto_20190317_1014','2019-03-17 10:14:47.022841'),(19,'app','0006_auto_20190317_1253','2019-03-17 12:53:34.248870'),(20,'app','0007_order_status','2019-03-17 12:53:51.408016'),(21,'app','0008_order_updatetime','2019-03-17 12:54:02.599424'),(22,'app','0009_order_createtime','2019-03-17 13:01:56.843547'),(23,'app','0010_remove_order_addr','2019-03-17 13:03:09.780620'),(24,'app','0011_user_addr','2019-03-17 13:03:46.282905'),(25,'app','0012_remove_user_addr','2019-03-17 13:28:09.430984'),(26,'app','0013_user_addr','2019-03-17 13:29:32.996411');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1bwkpeh5zhjjhb8ql6hgwvzf27ihkomj','MmNlYzY3MWNjNWYwM2U5ZWM0MDk1ZWM2YWYwZTQwYzczNmQ5YzJiMTp7InRva2VuIjoiOTc1ZWEyYTg2NGUzMWE0ZTQwNjA2NDQwMThlOWY1YjciLCJ2ZXJpZnkiOiJFT202In0=','2019-04-01 02:44:26.012489'),('3th7jcx6rqox90rzzkic6wayey69wo13','MmY4ZjMzYjdjNjZhMDNiNDhhZDA0OTdkMmUwMDU4MjdmYTQxZGNiZjp7InZlcmlmeSI6IlByUzEiLCJ0b2tlbiI6ImVlNmExMjA4NDZkYTEwYTUzNjE2OTBhOTJlMGU3OWY1In0=','2019-04-01 01:43:46.630968'),('7p56bppj0wmfonc9y389mfpdrjrkcr4g','MWIwY2QyMjZjNzM0YzNhNWNmYWMzOWU4NjFkZjdiMjhmZDNiODk0Mzp7InRva2VuIjoiNzVjMjAyNzE4ZTUyMDRhMjhlMzI0NTE5NDhlMWU4MTgiLCJ2ZXJpZnkiOiJVWld2In0=','2019-04-01 01:09:00.239427'),('85z6exttiiz13q7dxsk81n3zwkaxfos5','MDc4ODM0ZTA0NGU3NDJiNDZjZDc1ZWI4NjFkM2JkYTEyYTJjZmQ0Zjp7InRva2VuIjoiNzVmMjIyOWUwNTM1MmE3Nzk2Njc0NWIwM2I2MWMxZjkiLCJ2ZXJpZnkiOiI3c3pxIn0=','2019-04-01 03:07:11.433020'),('8y6m9myy4sn7eozpp74dwebozxoh30ny','ZjEzMjVhZjRmMTg1MjM5ODJiMzMyOTUxMTI0NDg4Y2I4OWFhOGFmMzp7InZlcmlmeSI6InJiTGciLCJ0b2tlbiI6IjRkNDBkZTE3ZTYyM2U2MTQxM2M3NTM0OTEyNjE1OWZjIn0=','2019-04-01 02:01:49.647087'),('a1pl284qndseqh0s2vjv9vduqtdwpl3a','Nzg2YTY1YzVjYjIxYzk2MTk2MjMwMTgwMWE4M2FlNTI5YzllZTFmNzp7InZlcmlmeSI6IjR3ckMiLCJ0b2tlbiI6IjM0MjhkMmUwYTJjMThmOWVkYTg4YzM0MmY0Zjk3NzNkIn0=','2019-03-31 12:38:13.054752'),('d7g49h93tc5eg13qmdm9t06ftok1rvze','Y2NmYjBjYTVlMzBkODNhZmFjODI3NmMwYWU3MTYxY2QxMGVlMmI1MTp7InZlcmlmeSI6IkZ5UTEifQ==','2019-03-31 10:32:32.020169'),('ez8a5iu5pxdaw6wc66exsj5y7rlgm4t8','ZTczNjYxM2ZlZTllMWY1NWU2ZGYzM2JmNmI2NDgwNTZmZjg3ODA5Yzp7InRva2VuIjoiMDU1YTI5YWZiYmM2ZjNmZjhiMDQ1MTJjZDBmYWM2ZDYiLCJ2ZXJpZnkiOiJUc3JiIn0=','2019-04-01 03:09:13.879889'),('fjqu0of750o7l23hc6mkjfpeccfjvcjn','YTQ3ODZmOTBlMjBiMWZlOTU0Y2NlYmE0OGEwNTk0ZjdhY2RiZWE5ZDp7InRva2VuIjoiMWU4YjZhZWE5OWYwOTlhYjcxY2UyYWMyNzU3MjRhNWIiLCJ2ZXJpZnkiOiJvZHZZIn0=','2019-04-01 02:58:10.507796'),('jkzzajuvt6el3ihpoz2vdkh40qiqt6as','ZGJjZmZhMWZhYmE1MjE4NmExNTI4YTIwMDAwZjNlZmZlMDRjMzI0OTp7InZlcmlmeSI6IjRZb3QiLCJ0b2tlbiI6ImU5NTZlMjk3YjU0OWY3MTI5NWU4NDJmZjE4OTlkMTE1In0=','2019-03-31 14:18:19.362791'),('kfsr0fcflc4fw4ygt8cx4gcnnqeemva2','YzRmZjFhOTcyMzZkNWQwYjAyMzAyZDQ2ZmJiNmU3NDFiNDVmZGI5YTp7InRva2VuIjoiNGI2ZjVjY2I1NWZkODhkMDdkN2YyNWRiM2MwNGVkZjciLCJ2ZXJpZnkiOiJHU3hsIn0=','2019-04-01 00:58:47.918515'),('nky4ov20szhzkj3dvsnrwsgyz8z1zid6','ZGIwOTQxMGQxZTU0NWQ1YzlkYjFjZmNmZjNkZDRhYjk3N2ViM2UzMTp7InRva2VuIjoiOTBmYWZkYTc3NmExNTc5MjdiN2ZhNzk1OWY2NDg1NTMiLCJ2ZXJpZnkiOiJDZmtFIn0=','2019-04-01 01:25:26.926972'),('pncxdg46z8tkgir9sx0pm2ajzjsctrfy','NmM1ODM3MGMyZDUwYTYyZmZjZDhiYTQ1ZWY2NDE1Y2EzMjIxODUzMDp7InRva2VuIjoiN2IxZGE1YmM3YzYzYWNiMmQ3ZGFjZDBlMmE0ZDAyYjUiLCJ2ZXJpZnkiOiJxWWJ1In0=','2019-04-01 02:50:21.977351'),('qg28qqrkoz252ynli9ac23q5iic67yov','NjQxZGI1NzQzNjU2YWFkY2ZkNmZlOTBmYmU4M2ExYjIzMjQ1OTExMTp7InZlcmlmeSI6ImJ6Vm4iLCJ0b2tlbiI6ImI5NTQxZDFjZGNlZWNiYmIxNDYxYzExNzgxOGI4OWJjIn0=','2019-03-31 11:58:54.965609'),('s2tzmxjr99x2m5x5hf5m88x97dqrmb5w','NzJiYTEzOGVlNDQ0MzMxNGNlOWVhNWMzZWM2OWU5MjU2NzMxNWY1ODp7InRva2VuIjoiYjQ1NTVlZGRjMTUzOTBlZWY5NTZlMTE5YjgxMDFkMzIiLCJ2ZXJpZnkiOiIzUmlDIn0=','2019-04-01 02:48:44.673120'),('zu4lg551tbbdywpcs2s9u7ruop2ogvhh','Y2Y1YjQxMDJmY2M5NDY5ZWVlODM3YWYyNWJmZjE5OTE5N2U5NzAyNzp7InZlcmlmeSI6ImdqazUiLCJ0b2tlbiI6IjcwMmVkZjNjOThkMzVlMjdmNzVjNTI0NmQxODQ2MmQ4In0=','2019-03-31 13:21:09.733876');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_cart`
--

DROP TABLE IF EXISTS `hr_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `iscollections` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_cart_goods_id_d66f192b_fk_hr_goods_id` (`goods_id`),
  KEY `hr_cart_user_id_af937098_fk_hr_user_id` (`user_id`),
  CONSTRAINT `hr_cart_goods_id_d66f192b_fk_hr_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `hr_goods` (`id`),
  CONSTRAINT `hr_cart_user_id_af937098_fk_hr_user_id` FOREIGN KEY (`user_id`) REFERENCES `hr_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_cart`
--

LOCK TABLES `hr_cart` WRITE;
/*!40000 ALTER TABLE `hr_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_collections`
--

DROP TABLE IF EXISTS `hr_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_collections_goods_id_67b2a774_fk_hr_goods_id` (`goods_id`),
  KEY `hr_collections_user_id_1175d00d_fk_hr_user_id` (`user_id`),
  CONSTRAINT `hr_collections_goods_id_67b2a774_fk_hr_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `hr_goods` (`id`),
  CONSTRAINT `hr_collections_user_id_1175d00d_fk_hr_user_id` FOREIGN KEY (`user_id`) REFERENCES `hr_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_collections`
--

LOCK TABLES `hr_collections` WRITE;
/*!40000 ALTER TABLE `hr_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_goods`
--

DROP TABLE IF EXISTS `hr_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL,
  `src` varchar(200) NOT NULL,
  `name` varchar(256) NOT NULL,
  `intro` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `smallimg1` varchar(200) NOT NULL,
  `smallimg2` varchar(200) NOT NULL,
  `smallimg3` varchar(200) NOT NULL,
  `smallimg4` varchar(200) NOT NULL,
  `smallimg5` varchar(200) NOT NULL,
  `e_name` varchar(100) NOT NULL,
  `bigimg` varchar(200) NOT NULL,
  `isdelete` varchar(20) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `repertory` int(11) NOT NULL,
  `specification` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_goods`
--

LOCK TABLES `hr_goods` WRITE;
/*!40000 ALTER TABLE `hr_goods` DISABLE KEYS */;
INSERT INTO `hr_goods` VALUES (1,'topGoods','static/images/12710425_218x218.jpg','【全国配送】松桂坊湘西腊肉(五花 后腿 萝卜干组合)手信套餐 1200g 五花500g*1后腿500g*1 萝卜干100g*2','明星腊味，荤素搭配，烹制方便',99,'/static/images/12710426_85X85.jpg','/static/images/12710427_85X85.jpg','/static/images/12710425_85X85.jpg','/static/images/12710426_85X85.jpg','/static/images/12710426_85X85.jpg','阳澄湖大闸蟹','/static/images/4680799_420X420.jpg','0',1,100,'尖品推荐'),(2,'topGoods','static/images/12700133_218x218.jpg','【全国配送】渔鲜世海 厄瓜多尔白虾1.8KG/盒 南美大白虾50-60 原盒进口海鲜水产','有人说无鲜勿落饭，鱼我所欲也。但我说虾我所欲也，一碗饭，一盘虾，一双筷子，一段静谧时光，这等幸福生活，我心所羡。深海的苦日子早就了白虾白嫩干醇的美味，甘甜白虾带给您温馨而幸福。【渔鲜世海】品牌买满99元全国包邮，黑龙江、吉林、辽宁、西藏、新疆、内蒙古、甘肃、青海、宁夏由于地区偏远，气候原因，暂不配送。未满99元邮费见商品详情页下方。',168,'/static/images/12700134_85X85.jpg','/static/images/12700131_85X85.jpg','/static/images/12700130_85X85.jpg','/static/images/12700132_85X85.jpg','/static/images/12700133_85X85.jpg','现货批发基围虾','/static/images/9220080_420X420.jpg','0',1,100,'尖品推荐'),(3,'topGoods','static/images/5470077_218x218.jpg','【全国配送】 碧然德 FB2020B1即热净水吧','多效过滤技术、过滤煮沸二合一',739,'/static/images/5470076_85X85.jpg','/static/images/5470080_85X85.jpg','/static/images/5470079_85X85.jpg','/static/images/5470078_85X85.jpg','/static/images/5470077_85X85.jpg','太阳能热水壶','/static/images/9400552_420X420.jpg','0',0,100,'尖品推荐'),(4,'topGoods','static/images/3175615_218x218.jpg','Jawbone UP MOVE智能追踪器 黑色梦之星','运动睡眠监控 蓝牙实时传送',349,'/static/images/1710008_85X85.png','/static/images/1760012_85X85.png','/static/images/1700012_85X85.png','/static/images/1710009_85X85.png','/static/images/3175615_85X85.jpg','iphoneWatch11','/static/images/11260490_420X420.jpg','0',1,100,'尖品推荐'),(5,'topGoods','static/images/14821135_218x218.jpg','【全国配送】 Mino Yaki 美浓烧 日式和风陶瓷盘子调味碟菜盘套装 唐草','日本进口，高温烧制！水墨蓝白，东方古韵',178,'/static/images/14821136_85X85.jpg','/static/images/14821135_85X85.jpg','/static/images/14821136_85X85.jpg','/static/images/14821135_85X85.jpg','/static/images/14821135_85X85.jpg','3000克拉钻戒','/static/images/12290525_420X420.jpg','0',1,100,'尖品推荐');
/*!40000 ALTER TABLE `hr_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_nav`
--

DROP TABLE IF EXISTS `hr_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_nav`
--

LOCK TABLES `hr_nav` WRITE;
/*!40000 ALTER TABLE `hr_nav` DISABLE KEYS */;
INSERT INTO `hr_nav` VALUES (1,'/static/images/15411519.jpg'),(2,'/static/images/15411442.jpg'),(3,'/static/images/15411372.jpg'),(4,'/static/images/15401767.jpg');
/*!40000 ALTER TABLE `hr_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_order`
--

DROP TABLE IF EXISTS `hr_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `updatetime` datetime(6) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_order_user_id_1388d6c8_fk_hr_user_id` (`user_id`),
  CONSTRAINT `hr_order_user_id_1388d6c8_fk_hr_user_id` FOREIGN KEY (`user_id`) REFERENCES `hr_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_order`
--

LOCK TABLES `hr_order` WRITE;
/*!40000 ALTER TABLE `hr_order` DISABLE KEYS */;
INSERT INTO `hr_order` VALUES (1,'15528302380791187588172',1,0,'2019-03-17 13:43:58.792020','2019-03-17 13:43:58.791959'),(2,'15528302390634812478478',1,0,'2019-03-17 13:43:59.635612','2019-03-17 13:43:59.635520'),(3,'1552830240067717566455',1,0,'2019-03-17 13:44:00.678475','2019-03-17 13:44:00.678424'),(4,'1552830241065949337138',1,0,'2019-03-17 13:44:01.660130','2019-03-17 13:44:01.660080'),(5,'1552830372050186331009',1,0,'2019-03-17 13:46:12.502597','2019-03-17 13:46:12.502527'),(6,'15528303730664280777566',1,0,'2019-03-17 13:46:13.664835','2019-03-17 13:46:13.664785'),(7,'15528303740226541594436',1,0,'2019-03-17 13:46:14.228795','2019-03-17 13:46:14.228728'),(8,'15528303740831502712286',1,0,'2019-03-17 13:46:14.834222','2019-03-17 13:46:14.834167'),(9,'155283037508071694550',1,0,'2019-03-17 13:46:15.808201','2019-03-17 13:46:15.808099'),(10,'15528304680769643859637',1,0,'2019-03-17 13:47:48.771311','2019-03-17 13:47:48.771257'),(11,'15528308470247198640205',1,0,'2019-03-17 13:54:07.248460','2019-03-17 13:54:07.248123'),(12,'15528308680651402785726',1,0,'2019-03-17 13:54:28.651967','2019-03-17 13:54:28.651916'),(13,'15528308710271918514935',1,0,'2019-03-17 13:54:31.272704','2019-03-17 13:54:31.272641'),(14,'15528308890974645430335',1,0,'2019-03-17 13:54:49.977645','2019-03-17 13:54:49.977587'),(15,'15528309830629845681982',1,0,'2019-03-17 13:56:23.630388','2019-03-17 13:56:23.630337'),(16,'15528309890011156321974',1,0,'2019-03-17 13:56:29.011661','2019-03-17 13:56:29.011611'),(17,'15528310000832120787708',1,0,'2019-03-17 13:56:40.832780','2019-03-17 13:56:40.832725'),(18,'15528310360256224625830',1,0,'2019-03-17 13:57:16.256976','2019-03-17 13:57:16.256791'),(19,'1552831037034939744088',1,0,'2019-03-17 13:57:17.350181','2019-03-17 13:57:17.350108'),(20,'15528310450815017537349',1,0,'2019-03-17 13:57:25.815981','2019-03-17 13:57:25.815922'),(21,'1552831053063334822883',1,0,'2019-03-17 13:57:33.633809','2019-03-17 13:57:33.633760'),(22,'1552831064034584814890',1,0,'2019-03-17 13:57:44.346514','2019-03-17 13:57:44.346460'),(23,'1552831205022266264680',1,0,'2019-03-17 14:00:05.223281','2019-03-17 14:00:05.223228'),(24,'155283120607342754427',1,0,'2019-03-17 14:00:06.735679','2019-03-17 14:00:06.735607'),(25,'15528315450420189935995',1,0,'2019-03-17 14:05:45.420951','2019-03-17 14:05:45.420899'),(26,'15528315460130452237352',1,0,'2019-03-17 14:05:46.131367','2019-03-17 14:05:46.131294'),(27,'15528315460866458769987',1,0,'2019-03-17 14:05:46.866953','2019-03-17 14:05:46.866895'),(28,'15528726990536428751954',1,0,'2019-03-18 01:31:39.536973','2019-03-18 01:31:39.536926'),(29,'15528729270788676561907',1,0,'2019-03-18 01:35:27.789383','2019-03-18 01:35:27.789328'),(30,'155287301206488546699',1,0,'2019-03-18 01:36:52.649407','2019-03-18 01:36:52.649353'),(31,'1552873078029772882126',1,0,'2019-03-18 01:37:58.299397','2019-03-18 01:37:58.299334'),(32,'15528730930530741583518',1,0,'2019-03-18 01:38:13.531681','2019-03-18 01:38:13.531575'),(33,'15528731680332289276071',1,0,'2019-03-18 01:39:28.332880','2019-03-18 01:39:28.332801'),(34,'1552873169055601998189',1,0,'2019-03-18 01:39:29.558463','2019-03-18 01:39:29.558392'),(35,'15528731730375806642103',1,0,'2019-03-18 01:39:33.376294','2019-03-18 01:39:33.376245'),(36,'15528733750349450866117',1,0,'2019-03-18 01:42:55.350541','2019-03-18 01:42:55.350445'),(37,'15528733980646937464124',1,0,'2019-03-18 01:43:18.647848','2019-03-18 01:43:18.647719'),(38,'1552873400057626749741',1,0,'2019-03-18 01:43:20.576833','2019-03-18 01:43:20.576780'),(39,'15528734510006338126700',1,0,'2019-03-18 01:44:11.006943','2019-03-18 01:44:11.006889'),(40,'15528743990809023653343',1,0,'2019-03-18 01:59:59.811398','2019-03-18 01:59:59.811343'),(41,'15528744490462002841031',1,0,'2019-03-18 02:00:49.463334','2019-03-18 02:00:49.463278'),(42,'15528744790788533726734',1,0,'2019-03-18 02:01:19.789392','2019-03-18 02:01:19.789341'),(43,'15528745160698642528288',1,0,'2019-03-18 02:01:56.699798','2019-03-18 02:01:56.699722'),(44,'15528745580841283347285',1,0,'2019-03-18 02:02:38.842056','2019-03-18 02:02:38.841981'),(45,'15528746330433107499794',1,0,'2019-03-18 02:03:53.434758','2019-03-18 02:03:53.434698'),(46,'15528747200881512256912',1,0,'2019-03-18 02:05:20.882195','2019-03-18 02:05:20.882142'),(47,'1552874786010078169079',1,0,'2019-03-18 02:06:26.101906','2019-03-18 02:06:26.101797'),(48,'1552875118090333816113',1,0,'2019-03-18 02:11:58.904415','2019-03-18 02:11:58.904350'),(49,'1552875853036346618242',1,0,'2019-03-18 02:24:13.364439','2019-03-18 02:24:13.364340'),(50,'15528759200586541759389',1,0,'2019-03-18 02:25:20.588487','2019-03-18 02:25:20.588341'),(51,'15528759240220269238614',1,0,'2019-03-18 02:25:24.220974','2019-03-18 02:25:24.220915'),(52,'1552875934015023470585',1,0,'2019-03-18 02:25:34.150875','2019-03-18 02:25:34.150821'),(53,'15528760950783225828147',1,0,'2019-03-18 02:28:15.784451','2019-03-18 02:28:15.784401'),(54,'15528761090264984651339',1,0,'2019-03-18 02:28:29.265804','2019-03-18 02:28:29.265724'),(55,'15528762100113646579504',1,0,'2019-03-18 02:30:10.116406','2019-03-18 02:30:10.116006'),(56,'15528763480414039488874',1,0,'2019-03-18 02:32:28.414812','2019-03-18 02:32:28.414731'),(57,'15528764330307264896505',1,0,'2019-03-18 02:33:53.308326','2019-03-18 02:33:53.308273'),(58,'15528765750451591345228',1,0,'2019-03-18 02:36:15.452788','2019-03-18 02:36:15.452737'),(59,'15528768420013471185577',1,0,'2019-03-18 02:40:42.014688','2019-03-18 02:40:42.014513'),(60,'1552876862060984424407',1,0,'2019-03-18 02:41:02.610316','2019-03-18 02:41:02.610270'),(61,'15528769560074861811337',1,0,'2019-03-18 02:42:36.076209','2019-03-18 02:42:36.076159'),(62,'1552877803048646866224',1,0,'2019-03-18 02:56:43.491088','2019-03-18 02:56:43.491002'),(63,'15528784870510778296150',1,0,'2019-03-18 03:08:07.511433','2019-03-18 03:08:07.511383'),(64,'1552879072033439894749',1,0,'2019-03-18 03:17:52.335994','2019-03-18 03:17:52.335908'),(65,'15528790800493461457895',1,0,'2019-03-18 03:18:00.494243','2019-03-18 03:18:00.494187');
/*!40000 ALTER TABLE `hr_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_ordergoods`
--

DROP TABLE IF EXISTS `hr_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_ordergoods_goods_id_b3c19f94_fk_hr_goods_id` (`goods_id`),
  KEY `app_ordergoods_order_id_ef926487_fk_hr_order_id` (`order_id`),
  CONSTRAINT `app_ordergoods_goods_id_b3c19f94_fk_hr_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `hr_goods` (`id`),
  CONSTRAINT `app_ordergoods_order_id_ef926487_fk_hr_order_id` FOREIGN KEY (`order_id`) REFERENCES `hr_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_ordergoods`
--

LOCK TABLES `hr_ordergoods` WRITE;
/*!40000 ALTER TABLE `hr_ordergoods` DISABLE KEYS */;
INSERT INTO `hr_ordergoods` VALUES (1,1,3,1),(2,1,1,10),(3,1,2,10),(4,1,3,10),(5,1,4,10),(6,1,5,10),(7,2,5,11),(8,1,1,11),(9,1,4,11),(10,1,5,14),(11,1,3,14),(12,1,2,14),(13,1,2,16),(14,31,2,17),(15,31,2,20),(16,31,2,22),(17,62,2,28),(18,1,3,28),(19,1,4,28),(20,1,1,29),(21,1,2,30),(22,1,5,31),(23,1,1,32),(24,1,1,35),(25,1,1,36),(26,1,1,37),(27,1,2,39),(28,3,2,40),(29,1,2,41),(30,1,2,42),(31,1,4,43),(32,1,4,44),(33,1,4,45),(34,1,4,46),(35,1,5,46),(36,1,5,47),(37,1,4,54),(38,1,5,54),(39,1,5,55),(40,1,1,55),(41,1,1,56),(42,1,1,57),(43,2,1,58),(44,2,1,59),(45,1,1,60),(46,1,1,62),(47,1,2,64),(48,1,5,64);
/*!40000 ALTER TABLE `hr_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_user`
--

DROP TABLE IF EXISTS `hr_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(256) NOT NULL,
  `phonetnum` varchar(20) NOT NULL,
  `p_code` varchar(20) NOT NULL,
  `addr` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_user`
--

LOCK TABLES `hr_user` WRITE;
/*!40000 ALTER TABLE `hr_user` DISABLE KEYS */;
INSERT INTO `hr_user` VALUES (1,'qqqqqq','96e79218965eb72c92a549dd5a330112','13333333333','123','大学城创客小镇');
/*!40000 ALTER TABLE `hr_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-18 11:50:31
