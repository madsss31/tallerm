-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2023 a las 00:43:07
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tallercb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `codigo` int(11) NOT NULL,
  `nombreCiudad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`codigo`, `nombreCiudad`) VALUES
(1, 'Bogotá'),
(2, 'Medellín'),
(3, 'Cali'),
(4, 'Barranquilla'),
(5, 'Cartagena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cedula` int(18) NOT NULL,
  `puntaje` int(11) DEFAULT NULL,
  `paginaWeb` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cedula`, `puntaje`, `paginaWeb`) VALUES
(123456789, 100, 'www.cliente1.com'),
(234567890, 5, 'www.cliente3.com'),
(345678901, 90, 'www.cliente5.com'),
(876543210, 75, 'www.cliente4.com'),
(987654321, 80, 'www.cliente2.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `numeroFactura` int(18) NOT NULL,
  `idProducto` int(18) DEFAULT NULL,
  `idVendedor` int(18) DEFAULT NULL,
  `idCliente` int(18) DEFAULT NULL,
  `cantidad` int(18) DEFAULT NULL,
  `fechafactura` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`numeroFactura`, `idProducto`, `idVendedor`, `idCliente`, `cantidad`, `fechafactura`) VALUES
(1, 1, 123456789, 999999999, 39, '2023-10-12'),
(2, 2, 987654321, 888888888, 40, '2023-10-11'),
(3, 3, 234567890, 777777777, 3, '2023-10-10'),
(4, 4, 876543210, 666666666, 12, '2023-10-09'),
(5, 5, 345678901, 555555555, 10, '2023-10-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idProducto` int(18) NOT NULL,
  `cantidad` int(18) DEFAULT NULL,
  `valorCompra` int(11) DEFAULT NULL,
  `fechaIngreso` date NOT NULL,
  `fechaVencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idProducto`, `cantidad`, `valorCompra`, `fechaIngreso`, `fechaVencimiento`) VALUES
(1, 100, 11, '2023-10-12', '2023-12-31'),
(2, 50, 8, '2023-10-11', '2024-01-15'),
(3, 75, 12, '2023-10-10', '2023-11-30'),
(4, 120, 7, '2023-10-09', '2024-02-28'),
(5, 90, 11, '2023-10-08', '2023-12-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(18) NOT NULL,
  `idTipoProducto` int(18) DEFAULT NULL,
  `nombreProducto` varchar(45) DEFAULT NULL,
  `valorVenta` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `idTipoProducto`, `nombreProducto`, `valorVenta`) VALUES
(1, 1, 'Muñecas de Porcelana', 20),
(2, 2, 'Autos de Carreras', 13),
(4, 4, 'Peluche de Osito', 8),
(5, 5, 'Juego de Construcción LEGO', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `idSucursal` int(18) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`idSucursal`, `nombre`, `direccion`, `ciudad`) VALUES
(1, 'Sucursal Central', 'Calle Principal 123', 1),
(2, 'Sucursal Norte', 'Avenida Norte 456', 2),
(3, 'Sucursal Sur', 'Carrera Sur 789', 3),
(4, 'Sucursal Este', 'Calle Este 101', 4),
(5, 'Sucursal Oeste', 'Avenida Oeste 202', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproductos`
--

CREATE TABLE `tipoproductos` (
  `idTipoProductos` int(18) NOT NULL,
  `nombreTipoProducto` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipoproductos`
--

INSERT INTO `tipoproductos` (`idTipoProductos`, `nombreTipoProducto`) VALUES
(1, 'Muñecas'),
(2, 'Autos de juguete'),
(3, 'Rompecabezas'),
(4, 'Peluches'),
(5, 'Juegos de construcción');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `fechNacimiento` date DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `apellido`, `fechNacimiento`, `direccion`, `telefono`) VALUES
(123456789, 'Juan', 'Pérez', '1990-03-15', 'Calle 123, Ciudad', '123-456-7890'),
(234567890, 'Carlos', 'López', '2000-01-10', 'Calle ABC, Ciudad', '555-123-4567'),
(345678901, 'Pedro', 'Martínez', '1988-11-30', 'Avenida 789, Ciudad', '111-222-3333'),
(555555555, 'Isabella', 'Fernández', '1996-04-15', 'Avenida 101, Ciudad', '555-666-7777'),
(666666666, 'Diego', 'Ramírez', '1980-12-05', 'Carrera 89, Ciudad', '444-555-6666'),
(777777777, 'Sofía', 'López', '1999-02-08', 'Calle 67, Ciudad', '333-444-5555'),
(876543210, 'Ana', 'Rodríguez', '1992-05-20', 'Calle 456, Ciudad', '222-333-4444'),
(888888888, 'Javier', 'Martínez', '1987-06-25', 'Avenida 45, Ciudad', '222-333-4444'),
(987654321, 'María', 'Gómez', '1985-07-22', 'Avenida XYZ, Ciudad', '987-654-3210'),
(999999999, 'Laura', 'García', '1994-09-18', 'Carrera 12, Ciudad', '111-222-3333');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `Cedula` int(18) NOT NULL,
  `idSucursal` int(18) DEFAULT NULL,
  `SALARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`Cedula`, `idSucursal`, `SALARIO`) VALUES
(555555555, 5, 2901),
(666666666, 4, 2700),
(777777777, 3, 2600),
(888888888, 2, 2801),
(999999999, 1, 2501);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`numeroFactura`),
  ADD KEY `fk_factura_produc_idx` (`idProducto`),
  ADD KEY `fk_vendedor_usu_idx` (`idVendedor`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idProducto`,`fechaIngreso`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_TipoProducto_idx` (`idTipoProducto`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idSucursal`),
  ADD KEY `fk_sucursal_cuidades_idx` (`ciudad`);

--
-- Indices de la tabla `tipoproductos`
--
ALTER TABLE `tipoproductos`
  ADD PRIMARY KEY (`idTipoProductos`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`Cedula`),
  ADD KEY `fk_vendedor_sucursal1_idx` (`idSucursal`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_usuarios1` FOREIGN KEY (`cedula`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_cliente_usu` FOREIGN KEY (`idProducto`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_produc` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendedor_usu` FOREIGN KEY (`idVendedor`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_Producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_TipoProducto` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipoproductos` (`idTipoProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `fk_sucursal_cuidades` FOREIGN KEY (`ciudad`) REFERENCES `ciudades` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `fk_vendedor_sucursal` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendedor_usuarios1` FOREIGN KEY (`Cedula`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
