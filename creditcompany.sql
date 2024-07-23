# Credit company project


SHOW DATABASES;
CREATE DATABASE creditcompany;
USE creditcompany;
SHOW TABLES;

DROP TABLE clientes;
DROP TABLE productos;
DROP TABLE transacciones;
DROP TABLE pagos;


#CREATE TABLES
CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  genero CHAR(1) NOT NULL,
  ingresos_mensuales DECIMAL(10,2) NOT NULL,
  estado_civil VARCHAR(255) NOT NULL
);

CREATE TABLE productos (
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre_producto VARCHAR(255) NOT NULL,
  tasa_de_interes DECIMAL(5,2) NOT NULL,
  comision_apertura DECIMAL(10,2) NOT NULL,
  cuota_mensual DECIMAL(10,2) NOT NULL
);

CREATE TABLE transacciones (
  id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  id_producto INT NOT NULL,
  fecha_transaccion DATE NOT NULL,
  monto_transaccion DECIMAL(10,2) NOT NULL,
  tipo_transaccion CHAR(1) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE pagos (
  id_pago INT PRIMARY KEY AUTO_INCREMENT,
  id_transaccion INT NOT NULL,
  fecha_pago DATE NOT NULL,
  monto_pago DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_transaccion) REFERENCES transacciones(id_transaccion)
);

#POPULATE TABLES

INSERT INTO clientes (nombre, fecha_nacimiento, genero, ingresos_mensuales, estado_civil)
VALUES
  ('Juan Perez', '1985-01-01', 'M', 2500.00, 'Soltero'),
  ('Maria Garcia', '1990-07-12', 'F', 1800.00, 'Casada'),
  ('Pedro Lopez', '1978-10-23', 'M', 3200.00, 'Divorciado'),
  ('Ana Sanchez', '1982-05-04', 'F', 2000.00, 'Soltera'),
  ('Carlos Rodriguez', '1995-03-15', 'M', 1500.00, 'Soltero'),
  ('Sofia Martinez', '1988-11-26', 'F', 2700.00, 'Casada'),
  ('Diego Gonzalez', '1976-02-07', 'M', 4000.00, 'Divorciado'),
  ('Laura Fernandez', '1992-08-18', 'F', 2300.00, 'Soltera'),
  ('Alejandro Moreno', '1989-06-29', 'M', 2100.00, 'Soltero'),
  ('Marta Ruiz', '1994-04-10', 'F', 1600.00, 'Casada'),
  ('David Ortiz', '1977-12-21', 'M', 3500.00, 'Divorciado'),
  ('Isabel Alonso', '1991-09-02', 'F', 2400.00, 'Soltera'),
  ('Javier Blanco', '1986-07-13', 'M', 2200.00, 'Soltero'),
  ('Patricia Gomez', '1993-05-24', 'F', 1700.00, 'Casada'),
  ('Raul Lopez', '1980-01-05', 'M', 4200.00, 'Divorciado'),
  ('Susana Perez', '1996-11-16', 'F', 2500.00, 'Soltera'),
  ('Hector Garcia', '1987-08-27', 'M', 2300.00, 'Soltero'),
  ('Monica Sanchez', '1998-06-08', 'F', 1800.00, 'Casada'),
  ('Jose Rodriguez', '1981-02-19', 'M', 3600.00, 'Divorciado'),
  ('Ana Martinez', '1997-10-30', 'F', 2600.00, 'Soltera')
;



INSERT INTO productos (nombre_producto, tasa_de_interes, comision_apertura, cuota_mensual)
VALUES
  ('Préstamo Personal', 15.00, 100.00, 200.00),
  ('Tarjeta de Crédito Clásica', 12.00, 50.00, 150.00),
  ('Tarjeta de Crédito Oro', 10.00, 150.00, 300.00),
  ('Línea de Crédito', 18.00, 75.00, 100.00)
;

  

INSERT INTO transacciones (id_cliente, id_producto, fecha_transaccion, monto_transaccion, tipo_transaccion)
VALUES
    (1, 1, '2023-01-10', 5000.00, 'P'),
    (1, 2, '2023-02-15', 100.00, 'P'),
    (1, 1, '2023-03-05', 200.00, 'P'),
    (2, 2, '2023-02-01', 50.00, 'P'),
    (2, 3, '2023-04-20', 1000.00, 'P'),
    (2, 1, '2023-05-12', 300.00, 'A'),
    (3, 1, '2023-01-25', 7500.00, 'P'),
    (3, 2, '2023-03-10', 75.00, 'P'),
    (3, 1, '2023-04-07', 400.00, 'A'),
    (4, 2, '2023-02-22', 125.00, 'P'),
    (4, 3, '2023-05-31', 500.00, 'P'),
    (4, 2, '2023-06-14', 150.00, 'P'),
    (5, 1, '2023-01-18', 3000.00, 'P'),
    (5, 2, '2023-03-08', 60.00, 'P'),
    (5, 1, '2023-04-27', 250.00, 'A'),
    (6, 2, '2023-02-04', 100.00, 'P'),
    (6, 3, '2023-05-17', 800.00, 'P'),
    (6, 2, '2023-06-28', 175.00, 'P'),
    (7, 1, '2023-01-22', 6000.00, 'P'),
    (7, 2, '2023-03-15', 85.00, 'P'),
    (7, 1, '2023-04-19', 350.00, 'A'),
    (8, 2, '2023-02-11', 110.00, 'P'),
    (8, 3, '2023-06-01', 650.00, 'P'),
    (8, 2, '2023-06-02', 218.00, 'P'),
    (9, 3, '2023-05-24', 700.00, 'P'),
    (10, 2, '2023-02-18', 140.00, 'P'),
    (10, 1, '2023-06-11', 300.00, 'P'),
    (11, 1, '2023-01-29', 4500.00, 'P'),
    (11, 2, '2023-03-22', 90.00, 'P'),
    (11, 1, '2023-05-03', 275.00, 'A');

