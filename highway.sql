-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2018 a las 00:11:25
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
--
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
--
-- Base de datos: `highway`
--
DROP DATABASE IF EXISTS `highway`;
create database `highway`;
use highway;
--
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `carretera`
--
CREATE TABLE `carretera` (
  `id_carretera` int(1) NOT NULL,
  `nombre_carretera` varchar(50) NOT NULL,
  `precio_carretera` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
--
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `boleta`
--
CREATE TABLE `boleta` (
  `id_boleta` int(4) NOT NULL,
  `rut_empresa` int(8) NOT NULL,
  `nombre_empresa` varchar(50) NOT NULL,
  `direccion_empresa` varchar(50) NOT NULL,
  `comprador` varchar(50) NOT NULL,
  `opc_pago` varchar(50) NOT NULL,
  `opc_retiro` varchar(50) NOT NULL,
  `total` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
--
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `pedido`
--
CREATE TABLE `pedido` (
  `id_pedido` int(4) NOT NULL,
  `cantidad` int(4) NOT NULL,
  `id_carretera_fk` int(1) NOT NULL,
  `id_boleta_fk` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
--
-- --------------------------------------------------------
--
-- Índices para tablas volcadas
--
-- Indices de la tabla `carretera`
--
ALTER TABLE `carretera`
  ADD PRIMARY KEY (`id_carretera`);
--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`id_boleta`);
--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `FK_ID_BOLETA` (`id_boleta_fk`),
  ADD KEY `FK_ID_CARRETERA` (`id_carretera_fk`);
--
-- --------------------------------------------------------
--
-- AUTO_INCREMENT de las tablas volcadas
--
-- AUTO_INCREMENT de la tabla `carretera`
--
ALTER TABLE `carretera`
  MODIFY `id_carretera` int(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
--
ALTER TABLE `boleta`
  MODIFY `id_boleta` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(4) NOT NULL AUTO_INCREMENT;
--
-- --------------------------------------------------------
--
-- Filtros para las tablas volcadas
--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_idfk_1` FOREIGN KEY (`id_carretera_fk`) REFERENCES `carretera` (`id_carretera`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_idfk_2` FOREIGN KEY (`id_boleta_fk`) REFERENCES `boleta` (`id_boleta`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- --------------------------------------------------------
--
-- Volcado de datos para las tablas
--
-- Volcado de datos para la tabla `carretera`
--
-- Se agregan 4 carreteras
--
INSERT INTO carretera VALUES(1,"Vespicio Sur", 150000);
INSERT INTO carretera VALUES(2,"Costanera Norte", 200000);
INSERT INTO carretera VALUES(3,"Autopista Central", 300000);
INSERT INTO carretera VALUES(4,"Vespucio Norte", 120000);
--
-- Volcado de datos para la tabla `boleta`
--
-- Se agregan 7 boletas
--
-- 3 boletas de 12345678
--
INSERT INTO BOLETA VALUES(1, 12345678, "ALTOMAS S.A.", "AHI MISMO 123", "MIGUEL LOPEZ", "TRANSFERENCIA", "OFICINA", 10920000);
INSERT INTO BOLETA VALUES(2, 12345678, "ALTOMAS S.A.", "AHI MISMO 123", "GONZALO PEREZ", "PAGO EN LINEA", "ENVIO CLIENTE", 6570000);
INSERT INTO BOLETA VALUES(3, 12345678, "ALTOMAS S.A.", "AHI MISMO 123", "MIGUEL LOPEZ", "TRANSFERENCIA", "OFICINA", 2400000);
--
-- 2 boletas de 11111111
--
INSERT INTO BOLETA VALUES(4, 11111111, "BAJOSUBO CORP", "MAS ACA 455", "CAMILA MOYA", "PAGO EN LINEA", "ENVIO CLIENTE", 15050000);
INSERT INTO BOLETA VALUES(5, 11111111, "BAJOSUBO CORP", "MAS ACA 455", "CAMILA MOYA", "ORDEN DE COMPRA", "ENVIO CLIENTE", 840000);
--
-- 1 boleta de 22222222
--
INSERT INTO BOLETA VALUES(6, 22222222, "QWERTY MEDIA", "A LA VUELTA 711", "JAIME SOTO", "TRANSFERENCIA", "OFICINA", 10120000);
--
-- 1 boleta de 33333333
--
INSERT INTO BOLETA VALUES(7, 33333333, "MAXIMO S.A.", "INTERSECCION X e Y", "IAN GONZALEZ", "PAGO EN LINEA", "ENVIO CLIENTE", 1800000);
--
-- Volcado de datos para la tabla `pedido`
--
-- Se agregan 16 pedidos
--
-- 12345678 tiene 7 pedidos, 4 de la boleta 1. (1.500.000+3.900.000+4.800.000+720.000) = 10.920.000
--
INSERT INTO PEDIDO VALUES(1, 10, 1, 1);
INSERT INTO PEDIDO VALUES(2, 13, 3, 1);
INSERT INTO PEDIDO VALUES(3, 24, 2, 1);
INSERT INTO PEDIDO VALUES(4, 6, 4, 1);
--
-- 12345678 tiene 7 pedidos, 2 de la boleta 2. (4.320.000+2.250.000) = 6.570.000
--
INSERT INTO PEDIDO VALUES(5, 36, 4, 2);
INSERT INTO PEDIDO VALUES(6, 15, 1, 2);
--
-- 12345678 tiene 7 pedidos, 1 de la boleta 3. 2.400.000
--
INSERT INTO PEDIDO VALUES(7, 8, 3, 3);
--
-- 11111111 tiene 4 pedidos, 3 de la boleta 4. (8.600.000+1.650.000+600.000+4.200.000) = 15.050.000
INSERT INTO PEDIDO VALUES(8, 43, 2, 4);
INSERT INTO PEDIDO VALUES(9, 11, 1, 4);
INSERT INTO PEDIDO VALUES(10, 5, 4, 4);
INSERT INTO PEDIDO VALUES(11, 14, 3, 4);
--
-- 11111111 tiene 4 pedidos, 1 de la boleta 5. 840.000
--
INSERT INTO PEDIDO VALUES(12, 7, 4, 5);
--
-- 22222222 tiene 3 pedidos de la boleta 6. (720.000+6.400.000+3.000.000) = 10.120.000
--
INSERT INTO PEDIDO VALUES(13, 6, 4, 6);
INSERT INTO PEDIDO VALUES(14, 32, 2, 6);
INSERT INTO PEDIDO VALUES(15, 20, 1, 6);
--
-- 33333333 tiene 1 pedido de la boleta 7. 1.800.000
--
INSERT INTO PEDIDO VALUES(16, 9, 2, 7);
--
COMMIT;
--
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
