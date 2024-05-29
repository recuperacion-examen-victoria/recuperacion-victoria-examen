-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2024 a las 15:36:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen`
--
CREATE DATABASE IF NOT EXISTS `examen` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `examen`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_CrearCita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearCita` (IN `_NOMBRE` VARCHAR(100))   BEGIN
INSERT INTO CITA (NOMBRE)
VALUES (_NOMBRE);
END$$

DROP PROCEDURE IF EXISTS `sp_EliminarCita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminarCita` (IN `_ID` INT)   BEGIN
DELETE FROM CITA 
WHERE ID=_ID;
END$$

DROP PROCEDURE IF EXISTS `sp_ListarCita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarCita` ()   BEGIN
SELECT ID, NOMBRE
FROM CITA;

END$$

DROP PROCEDURE IF EXISTS `sp_ModificarCita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ModificarCita` (IN `_ID` INT, IN `_NOMBRE` VARCHAR(100))   BEGIN
UPDATE CITA
SET NOMBRE = _NOMBRE
WHERE ID=_ID;
END$$

DROP PROCEDURE IF EXISTS `sp_MostrarCita`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_MostrarCita` (IN `_ID` INT)   BEGIN
SELECT * FROM CITA
WHERE ID=_ID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

DROP TABLE IF EXISTS `cita`;
CREATE TABLE `cita` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`ID`, `NOMBRE`) VALUES
(1, 'optometria'),
(2, 'terapia'),
(3, 'cardiaca'),
(4, 'psicologia'),
(5, 'pediatria'),
(6, 'ODONTOLOGICA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
