/*1. Lista el nombre de todos los productos que hay en la tabla producto.*/

SELECT tienda.producto.nombre FROM tienda.producto;

SELECT * FROM tienda.producto, tienda.fabricante
WHERE tienda.producto.codigo_fabricante=tienda.fabricante.codigo;

/*2. Lista los nombres y los precios de todos los productos de la tabla producto.*/

SELECT tienda.producto.nombre, tienda.producto.precio FROM tienda.producto;

/*3. Lista todas las columnas de la tabla producto.*/

SELECT * FROM tienda.producto;

/*4. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando 
el valor del precio.*/

SELECT tienda.producto.nombre, ROUND(tienda.producto.precio) FROM tienda.producto;

/*5. Lista el código de los fabricantes que tienen productos en la tabla producto.*/

SELECT DISTINCT tienda.fabricante.codigo FROM tienda.fabricante
INNER JOIN tienda.producto ON tienda.fabricante.codigo = tienda.producto.codigo_fabricante;

/*6. Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar 
los repetidos.*/

SELECT DISTINCT tienda.fabricante.codigo
FROM tienda.fabricante
INNER JOIN tienda.producto ON tienda.fabricante.codigo = tienda.producto.codigo_fabricante;

/*7. Lista los nombres de los fabricantes ordenados de forma ascendente.*/

SELECT tienda.fabricante.nombre
FROM tienda.fabricante
GROUP BY tienda.fabricante.nombre
ORDER BY tienda.fabricante.nombre ASC;

/*8. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma 
ascendente y en segundo lugar por el precio de forma descendente.*/

SELECT tienda.producto.nombre, tienda.producto.precio
FROM tienda.producto, tienda.fabricante
WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo
ORDER BY tienda.producto.nombre, tienda.producto.precio;

/*9. Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/

SELECT * FROM tienda.fabricante LIMIT 5;

/*10. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas 
ORDER BY y LIMIT)*/

SELECT tienda.producto.nombre, tienda.producto.precio 
FROM tienda.producto 
ORDER BY tienda.producto.precio  ASC LIMIT 1;

/*11. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER 
BY y LIMIT)*/

SELECT tienda.producto.nombre, tienda.producto.precio 
FROM tienda.producto 
ORDER BY tienda.producto.precio DESC LIMIT 1;

/*12. Lista el nombre de los productos que tienen un precio menor o igual a $120.*/

SELECT * FROM tienda.producto
WHERE tienda.producto.precio<=120;

/*13. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador 
BETWEEN.*/

SELECT * FROM tienda.producto
WHERE tienda.producto.precio BETWEEN 60 AND 120;

/*14. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador 
IN.*/

SELECT * FROM tienda.producto
WHERE tienda.producto.codigo_fabricante IN (1,3,5);

/*15. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil 
en el nombre.*/

SELECT * FROM tienda.producto
WHERE tienda.producto.nombre LIKE '%Portátil%';

					-- Consultas Multitabla --
/*1. Devuelve una lista con el código del producto, nombre del producto, código del fabricante 
y nombre del fabricante, de todos los productos de la base de datos.*/

SELECT tienda.producto.codigo, tienda.producto.nombre, tienda.fabricante.nombre
FROM tienda.producto
INNER JOIN tienda.fabricante ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo;

/*2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos 
los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por 
orden alfabético.*/

SELECT tienda.producto.nombre, tienda.producto.precio, tienda.fabricante.nombre
FROM tienda.producto
LEFT JOIN tienda.fabricante ON tienda.producto.codigo_fabricante = tienda.producto.codigo_fabricante
WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo
ORDER BY tienda.fabricante.nombre ASC;

/*3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto 
más barato. */

SELECT tienda.producto.nombre, tienda.producto.precio, tienda.fabricante.nombre
FROM tienda.producto
JOIN tienda.fabricante
ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
WHERE tienda.producto.precio = (SELECT MIN(precio) FROM tienda.producto);


SELECT tienda.producto.nombre, tienda.producto.precio, tienda.fabricante.nombre
FROM tienda.producto, tienda.fabricante
WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo
ORDER BY tienda.producto.precio ASC
LIMIT 1;



/*4. Devuelve una lista de todos los productos del fabricante Lenovo.*/

