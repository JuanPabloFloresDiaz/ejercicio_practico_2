-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_libro_express
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_cliente` varchar(36) NOT NULL DEFAULT uuid(),
  `nombre_cliente` varchar(50) NOT NULL,
  `email_cliente` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `uq_email_cliente_unico` (`email_cliente`),
  UNIQUE KEY `uq_telefono_cliente_unico` (`telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('2b39962f-d65f-11ee-8410-3c5576fe2454','Juan','juan@example.com','123456781'),('2b3d6dbb-d65f-11ee-8410-3c5576fe2454','Jose','Jose@example.com','123456782'),('2b3e00b0-d65f-11ee-8410-3c5576fe2454','Julio','Julio@example.com','123456783'),('2b3e91ef-d65f-11ee-8410-3c5576fe2454','Julia','Julia@example.com','123456784'),('2b3f33b6-d65f-11ee-8410-3c5576fe2454','Xavi','Xavi@example.com','123456785'),('2b3fd1ca-d65f-11ee-8410-3c5576fe2454','Mario','Mario@example.com','123456786'),('2b405553-d65f-11ee-8410-3c5576fe2454','Maria','Maria@example.com','123456787'),('2b40e2ae-d65f-11ee-8410-3c5576fe2454','Miguel','Miguel@example.com','123456788'),('2b415e5b-d65f-11ee-8410-3c5576fe2454','Pedro','Pedro@example.com','123456789'),('2b41eed2-d65f-11ee-8410-3c5576fe2454','Pablo','Pablo@example.com','123456780'),('2b428a3b-d65f-11ee-8410-3c5576fe2454','Jesus','Jesus@example.com','123456791'),('2b43206a-d65f-11ee-8410-3c5576fe2454','Luis','Luis@example.com','123456792'),('2b43a45f-d65f-11ee-8410-3c5576fe2454','Joel','Joel@example.com','123456793'),('2b441b90-d65f-11ee-8410-3c5576fe2454','Javier','Javier@example.com','123456794'),('2b44a443-d65f-11ee-8410-3c5576fe2454','Carlos','Carlos@example.com','123456795');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_prestamos`
--

DROP TABLE IF EXISTS `detalles_prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles_prestamos` (
  `id_detalle_prestamo` varchar(36) NOT NULL DEFAULT uuid(),
  `id_prestamo` varchar(36) NOT NULL,
  `id_libro` varchar(36) NOT NULL,
  PRIMARY KEY (`id_detalle_prestamo`),
  KEY `fk_detalle_del_prestamo` (`id_prestamo`),
  KEY `fk_detalle_del_prestamo_de_libro` (`id_libro`),
  CONSTRAINT `fk_detalle_del_prestamo` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamos` (`id_prestamo`),
  CONSTRAINT `fk_detalle_del_prestamo_de_libro` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_prestamos`
--

LOCK TABLES `detalles_prestamos` WRITE;
/*!40000 ALTER TABLE `detalles_prestamos` DISABLE KEYS */;
INSERT INTO `detalles_prestamos` VALUES ('483ea6d8-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b552b05-d65f-11ee-8410-3c5576fe2454'),('483f772f-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b55b084-d65f-11ee-8410-3c5576fe2454'),('48404f49-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b563110-d65f-11ee-8410-3c5576fe2454'),('4840dc1b-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b56c7b8-d65f-11ee-8410-3c5576fe2454'),('484174c7-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b573e5e-d65f-11ee-8410-3c5576fe2454'),('4842466c-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b57bc57-d65f-11ee-8410-3c5576fe2454'),('484302a6-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b582f50-d65f-11ee-8410-3c5576fe2454'),('48438656-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b58a555-d65f-11ee-8410-3c5576fe2454'),('48441195-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b593350-d65f-11ee-8410-3c5576fe2454'),('4844a20f-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b59af6b-d65f-11ee-8410-3c5576fe2454'),('484558e6-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b5a208f-d65f-11ee-8410-3c5576fe2454'),('4845f413-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b5a943e-d65f-11ee-8410-3c5576fe2454'),('48468434-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b5b0f0a-d65f-11ee-8410-3c5576fe2454'),('4847088d-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b5ba52c-d65f-11ee-8410-3c5576fe2454'),('4847c218-d65f-11ee-8410-3c5576fe2454','2b455be7-d65f-11ee-8410-3c5576fe2454','2b5c1e8f-d65f-11ee-8410-3c5576fe2454');
/*!40000 ALTER TABLE `detalles_prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_estado_del_libro
AFTER INSERT ON detalles_prestamos
FOR EACH ROW
BEGIN
    UPDATE libros
    SET estado = 'Prestado'
    WHERE id_libro = NEW.id_libro;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `generos_libros`
--

