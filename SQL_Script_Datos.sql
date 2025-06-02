-- Inserción de tablas independientes
-- Usuario
INSERT INTO Usuario (nombre, email, clave_acceso, rol) VALUES
('Juan Pérez', 'juan@example.com', '123456', 'admin'),
('María Gómez', 'maria@example.com', 'abcdef', 'usuario'),
('Carlos Ruiz', 'carlos@example.com', 'clave123', 'usuario'),
('Ana Torres', 'ana@example.com', 'torres321', 'usuario'),
('Luis Mendoza', 'luis@example.com', 'mendoza456', 'admin');

-- MétodoAmortizacion
INSERT INTO MetodoAmortizacion (nombre) VALUES
('Francés'),
('Alemán'),
('Americano');

-- PlazoGracia
INSERT INTO PlazoGracia (tipo, duracion_mes) VALUES
('Total', 6),
('Parcial', 3),
('Ninguno', 0),
('Total', 12),
('Parcial', 9);

-- Moneda
INSERT INTO Moneda (nombre, simbolo) VALUES
('Soles', 'S/'),
('Dólares', '$');

-- TasaInteres
INSERT INTO TasaInteres (tipo, valor, capitalizacion) VALUES
('Nominal', 10.00, 'Mensual'),
('Efectiva', 8.50, 'Trimestral'),
('Nominal', 12.00, 'Anual'),
('Efectiva', 7.25, 'Mensual'),
('Nominal', 9.75, 'Semestral');

-- Inserción de tabla transaccional: Bono
INSERT INTO Bono (valor_nominal, fecha_emision, fecha_vencimiento, id_metodo_amortizacion, id_moneda, id_tasa_interes, id_plazo) VALUES
(10000.00, '2023-01-01', '2028-01-01', 1, 1, 1, 1),
(20000.00, '2023-06-15', '2030-06-15', 2, 2, 2, 2),
(15000.00, '2022-03-10', '2027-03-10', 3, 3, 3, 3),
(25000.00, '2021-12-01', '2026-12-01', 4, 4, 4, 4),
(18000.00, '2023-04-20', '2029-04-20', 5, 5, 5, 5),
(12000.00, '2022-07-10', '2027-07-10', 1, 1, 2, 2),
(30000.00, '2023-09-05', '2033-09-05', 2, 2, 3, 3),
(17000.00, '2024-01-01', '2029-01-01', 3, 3, 4, 4),
(11000.00, '2024-02-15', '2029-02-15', 4, 4, 5, 5),
(22000.00, '2022-11-11', '2027-11-11', 5, 5, 1, 1);

DELETE FROM Bono;

-- Inserción de tabla transaccional: Bono
INSERT INTO Bono (valor_nominal, fecha_emision, fecha_vencimiento, id_metodo_amortizacion, id_moneda, id_tasa_interes, id_plazo) VALUES
(10000.00, '2023-01-01', '2028-01-01', 1, 1, 1, 1),
(20000.00, '2023-06-15', '2030-06-15', 2, 2, 2, 2),
(15000.00, '2022-03-10', '2027-03-10', 3, 1, 3, 1),
(25000.00, '2021-12-01', '2026-12-01', 1, 2, 1, 2),
(18000.00, '2023-04-20', '2029-04-20', 2, 1, 2, 1),
(12000.00, '2022-07-10', '2027-07-10', 3, 2, 3, 2),
(30000.00, '2023-09-05', '2033-09-05', 1, 1, 1, 1),
(17000.00, '2024-01-01', '2029-01-01', 2, 2, 2, 2),
(11000.00, '2024-02-15', '2029-02-15', 3, 1, 3, 1),
(22000.00, '2022-11-11', '2027-11-11', 1, 2, 1, 2);

-- Inserción de tabla transaccional: FlujoCaja
INSERT INTO FlujoCaja (periodo, monto_pago, fecha_pago, id_bono) VALUES
(1, 1000.00, '2023-02-01', 1),
(2, 1000.00, '2023-03-01', 1),
(3, 1000.00, '2023-04-01', 1),
(1, 1500.00, '2023-07-15', 2),
(2, 1500.00, '2023-08-15', 2),
(3, 1500.00, '2023-09-15', 2),
(1, 1200.00, '2022-04-10', 3),
(2, 1200.00, '2022-05-10', 3),
(3, 1200.00, '2022-06-10', 3),
(1, 2000.00, '2021-12-31', 4);







DELETE FROM FlujoCaja;