SELECT * FROM tienda.producto, tienda.fabricante
WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante
	AND tienda.fabricante.nombre LIKE 'Lenovo';
    
/*5. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio 
mayor que $200.*/

SELECT * FROM tienda.producto, tienda.fabricante
WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante
	AND tienda.fabricante.nombre LIKE 'Crucial'
    AND tienda.producto.precio>200;

/*6. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard. 
Utilizando el operador IN.*/

SELECT * FROM tienda.producto, tienda.fabricante
WHERE tienda.fabricante.codigo = tienda.producto.codigo_fabricante
	AND tienda.fabricante.nombre IN ('Asus', 'Hewlett-Packard');

/*7. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos 
los productos que tengan un precio mayor o igual a $180. Ordene el resultado en primer 
lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden 
ascendente)*/

SELECT tienda.producto.nombre, tienda.producto.precio, tienda.producto.codigo_fabricante
FROM tienda.producto
JOIN tienda.fabricante ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
WHERE tienda.producto.precio>180
ORDER BY tienda.producto.precio DESC, tienda.producto.nombre ASC;

				-- Consultas Multitabla --
				-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.--
/*1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los 
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos 
fabricantes que no tienen productos asociados.*/

SELECT tienda.fabricante.nombre FROM tienda.fabricante
LEFT JOIN tienda.producto ON tienda.fabricante.codigo = tienda.producto.codigo_fabricante
GROUP BY tienda.fabricante.nombre
ORDER BY tienda.fabricante.nombre ASC;

/*2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún 
producto asociado.*/

SELECT *
FROM tienda.fabricante
WHERE codigo NOT IN (SELECT codigo_fabricante FROM tienda.producto);


				-- Subconsultas (En la cláusula WHERE)--
				-- Con operadores básicos de comparación--
/*1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).*/

SELECT *  FROM tienda.producto, tienda.fabricante
WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo
AND tienda.fabricante.nombre='Lenovo';


/*2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto 
más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).*/

SELECT *  FROM tienda.producto, tienda.fabricante
WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo
AND tienda.producto.precio=(SELECT max(tienda.producto.precio) FROM tienda.producto, tienda.fabricante
							WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo
                            AND tienda.fabricante.nombre='Lenovo');

/*3. Lista el nombre del producto más caro del fabricante Lenovo.*/

SELECT tienda.producto.nombre FROM tienda.producto, tienda.fabricante
WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo
AND tienda.fabricante.nombre='Lenovo'
AND tienda.producto.precio=(SELECT max(tienda.producto.precio) FROM tienda.producto, tienda.fabricante
							WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo
                            AND tienda.fabricante.nombre='Lenovo');

/*4. Lista todos los productos del fabricante Asus que tienen un precio superior al precio 
medio de todos sus productos.*/

SELECT * FROM tienda.producto, tienda.fabricante
WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo
AND tienda.fabricante.nombre='Asus'
AND tienda.producto.precio>(SELECT avg(tienda.producto.precio) FROM tienda.producto);


				-- Subconsultas con IN y NOT IN--
/*1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o 
NOT IN).*/

SELECT tienda.fabricante.nombre FROM tienda.fabricante, tienda.producto
WHERE tienda.fabricante.codigo IN(tienda.producto.codigo_fabricante)
GROUP BY tienda.fabricante.nombre;

/*2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando 
IN o NOT IN).*/

SELECT tienda.fabricante.nombre FROM tienda.fabricante
WHERE tienda.fabricante.codigo NOT IN (SELECT tienda.producto.codigo_fabricante FROM tienda.producto);

				-- Subconsultas (En la cláusula HAVING)--
/*1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número 
de productos que el fabricante Lenovo*/

SELECT tienda.fabricante.nombre
FROM tienda.fabricante
INNER JOIN tienda.producto ON tienda.fabricante.codigo = tienda.producto.codigo_fabricante
WHERE tienda.fabricante.codigo <> (SELECT codigo FROM tienda.fabricante WHERE nombre = 'Lenovo')
GROUP BY tienda.fabricante.nombre
HAVING COUNT(tienda.producto.codigo) = (SELECT COUNT(*) FROM tienda.producto 
						WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre = 'Lenovo'));
