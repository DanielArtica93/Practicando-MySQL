DROP TABLE farmacias;
DROP TABLE  medicamentos;
DROP TABLE facturas;

/* Creando la tabla farmacias*/

CREATE TABLE farmacias(
id int not null auto_increment primary key,
nombre varchar(25) not null,
direccion varchar(50) not null,
telefono int);

-- UNIQUE: Asegurar valores únicos
ALTER TABLE farmacias ADD CONSTRAINT unique_nombre UNIQUE (nombre);

/* Insertar valores en la tabla farmacias*/
INSERT INTO farmacias(nombre, direccion, telefono)
VALUES("Farmacias del ahorro", "Plaza Miraflores, Tegucigalpa", 33929832);

INSERT INTO farmacias
(nombre, direccion, telefono)VALUES("Farmacias kielsa", "City Mall, Tegucigalpa", 33326598);

INSERT INTO farmacias(nombre, direccion)
VALUES("Farmacias kielsa", "City mall teg.");

/* Comprobando que se creó la base de datos farmacias*/
SELECT * FROM farmacias;

-- Consultar columnas específicas
SELECT id, nombre, direccion FROM farmacias;

-- Consultar resultados con WHERE
SELECT * FROM farmacias
WHERE nombre = "Farmacias del ahorro";

-- Ordenas de mayor a menor
SELECT * FROM farmacias
ORDER BY id desc;

-- Limitar el número de resultados
SELECT * FROM farmacias
LIMIT 1;

-- Buscar con patrones
SELECT * FROM farmacias
WHERE nombre LIKE 'farmacias%';

SELECT * FROM farmacias
WHERE direccion LIKE '%Tegucigalpa%';

/* Hacer llamado a los id 1 y 2 */
SELECT * FROM farmacias
WHERE id = 1;

SELECT * FROM farmacias
WHERE id = 2;

SELECT * FROM farmacias
WHERE id = 3;

/* Eliminar el id 2 */

DELETE FROM farmacias
WHERE id = 6;

SELECT * FROM farmacias;

-- Actualizando el id 3
UPDATE farmacias
SET nombre = "Farmacias kielsa", direccion = "Mall multiplaza", telefono = 32335577
WHERE id = 3;

SELECT * FROM farmacias;

/* Borrar la información de la tabla */
DELETE FROM farmacias;

/* Eliminar por completo la tabla */
DROP TABLE farmacias;

/*
	
    SEGUNDA TABLA

*/

-- Creando una segunda tabla llamada medicamentos

CREATE table medicamentos(
	id int not null auto_increment primary key,
    nombre_medicamento varchar(25) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp,
    fecha_vencimiento DATE NOT NULL,
    marca varchar(20),
    id2 int,
    CONSTRAINT fk_farmacias FOREIGN KEY (id2) REFERENCES farmacias(id)
);

DROP TABLE medicamentos;

/*

Insertando valores

*/

/*
INSERT medicamentos(nombre_medicamento, fecha_creacion, fecha_vencimiento)
VALUES("Viscof","Farmacias del Ahorro", '2024-12-01', '2025-10-25 10:00:12');
*/

/*
INSERT medicamentos(nombre_medicamento, fecha_vencimiento)
VALUES("Viscof","Farmacias Kielsa", '2025-10-25');
*/

-- Pruebas
INSERT medicamentos(nombre_medicamento, fecha_vencimiento, marca)
VALUES("Viscof", current_date(), "a");

INSERT medicamentos(nombre_medicamento, fecha_vencimiento, marca)
VALUES("Panadol", current_date(), "b");

-- Agregando un valor que no es la fecha actual de la computadora

INSERT medicamentos(nombre_medicamento, fecha_vencimiento, marca)
VALUES("Suero", "2025-09-21", "a");

INSERT medicamentos(nombre_medicamento, fecha_vencimiento, marca)
VALUES("Suero", "2025-09-21", "a");

INSERT medicamentos(nombre_medicamento, fecha_vencimiento, marca)
VALUES("Suero", "2025-09-21", "a");

DELETE FROM medicamentos
WHERE id = 6;

-- 	Viendo los datos insertados
SELECT * FROM medicamentos;

-- Actualizar por id
UPDATE medicamentos
SET nombre_medicamento = "Vaselina", fecha_vencimiento = current_date()
WHERE id = 1;

-- Viendo las actualizaciones en la fila 1
SELECT * FROM medicamentos;

-- Eliminar la fila con el id 1
DELETE FROM medicamentos
WHERE id = 1;

-- Viendo que se eliminó la fila 1
SELECT * FROM medicamentos;

-- Borrar los datos de la tabla medicamentos
DELETE FROM medicamentos;

-- Eliminar por completo la tabla medicamentos
DROP TABLE medicamentos;

