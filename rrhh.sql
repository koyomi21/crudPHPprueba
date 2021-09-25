-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2021 a las 17:28:09
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rrhh`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarEmpleado` (IN `cod` VARCHAR(11))  NO SQL
SELECT * FROM empleado WHERE idempleado = cod$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idcargo` char(3) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `sueldomin` double NOT NULL,
  `sueldomax` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idcargo`, `nombre`, `sueldomin`, `sueldomax`) VALUES
('C01', 'Gerente General', 15000, 50000),
('C02', 'Gerente', 10000, 15000),
('C03', 'Empleado', 7000, 10000),
('C04', 'Analista', 5000, 7000),
('C05', 'Vendedor', 3000, 5000),
('C06', 'Oficinista', 1500, 3000),
('C07', 'Programador', 2500, 6000),
('C08', 'Investigador', 6000, 8000),
('C09', 'Digitador', 1000, 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `iddepartamento` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `idubicacion` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`iddepartamento`, `nombre`, `idubicacion`) VALUES
(100, 'Gerencia', '001'),
(101, 'Contabilidad', '001'),
(102, 'Investigacion', '003'),
(103, 'Ventas', '001'),
(104, 'Operaciones', '001'),
(105, 'Sistemas', '004'),
(106, 'Recursos Humanos', '004'),
(107, 'Finanzas', '001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idempleado` char(5) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `fecingreso` date NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `idcargo` char(3) NOT NULL,
  `iddepartamento` int(11) NOT NULL,
  `sueldo` double NOT NULL,
  `comision` double NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idempleado`, `apellidos`, `nombre`, `fecingreso`, `telefono`, `idcargo`, `iddepartamento`, `sueldo`, `comision`, `email`) VALUES
('E0001', 'Garcias', 'Juanpa', '2020-12-20', '9861111', 'C03', 103, 1750, 150, 'garciaj@gmail.com'),
('E0002', 'Fernandez', 'Claudia', '2017-05-16', '987451265', 'C03', 100, 8000, 0, 'fernadez@hotmail.com'),
('E0003', 'Perez', 'Octavio', '2015-11-10', '254896', 'C02', 102, 150, 500, 'perez@gmail.com'),
('E0004', 'Diaz', 'Mariela', '2016-10-26', '322800', 'C06', 102, 1800, 100, 'diaz@hotmail.com'),
('E0005', 'Martinez', 'Roberto', '2016-12-21', '526412', 'C08', 102, 7000, 500, 'martinez@hotmail.com'),
('E0006', 'Espinoza', 'Miguel', '2016-07-21', '541254', 'C08', 102, 7500, 500, 'espinoza@hotmail.com'),
('E0007', 'VURGAs', 'NICOLs', '2016-04-13', '12345655', 'C06', 106, 1000, 200, 'NICOL123@gmail.coms');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `idubicacion` char(3) NOT NULL,
  `ciudad` varchar(15) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`idubicacion`, `ciudad`, `direccion`) VALUES
('001', 'Lima', 'Av. Benavides 534 - Miraflores'),
('002', 'Trujillo', 'Calle Primavera 1235 - Cercado'),
('003', 'Arequipa', 'Av Central 5623 - Cercado'),
('004', 'Lima', 'Av. La Marina 3456 - San Miguel');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idcargo`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`iddepartamento`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idempleado`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`idubicacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
