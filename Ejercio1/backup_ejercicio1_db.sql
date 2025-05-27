-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: eventos_deportivos
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
-- Table structure for table `Canchas`
--

DROP TABLE IF EXISTS `Canchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Canchas` (
  `cancha_id` int NOT NULL AUTO_INCREMENT,
  `sede_id_canchas` int NOT NULL,
  `direccion_cancha` int NOT NULL,
  `nombre_identificador` varchar(100) NOT NULL,
  `tipo_superficie` varchar(50) DEFAULT NULL,
  `dimensiones` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cancha_id`),
  KEY `fk_direccion_cancha` (`direccion_cancha`),
  KEY `fk_sede_id_canchas` (`sede_id_canchas`),
  CONSTRAINT `fk_direccion_cancha` FOREIGN KEY (`direccion_cancha`) REFERENCES `Direccion` (`direccion_id`),
  CONSTRAINT `fk_sede_id_canchas` FOREIGN KEY (`sede_id_canchas`) REFERENCES `Sedes` (`sede_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canchas`
--

LOCK TABLES `Canchas` WRITE;
/*!40000 ALTER TABLE `Canchas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Canchas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorias_Jugadores`
--

DROP TABLE IF EXISTS `Categorias_Jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias_Jugadores` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias_Jugadores`
--

LOCK TABLES `Categorias_Jugadores` WRITE;
/*!40000 ALTER TABLE `Categorias_Jugadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categorias_Jugadores` ENABLE KEYS */;
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
  UNIQUE KEY `departamento_id_ciudad` (`departamento_id_ciudad`),
  UNIQUE KEY `nombre_ciudad` (`nombre_ciudad`),
  KEY `fk_departamento_id_ciudad` (`departamento_id_ciudad`),
  CONSTRAINT `fk_departamento_id_ciudad` FOREIGN KEY (`departamento_id_ciudad`) REFERENCES `Departamentos` (`departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  KEY `fk_pais_id_departamento` (`pais_id_departamento`),
  CONSTRAINT `fk_pais_departamento` FOREIGN KEY (`pais_id_departamento`) REFERENCES `Paises` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamentos`
--

LOCK TABLES `Departamentos` WRITE;
/*!40000 ALTER TABLE `Departamentos` DISABLE KEYS */;
INSERT INTO `Departamentos` VALUES (1,1,'Antioquia');
/*!40000 ALTER TABLE `Departamentos` ENABLE KEYS */;
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
  `nombre_o_numero_via` varchar(100) NOT NULL,
  `numero_puerta` varchar(30) NOT NULL,
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
-- Table structure for table `EquipO_de_Jugadores`
--

DROP TABLE IF EXISTS `EquipO_de_Jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EquipO_de_Jugadores` (
  `jugador_id_equipo` int NOT NULL,
  `equipo_id_jugadores` int NOT NULL,
  `fecha_inicio_pertenencia` date NOT NULL,
  `fecha_fin_pertenencia` date NOT NULL,
  `numero_camiseta` int NOT NULL,
  `posicion_principal` varchar(50) NOT NULL,
  PRIMARY KEY (`jugador_id_equipo`,`equipo_id_jugadores`),
  KEY `fk_equipo_id_jugadores` (`equipo_id_jugadores`),
  CONSTRAINT `fk_equipo_id_jugadores` FOREIGN KEY (`equipo_id_jugadores`) REFERENCES `Equipos` (`equipo_id`),
  CONSTRAINT `fk_jugador_id_equipo` FOREIGN KEY (`jugador_id_equipo`) REFERENCES `Jugadores` (`jugador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EquipO_de_Jugadores`
--

LOCK TABLES `EquipO_de_Jugadores` WRITE;
/*!40000 ALTER TABLE `EquipO_de_Jugadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `EquipO_de_Jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipo_Partido_Participacion`
--

DROP TABLE IF EXISTS `Equipo_Partido_Participacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipo_Partido_Participacion` (
  `partido_id_participan` int NOT NULL,
  `equipo_id_participa` int NOT NULL,
  PRIMARY KEY (`partido_id_participan`,`equipo_id_participa`),
  KEY `fk_equipo_id_participa` (`equipo_id_participa`),
  CONSTRAINT `fk_equipo_id_participa` FOREIGN KEY (`equipo_id_participa`) REFERENCES `Equipos` (`equipo_id`),
  CONSTRAINT `fk_partido_id_participan` FOREIGN KEY (`partido_id_participan`) REFERENCES `Partidos` (`partido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipo_Partido_Participacion`
--

LOCK TABLES `Equipo_Partido_Participacion` WRITE;
/*!40000 ALTER TABLE `Equipo_Partido_Participacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Equipo_Partido_Participacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipos`
--

DROP TABLE IF EXISTS `Equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipos` (
  `equipo_id` int NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(150) NOT NULL,
  `tipo_evento` varchar(50) NOT NULL,
  `es_interno` tinyint(1) NOT NULL,
  `nombre_resposable` varchar(100) NOT NULL,
  PRIMARY KEY (`equipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipos`
--

LOCK TABLES `Equipos` WRITE;
/*!40000 ALTER TABLE `Equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evento_Partido`
--

DROP TABLE IF EXISTS `Evento_Partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evento_Partido` (
  `evento_partido_id_evento` int NOT NULL,
  `partido_id_evento` int NOT NULL,
  `rol_en_evento` varchar(50) NOT NULL,
  PRIMARY KEY (`evento_partido_id_evento`,`partido_id_evento`),
  KEY `fk_partido_id_evento` (`partido_id_evento`),
  CONSTRAINT `fk_evento_partido_id_evento` FOREIGN KEY (`evento_partido_id_evento`) REFERENCES `Eventos` (`evento_id`),
  CONSTRAINT `fk_partido_id_evento` FOREIGN KEY (`partido_id_evento`) REFERENCES `Partidos` (`partido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evento_Partido`
--

LOCK TABLES `Evento_Partido` WRITE;
/*!40000 ALTER TABLE `Evento_Partido` DISABLE KEYS */;
/*!40000 ALTER TABLE `Evento_Partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evento_Patrocinadores`
--

DROP TABLE IF EXISTS `Evento_Patrocinadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evento_Patrocinadores` (
  `evento_id_patrocidado` int NOT NULL,
  `id_patrocinador` int NOT NULL,
  `monto_patrocinio` decimal(10,2) NOT NULL,
  `tipo_acuerdo` varchar(30) NOT NULL,
  PRIMARY KEY (`evento_id_patrocidado`,`id_patrocinador`),
  KEY `fk_id_patrocinador` (`id_patrocinador`),
  CONSTRAINT `fk_evento_id_patrocidado` FOREIGN KEY (`evento_id_patrocidado`) REFERENCES `Eventos` (`evento_id`),
  CONSTRAINT `fk_id_patrocinador` FOREIGN KEY (`id_patrocinador`) REFERENCES `Patrocinadores` (`patrocinador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evento_Patrocinadores`
--

LOCK TABLES `Evento_Patrocinadores` WRITE;
/*!40000 ALTER TABLE `Evento_Patrocinadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Evento_Patrocinadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evento_Sesion_Entrenamiento`
--

DROP TABLE IF EXISTS `Evento_Sesion_Entrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evento_Sesion_Entrenamiento` (
  `id_evento_entrenamiento` int NOT NULL,
  `sesion_id_entrenamiento` int NOT NULL,
  `objetivo_especifico` text,
  PRIMARY KEY (`id_evento_entrenamiento`,`sesion_id_entrenamiento`),
  KEY `fk_sesion_id_entrenamiento` (`sesion_id_entrenamiento`),
  CONSTRAINT `fk_id_evento_entrenamiento` FOREIGN KEY (`id_evento_entrenamiento`) REFERENCES `Eventos` (`evento_id`),
  CONSTRAINT `fk_sesion_id_entrenamiento` FOREIGN KEY (`sesion_id_entrenamiento`) REFERENCES `Sesiones_Entrenamiento` (`sesion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evento_Sesion_Entrenamiento`
--

LOCK TABLES `Evento_Sesion_Entrenamiento` WRITE;
/*!40000 ALTER TABLE `Evento_Sesion_Entrenamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Evento_Sesion_Entrenamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Eventos`
--

DROP TABLE IF EXISTS `Eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Eventos` (
  `evento_id` int NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(150) NOT NULL,
  `tipo_evento` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `descripcion` text NOT NULL,
  `estado` varchar(30) NOT NULL,
  PRIMARY KEY (`evento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Eventos`
--

LOCK TABLES `Eventos` WRITE;
/*!40000 ALTER TABLE `Eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Incidencias_Partido`
--

DROP TABLE IF EXISTS `Incidencias_Partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Incidencias_Partido` (
  `incidencia_id` int NOT NULL AUTO_INCREMENT,
  `partido_id_incidencia` int NOT NULL,
  `jugador_id_incidencia` int NOT NULL,
  `minutos_juego` int NOT NULL,
  `tipo_incidencia` varchar(50) NOT NULL,
  `descripcion_adicional` text,
  `decision_arbitral` text NOT NULL,
  PRIMARY KEY (`incidencia_id`),
  KEY `fk_partido_id_incidencia` (`partido_id_incidencia`),
  KEY `fk_jugador_id_incidencia` (`jugador_id_incidencia`),
  CONSTRAINT `fk_jugador_id_incidencia` FOREIGN KEY (`jugador_id_incidencia`) REFERENCES `Jugadores` (`jugador_id`),
  CONSTRAINT `fk_partido_id_incidencia` FOREIGN KEY (`partido_id_incidencia`) REFERENCES `Partidos` (`partido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incidencias_Partido`
--

LOCK TABLES `Incidencias_Partido` WRITE;
/*!40000 ALTER TABLE `Incidencias_Partido` DISABLE KEYS */;
/*!40000 ALTER TABLE `Incidencias_Partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jugador_Partido_Alineacion`
--

DROP TABLE IF EXISTS `Jugador_Partido_Alineacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jugador_Partido_Alineacion` (
  `jugador_id_alineacion` int NOT NULL,
  `partido_id_dado` int NOT NULL,
  `rol_partido` varchar(30) NOT NULL,
  `minutos_jugados` int NOT NULL,
  PRIMARY KEY (`jugador_id_alineacion`,`partido_id_dado`),
  KEY `fk_partido_id_dado` (`partido_id_dado`),
  CONSTRAINT `fk_jugador_id_alineacion` FOREIGN KEY (`jugador_id_alineacion`) REFERENCES `Jugadores` (`jugador_id`),
  CONSTRAINT `fk_partido_id_dado` FOREIGN KEY (`partido_id_dado`) REFERENCES `Partidos` (`partido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jugador_Partido_Alineacion`
--

LOCK TABLES `Jugador_Partido_Alineacion` WRITE;
/*!40000 ALTER TABLE `Jugador_Partido_Alineacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Jugador_Partido_Alineacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jugador_Programa`
--

DROP TABLE IF EXISTS `Jugador_Programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jugador_Programa` (
  `jugador_id` int NOT NULL,
  `id_programa` int NOT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  PRIMARY KEY (`jugador_id`,`id_programa`),
  KEY `fk_id_programa` (`id_programa`),
  CONSTRAINT `fk_id_programa` FOREIGN KEY (`id_programa`) REFERENCES `Programas_Entrenamiento` (`programa_id`),
  CONSTRAINT `fk_jugador_id` FOREIGN KEY (`jugador_id`) REFERENCES `Jugadores` (`jugador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jugador_Programa`
--

LOCK TABLES `Jugador_Programa` WRITE;
/*!40000 ALTER TABLE `Jugador_Programa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Jugador_Programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jugador_Sesion_Asistencia`
--

DROP TABLE IF EXISTS `Jugador_Sesion_Asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jugador_Sesion_Asistencia` (
  `jugador_id_asistencia` int NOT NULL,
  `sesion_id_asistencia` int NOT NULL,
  `asistio` tinyint(1) NOT NULL,
  `justificacion_ausencia` text,
  PRIMARY KEY (`jugador_id_asistencia`,`sesion_id_asistencia`),
  KEY `fk_sesion_id_asistencia` (`sesion_id_asistencia`),
  CONSTRAINT `fk_jugador_id_asistencia` FOREIGN KEY (`jugador_id_asistencia`) REFERENCES `Jugadores` (`jugador_id`),
  CONSTRAINT `fk_sesion_id_asistencia` FOREIGN KEY (`sesion_id_asistencia`) REFERENCES `Sesiones_Entrenamiento` (`sesion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jugador_Sesion_Asistencia`
--

LOCK TABLES `Jugador_Sesion_Asistencia` WRITE;
/*!40000 ALTER TABLE `Jugador_Sesion_Asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Jugador_Sesion_Asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jugador_Sesion_Metrica`
--

DROP TABLE IF EXISTS `Jugador_Sesion_Metrica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jugador_Sesion_Metrica` (
  `jugador_id_metrica` int NOT NULL,
  `sesion_id_metrica` int NOT NULL,
  `id_metrica` int NOT NULL,
  `valor_metrica` varchar(20) NOT NULL,
  `fecha_medicion` date DEFAULT NULL,
  PRIMARY KEY (`jugador_id_metrica`,`sesion_id_metrica`,`id_metrica`),
  KEY `fk_sesion_id_metrica` (`sesion_id_metrica`),
  KEY `fk_id_metrica` (`id_metrica`),
  CONSTRAINT `fk_id_metrica` FOREIGN KEY (`id_metrica`) REFERENCES `Tipos_Metrica` (`metrica_id`),
  CONSTRAINT `fk_jugador_id_metrica` FOREIGN KEY (`jugador_id_metrica`) REFERENCES `Jugadores` (`jugador_id`),
  CONSTRAINT `fk_sesion_id_metrica` FOREIGN KEY (`sesion_id_metrica`) REFERENCES `Sesiones_Entrenamiento` (`sesion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jugador_Sesion_Metrica`
--

LOCK TABLES `Jugador_Sesion_Metrica` WRITE;
/*!40000 ALTER TABLE `Jugador_Sesion_Metrica` DISABLE KEYS */;
/*!40000 ALTER TABLE `Jugador_Sesion_Metrica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jugadores`
--

DROP TABLE IF EXISTS `Jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jugadores` (
  `jugador_id` int NOT NULL AUTO_INCREMENT,
  `categoria_id_jugador` int NOT NULL,
  `id_telefono_jugador` int NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `documento_identidad` varchar(30) NOT NULL,
  `posicion_principal` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_ingreso_club` date NOT NULL,
  PRIMARY KEY (`jugador_id`),
  UNIQUE KEY `documento_identidad` (`documento_identidad`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_categoria_id_jugador` (`categoria_id_jugador`),
  KEY `fk_id_telefono_jugador` (`id_telefono_jugador`),
  CONSTRAINT `fk_categoria_id_jugador` FOREIGN KEY (`categoria_id_jugador`) REFERENCES `Categorias_Jugadores` (`categoria_id`),
  CONSTRAINT `fk_id_telefono_jugador` FOREIGN KEY (`id_telefono_jugador`) REFERENCES `Telefonos` (`telefono_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jugadores`
--

LOCK TABLES `Jugadores` WRITE;
/*!40000 ALTER TABLE `Jugadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mantenimiento_Canchas`
--

DROP TABLE IF EXISTS `Mantenimiento_Canchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mantenimiento_Canchas` (
  `mantenimiento_id` int NOT NULL AUTO_INCREMENT,
  `cancha_id_mantenimiento` int NOT NULL,
  `fecha_mantenimiento` date NOT NULL,
  `descripcion_trabajo` text,
  `costo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`mantenimiento_id`),
  KEY `fk_cancha_id_mantenimiento` (`cancha_id_mantenimiento`),
  CONSTRAINT `fk_cancha_id_mantenimiento` FOREIGN KEY (`cancha_id_mantenimiento`) REFERENCES `Canchas` (`cancha_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mantenimiento_Canchas`
--

LOCK TABLES `Mantenimiento_Canchas` WRITE;
/*!40000 ALTER TABLE `Mantenimiento_Canchas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mantenimiento_Canchas` ENABLE KEYS */;
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
  PRIMARY KEY (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paises`
--

LOCK TABLES `Paises` WRITE;
/*!40000 ALTER TABLE `Paises` DISABLE KEYS */;
INSERT INTO `Paises` VALUES (1,'Colombia','CO'),(2,'Venezuela','VE'),(3,'Ecuador','EC'),(4,'Per','PE'),(5,'Brasil','BR');
/*!40000 ALTER TABLE `Paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Partido_Personal_Asignacion`
--

DROP TABLE IF EXISTS `Partido_Personal_Asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Partido_Personal_Asignacion` (
  `personal_id_asignado` int NOT NULL,
  `partido_id_asignacion` int NOT NULL,
  `rol_asignado_partido` varchar(20) NOT NULL,
  PRIMARY KEY (`personal_id_asignado`,`partido_id_asignacion`),
  KEY `fk_partido_id_asignacion` (`partido_id_asignacion`),
  CONSTRAINT `fk_partido_id_asignacion` FOREIGN KEY (`partido_id_asignacion`) REFERENCES `Partidos` (`partido_id`),
  CONSTRAINT `fk_personal_id_asignado` FOREIGN KEY (`personal_id_asignado`) REFERENCES `Personal` (`personal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Partido_Personal_Asignacion`
--

LOCK TABLES `Partido_Personal_Asignacion` WRITE;
/*!40000 ALTER TABLE `Partido_Personal_Asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Partido_Personal_Asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Partidos`
--

DROP TABLE IF EXISTS `Partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Partidos` (
  `partido_id` int NOT NULL AUTO_INCREMENT,
  `cancha_id_partido` int NOT NULL,
  `direccion_cancha` int NOT NULL,
  `equipo_local_id` int NOT NULL,
  `equipo_visitante_id` int NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `marcador_local` int NOT NULL,
  `marcador_visitante` int NOT NULL,
  `estado_partido` varchar(30) NOT NULL,
  PRIMARY KEY (`partido_id`),
  UNIQUE KEY `equipo_local_id` (`equipo_local_id`),
  UNIQUE KEY `equipo_visitante_id` (`equipo_visitante_id`),
  KEY `fk_cancha_id_partido` (`cancha_id_partido`),
  KEY `fk_direccion_cancha_partido` (`direccion_cancha`),
  KEY `fk_equipo_local_id` (`equipo_local_id`),
  KEY `fk_equipo_visitante_id` (`equipo_visitante_id`),
  CONSTRAINT `fk_cancha_id_partido` FOREIGN KEY (`cancha_id_partido`) REFERENCES `Canchas` (`cancha_id`),
  CONSTRAINT `fk_direccion_cancha_partido` FOREIGN KEY (`direccion_cancha`) REFERENCES `Direccion` (`direccion_id`),
  CONSTRAINT `fk_equipo_local_id` FOREIGN KEY (`equipo_local_id`) REFERENCES `Equipos` (`equipo_id`),
  CONSTRAINT `fk_equipo_visitante_id` FOREIGN KEY (`equipo_visitante_id`) REFERENCES `Equipos` (`equipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Partidos`
--

LOCK TABLES `Partidos` WRITE;
/*!40000 ALTER TABLE `Partidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patrocinadores`
--

DROP TABLE IF EXISTS `Patrocinadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patrocinadores` (
  `patrocinador_id` int NOT NULL AUTO_INCREMENT,
  `telefono_contacto_id_patrocinador` int NOT NULL,
  `nombre_empresa_o_persona` varchar(150) NOT NULL,
  `ruc_o_documento` varchar(30) NOT NULL,
  `email_contacto` varchar(100) NOT NULL,
  PRIMARY KEY (`patrocinador_id`),
  UNIQUE KEY `ruc_o_documento` (`ruc_o_documento`),
  KEY `fk_telefono_contacto_id_patrocinador` (`telefono_contacto_id_patrocinador`),
  CONSTRAINT `fk_telefono_contacto_id_patrocinador` FOREIGN KEY (`telefono_contacto_id_patrocinador`) REFERENCES `Telefonos` (`telefono_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patrocinadores`
--

LOCK TABLES `Patrocinadores` WRITE;
/*!40000 ALTER TABLE `Patrocinadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patrocinadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personal`
--

DROP TABLE IF EXISTS `Personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personal` (
  `personal_id` int NOT NULL AUTO_INCREMENT,
  `tipo_personal_id_personal` int NOT NULL,
  `id_telefono_personal` int NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `documento_identidad` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `licencia_o_especialidad` varchar(100) NOT NULL,
  PRIMARY KEY (`personal_id`),
  UNIQUE KEY `documento_identidad` (`documento_identidad`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_tipo_personal_id_personal` (`tipo_personal_id_personal`),
  KEY `fk_id_telefono_personal` (`id_telefono_personal`),
  CONSTRAINT `fk_id_telefono_personal` FOREIGN KEY (`id_telefono_personal`) REFERENCES `Telefonos` (`telefono_id`),
  CONSTRAINT `fk_tipo_personal_id_personal` FOREIGN KEY (`tipo_personal_id_personal`) REFERENCES `Tipos_Personal` (`tipo_personal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personal`
--

LOCK TABLES `Personal` WRITE;
/*!40000 ALTER TABLE `Personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Programas_Entrenamiento`
--

DROP TABLE IF EXISTS `Programas_Entrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Programas_Entrenamiento` (
  `programa_id` int NOT NULL AUTO_INCREMENT,
  `categoria_id_jugadores` int NOT NULL,
  `entrenador_responsable_id` int NOT NULL,
  `nombre_entrenamiento` varchar(100) NOT NULL,
  `descripcion` text,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`programa_id`),
  KEY `fk_categoria_id_jugadores` (`categoria_id_jugadores`),
  KEY `fk_entrenador_responsable_id` (`entrenador_responsable_id`),
  CONSTRAINT `fk_categoria_id_jugadores` FOREIGN KEY (`categoria_id_jugadores`) REFERENCES `Categorias_Jugadores` (`categoria_id`),
  CONSTRAINT `fk_entrenador_responsable_id` FOREIGN KEY (`entrenador_responsable_id`) REFERENCES `Personal` (`personal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Programas_Entrenamiento`
--

LOCK TABLES `Programas_Entrenamiento` WRITE;
/*!40000 ALTER TABLE `Programas_Entrenamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Programas_Entrenamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recursos`
--

DROP TABLE IF EXISTS `Recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recursos` (
  `recurso_id` int NOT NULL AUTO_INCREMENT,
  `tipo_recurso_id_recurso` int NOT NULL,
  `codigo_inventario` varchar(50) NOT NULL,
  `cantidad` int NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`recurso_id`),
  UNIQUE KEY `codigo_inventario` (`codigo_inventario`),
  KEY `fk_tipo_recurso_id_recurso` (`tipo_recurso_id_recurso`),
  CONSTRAINT `fk_tipo_recurso_id_recurso` FOREIGN KEY (`tipo_recurso_id_recurso`) REFERENCES `Tipos_Recurso` (`tipo_recurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recursos`
--

LOCK TABLES `Recursos` WRITE;
/*!40000 ALTER TABLE `Recursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recursos_En_Cancha`
--

DROP TABLE IF EXISTS `Recursos_En_Cancha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recursos_En_Cancha` (
  `recurso_en_cancha_id` int NOT NULL AUTO_INCREMENT,
  `recurso_id_cancha` int NOT NULL,
  `cancha_id_recursos` int NOT NULL,
  `cantidad_asignada` int NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `fecha_liberacion` date DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`recurso_en_cancha_id`),
  KEY `fk_recurso_id_cancha` (`recurso_id_cancha`),
  KEY `fk_cancha_id_recursos` (`cancha_id_recursos`),
  CONSTRAINT `fk_cancha_id_recursos` FOREIGN KEY (`cancha_id_recursos`) REFERENCES `Canchas` (`cancha_id`),
  CONSTRAINT `fk_recurso_id_cancha` FOREIGN KEY (`recurso_id_cancha`) REFERENCES `Recursos` (`recurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recursos_En_Cancha`
--

LOCK TABLES `Recursos_En_Cancha` WRITE;
/*!40000 ALTER TABLE `Recursos_En_Cancha` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recursos_En_Cancha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recursos_Necesarios_Evento`
--

DROP TABLE IF EXISTS `Recursos_Necesarios_Evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recursos_Necesarios_Evento` (
  `evento_id_recursos` int NOT NULL,
  `recurso_id_evento` int NOT NULL,
  `cantidad_asignada` int NOT NULL,
  PRIMARY KEY (`evento_id_recursos`,`recurso_id_evento`),
  KEY `fk_recurso_id_evento` (`recurso_id_evento`),
  CONSTRAINT `fk_evento_id_recursos` FOREIGN KEY (`evento_id_recursos`) REFERENCES `Eventos` (`evento_id`),
  CONSTRAINT `fk_recurso_id_evento` FOREIGN KEY (`recurso_id_evento`) REFERENCES `Recursos` (`recurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recursos_Necesarios_Evento`
--

LOCK TABLES `Recursos_Necesarios_Evento` WRITE;
/*!40000 ALTER TABLE `Recursos_Necesarios_Evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recursos_Necesarios_Evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recursos_Por_Sede`
--

DROP TABLE IF EXISTS `Recursos_Por_Sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recursos_Por_Sede` (
  `recurso_por_sede_id` int NOT NULL AUTO_INCREMENT,
  `recurso_id_sede` int NOT NULL,
  `id_sede` int NOT NULL,
  `cantidad_disponible` int NOT NULL,
  `ultima_actualizacion` datetime NOT NULL,
  PRIMARY KEY (`recurso_por_sede_id`),
  KEY `fk_recurso_id_sede` (`recurso_id_sede`),
  KEY `fk_id_sede` (`id_sede`),
  CONSTRAINT `fk_id_sede` FOREIGN KEY (`id_sede`) REFERENCES `Sedes` (`sede_id`),
  CONSTRAINT `fk_recurso_id_sede` FOREIGN KEY (`recurso_id_sede`) REFERENCES `Recursos` (`recurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recursos_Por_Sede`
--

LOCK TABLES `Recursos_Por_Sede` WRITE;
/*!40000 ALTER TABLE `Recursos_Por_Sede` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recursos_Por_Sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sedes`
--

DROP TABLE IF EXISTS `Sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sedes` (
  `sede_id` int NOT NULL AUTO_INCREMENT,
  `telefono_contacto_id` int NOT NULL,
  `direccion` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`sede_id`),
  KEY `fk_direccion` (`direccion`),
  KEY `fk_telefono_contacto_id` (`telefono_contacto_id`),
  CONSTRAINT `fk_direccion` FOREIGN KEY (`direccion`) REFERENCES `Direccion` (`direccion_id`),
  CONSTRAINT `fk_telefono_contacto_id` FOREIGN KEY (`telefono_contacto_id`) REFERENCES `Telefonos` (`telefono_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sedes`
--

LOCK TABLES `Sedes` WRITE;
/*!40000 ALTER TABLE `Sedes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sesiones_Entrenamiento`
--

DROP TABLE IF EXISTS `Sesiones_Entrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sesiones_Entrenamiento` (
  `sesion_id` int NOT NULL AUTO_INCREMENT,
  `programa_id_entrenamiento` int NOT NULL,
  `cancha_id_entrenamiento` int NOT NULL,
  `nombre_entrenamiento` varchar(100) NOT NULL,
  `descripcion` text,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`sesion_id`),
  KEY `fk_programa_id_entrenamiento` (`programa_id_entrenamiento`),
  KEY `fk_cancha_id_entrenamiento` (`cancha_id_entrenamiento`),
  CONSTRAINT `fk_cancha_id_entrenamiento` FOREIGN KEY (`cancha_id_entrenamiento`) REFERENCES `Canchas` (`cancha_id`),
  CONSTRAINT `fk_programa_id_entrenamiento` FOREIGN KEY (`programa_id_entrenamiento`) REFERENCES `Programas_Entrenamiento` (`programa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sesiones_Entrenamiento`
--

LOCK TABLES `Sesiones_Entrenamiento` WRITE;
/*!40000 ALTER TABLE `Sesiones_Entrenamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sesiones_Entrenamiento` ENABLE KEYS */;
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
  `observaciones` varchar(255) NOT NULL,
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
-- Table structure for table `Tipos_Metrica`
--

DROP TABLE IF EXISTS `Tipos_Metrica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipos_Metrica` (
  `metrica_id` int NOT NULL AUTO_INCREMENT,
  `nombre_metrica` varchar(50) NOT NULL,
  `unidad_medida` varchar(30) NOT NULL,
  PRIMARY KEY (`metrica_id`),
  UNIQUE KEY `nombre_metrica` (`nombre_metrica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipos_Metrica`
--

LOCK TABLES `Tipos_Metrica` WRITE;
/*!40000 ALTER TABLE `Tipos_Metrica` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipos_Metrica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipos_Personal`
--

DROP TABLE IF EXISTS `Tipos_Personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipos_Personal` (
  `tipo_personal_id` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`tipo_personal_id`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipos_Personal`
--

LOCK TABLES `Tipos_Personal` WRITE;
/*!40000 ALTER TABLE `Tipos_Personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipos_Personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipos_Recurso`
--

DROP TABLE IF EXISTS `Tipos_Recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipos_Recurso` (
  `tipo_recurso_id` int NOT NULL AUTO_INCREMENT,
  `nombre_recurso` varchar(150) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`tipo_recurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipos_Recurso`
--

LOCK TABLES `Tipos_Recurso` WRITE;
/*!40000 ALTER TABLE `Tipos_Recurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipos_Recurso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-27  0:50:23