/*

Consultas avanzadas básicas

*/

-- Ver mis tablas

SELECT * FROM farmacias;
SELECT * FROM medicamentos;

-- Mostrar la cantidad de datos que contiene la tabla farmacias por su id
SELECT COUNT(*) AS id FROM farmacias;

-- Obtener la fecha más reciente de la tabla medicamentos
SELECT MAX(fecha_creacion) 
AS fecha_vencimiento 
FROM medicamentos;

-- MOSTRAR DATOS DE AMBAS TABLAS CON ALIAS
SELECT f.nombre, f.direccion, m.nombre_medicamento, m.fecha_creacion, m.fecha_vencimiento
FROM farmacias f, medicamentos m;

-- Se puede hacer un JOIN por que los id son idénticos en ambas bases de datos son tipo int
-- Agrupar por los id, muestra los valores de los id coincidentes
SELECT f.nombre, m.nombre_medicamento
FROM farmacias f
JOIN medicamentos m ON  f.id = m.id;

-- Se puede hacer un JOIN por que los id son idénticos en ambas bases de datos son tipo int
-- Otra forma de hacer un JOIN o union como el de arriba
SELECT nombre, nombre_medicamento
FROM farmacias
JOIN medicamentos ON farmacias.id = medicamentos.id;

-- Se puede hacer un JOIN por que los id son idénticos en ambas bases de datos son tipo int
-- Otra forma de hacer el join o union de arriba
SELECT nombre, nombre_medicamento
FROM medicamentos
JOIN farmacias ON medicamentos.id = farmacias.id;

-- Agregar 2 columnas con ALTER TABLE
ALTER TABLE farmacias ADD sucursal VARCHAR(30);
ALTER TABLE farmacias ADD calle VARCHAR(30);

SELECT * FROM farmacias;

-- Modificar el tipo de columna
ALTER TABLE farmacias modify sucursal int;

SELECT * from farmacias;

-- VER TIPO DE VARIABLE DE TODA LA COLUMNA CON DESCRIBE
DESCRIBE farmacias;

-- Eliminar una columna
ALTER TABLE farmacias DROP COLUMN sucursal;

SELECT * FROM farmacias;

ALTER TABLE farmacias DROP COLUMN calle;

SELECT * FROM farmacias;

-- Crear ususario
CREATE USER 'daniel'@'localhost' IDENTIFIED BY '12345';

-- Asignar permisos
GRANT ALL PRIVILEGES ON base_datos.* TO 'daniel'@'localhost';

-- Crear un índice, NO FUNCIONA ESTO
-- CREATE INDEX idx_nombre ON usuarios (nombre(20));

-- Optimizar una tabla
OPTIMIZE TABLE usuarios;

CREATE TABLE factura(
id int auto_increment not null primary key,
sub_total int not null,
fecha_venta date,

id2 int,
CONSTRAINT fk_factura FOREIGN KEY (id2) REFERENCES medicamentos(id)

);

INSERT INTO factura(sub_total, fecha_venta)
VALUES(5, '2010-01-25');

INSERT INTO factura(sub_total, fecha_venta)
VALUES(10,'2011-05-15');

INSERT INTO factura(sub_total, fecha_venta)
VALUES(5,'2011-02-21');

INSERT INTO factura(sub_total, fecha_venta)
VALUES(10,'2011-03-21');

INSERT INTO factura(sub_total, fecha_venta)
VALUES(15,'2010-03-21');

-- RENAME: Renombrar una tabla
RENAME TABLE factura TO facturas;

DROP TABLE factura;

/*

HACER IMPRESIONES

*/

SELECT * FROM farmacias;
SELECT * FROM medicamentos;
SELECT * FROM facturas;
/*
Mostrando sólo las fechas del 2011 de la tabla factura
*/

SELECT nombre_medicamento, fecha_venta, sub_total
FROM facturas, medicamentos
WHERE YEAR(fecha_venta) = 2011;

SELECT nombre_medicamento,
SUM(sub_total) AS total_venta
FROM facturas, medicamentos
WHERE YEAR(fecha_venta) = 2011
GROUP BY nombre_medicamento
ORDER BY total_venta DESC;

-- Solución 
-- Mostrar el ranking de mayor a menor de los medicamentos más vendidos en 2011 top 2

SELECT nombre_medicamento,
SUM(sub_total) AS total_venta
FROM facturas, medicamentos
WHERE YEAR(fecha_venta) = 2011
GROUP BY nombre_medicamento, sub_total
ORDER BY total_venta desc
LIMIT 3;

-- Puedo multiplicar otra variable en la operación suma, ejemplo unidades * sub_total
SELECT nombre_medicamento,
SUM(sub_total + sub_total) AS total_venta
FROM facturas, medicamentos
WHERE YEAR(fecha_venta) = 2011
GROUP BY nombre_medicamento, sub_total
ORDER BY total_venta desc
LIMIT 3;

