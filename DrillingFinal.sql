--01• Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.

--• Crear custumer
INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES (600, 1, 'John', 'Doe', 'johndoe@example.com', 5, true, current_timestamp, current_timestamp, 1);

--• Modificar custumer
UPDATE customer SET last_name = 'doe2' WHERE customer_id = 600;

--• Eliminar custumer
DELETE FROM customer WHERE customer_id = 600;

--• Crear staff
INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture)
VALUES (3, 'John', 'Doe', 4, 'johndoe@example.com', 1, True, 'johndoe', 'password123', current_timestamp, 'profile.jpg');

--• Modificar staff
UPDATE staff SET first_name = 'john2' WHERE staff_id = 3;

--• Eliminar staff
DELETE FROM staff WHERE staff_id = 3;

--• Crear actor
INSERT INTO actor (actor_id, first_name, last_name, last_update)
VALUES (201, 'John', 'Doe', current_timestamp);

--• Modificar actor
UPDATE actor SET first_name = 'john3' WHERE actor_id = 201;

--• Eliminar actor
DELETE FROM actor WHERE actor_id = 201;

--02• Listar todas las “rental” con los datos del “customer” dado un año y mes.
SELECT rental.rental_id, rental.rental_date, rental.return_date, customer.customer_id, customer.first_name, customer.last_name
FROM rental
INNER JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(YEAR FROM rental.rental_date) = 2005 
AND EXTRACT(MONTH FROM rental.rental_date) = 5;

--03• Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.
SELECT payment_id, payment_date, amount FROM payment;

--04• Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.
SELECT * FROM film WHERE release_year = 2006 AND rental_rate > 4.0;

--•5. Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, 
--    si éstas pueden ser nulas, y su tipo de dato correspondiente.
SELECT
 t1.TABLE_NAME AS tabla_nombre,
 t1.COLUMN_NAME AS columna_nombre,
 t1.COLUMN_DEFAULT AS columna_defecto,
 t1.IS_NULLABLE AS columna_nulo,
 t1.DATA_TYPE AS columna_tipo_dato,
 COALESCE(t1.NUMERIC_PRECISION,
 t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
 PG_CATALOG.COL_DESCRIPTION(t2.OID,
 t1.DTD_IDENTIFIER::int) AS columna_descripcion,
 t1.DOMAIN_NAME AS columna_dominio
FROM
 INFORMATION_SCHEMA.COLUMNS t1
 INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
 t1.TABLE_SCHEMA = 'public'
ORDER BY
 t1.TABLE_NAME;