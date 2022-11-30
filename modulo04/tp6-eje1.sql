CREATE DATABASE  IF NOT EXISTS `elsistema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `elsistema`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: elsistema
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `horainicio` datetime NOT NULL,
  `horacierre` datetime NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` VALUES (1,'2022-10-01 06:00:00','2022-10-01 12:00:00',1,'2022-11-28 21:03:55'),(2,'2022-10-01 16:00:00','2022-10-01 20:00:00',1,'2022-11-28 21:03:55'),(3,'2022-10-02 06:00:00','2022-10-02 12:00:00',1,'2022-11-28 21:03:55'),(4,'2022-10-03 12:00:00','2022-10-03 16:00:00',1,'2022-11-28 21:03:55'),(5,'2022-10-04 16:00:00','2022-10-04 20:00:00',1,'2022-11-28 21:03:55');
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cuitcuil` varchar(20) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `categoría` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'florencia','ortiz','27345628969','eldorado',1),(2,'diana','machado','27415728965','iguazu',2),(3,'roberto','cavallo','20425625663','posadas',3),(4,'martin','leites','20315528967','posadas',1),(5,'roman','cardozo','20371121234','eldorado',3);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `iddepartamento` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `presupuesto` double unsigned NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `gasto` double DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iddepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Recursos_Humanos',120000,1,100000,'2022-11-22 21:44:54'),(2,'I+D',150000,1,100000,'2022-11-22 21:44:54'),(3,'Finanzas',500000,1,400000,'2022-11-22 21:44:54'),(4,'Produccion',180000,1,150000,'2022-11-22 21:44:54'),(5,'Marketing',130000,1,120000,'2022-11-22 21:44:54');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idemplaedo` int unsigned NOT NULL AUTO_INCREMENT,
  `cuil_cuit` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `id_departamento` int unsigned DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `id_localidad` int NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`idemplaedo`),
  UNIQUE KEY `cuil_cuit` (`cuil_cuit`),
  KEY `id_departamento` (`id_departamento`),
  KEY `id_localidad` (`id_localidad`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`iddepartamento`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'20351238521','juan','rodriguez',1,1,3,'colon 1830','juan@gmail.com','422123','2022-11-01','2022-11-22 21:57:36','1986-02-05'),(2,'27341368625','Mabel','Fernandez',3,1,1,' ','mabel@gmail.com',' ','2022-11-01','2022-11-22 22:07:27','1989-04-10'),(3,'20351868526','Julio','Gimenez',2,1,5,'junin 1232','julio@gmail.com','426133','2022-11-01','2022-11-22 22:07:27','1984-10-18'),(4,'27331258527','Ana','Otto',5,1,2,'jujuy 2589','ana@gmail.com','428963','2022-11-05','2022-11-22 22:07:27','1993-06-29'),(5,'20311237823','Fernando','Pereira',2,1,4,'entre rios 2541','fernando@gmail.com',' ','2022-11-01','2022-11-22 22:07:27','1983-07-25');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `cp` varchar(20) DEFAULT NULL,
  `id_provincia` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'Eldorado','3380',1),(2,'Montecarlo','3384',1),(3,'Posadas','3300',1),(4,'Iguazu','3370',1),(5,'Puerto Rico','3334',1);
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `id_proveedor` int NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `marcas_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'mirinda','agua gasificada',NULL,2,1,'2022-11-22 23:42:58'),(2,'hielito','bolsas de hielo',NULL,3,1,'2022-11-22 23:42:58'),(3,'lacoste','vestimenta',NULL,4,1,'2022-11-22 23:42:58'),(4,'pollos noel','comestibles',NULL,5,1,'2022-11-22 23:42:58'),(5,'coca cola','bebidas',NULL,1,1,'2022-11-22 23:42:58');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_cliente` int unsigned NOT NULL,
  `id_vendedor` int unsigned NOT NULL,
  `id_producto` int NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_movimiento` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id`),
  CONSTRAINT `movimientos_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (6,10,'2022-10-10',1,2,2,1,'2022-11-28 22:51:10','ingreso'),(7,15,'2022-10-15',2,1,1,1,'2022-11-28 22:51:10','egreso'),(8,20,'2022-10-20',3,5,4,0,'2022-11-28 22:51:10','ingreso'),(9,25,'2022-10-25',1,5,5,0,'2022-11-28 22:51:10','egreso'),(10,30,'2022-10-30',5,2,3,1,'2022-11-28 22:51:10','ingreso');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Argentina',1),(2,'Brasil',1),(3,'Paraguay',1),(4,'Peru',1),(5,'Bolivia',1);
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cosas` json DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (6,'2022-11-30 14:48:25','{\"permisos\": \"PUT, GET\", \"idDeLaCosa\": 101}',NULL),(7,'2022-11-30 14:49:34','{\"grupo\": \"ventas\", \"vistasPermitidas\": \"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente\"}',NULL),(8,'2022-11-30 14:50:24','{\"zonaHoraria\": \"America/Argentina/BuenosAires\"}',NULL),(9,'2022-11-30 14:54:12','{\"mesCierreCaja\": \"Diciembre\", \"mesAperturaCaja\": \"Enero\", \"fechaInicioActividades\": \"01/01/2019\"}',NULL),(10,'2022-11-30 14:54:53','{\"balancesAniosAnteriores\": {\"2019\": {\"egreso\": \"3732538,75\", \"ingreso\": \"7374901.93\"}, \"2020\": {\"egreso\": \"8522331,82\", \"ingreso\": \"27442665,12\"}, \"2021\": {\"egreso\": \"9757142,66\", \"ingreso\": \"31634912,57\"}}}',NULL);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `id_marca` int NOT NULL,
  `stock` double NOT NULL,
  `precio` double NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_marca` (`id_marca`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'gaseosas',NULL,5,99985,400,1,'2022-11-23 00:03:01'),(2,'comestibles',NULL,4,150010,650,1,'2022-11-23 00:03:01'),(3,'ropa',NULL,3,200030,720,1,'2022-11-23 00:03:01'),(4,'agua saborizada',NULL,1,300020,800,1,'2022-11-23 00:03:01'),(5,'carnes',NULL,4,500025,450,1,'2022-11-23 00:03:01');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `naturaleza` tinyint(1) NOT NULL,
  `cuit` varchar(20) DEFAULT NULL,
  `id_localidad` int NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_localidad` (`id_localidad`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'superluna','Jose','Martinez',1,'20415623369',5,1,'2022-11-22 23:32:42'),(2,'lindodia','Marta','Chenlo',1,'27415625562',3,1,'2022-11-22 23:32:42'),(3,'hieloseco','Jonas','Miranda',2,'20415623367',2,1,'2022-11-22 23:32:42'),(4,'waraclothing','Ara','Caruso',2,'27336623366',2,1,'2022-11-22 23:32:42'),(5,'pimpollo','Marcos','Mendia',1,'20355123364',4,1,'2022-11-22 23:32:42');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `idpais` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idpais` (`idpais`),
  CONSTRAINT `provincias_ibfk_1` FOREIGN KEY (`idpais`) REFERENCES `paises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Misiones',1),(2,'Corrientes',1),(3,'Cordoba',1),(4,'Buenos Aires',1),(5,'Entre Rios',1);
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `cuitcuil` varchar(20) DEFAULT NULL,
  `comisión` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'rodrigo','bueno','20367892451',10000),(2,'maria','gimenez','27337772451',15000),(3,'cesar','chavez','20317892451',13000),(4,'federico','sandobal','20417992451',11000),(5,'daniel','comparin','20351234451',16000);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-30 12:04:58