SELECT id_transaccion FROM transacciones;


INSERT INTO pagos (id_transaccion, fecha_pago, monto_pago)
VALUES
  (31, '2023-01-10', 5000.00),
  (32, '2023-02-15', 100.00),
  (33, '2023-03-05', 200.00),
  (61, '2023-01-18', 3000.00),
  (62, '2023-01-22', 6000.00),
  (63, '2023-02-08', 1200.00),
  (34, '2023-02-22', 800.00),
  (35, '2023-03-15', 2500.00),
  (36, '2023-04-05', 1800.00),
  (64, '2023-05-10', 1100.00),
  (65, '2023-05-24', 1400.00),
  (66, '2023-06-07', 900.00),
  (37, '2023-06-21', 1350.00),
  (38, '2023-01-25', 7500.00),
  (39, '2023-03-10', 1000.00),
  (67, '2023-04-07', 300.00),
  (68, '2023-05-31', 500.00),
  (69, '2023-06-14', 150.00),
  (40, '2023-02-01', 50.00),
  (41, '2023-04-20', 1000.00),
  (42, '2023-05-12', 300.00),
  (70, '2023-03-08', 60.00),
  (71, '2023-04-27', 250.00),
  (72, '2023-02-04', 100.00),
  (43, '2023-05-17', 800.00),
  (44, '2023-06-28', 175.00),
  (45, '2023-03-15', 85.00),
  (73, '2023-04-19', 350.00),
  (74, '2023-02-11', 110.00),
  (75, '2023-06-01', 650.00),
  (46, '2023-06-15', 220.00),
  (47, '2023-02-18', 140.00),
  (48, '2023-06-11', 300.00),
  (76, '2023-01-29', 4500.00),
  (77, '2023-03-22', 90.00),
  (78, '2023-05-03', 275.00);

  
 #MOSTRAR TABLAS
 SELECT * FROM clientes;
 SELECT * FROM pagos;
 SELECT * FROM productos;
 SELECT * FROM transacciones;
 
 
 #CONSULTAS UTILES
 
 #Transacciones totales por cliente
 SELECT id_cliente, COUNT(*) AS total_transacciones
FROM transacciones
GROUP BY id_cliente;


#Total de monto transaccionado por producto
SELECT id_producto, SUM(monto_transaccion) AS total_monto
FROM transacciones
GROUP BY id_producto;

 #Clientes con pagos mayores a monto especifico
 SELECT c.nombre, p.monto_pago
FROM pagos p
JOIN transacciones t ON p.id_transaccion = t.id_transaccion
JOIN clientes c ON t.id_cliente = c.id_cliente
WHERE p.monto_pago > 1000.00;


#Transacciones y pago por cliente
SELECT c.nombre, t.id_transaccion, t.fecha_transaccion, t.monto_transaccion, p.fecha_pago, p.monto_pago
FROM clientes c
JOIN transacciones t ON c.id_cliente = t.id_cliente
JOIN pagos p ON t.id_transaccion = p.id_transaccion
ORDER BY c.nombre, t.fecha_transaccion;


#Total monto pagado por cliente
SELECT c.nombre, SUM(p.monto_pago) AS total_pagado
FROM clientes c
JOIN transacciones t ON c.id_cliente = t.id_cliente
JOIN pagos p ON t.id_transaccion = p.id_transaccion
GROUP BY c.nombre;


#OTRAS CONSULTAS ESPECIFICAS
 
  #Rentabilidad producto
  
  SELECT
  p.nombre_producto,
  SUM(t.monto_transaccion) AS ingresos_totales,
  SUM(p.comision_apertura + t.monto_transaccion * p.tasa_de_interes / 100) AS costos_totales,
  SUM(t.monto_transaccion) - SUM(p.comision_apertura + t.monto_transaccion * p.tasa_de_interes / 100) AS utilidad_neta
FROM productos p
JOIN transacciones t ON p.id_producto = t.id_producto
GROUP BY p.nombre_producto;

#Tasa de Retorno de Inversion
SELECT
  p.nombre_producto,
  SUM(t.monto_transaccion) AS inversion_inicial,
  SUM(t.monto_transaccion) - SUM(p.comision_apertura + t.monto_transaccion * p.tasa_de_interes / 100) AS ganancia_neta,
  (SUM(t.monto_transaccion) - SUM(p.comision_apertura + t.monto_transaccion * p.tasa_de_interes / 100)) / SUM(t.monto_transaccion) AS ROI
FROM productos p
JOIN transacciones t ON p.id_producto = t.id_producto
GROUP BY p.nombre_producto;

#Costo de Adquisicion de cliente (CAC) por producto

SELECT
  p.nombre_producto,
  COUNT(DISTINCT t.id_cliente) AS clientes_nuevos,
  SUM(p.comision_apertura) AS costos_adquisicion,
  SUM(p.comision_apertura) / COUNT(DISTINCT t.id_cliente) AS CAC
FROM productos p
INNER JOIN transacciones t ON p.id_producto = t.id_producto
WHERE t.fecha_transaccion >= '2023-01-01'
GROUP BY p.nombre_producto;