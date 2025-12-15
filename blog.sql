-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog2
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `paterno` varchar(50) DEFAULT NULL,
  `materno` varchar(50) DEFAULT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('REGISTRADO','ELIMINADO') NOT NULL DEFAULT 'REGISTRADO',
  `imagen` varchar(255) DEFAULT 'vistas/dist/images/user.png',
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Carlossd','Guisbertx','Salazar','2025-11-22 04:16:37','REGISTRADO','vistas/upload/personas/1765835449Carlossd1.jpeg'),(2,'Masiel','Guisbert','Monrroy','2025-11-22 04:17:06','REGISTRADO','vistas/upload/personas/1765791121Masiel2.jpg'),(3,'Brian','Guisbert','Monrroy','2025-11-22 04:17:58','REGISTRADO','vistas/dist/images/user.png'),(4,'bladi','torrelio','espiniza','2025-12-10 09:44:29','REGISTRADO','vistas/dist/images/user.png'),(5,'matilde','salazar','salazar','2025-12-10 09:51:04','REGISTRADO','vistas/dist/images/user.png'),(6,'Carlos','Guisbert','Lizarraga','2025-12-10 09:53:47','REGISTRADO','vistas/dist/images/user.png'),(7,'Marco','Villan','Salazar','2025-12-10 10:00:55','REGISTRADO','vistas/dist/images/user.png'),(8,'Juan','Perez','Perez','2025-12-10 10:09:13','REGISTRADO','vistas/dist/images/user.png'),(9,'ariel','hidalgo','miranda','2025-12-12 23:32:38','REGISTRADO','vistas/dist/images/user.png'),(10,'pedro','menacho','menacho','2025-12-15 03:07:56','REGISTRADO','vistas/dist/images/user.png'),(11,'pedro','picapiedra','marmol','2025-12-15 09:38:42','REGISTRADO','vistas/upload/personas/1765791762pedro11.jpg');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `id_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('REGISTRADO','ELIMINADO') NOT NULL DEFAULT 'REGISTRADO',
  PRIMARY KEY (`id_pregunta`),
  KEY `fk_pregunta_usuario` (`id_usuario`),
  CONSTRAINT `fk_pregunta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,'Listar los archivos de un directorio en web','stoy usando php y html para mostrar como una galería de archivos, donde el usuario entre y pueda ver que archivos están dentro de una carpeta llamada converted_files que esta en una ruta distinta al código php que estoy usando y el problema es que no me muestran los archivos y en mi localhost también aparece lo siguiente: no se si es necesario usar php o si se podrá con javascript pero todo lo que conseguia de mostrar archivos de una carpeta era en php',NULL,2,'2025-11-22 12:35:57','REGISTRADO'),(2,'Consulta SQL 2 Bases de datos diferentes','Buen día, estoy realizando algunas consultas para validación de datos de una aplicación de escritorio. Al realizar la consulta, junto dos tablas de una misma base de datos, quedando la consulta asi:',NULL,3,'2025-11-22 12:36:42','REGISTRADO'),(3,'Obtener datos de una datatable con SQL en C# vía código','Estoy comenzando con C# (Solo 2 semanas con él). Se me presenta una duda con relación a la pregunta. Tengo el siguiente código:',NULL,2,'2025-11-22 12:37:24','REGISTRADO'),(4,'Programación en Java','kdsgjkldsjglkjdflkgjldfkjglkdf','vistas/upload/pregunta/1764473545.PNG',1,'2025-11-30 03:32:25','REGISTRADO'),(5,'Problemas con el servidor','Problemas con el servidor','vistas/upload/pregunta/1764473698.jpg',1,'2025-11-30 03:34:58','REGISTRADO'),(6,'Error 404','Error 404','vistas/upload/pregunta/1764764084.PNG',1,'2025-12-03 12:14:44','REGISTRADO'),(7,'Programación en Java','Java','vistas/upload/pregunta/1765240604.jpeg',1,'2025-12-09 00:36:44','REGISTRADO'),(8,'Php','php8','vistas/upload/pregunta/1765240770.jpeg',1,'2025-12-09 00:39:30','REGISTRADO'),(9,'hfgh','fghfgh','vistas/upload/pregunta/1765791971.jpg',11,'2025-12-15 09:46:11','REGISTRADO');
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta` (
  `id_respuesta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('REGISTRADO','ELIMINADO') NOT NULL DEFAULT 'REGISTRADO',
  PRIMARY KEY (`id_respuesta`),
  KEY `fk_respuesta_usuario` (`id_usuario`),
  KEY `fk_pregunta_respuesta` (`id_pregunta`),
  CONSTRAINT `fk_pregunta_respuesta` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`),
  CONSTRAINT `fk_respuesta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES (13,'debe desintalar los programas',NULL,1,8,'2025-12-09 02:45:30','REGISTRADO'),(14,'otras respuestas','vistas/upload/respuesta/1765248379.jpeg',1,8,'2025-12-09 02:46:19','REGISTRADO'),(15,'No se puede acceder al servidor web','vistas/upload/respuesta/1765410986.png',1,7,'2025-12-10 23:56:26','REGISTRADO'),(16,'mas respuestas',NULL,1,7,'2025-12-10 23:58:55','REGISTRADO'),(17,'otra respuesta 5',NULL,1,7,'2025-12-11 00:00:19','REGISTRADO'),(18,'Mas respuestas para esta pregunta',NULL,1,7,'2025-12-11 00:21:17','REGISTRADO'),(19,'prueba de la respuesta',NULL,1,2,'2025-12-13 02:15:35','REGISTRADO'),(20,'prueba',NULL,11,1,'2025-12-15 09:42:57','REGISTRADO');
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `rol` varchar(20) NOT NULL DEFAULT 'usuario',
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`),
  CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`id_usuario`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'cguisbert@gmail.com','$2y$10$o6yOxcztK4qfMDO16U4eUuKgjhCN0tzQEa5/xCbz83/gWAUHQfTMi','adminsitrador','2025-11-22 04:18:53','ACTIVO'),(2,'mguisbert@gmail.com','$2y$10$cwY1ESk.d.d9ARMj5flIN.4cPOWG7kTkvHkvScauWRqBIk38EUi8a','usuario','2025-11-22 04:19:35','ACTIVO'),(3,'bguisbert@gmail.com','$2y$10$cwY1ESk.d.d9ARMj5flIN.4cPOWG7kTkvHkvScauWRqBIk38EUi8a','usuario','2025-11-22 04:20:01','ACTIVO'),(4,'btorrelio@gmail.com','$2y$10$cwY1ESk.d.d9ARMj5flIN.4cPOWG7kTkvHkvScauWRqBIk38EUi8a','USUARIO','2025-12-10 09:44:29','ACTIVO'),(5,'msalazar@gmail.com','$2y$10$cwY1ESk.d.d9ARMj5flIN.4cPOWG7kTkvHkvScauWRqBIk38EUi8a','USUARIO','2025-12-10 09:51:04','ACTIVO'),(6,'cguisbertl@gmail.com','$2y$10$cIzwYFldoGB0CdOZSeAEIOdbFFsTjVzgH.v371LyCpaNYJPhAec76','USUARIO','2025-12-10 09:53:47','ACTIVO'),(7,'mvillan@gmail.com','$2y$10$cwY1ESk.d.d9ARMj5flIN.4cPOWG7kTkvHkvScauWRqBIk38EUi8a','USUARIO','2025-12-10 10:00:55','ACTIVO'),(8,'jperez@gmail.com','$2y$10$cwY1ESk.d.d9ARMj5flIN.4cPOWG7kTkvHkvScauWRqBIk38EUi8a','USUARIO','2025-12-10 10:09:13','ACTIVO'),(9,'arwihimi@gmail.com','$2y$10$fcwPD8M0E4.xVjAHfy9tfeUwQ/9QSz2W2vSENyo4lTo/RCS52OlyW','USUARIO','2025-12-12 23:32:38','ACTIVO'),(10,'menacho@gmail.com','$2y$10$Nz3CYwJDg.f3p07rE4uRGe4L0vT6UyIrso9XtnntiHuMRxJVnMjEW','USUARIO','2025-12-15 03:07:56','ACTIVO'),(11,'padro@gmail.com','$2y$10$laqLdE/1KTqGowCwUqY6YOwUzyUu6QB9.3BdLbrYU9DOiQrOB2lHe','USUARIO','2025-12-15 09:38:42','ACTIVO');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-15 18:30:48
