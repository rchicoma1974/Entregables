--Listar todos los bonos con su método de amortización y moneda--
SELECT 
    b.id_bono,
    b.valor_nominal,
    b.fecha_emision,
    b.fecha_vencimiento,
    m.nombre AS metodo_amortizacion,
    mo.nombre AS moneda
FROM Bono b
JOIN MetodoAmortizacion m ON b.id_metodo_amortizacion = m.id_metodo
JOIN Moneda mo ON b.id_moneda = mo.id_moneda;

--Mostrar los flujos de caja de un bono específico (por ejemplo, id_bono = 1)--
SELECT 
    f.periodo,
    f.monto_pago,
    f.fecha_pago
FROM FlujoCaja f
WHERE f.id_bono = 1
ORDER BY f.periodo;

--Mostrar las valoraciones realizadas por cada usuario (nombre del usuario y tcea)--
SELECT 
    u.nombre AS usuario,
    v.tcea,
    v.trea,
    v.precio_mercado
FROM Valoracion v
JOIN Usuario u ON v.id_usuario = u.id_usuario;

--Contar cuántos bonos existen por cada tipo de método de amortización--
SELECT 
    m.nombre AS metodo_amortizacion,
    COUNT(*) AS cantidad_bonos
FROM Bono b
JOIN MetodoAmortizacion m ON b.id_metodo_amortizacion = m.id_metodo
GROUP BY m.nombre;

--Ver bonos cuyo vencimiento es en el año 2026--
SELECT 
    id_bono,
    valor_nominal,
    fecha_emision,
    fecha_vencimiento
FROM Bono
WHERE YEAR(fecha_vencimiento) = 2026;

--Mostrar bonos con su tasa de interés--
SELECT 
    b.id_bono,
    b.valor_nominal,
    t.tipo,
    t.valor,
    t.capitalizacion
FROM Bono b
JOIN TasaInteres t ON b.id_tasa_interes = t.id_tasa;

SELECT 
    b.id_bono,
    b.valor_nominal,
    pg.tipo AS tipo_gracia,
    pg.duracion_mes
FROM Bono b
LEFT JOIN PlazoGracia pg ON b.id_plazo = pg.id_plazo
WHERE b.id_plazo IS NOT NULL;

SELECT 
    b.id_bono,
    b.valor_nominal,
    ISNULL(pg.tipo, 'Sin gracia') AS tipo_gracia,
    ISNULL(pg.duracion_mes, 0) AS duracion_mes
FROM Bono b
LEFT JOIN PlazoGracia pg ON b.id_plazo = pg.id_plazo;

--Mostrar una lista de todos los bonos registrados, incluyendo su valor nominal, fecha de emisión, fecha de vencimiento, el nombre del método de amortización y el nombre de la moneda en que están emitidos.--
SELECT 
    b.id_bono,
    b.valor_nominal,
    b.fecha_emision,
    b.fecha_vencimiento,
    m.nombre AS metodo_amortizacion,
    mo.nombre AS moneda
FROM Bono b
INNER JOIN MetodoAmortizacion m ON b.id_metodo_amortizacion = m.id_metodo
INNER JOIN Moneda mo ON b.id_moneda = mo.id_moneda;



