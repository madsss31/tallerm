-- 1
ALTER TABLE `vendedor` MODIFY `SALARIO` INT;

-- 2 
CREATE TABLE IF NOT EXISTS `TallerCB`.`cuidades` (
  `codigo` INT NOT NULL,
  `nombreCiudad` VARCHAR(50) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;

-- 3 
ALTER TABLE `sucursal` MODIFY `ciudad` INT;

-- 4
ALTER TABLE `inventario` CHANGE `valor` `valorCompra` INT;

-- 5
ALTER TABLE `inventario` ADD `fechaIngreso` DATE;

-- 6
ALTER TABLE`fechaIngreso` DROP CONSTRAINT `fk_Producto`;
ALTER TABLE `inventario` DROP PRIMARY KEY ;
ALTER TABLE `inventario`   ADD CONSTRAINT fk_Producto FOREIGN KEY (`idProducto`) REFERENCES `TallerCB`.`producto` (`idProducto`);
-- 7
ALTER TABLE `inventario` ADD `fechaVencimiento` DATE;

-- 8
ALTER TABLE `tallercb`.`sucursal` 
ADD INDEX `fk_sucursal_cuidades_idx` (`ciudad` ASC);
ALTER TABLE `tallercb`.`sucursal` 
ADD CONSTRAINT `fk_sucursal_cuidades`
  FOREIGN KEY (`ciudad`)
  REFERENCES `tallercb`.`cuidades` (`codigo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-- 9
RENAME TABLE `factura` TO `facturas`;

-- 10
ALTER TABLE clientes DROP COLUMN direcion;

-- 11
INSERT INTO tipoproductos VALUES
(1, 'Muñecas  de Porcelana'),
(2, 'Autos de Carreras'),
(3, 'Rompecabezas de Dinosaurios'),
(4, 'Peluche de Osito'),
(5, 'Juego de Construcción LEGO');
INSERT INTO usuarios  VALUES
('999999999', 'Laura', 'García', '1994-09-18', 'Carrera 12, Ciudad', '111-222-3333'),
('888888888', 'Javier', 'Martínez', '1987-06-25', 'Avenida 45, Ciudad', '222-333-4444'),
('777777777', 'Sofía', 'López', '1999-02-08', 'Calle 67, Ciudad', '333-444-5555'),
('666666666', 'Diego', 'Ramírez', '1980-12-05', 'Carrera 89, Ciudad', '444-555-6666'),
('555555555', 'Isabella', 'Fernández', '1996-04-15', 'Avenida 101, Ciudad', '555-666-7777');


INSERT INTO cuidades VALUES
(1, 'Bogotá'),
(2, 'Medellín'),
(3, 'Cali'),
(4, 'Barranquilla'),
(5, 'Cartagena');
RENAME TABLE cuidades TO ciudades;
INSERT INTO sucursal VALUES
(1, 'Sucursal Central', 'Calle Principal 123', 1),
(2, 'Sucursal Norte', 'Avenida Norte 456', 2),
(3, 'Sucursal Sur', 'Carrera Sur 789', 3),
(4, 'Sucursal Este', 'Calle Este 101', 4),
(5, 'Sucursal Oeste', 'Avenida Oeste 202', 5 );


INSERT INTO clientes VALUES
('123456789', 100, 'www.cliente1.com'),
('987654321', 80, 'www.cliente2.com'),
('234567890', 5, 'www.cliente3.com'),
('876543210', 75, 'www.cliente4.com'),
('345678901', 90, 'www.cliente5.com');
INSERT INTO inventario  VALUES
(1, 100, 10.5, '2023-10-12', '2023-12-31'),
(2, 50, 8.0, '2023-10-11', '2024-01-15'),
(3, 75, 12.2, '2023-10-10', '2023-11-30'),
(4, 120, 6.8, '2023-10-09', '2024-02-28'),
(5, 90, 11.0, '2023-10-08', '2023-12-15');
INSERT INTO vendedor VALUES 
('999999999', 1, 2500.50),
('888888888', 2, 2800.75),
('777777777', 3, 2600.25),
('666666666', 4, 2700.00),
('555555555', 5, 2900.80);

INSERT INTO producto VALUES
(1, 1, 'Muñecas de Porcelana', 19.99),
(2, 2, 'Autos de Carreras', 12.99),
(3, 3, 'Rompecabezas de Dinosaurios', 9.99),
(4, 4, 'Peluche de Osito', 7.99),
(5, 5, 'Juego de Construcción LEGO', 29.99);


INSERT INTO facturas VALUES 
(1, 1, '123456789', 999999999, 39, '2023-10-12'),
(2, 2, '987654321', 888888888, 40, '2023-10-11'),
(3, 3, '234567890', 777777777, 3, '2023-10-10'),
(4, 4, '876543210', 666666666, 12, '2023-10-09'),
(5, 5, '345678901', 555555555, 10, '2023-10-08');
SET foreign_key_checks = 1;

ALTER TABLE facturas
CHANGE COLUMN facturaventa fechafactura DATE;

-- 12
DELETE FROM producto WHERE idProducto = 3;

-- 13
ALTER TABLE usuarios CHANGE idususario idUsuario INT;
