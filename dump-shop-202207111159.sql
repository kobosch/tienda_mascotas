-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 45.7.231.218    Database: shop
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Administrador'),(2,'Cliente');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,68),(50,1,69),(51,1,70),(52,1,71),(53,1,72),(54,1,73),(55,1,74),(56,1,75),(57,1,76),(58,1,77),(59,2,68),(60,2,69),(61,2,70),(62,2,71),(63,2,72),(64,2,73),(65,2,74);
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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (68,'ViewShoopingCart',10,'ViewShoopingCart'),(69,'AddShoppingCart',10,'AddShoppingCart'),(70,'RemoveShoppingCart',10,'RemoveShoppingCart'),(71,'ViewProduct',10,'ViewProduct'),(72,'PayShoppingCart',12,'PayShoppingCart'),(73,'ViewOffers',10,'ViewOffers'),(74,'ViewHistory',12,'ViewHistory'),(75,'AdminUsers',13,'AdminUsers'),(76,'AdminProducts',10,'AdminProducts'),(77,'AdminBuys',12,'AdminBuys'),(78,'Can add log entry',1,'add_logentry'),(79,'Can change log entry',1,'change_logentry'),(80,'Can delete log entry',1,'delete_logentry'),(81,'Can view log entry',1,'view_logentry'),(82,'Can add permission',2,'add_permission'),(83,'Can change permission',2,'change_permission'),(84,'Can delete permission',2,'delete_permission'),(85,'Can view permission',2,'view_permission'),(86,'Can add group',3,'add_group'),(87,'Can change group',3,'change_group'),(88,'Can delete group',3,'delete_group'),(89,'Can view group',3,'view_group'),(90,'Can add user',4,'add_user'),(91,'Can change user',4,'change_user'),(92,'Can delete user',4,'delete_user'),(93,'Can view user',4,'view_user'),(94,'Can add content type',5,'add_contenttype'),(95,'Can change content type',5,'change_contenttype'),(96,'Can delete content type',5,'delete_contenttype'),(97,'Can view content type',5,'view_contenttype'),(98,'Can add session',6,'add_session'),(99,'Can change session',6,'change_session'),(100,'Can delete session',6,'delete_session'),(101,'Can view session',6,'view_session'),(102,'Can add categoria',8,'add_categoria'),(103,'Can change categoria',8,'change_categoria'),(104,'Can delete categoria',8,'delete_categoria'),(105,'Can view categoria',8,'view_categoria'),(106,'Can add compra',12,'add_compra'),(107,'Can change compra',12,'change_compra'),(108,'Can delete compra',12,'delete_compra'),(109,'Can view compra',12,'view_compra'),(110,'Can add estad o_compra',11,'add_estado_compra'),(111,'Can change estad o_compra',11,'change_estado_compra'),(112,'Can delete estad o_compra',11,'delete_estado_compra'),(113,'Can view estad o_compra',11,'view_estado_compra'),(114,'Can add producto',10,'add_producto'),(115,'Can change producto',10,'change_producto'),(116,'Can delete producto',10,'delete_producto'),(117,'Can view producto',10,'view_producto'),(118,'Can add compr a_producto',9,'add_compra_producto'),(119,'Can change compr a_producto',9,'change_compra_producto'),(120,'Can delete compr a_producto',9,'delete_compra_producto'),(121,'Can view compr a_producto',9,'view_compra_producto'),(122,'Can add suscrito',13,'add_suscrito'),(123,'Can change suscrito',13,'change_suscrito'),(124,'Can delete suscrito',13,'delete_suscrito'),(125,'Can view suscrito',13,'view_suscrito');
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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$h2SfEzoc8WHo3VJquW06kW$w5mQoliLFtDG83UO6n/6mEn44bcO0GT2aWOvvdvWSQU=','2022-07-11 14:29:10.612267',1,'admin','El','Admin','admin@admin.cl',1,1,'2022-06-30 20:36:15.000000'),(2,'pbkdf2_sha256$320000$8AE82NyoqCHi3gjMCNFZJV$KN+yzegCXPKrtFwJraAtYuMYsnu9YnuMN2Uf2qhlc8M=','2022-07-07 02:15:35.890118',1,'admin2','','','admin2@admin2.cl',1,1,'2022-07-01 04:04:21.859910'),(7,'pbkdf2_sha256$320000$WZGompYjtBPur1jmHWZK3a$y4X/kk07PZjgg3umkSbFoAhH53g+57XlTEftevzORYg=','2022-07-01 20:08:29.509096',0,'cliente','cliente','cliente','cliente@cliente.cl',0,1,'2022-07-01 20:08:24.458746'),(8,'pbkdf2_sha256$320000$BHpBzucnwpypAPU6U8cyF2$cgq3YBdKzcNiqa6Yw9ZPi+DzQOMoprYBC07h7Fej0iI=','2022-07-01 20:14:10.876525',0,'cliente2','cliente2','cliente2','cliente2@cliente2.cl',0,1,'2022-07-01 20:13:58.108448'),(9,'pbkdf2_sha256$320000$r7YjUua5dNXFXJhWqGnuLw$S61glJP2F+3iTfY470iypUbwb0xQ4mBIUVX20HFdmmE=',NULL,0,'cliente4','cliente4','cliente4','cliente4@cliente.cl',0,1,'2022-07-01 20:17:44.949764'),(10,'pbkdf2_sha256$320000$0DsTtWXf1BqUZ7CsffCZB1$6aPAzYpOBgqVq/JEd6JmNrsL7ykF9XkS1fjOn1reJW0=','2022-07-01 20:18:24.360848',0,'cliente5','cliente5','cliente5','cliente5@cliente.cl',0,1,'2022-07-01 20:18:12.300912'),(11,'pbkdf2_sha256$320000$cEk0qDleRaMP3rP0gdGi29$6UBLqQGbB/87cxoLAwq1/g5s7V/UPfp35cPICxe6D8U=','2022-07-01 20:26:27.782677',0,'clientetest','clientetest','clientetest','clientetest@cliente.cl',0,1,'2022-07-01 20:26:15.783819'),(23,'pbkdf2_sha256$320000$wq8pnO3pGvb7GA7R8seo1p$nD86+ldf0HZdtlrJbUKm0dHURaJFzgum4Mn36+So4ws=',NULL,0,'administrador','administrador','administrador','administrador@admin.cl',0,1,'2022-07-01 20:52:28.773032'),(24,'pbkdf2_sha256$320000$WUxujfc8yHQw2Rmho2h3t3$UvuJnFzfk9aabCjsID2li5RDVij9SowHPbSr5lTJpc0=','2022-07-04 22:07:32.035077',0,'testenotesteo','testenotesteo','testenotesteo','testenotesteo@testenotesteo.cl',0,1,'2022-07-04 22:07:27.643969'),(25,'pbkdf2_sha256$320000$0jMxUsAN6EybkdOXCAVnfs$CcXGboTOGuA9TjAyKkDOcbWCobS73M7zbh01mpWpMOI=','2022-07-05 20:56:36.000000',0,'elclienteconpermisos','elclienteconpermisos','elclienteconpermisos','elclienteconpermisos@cliente.cl',0,0,'2022-07-05 19:58:02.000000'),(26,'pbkdf2_sha256$320000$t1KjfBUl4m7nDTKx2mpxWM$+PZRysmWRUaCZaMYgVGp/m5aDRSZSM1umXZyPBonzKU=','2022-07-05 21:23:48.528829',0,'newclient','newclient','newclient','newclient@newclient.cl',0,1,'2022-07-05 21:01:03.375480'),(27,'pbkdf2_sha256$320000$2KL2HrFQ2p9gqnu7qLVDjd$Q319L6cLFJH5pYe0maPsOJkk6a89km/O96HVJlBIW2s=','2022-07-05 23:44:19.452179',0,'usuario1','usuario1','usuario1','usuario1@ususario.cl',0,1,'2022-07-05 23:27:06.496826'),(28,'pbkdf2_sha256$320000$0vK8Bnw05GuH7PWDepwhKn$kFLdqq8FNGdSx1qJ60hp4PR8Cm2cBlP0GupeQk2kUpY=','2022-07-05 23:44:02.906805',0,'user2','user2','user2','user2@user2.cl',0,1,'2022-07-05 23:29:38.731494'),(29,'pbkdf2_sha256$320000$IGGmHsdklpUbGF5pkQHo3P$uRmk1DBJHbuESvXN4ZbtJNRwYaDSbog5Xz4rit4yAeE=','2022-07-07 02:09:24.256194',0,'lucas','lucas','skywalker','elamordemivida@teamo.cl',0,1,'2022-07-07 02:09:18.421173'),(30,'pbkdf2_sha256$320000$unAHWUzDzN4MFcb4YkXYCL$u8Nwp7i5oU3u45DNtIlcuF7o7Beuqb2xn3eMfsfmvuQ=','2022-07-07 02:51:55.910245',0,'noesadmin','noesadmin','es lucas y eso es mejor','noesadmin@noesadmin.cl',0,1,'2022-07-07 02:51:50.393771'),(31,'pbkdf2_sha256$320000$z4FUFk2yLvdzl9dCthtXgz$KNA//07BeJv9BMaaqraLbL86Xu9reNSGv6jUd1mTug4=',NULL,0,'tama','taja','tama','tamaa@tama.cl',0,1,'2022-07-10 00:27:53.767142'),(32,'pbkdf2_sha256$320000$idM8LS4hkdf4BLKgHzDa2N$S8A1IW3Wvp4ia/92mQhEG5aLyKmxQNYmdHFh26FPFs8=','2022-07-10 00:28:51.048740',0,'tamaj','tamaj','tamaj','tamaj2@tamaj.cl',0,1,'2022-07-10 00:28:44.096097'),(33,'pbkdf2_sha256$320000$R87AE8ppdVYe1z3ggPkVDC$Ovqxea6da668s/fncs3n5eWg6hPAOgVGPgUWtP16zLk=','2022-07-10 18:45:58.383403',0,'nicole','nic','vene','nicolevenegas7@gmail.com',0,1,'2022-07-10 18:45:46.490347'),(34,'pbkdf2_sha256$320000$i1r9lLpDL5MPGsQ2qirnqM$0VzcsObvX+JS5nCCG+SjhkcRzRfyNqqD3aMG4w43WP8=','2022-07-11 01:12:47.832656',0,'tamatown','tamatown','tamatown','tamatowm@gmail.cl',0,1,'2022-07-11 01:12:29.893634'),(35,'pbkdf2_sha256$320000$K4qSOCd2wB2U9DLaq2ZZL0$UKLUzBteaV0Kgz8YedlPayNO7hbxBj7KinTopksBgRs=','2022-07-11 01:56:09.064385',0,'potito','potito','potito','potito2@gmailpotito.cl',0,1,'2022-07-11 01:55:53.861218'),(36,'pbkdf2_sha256$320000$50Pr1zGJHvQPO1lpsePEsp$evaYHMXAXmlHavKS2rJd8HXBU0UxlTqOJrfkrRsgeOI=','2022-07-11 13:58:55.352521',0,'ignacia','ignacia ','alvear','ignacia@gmail.com',0,1,'2022-07-11 02:06:18.801697'),(37,'pbkdf2_sha256$320000$o5x4q0Uh2Fio1o0rd41s30$/PJNA1V2ghE109gKSB9UdwzsUtFUQ4kpsn67K8ogCZ8=',NULL,0,'nicolee','nicole','venegas','nicole123@d.com',0,1,'2022-07-11 14:00:33.149385'),(38,'pbkdf2_sha256$320000$ALAdocqy5jn6nl37i0Fg0X$nfZNHjWAFAuenPeqw8BTuzVlltiqadUVvIlREsqPqCA=','2022-07-11 14:01:58.180683',0,'user5','user','user','user@g.com',0,1,'2022-07-11 14:01:46.836918');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(4,7,2),(5,8,2),(6,9,2),(7,10,2),(8,11,2),(17,23,1),(18,24,2),(19,25,2),(20,26,2),(21,27,2),(22,28,2),(23,29,2),(24,30,2),(25,31,2),(26,32,2),(27,33,2),(28,34,2),(29,35,2),(30,36,2),(31,37,2),(32,38,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Gatos'),(2,'Perros'),(3,'Conejos'),(5,'Erizos'),(6,'Tama'),(8,'');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `monto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado_id` bigint(20) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `tarjeta` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compra_estado_id_e1acb72e_fk_estado_compra_id` (`estado_id`),
  KEY `compra_usuario_id_227c6c2e_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `compra_estado_id_e1acb72e_fk_estado_compra_id` FOREIGN KEY (`estado_id`) REFERENCES `estado_compra` (`id`),
  CONSTRAINT `compra_usuario_id_227c6c2e_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,30,'2022-06-30',1,1,'calle falsa 123','123456'),(2,20,'2022-06-30',1,1,'calle falsa 321','123456'),(3,20,'2022-06-30',1,1,'calle falsa 321','123456'),(4,6000,'2022-06-30',1,1,'232','234323454324'),(5,6020,'2022-06-30',1,1,'123','234323454324'),(6,3010,'2022-06-30',4,1,'casa falsa','234323454324'),(7,2030,'2022-07-01',4,2,'232','13213243234'),(8,2030,'2022-07-01',4,2,'Hola mundo inc','123456'),(9,3000,'2022-07-01',4,2,'volvio','2020'),(10,9000,'2022-07-04',4,1,'2343 casa 12','2929292929299'),(11,3000,'2022-07-04',1,1,'Hola Mundo','123456'),(12,100000,'2022-07-05',4,1,'Hola Mundillo amiguillo','32323432323'),(13,30000,'2022-07-05',4,26,'232123e432','32323432323'),(14,20130,'2022-07-06',4,29,'La casa de tu abuela','234323454324'),(15,10,'2022-07-09',1,27,'Pollo frito ','234323454324'),(16,37240,'2022-07-10',3,34,'los pinguinos 44','434345534345345'),(17,398000,'2022-07-10',4,1,'profesor alcaino 01188','2744556'),(18,1000,'2022-07-10',4,36,'profesor alcaino 01188','cxw34e3'),(19,2000,'2022-07-11',4,1,'calle falsa 123','34e455r'),(20,4060,'2022-07-11',3,38,'calle falsa 123','34e455r');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_producto`
--

DROP TABLE IF EXISTS `compra_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_producto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `compra_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compra_producto_compra_id_98fc22f9_fk_compra_id` (`compra_id`),
  KEY `compra_producto_producto_id_255df000_fk_producto_id` (`producto_id`),
  CONSTRAINT `compra_producto_compra_id_98fc22f9_fk_compra_id` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`),
  CONSTRAINT `compra_producto_producto_id_255df000_fk_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_producto`
--

LOCK TABLES `compra_producto` WRITE;
/*!40000 ALTER TABLE `compra_producto` DISABLE KEYS */;
INSERT INTO `compra_producto` VALUES (3,2,10,3,2),(4,2,3000,4,1),(5,2,3000,5,1),(6,2,10,5,2),(7,1,3000,6,1),(8,1,10,6,2),(9,1,2030,7,2),(10,1,2030,8,2),(11,1,3000,9,3),(12,3,3000,10,1),(13,1,3000,11,1),(14,5,20000,12,1),(15,1,30000,13,1),(16,1,120,14,4),(17,1,20000,14,1),(18,1,10,14,2),(19,1,10,15,2),(20,1,6500,16,8),(21,1,30500,16,14),(22,2,120,16,4),(23,199,2000,17,3),(24,1,1000,18,5),(25,2,1000,19,5),(26,2,2030,20,2);
/*!40000 ALTER TABLE `compra_producto` ENABLE KEYS */;
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
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-06-30 20:38:35.196019','1','Comida de perro',1,'[{\"added\": {}}]',10,1),(2,'2022-06-30 20:49:18.726075','2','Collar de perro',1,'[{\"added\": {}}]',10,1),(3,'2022-06-30 21:51:57.658238','1','Administrador',1,'[{\"added\": {}}]',3,1),(4,'2022-06-30 21:52:04.927137','2','Cliente',1,'[{\"added\": {}}]',3,1),(5,'2022-06-30 22:22:26.370126','3','admin',1,'[{\"added\": {}}]',13,1),(6,'2022-06-30 22:22:36.601323','3','admin',3,'',13,1),(7,'2022-06-30 22:31:11.594112','4','admin',1,'[{\"added\": {}}]',13,1),(8,'2022-07-01 03:55:18.350142','1','admin',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\"]}}]',4,1),(9,'2022-07-01 20:01:42.745174','3','cliente1',3,'',4,1),(10,'2022-07-01 20:04:54.446116','4','Cliente',3,'',4,1),(11,'2022-07-01 20:06:41.442172','6','cliente',3,'',4,1),(12,'2022-07-01 20:06:49.763208','5','cliente1',3,'',4,1),(13,'2022-07-01 20:35:27.648023','12','admin3',3,'',4,1),(14,'2022-07-01 20:44:20.089104','16','admin7',3,'',4,1),(15,'2022-07-01 20:46:39.013798','13','admin4',3,'',4,1),(16,'2022-07-01 20:46:39.069994','14','admin5',3,'',4,1),(17,'2022-07-01 20:46:39.087058','15','admin6',3,'',4,1),(18,'2022-07-01 20:46:39.151351','17','admin8',3,'',4,1),(19,'2022-07-01 20:46:53.211994','18','administrador',3,'',4,1),(20,'2022-07-01 20:48:02.616340','19','administrador',3,'',4,1),(21,'2022-07-01 20:48:36.903046','20','administrador',3,'',4,1),(22,'2022-07-01 20:49:34.111207','21','administrador',3,'',4,1),(23,'2022-07-01 20:52:20.547291','22','administrador',3,'',4,1),(24,'2022-07-05 19:55:42.788812','1','Administrador',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(25,'2022-07-05 19:56:47.289741','2','Cliente',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(26,'2022-07-05 21:00:19.239761','25','elclienteconpermisos',2,'[]',4,1),(27,'2022-07-10 00:31:39.026426','5','Erizos',1,'[{\"added\": {}}]',8,1),(28,'2022-07-10 00:31:41.859048','5','Erizos',2,'[]',8,1),(29,'2022-07-10 00:31:49.548789','4','categoria de prueba',3,'',8,1),(30,'2022-07-10 01:11:44.078875','6','Tama',1,'[{\"added\": {}}]',8,1),(31,'2022-07-11 01:49:03.684072','17','Chalequito Cachorro',1,'[{\"added\": {}}]',10,1),(32,'2022-07-11 01:53:37.352042','17','Chaqueta Cachorro',2,'[{\"changed\": {\"fields\": [\"Nombre\", \"Imagen\"]}}]',10,1),(33,'2022-07-11 01:54:21.533090','17','Chaqueta Cachorro',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',10,1),(34,'2022-07-11 05:42:49.830784','21','Pupi Snack',1,'[{\"added\": {}}]',10,1),(35,'2022-07-11 05:53:11.702712','23','Comedero',1,'[{\"added\": {}}]',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(8,'app','categoria'),(12,'app','compra'),(9,'app','compra_producto'),(11,'app','estado_compra'),(10,'app','producto'),(13,'app','suscrito'),(7,'app','tarjeta'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-06-30 20:24:45.399716'),(2,'auth','0001_initial','2022-06-30 20:24:46.322227'),(3,'admin','0001_initial','2022-06-30 20:24:46.713714'),(4,'admin','0002_logentry_remove_auto_add','2022-06-30 20:24:46.774661'),(5,'admin','0003_logentry_add_action_flag_choices','2022-06-30 20:24:46.814742'),(6,'contenttypes','0002_remove_content_type_name','2022-06-30 20:24:46.974585'),(7,'auth','0002_alter_permission_name_max_length','2022-06-30 20:24:47.114368'),(8,'auth','0003_alter_user_email_max_length','2022-06-30 20:24:47.174149'),(9,'auth','0004_alter_user_username_opts','2022-06-30 20:24:47.229994'),(10,'auth','0005_alter_user_last_login_null','2022-06-30 20:24:47.313976'),(11,'auth','0006_require_contenttypes_0002','2022-06-30 20:24:47.344157'),(12,'auth','0007_alter_validators_add_error_messages','2022-06-30 20:24:47.384343'),(13,'auth','0008_alter_user_username_max_length','2022-06-30 20:24:47.443986'),(14,'auth','0009_alter_user_last_name_max_length','2022-06-30 20:24:47.504620'),(15,'auth','0010_alter_group_name_max_length','2022-06-30 20:24:47.605492'),(16,'auth','0011_update_proxy_permissions','2022-06-30 20:24:47.689629'),(17,'auth','0012_alter_user_first_name_max_length','2022-06-30 20:24:47.744071'),(18,'sessions','0001_initial','2022-06-30 20:24:47.845192'),(19,'app','0001_initial','2022-06-30 20:25:56.304345'),(20,'app','0002_remove_categoria_descripcion_remove_categoria_imagen','2022-06-30 20:27:33.614191'),(21,'app','0003_producto_oferta','2022-06-30 20:46:16.228998'),(22,'app','0004_suscrito','2022-06-30 22:05:03.208948'),(23,'app','0005_remove_compra_tarjeta_delete_tarjeta','2022-07-01 00:15:38.250039'),(24,'app','0006_compra_direccion_compra_tarjeta','2022-07-01 00:18:47.636614');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0ynkhny5z1wun8cfqkj9ovfvv3ms9hda','.eJxVjDsOwjAQRO_iOrKStTeGlPScAKFo1x8SQLHkT4W4O4lIAeXMvHkvMVIt01izT-PsxCA60fx2TPbhl21wd1puUdq4lDSz3BC5r1meo_PP087-CSbK0_o2qEBp5oBsgDQjtJ0ntIYIUdkjAGhgZQOw06Z3fWiVak3nDow9qrBKc802zSWKoaTqG2EpfePl-v4ArWxBkg:1oAmvH:8aqY0EYm9cPoF6iN8stpKEimFNQabXDZJkY8jehYy5s','2022-08-10 06:29:35.375718'),('2lvdr4har0ugu80syg478m22kclhy7c8','.eJxVjDsOwjAQRO_iOrJsB39CSc8JEIrW3jUJoFjyp0LcnUSkAGmamTczLzZCq9PYCuVxRnZkinW_mYfwoGUDeIfllnhIS82z51uF77Twc0J6nvbu38EEZVrX0jgSq6Q7yN66HkXUkawnlBFQaxuVVVoJbdwglAGEwZghotU9SI1-PS2thDzXxI41N-pYgPy1l-v7A6HbQY0:1o9H3L:qd7_hEnbTKgXKABIZVTlKf67IiTBFkZkmg0QZXLfj5s','2022-08-06 02:15:39.090505'),('58zknkgiokswxnxh29yfvxyas87jo0fg','.eJxVjDsOwjAQRO_iOrKStTeGlPScAKFo1x8SQLHkT4W4O4lIAeXMvHkvMVIt01izT-PsxCA60fx2TPbhl21wd1puUdq4lDSz3BC5r1meo_PP087-CSbK0_o2qEBp5oBsgDQjtJ0ntIYIUdkjAGhgZQOw06Z3fWiVak3nDow9qrBKc802zSWKoaTqG2EpfePl-v4ArWxBkg:1oAi8F:EDqvbgeitYNq85-iZUaqo4YZ9inFkDbcQYSNrNaC2Ko','2022-08-10 01:22:39.526059'),('6fi05kmfatm9jfbszudtdhz38tiu51mi','e30:1oAhpX:HMwvSqTbrN8PMy2AgkaqPlhMUwP5uxR53g6WjTPf4_U','2022-08-10 01:03:19.039245'),('6h9q143wghok74vnaf3l1fq6uodtz518','.eJxVjDsOwjAQRO_iOrKStTeGlPScAKFo1x8SQLHkT4W4O4lIAeXMvHkvMVIt01izT-PsxCA60fx2TPbhl21wd1puUdq4lDSz3BC5r1meo_PP087-CSbK0_o2qEBp5oBsgDQjtJ0ntIYIUdkjAGhgZQOw06Z3fWiVak3nDow9qrBKc802zSWKoaTqG2EpfePl-v4ArWxBkg:1oAdsY:QOdWPLuJtZ8mGkYrDIWD4dkUbPjs5N4mLhCnFUx1t-g','2022-08-09 20:50:10.657394'),('8gkj00kgv8glwc2snpkb7jrudxrc6c2j','.eJxVjDsOwjAQRO_iOrKStTeGlPScAKFo1x8SQLHkT4W4O4lIAeXMvHkvMVIt01izT-PsxCA60fx2TPbhl21wd1puUdq4lDSz3BC5r1meo_PP087-CSbK0_o2qEBp5oBsgDQjtJ0ntIYIUdkjAGhgZQOw06Z3fWiVak3nDow9qrBKc802zSWKoaTqG2EpfePl-v4ArWxBkg:1oAi8I:JBtBqdwMeHevYXopol2wseiIqIzMLU0PUdONrEzj-q0','2022-08-10 01:22:42.353817'),('8i06r9eky9au1bhyrgnp6n49isa2hdcw','.eJxVjDsOwjAQRO_iOrKStTeGlPScAKFo1x8SQLHkT4W4O4lIAeXMvHkvMVIt01izT-PsxCA60fx2TPbhl21wd1puUdq4lDSz3BC5r1meo_PP087-CSbK0_o2qEBp5oBsgDQjtJ0ntIYIUdkjAGhgZQOw06Z3fWiVak3nDow9qrBKc802zSWKoaTqG2EpfePl-v4ArWxBkg:1oAuPk:JuOftY-WoMKHz7AsBElnjPMq6HSe03Ry87EkL3T_-P8','2022-08-10 14:29:32.206077'),('96k4tl70c6mp9f79mohk6xdplveohkig','.eJxVj8lugzAURX8lemtkjI0hYdmu-wVVhZ4HwEmwkYdVlH-vadKqWd7pSPcGI-a0jDmaMFoNAzRQ_fckqotxe6DP6GZPlHcpWEn2CnmmkXx4ba5vz-4LYMG4lHUvOOOtlJOQPcNWCkYbg0L1iEJwdWKMtUxyNTGp277T3UQ5p32jj1J0gk8FGnNUwSYPQwrZVKAwPOTnDbbgdVa7gHe_Wo0HbQ6bCcHDXnSpWOUEryD5hFcYTpTSCv4eb8EoW9b8Ya84G1eiejXaYv1Lj7X6gZPzNsP96_4Niq9nbA:1o7Le9:WWW7ilZomzFdMJeB98r27a3XISBRS7CNmznQvSCDCfs','2022-07-31 18:45:41.798997'),('9aj7hkess9wtrkjbo8do50hd9fyn5hsn','.eJxVjDsOwjAQRO_iOrKStTeGlPScAKFo1x8SQLHkT4W4O4lIAeXMvHkvMVIt01izT-PsxCA60fx2TPbhl21wd1puUdq4lDSz3BC5r1meo_PP087-CSbK0_o2qEBp5oBsgDQjtJ0ntIYIUdkjAGhgZQOw06Z3fWiVak3nDow9qrBKc802zSWKoaTqG2EpfePl-v4ArWxBkg:1oAmM4:OYXwJU-fa6IYd1uOU-l7xEK83aQXJw8EKZ6Zhjn6yZA','2022-08-10 05:53:12.329901'),('ag1tnuv2i1mtu2y752xm6rjld0qcp747','e30:1o8rwj:3eDXhgwJhzBB1cGwyGwZdDc19u0Dos1RzjSsIZB7CmE','2022-08-04 23:27:09.987725'),('e5o835gddody6306t13z5c2d3vafu26m','e30:1o8sAx:fzGdYsmeLKYvs8Bze9nYd6V1OVpzJjF4cYt3jmBpKIU','2022-08-04 23:41:51.653442'),('gbnrxh1ge6uo3m3vmbm37mqibbfz3ugu','e30:1oAtcA:6xuVqywiWL1T9Ew2yrlIcM8YmfC6tH8BYune-1XtyKY','2022-08-10 13:38:18.189595'),('gma5xl4gqd14x0p7y34nwlkhlwjhqgli','e30:1oAtcA:6xuVqywiWL1T9Ew2yrlIcM8YmfC6tH8BYune-1XtyKY','2022-08-10 13:38:18.205248'),('hoyqw2v8ie8tg39c0fu3cj4n8d8t02wh','.eJxVjDsOwjAQRO_iOrKStTeGlPScAKFo1x8SQLHkT4W4O4lIAeXMvHkvMVIt01izT-PsxCA60fx2TPbhl21wd1puUdq4lDSz3BC5r1meo_PP087-CSbK0_o2qEBp5oBsgDQjtJ0ntIYIUdkjAGhgZQOw06Z3fWiVak3nDow9qrBKc802zSWKoaTqG2EpfePl-v4ArWxBkg:1oAi8H:9S0oFzvwb60GIKX-7oM3askFdQHe1euhG_skv4iHh5E','2022-08-10 01:22:41.429870'),('j74mtsv7sdsoblirbs9ncioufjuos6o0','e30:1o8rxA:1t2BpxYr8d4qsHERjWMq9mnEmSF-mAW5mbqNETO1eUo','2022-08-04 23:27:36.666631'),('jdxzg6lg5l3p5lzpfcb2igu0qmbmedsg','e30:1o8sCB:0-sveFjQwch984546fqVrBpPJXdmC1zrqwWkXLA0GCA','2022-08-04 23:43:07.074642'),('jj27aidh36m29vracq94sfmipkby26wn','e30:1o8s2r:cWciTaDyGYwZ4V3n6txHCmjiLK6PMBv1jcUp0Evj_xU','2022-08-04 23:33:29.663264'),('kjn80ejlrxnuc2g6qqzuqf27680sl1wk','e30:1o8sBl:7qhWAk3aEQrARyBOjsulTROFXWazFLpiYJE5xkyX-Go','2022-08-04 23:42:41.108113'),('omcrowc04jrmjevv1am8agzdnkkd5n5x','e30:1oAhpV:FDQ8kl_SafKZ3oxQfS7dF0l0fMIPAS11iJT5KVJOpIE','2022-08-10 01:03:17.167832'),('pl91e5ulbiuzw7415ntnmqi8p0jy7wxs','.eJxVjDsOwjAQBe_iGln2rjcGSnrOYO36gwMoluKkQtwdIqWA9s3Me6nA61LD2vMcxqTOyqrD7yYcH3naQLrzdGs6tmmZR9Gbonfa9bWl_Lzs7t9B5V6_tScEdCKFxAM7ITA2M0XPTITxBAAOBGMBSc4PaSgG0XibjkIDYVHvD9I5N1Y:1oAevg:TaZpofvuTnGMSqQZiMa_jhMbGb57lhHzpzmnuPk69sM','2022-08-09 21:57:28.606438'),('vly1svvituadlop4xfdawub6tq8t1kvv','e30:1oAtcA:6xuVqywiWL1T9Ew2yrlIcM8YmfC6tH8BYune-1XtyKY','2022-08-10 13:38:18.236512'),('z2l3953nv2hz6efb2vznojeuss0s2n0a','.eJxVjDsOwjAQRO_iOrKStTeGlPScAKFo1x8SQLHkT4W4O4lIAeXMvHkvMVIt01izT-PsxCA60fx2TPbhl21wd1puUdq4lDSz3BC5r1meo_PP087-CSbK0_o2qEBp5oBsgDQjtJ0ntIYIUdkjAGhgZQOw06Z3fWiVak3nDow9qrBKc802zSWKoaTqG2EpfePl-v4ArWxBkg:1oAu5o:KQEjG06flWwwwv_0ED5q4he-1R4CsutBczEWWmOt7fQ','2022-08-10 14:08:56.103500'),('zl1dkt21w5ldy1l9ylm5bt9rkus67cb0','.eJxVjDsOwjAQRO_iOrKStTeGlPScAKFo1x8SQLHkT4W4O4lIAeXMvHkvMVIt01izT-PsxCA60fx2TPbhl21wd1puUdq4lDSz3BC5r1meo_PP087-CSbK0_o2qEBp5oBsgDQjtJ0ntIYIUdkjAGhgZQOw06Z3fWiVak3nDow9qrBKc802zSWKoaTqG2EpfePl-v4ArWxBkg:1oAiOj:bEjqLpG0vi-9Kx6_y_jhegFUhLUxGPRnOmoawyLSPvo','2022-08-10 01:39:41.415764'),('zyne3ohfxg6y6s4hdwmauegvzt66c72e','.eJxVjDsOwjAQRO_iOrKStTeGlPScAKFo1x8SQLHkT4W4O4lIAeXMvHkvMVIt01izT-PsxCA60fx2TPbhl21wd1puUdq4lDSz3BC5r1meo_PP087-CSbK0_o2qEBp5oBsgDQjtJ0ntIYIUdkjAGhgZQOw06Z3fWiVak3nDow9qrBKc802zSWKoaTqG2EpfePl-v4ArWxBkg:1oAi8M:UGtUwRO_6DSm9D66NhE7NwuPyKVTOYSB0ZeiNg1u84g','2022-08-10 01:22:46.213389');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_compra`
--