DROP TABLE IF EXISTS `generos_libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generos_libros` (
  `id_genero_libro` varchar(36) NOT NULL DEFAULT uuid(),
  `nombre_genero_libre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genero_libro`),
  UNIQUE KEY `uq_nombre_del_genero_unico` (`nombre_genero_libre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos_libros`
--

LOCK TABLES `generos_libros` WRITE;
/*!40000 ALTER TABLE `generos_libros` DISABLE KEYS */;
INSERT INTO `generos_libros` VALUES ('2b4de8b8-d65f-11ee-8410-3c5576fe2454','Género1'),('2b524142-d65f-11ee-8410-3c5576fe2454','Género10'),('2b52a7e4-d65f-11ee-8410-3c5576fe2454','Género11'),('2b5319be-d65f-11ee-8410-3c5576fe2454','Género12'),('2b5389bb-d65f-11ee-8410-3c5576fe2454','Género13'),('2b541755-d65f-11ee-8410-3c5576fe2454','Género14'),('2b549373-d65f-11ee-8410-3c5576fe2454','Género15'),('2b4e64e0-d65f-11ee-8410-3c5576fe2454','Género2'),('2b4ef910-d65f-11ee-8410-3c5576fe2454','Género3'),('2b4f89ac-d65f-11ee-8410-3c5576fe2454','Género4'),('2b4fe84f-d65f-11ee-8410-3c5576fe2454','Género5'),('2b5062a5-d65f-11ee-8410-3c5576fe2454','Género6'),('2b50d44c-d65f-11ee-8410-3c5576fe2454','Género7'),('2b514795-d65f-11ee-8410-3c5576fe2454','Género8'),('2b51c334-d65f-11ee-8410-3c5576fe2454','Género9');
/*!40000 ALTER TABLE `generos_libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libros` (
  `id_libro` varchar(36) NOT NULL DEFAULT uuid(),
  `titulo_libro` varchar(50) NOT NULL,
  `anio_publicacion` int(11) NOT NULL,
  `id_genero_libro` varchar(36) NOT NULL,
  `estado` enum('Disponible','Prestado') NOT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `fk_genero_del_libro` (`id_genero_libro`),
  CONSTRAINT `fk_genero_del_libro` FOREIGN KEY (`id_genero_libro`) REFERENCES `generos_libros` (`id_genero_libro`),
  CONSTRAINT `chk_anio` CHECK (`anio_publicacion` > 0 and `anio_publicacion` <= 2024)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES ('2b552b05-d65f-11ee-8410-3c5576fe2454','Libro1',2020,'2b4de8b8-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b55b084-d65f-11ee-8410-3c5576fe2454','Libro2',2019,'2b4e64e0-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b563110-d65f-11ee-8410-3c5576fe2454','Libro3',2018,'2b4ef910-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b56c7b8-d65f-11ee-8410-3c5576fe2454','Libro4',2017,'2b4f89ac-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b573e5e-d65f-11ee-8410-3c5576fe2454','Libro5',2016,'2b4fe84f-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b57bc57-d65f-11ee-8410-3c5576fe2454','Libro6',2015,'2b5062a5-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b582f50-d65f-11ee-8410-3c5576fe2454','Libro7',2014,'2b50d44c-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b58a555-d65f-11ee-8410-3c5576fe2454','Libro8',2013,'2b514795-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b593350-d65f-11ee-8410-3c5576fe2454','Libro9',2012,'2b51c334-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b59af6b-d65f-11ee-8410-3c5576fe2454','Libro10',2011,'2b524142-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b5a208f-d65f-11ee-8410-3c5576fe2454','Libro11',2010,'2b52a7e4-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b5a943e-d65f-11ee-8410-3c5576fe2454','Libro12',2009,'2b5319be-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b5b0f0a-d65f-11ee-8410-3c5576fe2454','Libro13',2008,'2b5389bb-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b5ba52c-d65f-11ee-8410-3c5576fe2454','Libro14',2007,'2b541755-d65f-11ee-8410-3c5576fe2454','Prestado'),('2b5c1e8f-d65f-11ee-8410-3c5576fe2454','Libro15',2006,'2b549373-d65f-11ee-8410-3c5576fe2454','Prestado');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `id_prestamo` varchar(36) NOT NULL DEFAULT uuid(),
  `id_cliente` varchar(36) NOT NULL,
  `fecha_inicio` datetime DEFAULT current_timestamp(),
  `fecha_devolucion` date DEFAULT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `fk_prestamos_de_clientes` (`id_cliente`),
  CONSTRAINT `fk_prestamos_de_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `chk_validacion_de_fechas` CHECK (`fecha_inicio` < `fecha_devolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES ('2b455be7-d65f-11ee-8410-3c5576fe2454','2b39962f-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-02-29','Activo'),('2b45e9a2-d65f-11ee-8410-3c5576fe2454','2b39962f-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-01','Activo'),('2b466eeb-d65f-11ee-8410-3c5576fe2454','2b39962f-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-02','Activo'),('2b47033d-d65f-11ee-8410-3c5576fe2454','2b441b90-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-03','Activo'),('2b479ad1-d65f-11ee-8410-3c5576fe2454','2b441b90-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-04','Activo'),('2b482922-d65f-11ee-8410-3c5576fe2454','2b441b90-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-05','Activo'),('2b48c3d5-d65f-11ee-8410-3c5576fe2454','2b441b90-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-06','Activo'),('2b4953bf-d65f-11ee-8410-3c5576fe2454','2b441b90-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-07','Activo'),('2b49f902-d65f-11ee-8410-3c5576fe2454','2b43206a-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-08','Activo'),('2b4a8b57-d65f-11ee-8410-3c5576fe2454','2b43206a-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-09','Activo'),('2b4b18f7-d65f-11ee-8410-3c5576fe2454','2b441b90-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-10','Activo'),('2b4b95f8-d65f-11ee-8410-3c5576fe2454','2b43206a-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-11','Activo'),('2b4c28e9-d65f-11ee-8410-3c5576fe2454','2b43206a-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-12','Activo'),('2b4cb29b-d65f-11ee-8410-3c5576fe2454','2b43206a-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-13','Activo'),('2b4d44df-d65f-11ee-8410-3c5576fe2454','2b43206a-d65f-11ee-8410-3c5576fe2454','2024-02-28 11:31:13','2024-03-14','Activo');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 11:38:52