-- En este caso el having sólo muestra los valores de total_venta mayores a 41 nada más
SELECT nombre_medicamento,
SUM(sub_total) AS total_venta
FROM facturas, medicamentos
GROUP BY nombre_medicamento, sub_total
HAVING total_venta > 40
ORDER BY total_venta desc;

-- Ver todos los nombres de las tablas 
show tables;

-- SHOW: Mostrar todas las bases de datos
SHOW DATABASES;

-- TRUNCATE: Eliminar todos los registros pero conservar la tabla
TRUNCATE TABLE farmacias;

-- DISTINCT: Eliminar duplicados
SELECT DISTINCT nombre_medicamento FROM medicamentos;

SELECT * FROM medicamentos;

DROP TABLE ejemplo;

-- Ponerle un valor por defecto a un atributo al insertarlo
create table ejemplo(
id int auto_increment primary key not null,
nombre varchar(20) not null,
precio int
/*
valor int DEFAULT 504
*/
);

-- CHECK: Restringir valores
ALTER TABLE ejemplo ADD CONSTRAINT check_precio CHECK (precio > 0);

-- DEFAULT: Asignar valor por defecto
ALTER TABLE ejemplo MODIFY COLUMN precio INT DEFAULT 10;

-- UNIQUE: Asegurar valores únicos, la variable nombre no se puede repetir
ALTER TABLE ejemplo ADD CONSTRAINT unique_nombre UNIQUE (nombre);

-- NOT NULL: Evitar valores nulos y cambiando el tipo de dato
SELECT * FROM ejemplo;
-- Usar DECIMAL o NUMERIC para dinero, tasas o porcentajes
-- Usar float o double para cálculos aproximados o valores científicos(grandes o pequeños)
ALTER TABLE ejemplo MODIFY COLUMN precio DECIMAL NOT NULL;

desc ejemplo;
select * from ejemplo;

INSERT INTO ejemplo(nombre)
VALUES("ejemplo 1");

INSERT INTO ejemplo(nombre)
VALUES("ejemplo 2");

INSERT INTO ejemplo(nombre)
VALUES("ejemplo 3");

-- DESDE ESTE MOMENTO PUEDO RETORNAR A UN COMMIT ATRAS, SOLO DE ESA INSERCION 3
START TRANSACTION;

-- actualizar el valor de 504 en ejemplo 2
update ejemplo 
SET precio = 501 
where nombre = "ejemplo 1";

SELECT * FROM ejemplo;

rollback;

SELECT * FROM ejemplo;

-- Fin del primer rollback

start transaction;

-- actualizar el nombre de todas las filas, cuando el valor valga 505
update ejemplo 
SET precio = 501 
where nombre = "ejemplo 3";

SELECT * FROM ejemplo;

ROLLBACK;

SELECT * FROM ejemplo;

-- fin del segundo rollback

-- Eliminar todos los registros por filas de los nombres que se llamen ejemplo 2
DELETE FROM ejemplo 
WHERE nombre = "ejemplo 2";

select * from ejemplo;

-- elimina los registros pero no los indices y puedo recuperar la información borrada usando triggers
DELETE FROM ejemplo;

-- elimina los registros de la tabla y no puedo recuperar la información usando triggers
TRUNCATE TABLE ejemplo;

-- DISTINCT: Eliminar duplicados de medicamentos y obtener el listado sin duplicados
select * from medicamentos;
SELECT DISTINCT nombre_medicamento from medicamentos;

/*

Tipos de unión

*/

SELECT * FROM farmacias;
SELECT * FROM medicamentos;
SELECT * FROM facturas;
SELECT * FROM ejemplo;

-- INNER JOIN: Mostrar datos que coincidan en ambas tablas
SELECT medicamentos.nombre_medicamento, medicamentos.marca, facturas.sub_total, facturas.fecha_venta 
FROM medicamentos
INNER JOIN facturas ON medicamentos.id = facturas.id;

-- LEFT JOIN: Mostrar todos los medicamentos y los facturas que existan
-- Muestra los resultados de izquierda a derecha, tal y como están en la consulta SQL
SELECT medicamentos.nombre_medicamento, medicamentos.marca, facturas.sub_total, facturas.fecha_venta 
FROM medicamentos
LEFT JOIN facturas ON medicamentos.id = facturas.id;

-- RIGHT JOIN: Mostrar todas las facturas y los medicamentos que existan
SELECT medicamentos.nombre_medicamento, medicamentos.marca, facturas.sub_total, facturas.fecha_venta 
FROM medicamentos
RIGHT JOIN facturas ON medicamentos.id = facturas.id;

