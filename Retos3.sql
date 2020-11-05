USE tienda;
SHOW TABLES;
DESCRIBE venta;

#Reto 1

SELECT nombre FROM empleado
WHERE id_empleado IN
(SELECT id_puesto FROM puesto
WHERE salario < 10000); 


SELECT id_empleado, min(ventas), max(ventas)
FROM
(SELECT clave, id_empleado, count(*) AS ventas
FROM venta
GROUP BY clave, id_empleado) AS sq
GROUP BY id_empleado;	customers


SELECT clave, id_articulo FROM venta
WHERE id_articulo IN 
(SELECT id_articulo FROM articulo
WHERE precio > 5000);


#RETO 2

SHOW KEYS FROM venta;
SHOW KEYS FROM empleado;

SELECT clave, nombre FROM venta AS i 
JOIN empleado AS d ON i.id_empleado = d.id_empleado ORDER BY clave;
 
SELECT clave, nombre FROM venta AS i 
JOIN articulo AS d ON i.id_articulo = d.id_articulo ORDER BY clave;

SELECT clave, round(sum(precio)) AS total_venta FROM venta AS i
JOIN articulo AS d ON i.id_articulo = d.id_articulo GROUP BY clave;

#RETO 3

CREATE VIEW puestos AS SELECT concat(e.nombre, ' ', e.apellido_paterno), p.nombre
FROM empleado e JOIN puesto p ON e.id_puesto = p.id_puesto;

CREATE VIEW empleado_articulo AS SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) nombre, a.nombre articulo
FROM venta v
JOIN empleado e ON v.id_empleado = e.id_empleado
JOIN articulo a ON v.id_articulo = a.id_articulo
ORDER BY v.clave;

CREATE VIEW puesto_ventas AS SELECT p.nombre, count(v.clave) total
FROM venta v
JOIN empleado e ON v.id_empleado = e.id_empleado
JOIN puesto p ON e.id_puesto = p.id_puesto
GROUP BY p.nombre;