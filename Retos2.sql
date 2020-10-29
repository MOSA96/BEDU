USE tienda;
SHOW tables;
DESCRIBE venta;

# RETO 1
SELECT * FROM articulo WHERE nombre LIKE '%pasta%' ;
SELECT * FROM articulo WHERE nombre LIKE '%cannelloni%';
SELECT * FROM articulo WHERE nombre LIKE '%-%';
SELECT * FROM puesto WHERE nombre LIKE '%designer%';
SELECT * FROM puesto WHERE nombre LIKE '%developer%';

# RETO 2

SELECT avg(salario) FROM puesto;
SELECT count(*) FROM articulo WHERE nombre LIKE '%pasta%' ;
SELECT min(salario), max(salario) FROM puesto;
SELECT count(*);
SELECT sum(salario) FROM (SELECT salario FROM puesto ORDER BY id_puesto ASC LIMIT 5 ) AS salario5;

# RETO 3

SELECT nombre, count(*) AS registro FROM puesto GROUP BY nombre;
SELECT nombre, sum(salario) as salario FROM puesto GROUP BY nombre;
SELECT id_empleado, count(*) AS ventas FROM venta GROUP BY id_empleado;
SELECT id_articulo, count(*) AS ventas FROM venta GROUP BY id_articulo;




