CREATE DATABASE  IF NOT EXISTS `restaurante` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurante`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurante
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Maria','628340800','maria93@gmail.com'),(2,'Jesus','623440850','jesus56@hotmail.com'),(3,'Samuel','638341803','samu88@gmail.com'),(4,'Alex','658640770','alex365@hotmail.com'),(5,'Karen','668743666','karen134@gmail.com'),(6,'Rosa','688340542','rose98@gmail.com'),(7,'Joseph','618440630','josepgh_95@gmail.com'),(8,'Kenya','648640650','kenya67@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `locales_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favoritos_cliente1_idx` (`cliente_id`),
  KEY `fk_favoritos_locales1_idx` (`locales_id`),
  CONSTRAINT `fk_favoritos_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_favoritos_locales1` FOREIGN KEY (`locales_id`) REFERENCES `locales` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (1,1,2),(2,6,4),(3,1,5),(4,6,7),(5,2,1),(6,2,4),(7,3,2),(8,4,5),(9,5,7),(10,5,3),(11,7,8),(12,8,6);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_responsable` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abierto` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  UNIQUE KEY `direccion_UNIQUE` (`direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'El Bejeque Tasca Restaurante','C. León y Castillo, 82','928 70 15 82','Maria del Carmen',0),(2,'Gastrobar El Acebuche','C. los Blanquizales','633 94 49 39','Juan Andrés',1),(3,'Don Don Ramen','Calle Dr. Miguel Rosas, 9','928 96 41 21','Mikel',1),(4,'Anteo Bar Gastronomico','C. los Martínez de Escobar, 16','828 08 29 90','Abraham',1),(5,'All or nothing Burger','Av. Primero de Mayo, 14','828 04 56 07','Emily',0),(6,'Selvático Sushi & Grill','C. Secretario Artiles, 6','928 02 35 47','Jennifer',1),(7,'Restaurante Nativo Las Palmas','Ctra. la Costa, 48','928 47 25 49','Heather',1),(8,'Casa Tandoori Indian and Nepali','C. Jesús Ferrer Jimeno, 7','928 02 11 25','Kevin Jesús',0);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_mesa` int NOT NULL,
  `comensales` int NOT NULL,
  `ocupada` tinyint NOT NULL,
  `fecha_reserva` datetime DEFAULT NULL,
  `locales_id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mesas_locales1_idx` (`locales_id`),
  KEY `fk_mesas_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_mesas_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_mesas_locales1` FOREIGN KEY (`locales_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,1,10,0,'2023-03-25 16:00:00',1,6),(2,2,4,0,'2023-03-23 21:00:00',4,1),(3,3,6,0,'2023-04-03 13:30:00',4,4),(4,4,3,1,NULL,5,NULL),(5,2,8,1,NULL,8,NULL),(6,3,9,1,NULL,5,NULL),(7,1,2,0,'2023-04-07 13:00:00',6,7),(8,2,1,1,NULL,6,NULL),(9,1,7,1,NULL,6,NULL),(10,4,5,0,'2023-03-30 15:00:00',7,5),(11,5,4,1,NULL,3,NULL),(12,3,8,0,'2023-04-01 21:00:00',2,3);
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-23 13:02:09
