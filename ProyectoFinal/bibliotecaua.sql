-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2019 a las 01:04:24
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bibliotecaua`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `devolucion_id` int(11) NOT NULL,
  `libro_id` int(11) DEFAULT NULL,
  `devoluciont` int(11) DEFAULT NULL,
  `fechadevolucion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Disparadores `devolucion`
--
DELIMITER $$
CREATE TRIGGER `backdevolucion` AFTER INSERT ON `devolucion` FOR EACH ROW insert into devolucionbak VALUES(NEW.devolucion_id, 
NEW.libro_id , 
NEW.devoluciont , 
NEW.fechadevolucion)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucionbak`
--

CREATE TABLE `devolucionbak` (
  `devolucion_id` int(11) NOT NULL,
  `libro_id` int(11) DEFAULT NULL,
  `devoluciont` int(11) DEFAULT NULL,
  `fechadevolucion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `libro_id` int(11) NOT NULL,
  `nombrelib` varchar(100) DEFAULT NULL,
  `cantidadlib` int(11) DEFAULT NULL,
  `autorlib` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`libro_id`, `nombrelib`, `cantidadlib`, `autorlib`) VALUES
(1, 'Cantar de Mio Cid', 20, 'Per Abbat'),
(2, 'Los espartanos', 10, 'Paul Cartledge'),
(3, 'Luces de Bohemia', 20, 'Ramón del Valle'),
(4, 'Crimen y Castigo', 20, 'Fyodor Dostoyevsky'),
(5, '100 años de Soledad', 20, 'Gabriel García Márquez'),
(6, 'La casa de los Espíritus', 20, 'Isabel Allende'),
(7, 'Preludio a la fundación', 15, 'Isaac Asimov'),
(8, 'Las Almas Muertas', 20, 'Nicolai Gogol'),
(9, 'La Comedia Humana', 20, 'Honoré de Balzac'),
(10, 'Cumbres Borrascosas', 20, 'Emily Brontë'),
(11, 'La muerte de Artemio Cruz', 20, 'Carlos Fuentes'),
(12, 'El Buscon', 20, 'Francisco de Quevedo y Villegas'),
(13, 'Rojo y Negro', 20, 'Stendhal'),
(14, 'En el Camino', 20, 'Jack Kerouac'),
(15, 'El extranjero', 20, 'Albert Camus'),
(16, 'Dracula', 20, 'Bram Stroker'),
(17, 'El campesino y otros cuentos', 20, 'Anton P. Chejov'),
(18, 'Trópico de Cáncer', 20, 'Henry Miller'),
(19, 'Ensayo sobre la Seguera', 20, 'Jose Saramago'),
(20, 'La Divina Comedia', 20, 'Dante Alighieri');

--
-- Disparadores `libros`
--
DELIMITER $$
CREATE TRIGGER `backlibros` AFTER INSERT ON `libros` FOR EACH ROW insert into librosbak VALUES(NEW.libro_id, 
NEW.nombrelib , 
NEW.cantidadlib , 
NEW.autorlib)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `librosbak`
--

CREATE TABLE `librosbak` (
  `libro_id` int(11) NOT NULL,
  `nombrelib` varchar(100) DEFAULT NULL,
  `cantidadlib` int(11) DEFAULT NULL,
  `autorlib` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `librosbak`
--

INSERT INTO `librosbak` (`libro_id`, `nombrelib`, `cantidadlib`, `autorlib`) VALUES
(1, 'Cantar de Mio Cid', 20, 'Per Abbat'),
(2, 'Los espartanos', 10, 'Paul Cartledge'),
(3, 'Luces de Bohemia', 20, 'Ramón del Valle'),
(4, 'Crimen y Castigo', 20, 'Fyodor Dostoyevsky'),
(5, '100 años de Soledad', 20, 'Gabriel García Márquez'),
(6, 'La casa de los Espíritus', 20, 'Isabel Allende'),
(7, 'Preludio a la fundación', 15, 'Isaac Asimov'),
(8, 'Las Almas Muertas', 20, 'Nicolai Gogol'),
(9, 'La Comedia Humana', 20, 'Honoré de Balzac'),
(10, 'Cumbres Borrascosas', 20, 'Emily Brontë'),
(11, 'La muerte de Artemio Cruz', 20, 'Carlos Fuentes'),
(12, 'El Buscon', 20, 'Francisco de Quevedo y Villegas'),
(13, 'Rojo y Negro', 20, 'Stendhal'),
(14, 'En el Camino', 20, 'Jack Kerouac'),
(15, 'El extranjero', 20, 'Albert Camus'),
(16, 'Dracula', 20, 'Bram Stroker'),
(17, 'El campesino y otros cuentos', 20, 'Anton P. Chejov'),
(18, 'Trópico de Cáncer', 20, 'Henry Miller'),
(19, 'Ensayo sobre la Seguera', 20, 'Jose Saramago'),
(20, 'La Divina Comedia', 20, 'Dante Alighieri');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `prestamo_id` int(11) NOT NULL,
  `libro_id` int(11) DEFAULT NULL,
  `prestamot` int(11) DEFAULT NULL,
  `fechaentrega` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Disparadores `prestamos`
--
DELIMITER $$
CREATE TRIGGER `backprestamos` AFTER INSERT ON `prestamos` FOR EACH ROW insert into prestamosbak VALUES(NEW.prestamo_id, 
NEW.libro_id , 
NEW.prestamot , 
NEW.fechaentrega)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamosbak`
--

CREATE TABLE `prestamosbak` (
  `prestamo_id` int(11) NOT NULL,
  `libro_id` int(11) DEFAULT NULL,
  `prestamot` int(11) DEFAULT NULL,
  `fechaentrega` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `backusuario` AFTER INSERT ON `usuario` FOR EACH ROW insert into usuariobak VALUES(NEW.usu_id, 
NEW.password , 
NEW.nombre , 
NEW.apellido,
                             NEW.dni,
                             NEW.telefono)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariobak`
--

CREATE TABLE `usuariobak` (
  `usu_id` int(11) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`devolucion_id`),
  ADD KEY `libro_id` (`libro_id`);

--
-- Indices de la tabla `devolucionbak`
--
ALTER TABLE `devolucionbak`
  ADD PRIMARY KEY (`devolucion_id`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`libro_id`);

--
-- Indices de la tabla `librosbak`
--
ALTER TABLE `librosbak`
  ADD PRIMARY KEY (`libro_id`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`prestamo_id`),
  ADD KEY `libro_id` (`libro_id`);

--
-- Indices de la tabla `prestamosbak`
--
ALTER TABLE `prestamosbak`
  ADD PRIMARY KEY (`prestamo_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_id`);

--
-- Indices de la tabla `usuariobak`
--
ALTER TABLE `usuariobak`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `devolucion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devolucionbak`
--
ALTER TABLE `devolucionbak`
  MODIFY `devolucion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `libro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `librosbak`
--
ALTER TABLE `librosbak`
  MODIFY `libro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `prestamo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamosbak`
--
ALTER TABLE `prestamosbak`
  MODIFY `prestamo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuariobak`
--
ALTER TABLE `usuariobak`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`libro_id`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`libro_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
