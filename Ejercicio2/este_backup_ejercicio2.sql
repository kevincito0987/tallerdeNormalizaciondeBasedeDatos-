-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: Gestin_de_Inventario
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
-- Table structure for table `Atributo_Definicion`
--

DROP TABLE IF EXISTS `Atributo_Definicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Atributo_Definicion` (
  `id_atributo_def` int NOT NULL AUTO_INCREMENT,
  `nombre_atributo` varchar(100) NOT NULL,
  `unidad_medida` varchar(10) NOT NULL,
  `tipo_dato_valor` varchar(30) NOT NULL,
  `descripcion_atributo` text NOT NULL,
  PRIMARY KEY (`id_atributo_def`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Atributo_Definicion`
--

LOCK TABLES `Atributo_Definicion` WRITE;
/*!40000 ALTER TABLE `Atributo_Definicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Atributo_Definicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) NOT NULL,
  `descripcion_categoria` text NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ciudades`
--

DROP TABLE IF EXISTS `Ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ciudades` (
  `ciudad_id` int NOT NULL AUTO_INCREMENT,
  `departamento_id_ciudad` int NOT NULL,
  `nombre_ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`ciudad_id`),
  KEY `fk_departamento_id_ciudad` (`departamento_id_ciudad`),
  CONSTRAINT `fk_departamento_id_ciudad` FOREIGN KEY (`departamento_id_ciudad`) REFERENCES `Departamentos` (`departamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciudades`
--

LOCK TABLES `Ciudades` WRITE;
/*!40000 ALTER TABLE `Ciudades` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departamentos`
--

DROP TABLE IF EXISTS `Departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departamentos` (
  `departamento_id` int NOT NULL AUTO_INCREMENT,
  `pais_id_departamento` int NOT NULL,
  `nombre_departamento` varchar(100) NOT NULL,
  PRIMARY KEY (`departamento_id`),
  UNIQUE KEY `nombre_departamento` (`nombre_departamento`),
  KEY `fk_pais_id_departamento` (`pais_id_departamento`),
  CONSTRAINT `fk_pais_id_departamento` FOREIGN KEY (`pais_id_departamento`) REFERENCES `Paises` (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamentos`
--

LOCK TABLES `Departamentos` WRITE;
/*!40000 ALTER TABLE `Departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalle_Movimiento`
--

DROP TABLE IF EXISTS `Detalle_Movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalle_Movimiento` (
  `id_movimiento` int NOT NULL,
  `id_producto_movimiento` int NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `stock_actual` int NOT NULL,
  `precio_unitario_actuaL` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_movimiento`,`id_producto_movimiento`),
  KEY `fk_id_producto_movimiento` (`id_producto_movimiento`),
  CONSTRAINT `fk_id_movimiento` FOREIGN KEY (`id_movimiento`) REFERENCES `Movimiento` (`id_movimiento`),
  CONSTRAINT `fk_id_producto_movimiento` FOREIGN KEY (`id_producto_movimiento`) REFERENCES `Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalle_Movimiento`
--

LOCK TABLES `Detalle_Movimiento` WRITE;
/*!40000 ALTER TABLE `Detalle_Movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Detalle_Movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Direccion`
--

DROP TABLE IF EXISTS `Direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Direccion` (
  `direccion_id` int NOT NULL AUTO_INCREMENT,
  `id_ciudad` int NOT NULL,
  `id_departamento` int NOT NULL,
  `id_pais` int NOT NULL,
  `barrio` varchar(100) NOT NULL,
  `tipo_via` varchar(30) NOT NULL,
  `nombre_o_numero_via` varchar(20) NOT NULL,
  `numero_puerta` varchar(20) NOT NULL,
  `complemento` varchar(100) NOT NULL,
  `codigo_postal` varchar(20) NOT NULL,
  PRIMARY KEY (`direccion_id`),
  UNIQUE KEY `codigo_postal` (`codigo_postal`),
  KEY `fk_id_ciudad` (`id_ciudad`),
  KEY `fk_id_departamento` (`id_departamento`),
  KEY `fk_id_pais` (`id_pais`),
  CONSTRAINT `fk_id_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `Ciudades` (`ciudad_id`),
  CONSTRAINT `fk_id_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `Departamentos` (`departamento_id`),
  CONSTRAINT `fk_id_pais` FOREIGN KEY (`id_pais`) REFERENCES `Paises` (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Direccion`
--

LOCK TABLES `Direccion` WRITE;
/*!40000 ALTER TABLE `Direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medio_Pago`
--

DROP TABLE IF EXISTS `Medio_Pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medio_Pago` (
  `id_medio_pago` int NOT NULL AUTO_INCREMENT,
  `nombre_medio_pago` varchar(100) NOT NULL,
  `descripcion_medio_pago` text NOT NULL,
  PRIMARY KEY (`id_medio_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medio_Pago`
--

LOCK TABLES `Medio_Pago` WRITE;
/*!40000 ALTER TABLE `Medio_Pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medio_Pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movimiento`
--

DROP TABLE IF EXISTS `Movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movimiento` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_tipo_movimiento` int NOT NULL,
  `id_tercero` int NOT NULL,
  `id_medio_pago` int NOT NULL,
  `fecha_movimiento` date NOT NULL,
  `observaciones` text NOT NULL,
  `valor_total_movimiento` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `fk_id_tipo_movimiento` (`id_tipo_movimiento`),
  KEY `fk_id_tercero` (`id_tercero`),
  KEY `fk_id_medio_pago` (`id_medio_pago`),
  CONSTRAINT `fk_id_medio_pago` FOREIGN KEY (`id_medio_pago`) REFERENCES `Medio_Pago` (`id_medio_pago`),
  CONSTRAINT `fk_id_tercero` FOREIGN KEY (`id_tercero`) REFERENCES `Tercero` (`id_tercero`),
  CONSTRAINT `fk_id_tipo_movimiento` FOREIGN KEY (`id_tipo_movimiento`) REFERENCES `Tipo_Movimiento` (`id_tipo_movimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movimiento`
--

LOCK TABLES `Movimiento` WRITE;
/*!40000 ALTER TABLE `Movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paises`
--

DROP TABLE IF EXISTS `Paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paises` (
  `pais_id` int NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(100) NOT NULL,
  `codigo_iso_2` char(2) NOT NULL,
  PRIMARY KEY (`pais_id`),
  UNIQUE KEY `codigo_iso_2` (`codigo_iso_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paises`
--

LOCK TABLES `Paises` WRITE;
/*!40000 ALTER TABLE `Paises` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `id_tipo_producto` int NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `stock_actual` int NOT NULL,
  `precio_unitario_actual` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_id_categoria` (`id_categoria`),
  KEY `fk_id_tipo_producto` (`id_tipo_producto`),
  CONSTRAINT `fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `fk_id_tipo_producto` FOREIGN KEY (`id_tipo_producto`) REFERENCES `Tipo_Descripcion_Producto` (`id_tipo_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto_Atributo_Valor`
--

DROP TABLE IF EXISTS `Producto_Atributo_Valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producto_Atributo_Valor` (
  `id_producto` int NOT NULL,
  `id_atributo_def` int NOT NULL,
  `valor_atributo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_producto`,`id_atributo_def`),
  KEY `fk_id_atributo_def` (`id_atributo_def`),
  CONSTRAINT `fk_id_atributo_def` FOREIGN KEY (`id_atributo_def`) REFERENCES `Atributo_Definicion` (`id_atributo_def`),
  CONSTRAINT `fk_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto_Atributo_Valor`
--

LOCK TABLES `Producto_Atributo_Valor` WRITE;
/*!40000 ALTER TABLE `Producto_Atributo_Valor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Producto_Atributo_Valor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto_Descripcion`
--

DROP TABLE IF EXISTS `Producto_Descripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producto_Descripcion` (
  `id_producto_descripcion` int NOT NULL,
  `id_tipo_descripcion` int NOT NULL,
  `contenido_descripcion` text NOT NULL,
  PRIMARY KEY (`id_producto_descripcion`,`id_tipo_descripcion`),
  KEY `fk_id_tipo_descripcion` (`id_tipo_descripcion`),
  CONSTRAINT `fk_id_producto_descripcion` FOREIGN KEY (`id_producto_descripcion`) REFERENCES `Producto` (`id_producto`),
  CONSTRAINT `fk_id_tipo_descripcion` FOREIGN KEY (`id_tipo_descripcion`) REFERENCES `Tipo_Descripcion_Producto` (`id_tipo_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto_Descripcion`
--

LOCK TABLES `Producto_Descripcion` WRITE;
/*!40000 ALTER TABLE `Producto_Descripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Producto_Descripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefonos`
--

DROP TABLE IF EXISTS `Telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Telefonos` (
  `telefono_id` int NOT NULL AUTO_INCREMENT,
  `sufijo_pais` varchar(10) NOT NULL,
  `numero_telefono_sin_sufijo` varchar(20) NOT NULL,
  `es_principal` tinyint(1) NOT NULL,
  `observaciones` text,
  PRIMARY KEY (`telefono_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefonos`
--

LOCK TABLES `Telefonos` WRITE;
/*!40000 ALTER TABLE `Telefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tercero`
--

DROP TABLE IF EXISTS `Tercero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tercero` (
  `id_tercero` int NOT NULL AUTO_INCREMENT,
  `id_direccion_tercero` int NOT NULL,
  `id_telefono_tercero` int NOT NULL,
  `nombre_tercero` varchar(50) NOT NULL,
  `tipo_tercero` varchar(30) NOT NULL,
  `nit_cedula` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tercero`),
  UNIQUE KEY `nit_cedula` (`nit_cedula`),
  KEY `fk_id_direccion_tercero` (`id_direccion_tercero`),
  KEY `fk_id_telefono_tercero` (`id_telefono_tercero`),
  CONSTRAINT `fk_id_direccion_tercero` FOREIGN KEY (`id_direccion_tercero`) REFERENCES `Direccion` (`direccion_id`),
  CONSTRAINT `fk_id_telefono_tercero` FOREIGN KEY (`id_telefono_tercero`) REFERENCES `Telefonos` (`telefono_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tercero`
--

LOCK TABLES `Tercero` WRITE;
/*!40000 ALTER TABLE `Tercero` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tercero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Descripcion_Producto`
--

DROP TABLE IF EXISTS `Tipo_Descripcion_Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipo_Descripcion_Producto` (
  `id_tipo_descripcion` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Descripcion_Producto`
--

LOCK TABLES `Tipo_Descripcion_Producto` WRITE;
/*!40000 ALTER TABLE `Tipo_Descripcion_Producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_Descripcion_Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Movimiento`
--

DROP TABLE IF EXISTS `Tipo_Movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipo_Movimiento` (
  `id_tipo_movimiento` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_movimiento` varchar(100) NOT NULL,
  `descripcion_tipo_movimiento` text NOT NULL,
  `es_entrada_salida` char(1) NOT NULL,
  PRIMARY KEY (`id_tipo_movimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Movimiento`
--

LOCK TABLES `Tipo_Movimiento` WRITE;
/*!40000 ALTER TABLE `Tipo_Movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_Movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Producto`
--

DROP TABLE IF EXISTS `Tipo_Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipo_Producto` (
  `id_tipo_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_producto` varchar(100) NOT NULL,
  `descripcion_tipo_producto` text NOT NULL,
  PRIMARY KEY (`id_tipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Producto`
--

LOCK TABLES `Tipo_Producto` WRITE;
/*!40000 ALTER TABLE `Tipo_Producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_Producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-27 13:15:51