-- Inserción de tabla transaccional: FlujoCaja
INSERT INTO FlujoCaja (periodo, monto_pago, fecha_pago, id_bono) VALUES
(1, 1000.00, '2023-02-01', 1),
(2, 1000.00, '2023-03-01', 1),
(3, 1000.00, '2023-04-01', 1),
(1, 1500.00, '2023-07-15', 2),
(2, 1500.00, '2023-08-15', 2),
(3, 1500.00, '2023-09-15', 2),
(1, 1200.00, '2022-04-10', 3),
(2, 1200.00, '2022-05-10', 3),
(3, 1200.00, '2022-06-10', 3),
(1, 2000.00, '2023-01-01', 4);

SELECT * FROM Moneda;
SELECT * FROM MetodoAmortizacion;
SELECT * FROM TasaInteres;
SELECT * FROM Plazo;

SELECT name FROM sys.tables;

EXEC sp_rename 'Bono.id_plazo', 'id_plazo_gracia', 'COLUMN';

sp_help Bono;

EXEC sp_rename 'plazo_gracia', 'PlazoGracia';

SELECT name FROM sys.tables;

DELETE FROM FlujoCaja;

-- Inserción de tabla transaccional: FlujoCaja
INSERT INTO FlujoCaja (periodo, monto_pago, fecha_pago, id_bono) VALUES
(1, 1000.00, '2023-02-01', 1),
(2, 1000.00, '2023-03-01', 1),
(3, 1000.00, '2023-04-01', 1),
(1, 1500.00, '2023-07-15', 2),
(2, 1500.00, '2023-08-15', 2),
(3, 1500.00, '2023-09-15', 2),
(1, 1200.00, '2022-04-10', 3),
(2, 1200.00, '2022-05-10', 3),
(3, 1200.00, '2022-06-10', 3),
(1, 2000.00, '2023-01-01', 4);

SELECT id_bono, valor_nominal FROM Bono;

SELECT id_bono FROM Bono ORDER BY id_bono;

DELETE FROM FlujoCaja;

INSERT INTO FlujoCaja (periodo, monto_pago, fecha_pago, id_bono) VALUES
(1, 1000.00, '2023-02-01', 1),
(2, 1000.00, '2023-03-01', 1),
(3, 1000.00, '2023-04-01', 1),
(1, 1500.00, '2023-07-15', 2),
(2, 1500.00, '2023-08-15', 2),
(3, 1500.00, '2023-09-15', 2),
(1, 1200.00, '2022-04-10', 3),
(2, 1200.00, '2022-05-10', 3),
(3, 1200.00, '2022-06-10', 3),
(1, 2000.00, '2021-12-31', 4);

SELECT id_bono FROM Bono ORDER BY id_bono;
SELECT id_bono, valor_nominal FROM Bono ORDER BY id_bono;

DELETE FROM FlujoCaja;

-- Inserción de tabla transaccional: FlujoCaja
INSERT INTO FlujoCaja (periodo, monto_pago, fecha_pago, id_bono) VALUES
(1, 1000.00, '2023-02-01', 4),
(2, 1000.00, '2023-03-01', 4),
(1, 1500.00, '2023-07-15', 5),
(2, 1500.00, '2023-08-15', 5),
(1, 1200.00, '2022-04-10', 6),
(2, 1200.00, '2022-05-10', 6),
(1, 2000.00, '2021-12-31', 7),
(2, 2000.00, '2022-01-31', 7),
(1, 1800.00, '2023-04-20', 8),
(2, 1800.00, '2023-05-20', 8);




-- Inserción de tabla transaccional: Valoracion
INSERT INTO Valoracion (tcea, trea, convexidad, duracion, duracion_modificada, precio_mercado, id_usuario, id_bono) VALUES
(0.095000, 0.090000, 2.456789, 3.456789, 3.345678, 24000.00, 4, 4),
(0.070000, 0.065000, 3.789012, 4.456789, 4.345678, 17500.00, 5, 5),
(0.080000, 0.075000, 3.012345, 3.987654, 3.876543, 11800.00, 1, 6),
(0.090000, 0.085000, 2.876543, 3.765432, 3.654321, 29800.00, 2, 7),
(0.068000, 0.063000, 3.456123, 4.654321, 4.543210, 16000.00, 3, 8),
(0.077000, 0.072000, 3.789654, 4.321098, 4.210987, 10500.00, 4, 9),
(0.082000, 0.077000, 3.345678, 4.123456, 4.012345, 21000.00, 5, 10),
(0.075000, 0.070000, 3.456789, 4.123456, 3.912345, 9800.00, 1, 11),
(0.085000, 0.080000, 2.987654, 3.876543, 3.745678, 19500.00, 2, 12),
(0.065000, 0.060000, 4.123456, 5.123456, 4.912345, 14800.00, 3, 13);

SELECT * FROM Usuario;
SELECT * FROM MetodoAmortizacion;
SELECT * FROM PlazoGracia;
SELECT * FROM Moneda;
SELECT * FROM TasaInteres;
SELECT * FROM Bono;
SELECT * FROM FlujoCaja;
SELECT * FROM Valoracion;
