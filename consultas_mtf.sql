-- ################################
-- Abril 28 de 2025
-- Asignatura:Base de Datos
-- federico.barbetti@correounivalle.edu.co
-- Codigo: 2181247
-- Proyecto: Move to fast
-- ################################

/**LISTADO DE CONSULTAS A EJECUTAR

/* CONSULTA 1 Obtener los vehículos disponibles en una ciudad específica.


SELECT v.id_matricula, v.modelo, v.tipo_vehi, s.ciudad_suc
FROM vehiculo v
JOIN sucursal s ON v.id_sucursal = s.id_sucursal
JOIN alquiler a ON v.id_matricula = a.id_matricula
WHERE a.disponible = TRUE
AND s.ciudad_suc = 'Bogota';

*/

/* CONSULTA 2 Listar los alquileres activos con información del cliente y vehículo.


SELECT c.nombre_c, c.apellido1_c, v.modelo, v.tipo_vehi, a.fecha_salida, a.fecha_llegada
FROM alquiler a
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN vehiculo v ON a.id_matricula = v.id_matricula
WHERE a.disponible = TRUE;

*/

/* CONSULTA 3 Calcular los ingresos totales por sucursal considerando solo vehículos con más de 3 alquileres

SELECT s.ciudad_suc, SUM(p.importe) AS ingresos_totales
FROM vehiculo v
JOIN alquiler a ON v.id_matricula = a.id_matricula
JOIN pago p ON v.id_matricula = p.id_matricula
JOIN sucursal s ON v.id_sucursal = s.id_sucursal
GROUP BY s.ciudad_suc
HAVING COUNT(a.id_matricula) > 3;

*/

/* CONSULTA 4 Filtrar solo vehículos con más de 5 alquileres (usar subconsulta)

SELECT v.id_matricula, v.modelo, v.tipo_vehi
FROM vehiculo v
WHERE v.id_matricula IN (
SELECT a.id_matricula
FROM alquiler a
GROUP BY a.id_matricula
HAVING COUNT(a.id_matricula) > 5
);

*/

/* CONSULTA 5 Sumar los montos de todos los pagos asociados.

SELECT SUM(importe) AS total_ingresos
FROM pago;

*/

--===================================PRUEBAS DE INTEGRIDAD=================



--INSERTAR UN CLIENTE Y UN ALQUILER ASOCIADO

/*

SELECT * FROM cliente

INSERT INTO cliente (nombre_c, apellido1_c) VALUES
('Tigre', 'Falcao');

SELECT * FROM alquiler


INSERT INTO alquiler(id_cliente, id_matricula, fecha_salida, fecha_llegada, disponible)
VALUES ( (SELECT id_cliente FROM cliente WHERE nombre_c = 'Tigre' AND apellido1_c = 'Falcao'), 1, '2025-04-27 09:00', '2025-04-29 09:00', TRUE);

--BORRAR UN CLIENTE Y UN BORRAR ALQUILER ASOCIADO CASCADE


DELETE FROM cliente WHERE id_cliente = 6; --tigre falcao

SELECT * FROM alquiler

SELECT * FROM vehiculo

--ACTUALIZAR SUCURSAL Y ON CASCADE VEHICULOS SE ACTUALIZAN


SELECT * FROM sucursal

UPDATE sucursal SET id_sucursal = 'SUC099' WHERE ciudad_suc = 'Bogota';

--INSERT FALLIDO VEHICULO MODELO 1999

INSERT INTO vehiculo (modelo, tipo_vehi, tarifa_dia, id_sucursal) VALUES
(1999, 'sedan', 150000, 'SUC001');


*/


/*

CONSULTA QUE ACTUALIZA LOS VEHICULOS DISPONIBLES
EN UN MOMENTO DADO.

UPDATE alquiler
SET disponible = FALSE
WHERE fecha_llegada > CURRENT_TIMESTAMP
*/

*/



