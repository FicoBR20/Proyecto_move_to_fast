-- ################################
-- Abril 28 de 2025
-- Asignatura:Base de Datos
-- federico.barbetti@correounivalle.edu.co
-- Codigo: 2181247
-- Proyecto: Move to fast
-- ################################


INSERT INTO cliente (nombre_c, apellido1_c) VALUES
('Juan', 'Perez'),
('Ana', 'Gomez'),
('Carlos', 'Lopez'),
('Laura', 'Martinez'),
('Sofia', 'Diaz');

INSERT INTO sucursal (id_sucursal, ciudad_suc) VALUES
('SUC001', 'Bogota'),
('SUC002', 'Medellin');

INSERT INTO vehiculo (modelo, tipo_vehi, tarifa_dia, id_sucursal) VALUES
(2022, 'sedan', 150000, 'SUC001'),
(2021, 'suv', 180000, 'SUC001'),
(2023, 'doble_cabina', 200000, 'SUC002'),
(2022, 'sedan', 170000, 'SUC002'),
(2024, 'suv', 190000, 'SUC002');

-- Alquileres de vehículos (varios para algunos vehículos)
-- id_cliente, id_matricula, fecha_salida, fecha_llegada, disponible

-- Vehículo 1 (Bogotá) - 4 alquileres
INSERT INTO alquiler VALUES (1, 1, '2025-04-01 09:00', '2025-04-02 09:00', TRUE);
INSERT INTO alquiler VALUES (2, 1, '2025-04-03 10:00', '2025-04-04 10:00', TRUE);
INSERT INTO alquiler VALUES (3, 1, '2025-04-05 11:00', '2025-04-06 11:00', TRUE);
INSERT INTO alquiler VALUES (4, 1, '2025-04-07 12:00', '2025-04-08 12:00', TRUE);

-- Vehículo 2 (Bogotá) - 2 alquileres
INSERT INTO alquiler VALUES (1, 2, '2025-04-01 09:00', '2025-04-01 18:00', TRUE);
INSERT INTO alquiler VALUES (5, 2, '2025-04-04 10:00', '2025-04-05 18:00', TRUE);

-- Vehículo 3 (Medellín) - 6 alquileres
INSERT INTO alquiler VALUES (2, 3, '2025-04-02 08:00', '2025-04-02 20:00', TRUE);
INSERT INTO alquiler VALUES (3, 3, '2025-04-03 08:00', '2025-04-03 20:00', TRUE);
INSERT INTO alquiler VALUES (4, 3, '2025-04-04 08:00', '2025-04-04 20:00', TRUE);
INSERT INTO alquiler VALUES (5, 3, '2025-04-05 08:00', '2025-04-05 20:00', TRUE);
INSERT INTO alquiler VALUES (1, 3, '2025-04-06 08:00', '2025-04-06 20:00', TRUE);
INSERT INTO alquiler VALUES (2, 3, '2025-04-07 08:00', '2025-04-07 20:00', TRUE);

-- Vehículo 4 (Medellín) - 1 alquiler
INSERT INTO alquiler VALUES (5, 4, '2025-04-02 09:00', '2025-04-02 15:00', TRUE);

-- Vehículo 5 (Medellín) - 0 alquileres (disponible completamente)
-- No se inserta nada aún

-- Pagos asociados (solo ejemplos, algunos importes distintos)
INSERT INTO pago (id_matricula, importe) VALUES
(1, 150000),
(1, 150000),
(1, 150000),
(1, 150000),
(2, 180000),
(2, 180000),
(3, 200000),
(3, 200000),
(3, 200000),
(3, 200000),
(3, 200000),
(3, 200000),
(4, 170000);