DROP TABLE IF EXISTS `estado_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_compra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_compra`
--

LOCK TABLES `estado_compra` WRITE;
/*!40000 ALTER TABLE `estado_compra` DISABLE KEYS */;
INSERT INTO `estado_compra` VALUES (1,'Compra realizada.'),(2,'Preparando pedido'),(3,'Pedido enviado'),(4,'Entregado');
/*!40000 ALTER TABLE `estado_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `oferta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_categoria_id_67131168_fk_categoria_id` (`categoria_id`),
  CONSTRAINT `producto_categoria_id_67131168_fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Comida de perro Guau Forte 40 kilos','       Comida para el campeón de la casa       ','productos/guau.jfif',30000,28,0,2,20000),(2,'Collar de perro','Collar para perrito rosado','productos/collar.jfif',2030,16,1,2,10),(3,'conejo','conejo','productos/conejo_604fPWB.jfif',3000,0,1,3,2000),(4,'Gatolate','           Se que no es para animales..pero tiene la palabra gato, debe contar.           ','productos/churuperros.png',2332,100,0,1,120),(5,'Collar para gato','  No puede se AMBORGESA pero si SANDWICH  ','productos/descargar.jfif',2000,0,1,1,1000),(6,'botas para gato','Invita a tu gato a una gran aventura junto a un burro y un ogro','productos/botas.jfif',1233,123,1,1,0),(7,'KITTEN OPTISTART','Pro Plan Kitten Optistart es una comida para gatitos de hasta doce meses de edad. Elaborado con carne fresca de pollo y formulada especialmente con una mezcla innovadora de nutrientes, como el calostr','productos/kitten-optistart.jpg',44910,50,1,1,25400),(8,'Alimento Versele-Laga Nature para conejo 700gr','Alimento completo para Conejos, libre de granos, alto contenido de verduras, vitaminas y minerales.\r\n\r\nAlimento completo para Conejos, libre de granos, alto contenido de verduras, vitaminas y minerale','productos/X_versele-laga-conejo-700-grs1104.jpg',6500,11,1,3,3443),(9,'Living World Dispensador Heno Giratorio Conejo Cuy','Una manera divertida de comer heno sanamente ya que mantiene el heno alejado del suelo de la jaula y evita que se ensucie, también estimula el comportamiento natural de búsqueda.\r\n\r\n','productos/X_livingworlddispensadorhenogiratorioconejocuy3269.jpg',12410,24,1,3,10000),(10,'LICKIMAT FELIX','LickiMat Felix es un alimentador lento para gatos que estimula el lamido, un comportamiento que provoca la segregación de hormonas calmantes en tu gato. Hace que las comidas pequeñas duren más tiempo,','productos/lickimat-felix.jpg',10900,45,1,1,7000),(11,'Cat It Nibbly Snack Pollo 90gr','Snack para gatos horneados artesanalmente con pollo, para gatos.\r\n\r\n','productos/X_catitnibblysnackpollo1061.jpg',4000,30,1,1,3500),(12,'Birba Kit bandeja sanitaria','Bandeja sanitaria que incluye borde, plato y pala.','productos/X_birbakitbandejasanitaria8290.jpg',7990,45,1,1,5000),(13,'Peluche Tama','Peluche tematico de Tama, original','productos/station_master_tama_cat_1452595551_eb9041ae.jpg',15000,40,1,6,10000),(14,'KIT TAMA','KIT DE OBJETOS ORIGINALES DE LA ESTACION DE TAMA','productos/station-master-tama-the-cat_25.jpg',30500,9,1,6,25990),(15,'Plato Con Pelotas','Plato excelente para el aburrimiento de tu mascota, controla su obesidad y estimúlalo mentalmente\r\n\r\n','productos/Diapositiva5-7.jpg',8990,321,1,1,6500),(16,'Churu Pollo Con Vegetales 4u.',' Churu Pollo Con Vegetales 4u.\r\n ','productos/churuperros_oAYRuH4.png',3290,34,1,2,2600),(17,'Chaqueta Cachorro','  desde 3 meses  ','productos/chaleocachorro1.png',10000,50,1,2,0),(18,'Cama para perrito','Cama para que tu peludo duerma calentito','productos/camacachorro.jfif',15990,100,1,2,10000),(19,'Cactus Mordedor','Juguete para tu mejor amigo','productos/cactus_mordelon.jfif',8990,50,1,2,8000),(20,'Botas','Manten las patitas de tu amigo calentitas \r\ncon estas botas termicas','productos/botasperro.jpg',11200,50,1,2,11000),(21,'Pupi Snack',' Hechas con amor y las mejores vitaminas ','productos/pupisnack.jpg',3690,20,1,2,0),(22,'Lentes Bad Bunny','Lentes facheritos coleccion bad bunny','productos/lentes_badboni.png',40000,10,1,3,10000),(23,'Comedero',' Comedero y bebedero para conejo ','productos/comedero-768x784.jpg',9990,80,1,3,0),(24,'Correa','arnes para conejo 180cm ','productos/arnesconejo.jpg',4000,200,1,3,0),(25,'Guante para pelos','Guantes de goma para peinar tu conejo','productos/Peinador_Conejo.jpg',7000,100,1,3,5000),(26,'Pelota','Pelota para conejo','productos/conejopelota.jfif',2000,100,1,3,0),(27,'Comedero y juguete','Comedero y jueguete de madera para conejos','productos/juguete_y_comedero.jfif',5990,10,1,3,0),(28,'Pellets','Pellets para conejos a granel','productos/Rabbit-Pellets-610x440.jpg',990,200,1,3,0),(29,'Jaula mediana','Jaula mediana para erizos 80x60cm','productos/jaula.jfif',50000,55,1,5,45000),(30,'Rueda para erizo','Rueda para erizos 30cm con base','productos/rueda_erizo.jpg',11000,67,1,5,10000),(31,'Tropifit Atelerix','Comida para erizos 300gr','productos/comidaerizo.jpg',5990,50,1,5,0),(32,'Casa para erizo','Casa para erizo 30cm','productos/casaerizo.jfif',15000,20,1,5,1000),(33,'Jaula grande','Jaula para erizo 100x100cm','productos/jaula_grande.jpg',60000,10,1,5,50000),(34,'Cama para erizo','Cama blandita para erizo','productos/casaerizoanimales.jpg',6000,40,1,5,0),(35,'Juguete de goma','Juguete de goma entretenido para erizos','productos/jugueteerizo.jfif',1500,200,1,5,1000),(36,'Transportador','Transportador para erizos y animales pequeños 40x30cm','productos/transportador.jpg',20000,36,1,5,0);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscrito`
--

DROP TABLE IF EXISTS `suscrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suscrito` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `suscrito_usuario_id_94ba8f59_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `suscrito_usuario_id_94ba8f59_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscrito`
--

LOCK TABLES `suscrito` WRITE;
/*!40000 ALTER TABLE `suscrito` DISABLE KEYS */;
INSERT INTO `suscrito` VALUES (4,1),(5,2),(6,24),(7,26),(9,27),(8,28),(10,29),(11,34),(12,36);
/*!40000 ALTER TABLE `suscrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-11 11:59:42