-- CROSS JOIN: Producto cartesiano, pone 4 veces la misma información de las columnas
SELECT medicamentos.nombre_medicamento, medicamentos.marca AS facturas
FROM medicamentos
CROSS JOIN facturas;

/*

Funciones y cálculos

*/

-- AS: Dar alias a una columna
SELECT * FROM medicamentos;
SELECT nombre_medicamento AS nomb_med, fecha_creacion AS fc FROM medicamentos;

-- COUNT: Contar registros
SELECT * FROM facturas;
SELECT COUNT(*) AS total_facturas FROM facturas;

-- SUM: Sumar valores de una columna
SELECT * FROM facturas;
SELECT SUM(sub_total) AS Total_Sub_Factura FROM facturas;

-- AVG: Promedio
SELECT * FROM facturas;
SELECT AVG(sub_total) AS Sub_Total_Promedio FROM facturas;

-- MIN: Valor mínimo
SELECT * FROM facturas;
SELECT MIN(sub_total) AS Sub_Total_Mínimo FROM facturas;

-- MAX: Valor máximo
SELECT MAX(sub_total) AS Sub_Total_Máximo FROM facturas;
























-- Ponerle un valor por defecto a un atributo al insertarlo
create table ejemplo2(
id int auto_increment primary key not null,
nombre2 varchar(20) not null,
precio int
/*
valor int DEFAULT 504
*/
);

INSERT INTO ejemplo2(nombre2)
VALUES("ejemplo 4");

INSERT INTO ejemplo2(nombre2)
VALUES("ejemplo 5");

INSERT INTO ejemplo2(nombre2)
VALUES("ejemplo 6");

select * from ejemplo2;


/*

*/

-- Ponerle un valor por defecto a un atributo al insertarlo
create table ejemplo3(
id int auto_increment primary key not null,
nombre3 varchar(20) not null,
precio int
/*
valor int DEFAULT 504
*/
);

INSERT INTO ejemplo3(nombre3)
VALUES("ejemplo 7");

INSERT INTO ejemplo3(nombre3)
VALUES("ejemplo 8");

INSERT INTO ejemplo3(nombre3)
VALUES("ejemplo 9");

select * from ejemplo3;


-- Ponerle un valor por defecto a un atributo al insertarlo
create table ejemplo4(
id int auto_increment primary key not null,
nombre4 varchar(20) not null,
precio int
/*
valor int DEFAULT 504
*/
);

INSERT INTO ejemplo4(nombre4)
VALUES("ejemplo 7");

INSERT INTO ejemplo4(nombre4)
VALUES("ejemplo 8");

INSERT INTO ejemplo4(nombre4)
VALUES("ejemplo 9");

select * from ejemplo4;

/*
Unir 4 tablas sin llaves foraneas por id ni llaves primarias

*/


select nombre, nombre2, nombre3, nombre4
from ejemplo, ejemplo2, ejemplo3, ejemplo4;

/*

	TRANSACCIONES

*/

SELECT * FROM medicamentos;

-- START TRANSACTION: Iniciar una transacción
-- Cuando hago una transacción puedo recuperar o guardar las inserciones realizadas
start transaction;

INSERT INTO medicamentos (nombre_medicamento, fecha_vencimiento, marca) VALUES ('Ibuprofeno', '2025-05-21', "a");

rollback; -- Revierte el cambio

SELECT * FROM medicamentos;

-- COMMIT: Guardar los cambios realizados
-- Cuando hago una transacción puedo recuperar o guardar las inserciones realizadas
start transaction;

INSERT INTO medicamentos (nombre_medicamento, fecha_vencimiento, marca) VALUES ('Ibuprofeno', '2025-05-21', "a");

-- El commit sirve para guardar lo anterior
commit;

SELECT * FROM medicamentos;

-- SAVEPOINT: Crear un punto de guardado
start transaction;

savepoint punto1;

update medicamentos set marca = "a" where nombre_medicamento = "Ibuprofeno";

ROLLBACK TO punto1;

commit;

-- Comprobar aparte en otra consulta, que no se realizaron los cambios

SELECT * FROM medicamentos;

-- RELEASE SAVEPOINT: Eliminar un punto de guardado
start transaction;

savepoint punto1;

RELEASE SAVEPOINT punto1;

/*

	Administración
    
*/

-- GRANT: Otorgar permisos
GRANT SELECT, INSERT ON farmacias.* TO 'daniel'@'localhost';

-- REVOKE: Revocar permisos
REVOKE INSERT ON farmacias.* FROM 'daniel'@'localhost';

-- EXPLAIN: Mostrar cómo se ejecutará una consulta
EXPLAIN SELECT * FROM farmacias WHERE nombre = "Farmacias kielsa";