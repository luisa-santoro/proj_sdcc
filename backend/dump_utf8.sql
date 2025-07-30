-- MySQL dump 10.13  Distrib 9.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: news_finanza_db
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `articoli`
--

DROP TABLE IF EXISTS `articoli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articoli` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenuto` text COLLATE utf8mb4_unicode_ci,
  `data_pubblicazione` datetime(6) DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titolo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articoli`
--

LOCK TABLES `articoli` WRITE;
/*!40000 ALTER TABLE `articoli` DISABLE KEYS */;
/*!40000 ALTER TABLE `articoli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_pubblicazione` datetime(6) DEFAULT NULL,
  `descrizione` text COLLATE utf8mb4_unicode_ci,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `immagini` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titolo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` int NOT NULL DEFAULT '0',
  `creatore` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (6,NULL,'Descrizione originale54',NULL,NULL,'Titolo modificato 54',5,NULL),(8,'2025-06-01 10:00:00.000000','La BCE ha deciso di non modificare i tassi dÔÇÖinteresse nel mese di giugno.','ANSA',NULL,'Tassi BCE stabili a giugno_TESTMODIFICATO',1,NULL),(11,NULL,'Descrizione test',NULL,NULL,'Notizia Test',0,NULL),(12,NULL,'Senza titolo',NULL,NULL,NULL,0,NULL),(13,NULL,'Descrizione test',NULL,NULL,'Notizia Test',0,NULL),(14,NULL,'Senza titolo',NULL,NULL,NULL,0,NULL),(15,NULL,'Descrizione test',NULL,NULL,'Notizia Test',0,NULL),(16,NULL,'Senza titolo',NULL,NULL,NULL,0,NULL),(17,'2025-05-28 12:00:00.000000','Test descrizione','Fonte Notizia','url_immagine.jpg','Nuova Notizia',0,NULL),(18,'2025-05-28 15:00:00.000000','Contenuto della notizia...','Fonte XYZ','url/immagine.jpg','Nuova notizia di prova',0,NULL),(19,NULL,'Descrizione test',NULL,NULL,'Notizia Test',0,NULL),(20,NULL,'Senza titolo',NULL,NULL,NULL,0,NULL),(21,'2025-06-01 10:00:00.000000','La BCE ha deciso di non modificare i tassi dÔÇÖinteresse nel mese di giugno.','ANSA',NULL,'Tassi BCE stabili a giugno_TESTMODIF',1,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruolo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'$2a$10$Vh3EB/T/0zEUPVFYQfKDQ.9tO7ODZ7At0Uu5Qjv5BQoHXoKN5L7Py','ADMIN','admin'),(2,'$2a$10$IvZnJz/vAXyB4q0WQ7Cim.gIfOPI1p9UxnTUK5DjgxAxf5eD4iTtq','USER','utente'),(3,'$2a$10$F.27b12CNH3rMvDZ6TaigOMqmhnNoHhcy3s6GBoUUh0Z/mMO1Yt6C','ADMIN','admin');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-30 11:46:15
