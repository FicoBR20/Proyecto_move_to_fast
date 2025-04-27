CREATE TABLE cliente(
    id_cliente SERIAL PRIMARY KEY NOT NULL,
    nombre_c    VARCHAR(45) NOT NULL,
    apellido1_c  VARCHAR(45) NOT NULL
);
CREATE TABLE sucursal(
    id_sucursal VARCHAR(25) PRIMARY KEY NOT NULL,
    ciudad_suc  VARCHAR(25) NOT NULL
);
CREATE TYPE carro AS ENUM ('sedan', 'suv', 'doble_cabina');
CREATE TABLE vehiculo(
    id_matricula SERIAL PRIMARY KEY NOT NULL,
    modelo  INT NOT NULL,
    tipo_vehi   carro NOT NULL, --dato definido por el usuario
    tarifa_dia INT NOT NULL, -- se cobra lo mismo por fraccion o por dia
    id_sucursal VARCHAR(25) NOT NULL,
    --actualiza los registros en vehiculos al cambiar id_sucursal
    CONSTRAINT fk_sucu_vehiculo FOREIGN KEY(id_sucursal) REFERENCES sucursal(id_sucursal) ON UPDATE CASCADE, 
    --limite minimo del año correspondiente al modelo. 
    CONSTRAINT ck_modelo CHECK (modelo > 2020),
	CONSTRAINT ck_tarifa_dia CHECK (tarifa_dia > 120000) --limite minimo del valor de renta por hora
);
CREATE TABLE pago(--entidad debil
    id_pago SERIAL,
    id_matricula INT NOT NULL,--no puede ser serial puesto que generaria nuevos valores
    importe INT NOT NULL,--total pagado por el servicio
    PRIMARY KEY(id_matricula, id_pago),
    FOREIGN KEY(id_matricula) REFERENCES vehiculo(id_matricula),
    CONSTRAINT ck_importe CHECK (importe >= 120000) --tarifa minima por dia
);
CREATE TABLE alquiler(
	frecuencia	SERIAL,
    id_cliente INT NOT NULL,--no pueden ser serial pues generarian nuevos valores
    id_matricula INT NOT NULL,--no puede ser serial pues generaria nuevo valores
    fecha_salida   TIMESTAMP NOT NULL, --cliente saca el carro de la sucursal
    fecha_llegada TIMESTAMP NOT NULL, --retorna el carro a la sucursal
    disponible BOOLEAN DEFAULT TRUE NOT NULL,--TRUE/FALSE
    PRIMARY KEY(id_cliente,id_matricula, frecuencia),--frecuencia permite la unicidad de la PK.
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY(id_matricula) REFERENCES vehiculo(id_matricula),
    CONSTRAINT ck_fech_salida CHECK(fecha_salida < fecha_llegada)
    --restricciones
);

-- ajustes tabla alquiler.

--SELECT * FROM alquiler

--ALTER TABLE alquiler DROP COLUMN total_alquiler;

--ALTER TABLE alquiler ADD COLUMN frecuencia SERIAL;

--ALTER TABLE alquiler DROP CONSTRAINT alquiler_pkey;

--ALTER TABLE alquiler ADD PRIMARY KEY (id_cliente,id_matricula, frecuencia);



