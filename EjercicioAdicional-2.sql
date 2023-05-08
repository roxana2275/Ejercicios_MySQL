/*1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.*/

SELECT jardineria.oficina.codigo_oficina, jardineria.oficina.ciudad FROM jardineria.oficina
WHERE jardineria.oficina.ciudad IS NOT NULL;

/*2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.*/

SELECT jardineria.oficina.ciudad, jardineria.oficina.telefono FROM jardineria.oficina
WHERE jardineria.oficina.pais LIKE'Espa%a';

/*3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un 
código de jefe igual a 7*/

SELECT jardineria.empleado.nombre, jardineria.empleado.apellido1, jardineria.empleado.apellido2,
jardineria.empleado.email FROM jardineria.empleado
WHERE jardineria.empleado.codigo_jefe IN (7);

/*4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.*/

SELECT jardineria.empleado.puesto, jardineria.empleado.nombre, jardineria.empleado.apellido1, jardineria.empleado.apellido2,
jardineria.empleado.email FROM jardineria.empleado
WHERE jardineria.empleado.puesto LIKE 'DIrector General';

/*5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean 
representantes de ventas.*/

SELECT jardineria.empleado.nombre, jardineria.empleado.apellido1, jardineria.empleado.apellido2, 
jardineria.empleado.puesto 
FROM jardineria.empleado
WHERE jardineria.empleado.puesto NOT LIKE 'representante%ventas';

/*6. Devuelve un listado con el nombre de los todos los clientes españoles.*/

SELECT * FROM jardineria.cliente
WHERE jardineria.cliente.pais = 'Spain';

/*7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.*/

SELECT jardineria.pedido.estado FROM jardineria.pedido
GROUP BY jardineria.pedido.estado;

/*8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago 
en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan 
repetidos. Resuelva la consulta:
o Utilizando la función YEAR de MySQL.
o Utilizando la función DATE_FORMAT de MySQL.
o Sin utilizar ninguna de las funciones anteriores.*/

SELECT * FROM jardineria.pago
WHERE YEAR(jardineria.pago.fecha_pago)=2008;

SELECT * FROM jardineria.pago
WHERE DATE_FORMAT(jardineria.pago.fecha_pago, "%Y")=2008;

SELECT * FROM jardineria.pago
WHERE jardineria.pago.fecha_pago >='2008-01-01' AND jardineria.pago.fecha_pago <'2009-01-01';

/*9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de 
entrega de los pedidos que no han sido entregados a tiempo.*/

SELECT jardineria.pedido.codigo_pedido, jardineria.pedido.codigo_cliente,
jardineria.pedido.fecha_esperada, jardineria.pedido.fecha_entrega FROM jardineria.pedido
WHERE jardineria.pedido.fecha_esperada<jardineria.pedido.fecha_entrega;

/*10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de 
entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha 
esperada.
o Utilizando la función ADDDATE de MySQL.
o Utilizando la función DATEDIFF de MySQL.*/

SELECT jardineria.pedido.codigo_pedido, jardineria.pedido.codigo_cliente,
jardineria.pedido.fecha_esperada, jardineria.pedido.fecha_entrega FROM jardineria.pedido
WHERE jardineria.pedido.fecha_esperada>= ADDDATE(jardineria.pedido.fecha_entrega, INTERVAL 2 DAY);

SELECT jardineria.pedido.codigo_pedido, jardineria.pedido.codigo_cliente,
jardineria.pedido.fecha_esperada, jardineria.pedido.fecha_entrega FROM jardineria.pedido
WHERE DATEDIFF(jardineria.pedido.fecha_esperada, jardineria.pedido.fecha_entrega)>=2;

/*11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.*/

SELECT * FROM jardineria.pedido
WHERE jardineria.pedido.estado = 'Rechazado'
AND YEAR(jardineria.pedido.fecha_pedido)=2009;

/*12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de 
cualquier año.*/

SELECT * FROM jardineria.pedido
WHERE jardineria.pedido.estado = 'Entregado'
AND DATE_FORMAT(jardineria.pedido.fecha_pedido,"%c")=01;

/*13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. 
Ordene el resultado de mayor a menor.*/

SELECT * FROM jardineria.pago
WHERE jardineria.pago.forma_pago = 'PayPal'
AND YEAR(jardineria.pago.fecha_pago)=2009;

/*14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en 
cuenta que no deben aparecer formas de pago repetidas.*/

SELECT jardineria.pago.forma_pago FROM jardineria.pago
GROUP BY jardineria.pago.forma_pago;

/*15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que 
tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de 
venta, mostrando en primer lugar los de mayor precio.*/

SELECT * FROM jardineria.producto
WHERE jardineria.producto.gama = 'Ornamentales'
AND jardineria.producto.cantidad_en_stock>100
ORDER BY jardineria.producto.precio_venta DESC;

/*16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo 
representante de ventas tenga el código de empleado 11 o 30.*/

SELECT * FROM jardineria.cliente
WHERE jardineria.cliente.ciudad = 'Madrid'
AND jardineria.cliente.codigo_empleado_rep_ventas IN (11,30);

				/*Consultas multitabla (Composición interna)
				Las consultas se deben resolver con INNER JOIN.*/
            
/*1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante 
de ventas.*/

SELECT c1.nombre_cliente, c2.nombre_cliente AS Representante
FROM jardineria.cliente c2
INNER JOIN jardineria.cliente c1
ON c1.codigo_empleado_rep_ventas = c2.codigo_cliente;

/*2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus 
representantes de ventas.*/

SELECT c1.nombre_cliente, c2.nombre_cliente AS Representante
FROM jardineria.cliente c1
INNER JOIN jardineria.cliente c2
ON c1.codigo_empleado_rep_ventas = c2.codigo_cliente;

/*3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de 
sus representantes de ventas.*/

SELECT c1.nombre_cliente, c2.nombre_cliente AS Representante
FROM jardineria.cliente c1
INNER JOIN jardineria.cliente c2 ON c1.codigo_empleado_rep_ventas = c2.codigo_cliente
LEFT JOIN jardineria.pago ON c1.codigo_cliente = jardineria.pago.codigo_cliente
WHERE jardineria.pago.codigo_cliente IS NULL ;

/*4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes 
junto con la ciudad de la oficina a la que pertenece el representante.*/

SELECT c1.nombre_cliente, c2.nombre_cliente AS Representante, c2.ciudad
FROM jardineria.cliente c1
INNER JOIN jardineria.cliente c2 ON c1.codigo_empleado_rep_ventas = c2.codigo_cliente
LEFT JOIN jardineria.pago ON c1.codigo_cliente = jardineria.pago.codigo_cliente
WHERE jardineria.pago.codigo_cliente IS NOT NULL 
GROUP BY c1.nombre_cliente, Representante, c2.ciudad;

/*5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus 
representantes junto con la ciudad de la oficina a la que pertenece el representante.*/

SELECT c1.nombre_cliente, c2.nombre_cliente AS Representante, c2.ciudad
FROM jardineria.cliente c1
INNER JOIN jardineria.cliente c2 ON c1.codigo_empleado_rep_ventas = c2.codigo_cliente
LEFT JOIN jardineria.pago ON c1.codigo_cliente = jardineria.pago.codigo_cliente
WHERE jardineria.pago.codigo_cliente IS NULL
GROUP BY c1.nombre_cliente, Representante, c2.ciudad;

/*6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.*/

SELECT jardineria.oficina.ciudad, jardineria.oficina.pais, jardineria.oficina.region FROM jardineria.oficina
INNER JOIN jardineria.empleado ON jardineria.empleado.codigo_oficina = jardineria.oficina.codigo_oficina
INNER JOIN jardineria.cliente ON jardineria.empleado.codigo_empleado = jardineria.cliente.codigo_empleado_rep_ventas
WHERE jardineria.cliente.ciudad = 'Fuenlabrada'
GROUP BY jardineria.oficina.ciudad, jardineria.oficina.pais, jardineria.oficina.region;

/*7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad 
de la oficina a la que pertenece el representante.*/

SELECT c1.nombre_cliente, c2.nombre_cliente AS Representante, c2.ciudad
FROM jardineria.cliente c1
INNER JOIN jardineria.cliente c2 ON c1.codigo_empleado_rep_ventas = c2.codigo_cliente
GROUP BY c1.nombre_cliente, Representante, c2.ciudad;

/*8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.*/

SELECT CONCAT(e1.nombre,' ', e1.apellido1,' ', e1.apellido2) AS Empleado, 
CONCAT(e2.nombre,' ', e2.apellido1,' ', e2.apellido2) AS Representante
FROM jardineria.empleado e1
INNER JOIN jardineria.empleado e2 ON e1.codigo_empleado = e2.codigo_jefe
GROUP BY Empleado, Representante;

/*9. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.*/

SELECT jardineria.cliente.nombre_cliente FROM jardineria.cliente
INNER JOIN jardineria.pedido ON jardineria.pedido.codigo_cliente = jardineria.cliente.codigo_cliente
WHERE jardineria.pedido.fecha_esperada>=jardineria.pedido.fecha_entrega
GROUP BY jardineria.cliente.nombre_cliente;

/*10. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.*/

SELECT jardineria.cliente.nombre_cliente, jardineria.producto.gama FROM jardineria.cliente
INNER JOIN jardineria.pedido ON jardineria.pedido.codigo_cliente = jardineria.cliente.codigo_cliente
INNER JOIN jardineria.detalle_pedido ON jardineria.pedido.codigo_pedido = jardineria.detalle_pedido.codigo_pedido
INNER JOIN jardineria.producto ON jardineria.producto.codigo_producto = jardineria.detalle_pedido.codigo_producto
GROUP BY jardineria.cliente.nombre_cliente, jardineria.producto.gama;

			/*Consultas multitabla (Composición externa)
			Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, JOIN.*/
            
/*1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.*/

SELECT jardineria.cliente.nombre_cliente, jardineria.cliente.codigo_cliente FROM jardineria.cliente
LEFT JOIN jardineria.pago ON jardineria.pago.codigo_cliente = jardineria.cliente.codigo_cliente
WHERE jardineria.pago.forma_pago IS NULL;

/*2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún 
pedido.*/

SELECT jardineria.cliente.nombre_cliente,jardineria.cliente.codigo_cliente FROM jardineria.cliente
LEFT JOIN jardineria.pedido ON jardineria.pedido.codigo_cliente = jardineria.cliente.codigo_cliente
WHERE jardineria.pedido.codigo_cliente IS NULL;

/*3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que 
no han realizado ningún pedido.*/

SELECT jardineria.cliente.nombre_cliente, jardineria.cliente.codigo_cliente 
FROM jardineria.cliente 
LEFT JOIN jardineria.pago ON jardineria.pago.codigo_cliente = jardineria.cliente.codigo_cliente 
WHERE jardineria.pago.forma_pago IS NULL
AND jardineria.cliente.codigo_cliente IN (
    SELECT jardineria.pedido.codigo_cliente 
    FROM jardineria.pedido);

/*4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina 
asociada.*/

SELECT CONCAT(jardineria.empleado.nombre,' ', jardineria.empleado.apellido1,' ', jardineria.empleado.apellido2) AS Empledo
FROM jardineria.empleado
WHERE jardineria.empleado.codigo_empleado NOT IN 
		(SELECT jardineria.empleado.codigo_empleado FROM jardineria.empleado
		LEFT JOIN jardineria.oficina ON jardineria.empleado.codigo_oficina=jardineria.oficina.codigo_oficina);


/*5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente 
asociado.*/

SELECT jardineria.empleado.codigo_empleado FROM jardineria.empleado
WHERE jardineria.empleado.codigo_empleado NOT IN 
		(SELECT jardineria.empleado.codigo_empleado FROM jardineria.empleado
		LEFT JOIN jardineria.cliente ON jardineria.empleado.codigo_empleado=jardineria.cliente.codigo_empleado_rep_ventas);


/*6. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los 
que no tienen un cliente asociado.*/

SELECT CONCAT(jardineria.empleado.nombre,' ', jardineria.empleado.apellido1,' ', jardineria.empleado.apellido2) AS Empledo
FROM jardineria.empleado
WHERE jardineria.empleado.codigo_empleado NOT IN 
		(SELECT jardineria.empleado.codigo_empleado FROM jardineria.empleado
		LEFT JOIN jardineria.oficina ON jardineria.empleado.codigo_oficina=jardineria.oficina.codigo_oficina)
AND jardineria.empleado.codigo_empleado NOT IN 
		(SELECT jardineria.empleado.codigo_empleado FROM jardineria.empleado
		LEFT JOIN jardineria.cliente ON jardineria.empleado.codigo_empleado=jardineria.cliente.codigo_empleado_rep_ventas);

/*7. Devuelve un listado de los productos que nunca han aparecido en un pedido.*/

SELECT jardineria.producto.nombre
FROM jardineria.producto
WHERE jardineria.producto.codigo_producto NOT IN
		(SELECT jardineria.producto.codigo_producto FROM jardineria.producto
		 RIGHT JOIN jardineria.detalle_pedido ON jardineria.detalle_pedido.codigo_producto = jardineria.producto.codigo_producto);

/*8. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los 
representantes de ventas de algún cliente que haya realizado la compra de algún producto 
de la gama Frutales.*/

SELECT jardineria.oficina.codigo_oficina FROM jardineria.oficina
LEFT JOIN jardineria.empleado ON jardineria.oficina.codigo_oficina= jardineria.empleado.codigo_oficina
WHERE jardineria.empleado.codigo_oficina
NOT IN (
	SELECT jardineria.empleado.codigo_oficina 
	FROM jardineria.empleado
	WHERE jardineria.empleado.codigo_empleado 
	IN (
		SELECT jardineria.cliente.codigo_empleado_rep_ventas FROM jardineria.cliente
		WHERE jardineria.cliente.codigo_cliente
		IN (
			SELECT jardineria.pedido.codigo_cliente 
			FROM jardineria.pedido
			WHERE jardineria.pedido.codigo_pedido 
				IN (        
					SELECT jardineria.detalle_pedido.codigo_pedido 
					FROM jardineria.detalle_pedido
					WHERE jardineria.detalle_pedido.codigo_producto 
					IN (        
						SELECT jardineria.producto.codigo_producto 
						FROM jardineria.producto
						WHERE jardineria.producto.gama LIKE 'Frutales')))))
						GROUP BY jardineria.oficina.codigo_oficina
						ORDER BY jardineria.oficina.codigo_oficina;

SELECT jardineria.oficina.codigo_oficina FROM jardineria.oficina
RIGHT JOIN jardineria.empleado ON jardineria.oficina.codigo_oficina= jardineria.empleado.codigo_oficina
WHERE jardineria.empleado.codigo_oficina NOT IN
	(SELECT jardineria.empleado.codigo_oficina FROM jardineria.empleado
		INNER JOIN jardineria.cliente ON jardineria.empleado.codigo_empleado= jardineria.cliente.codigo_empleado_rep_ventas
        INNER JOIN jardineria.pedido ON jardineria.pedido.codigo_cliente = jardineria.cliente.codigo_cliente
        INNER JOIN jardineria.detalle_pedido ON jardineria.detalle_pedido.codigo_pedido= jardineria.pedido.codigo_pedido
        INNER JOIN jardineria.producto ON jardineria.producto.codigo_producto = jardineria.detalle_pedido.codigo_producto
        WHERE jardineria.producto.gama LIKE 'Frutales')
GROUP BY jardineria.oficina.codigo_oficina;
        
        
/*9. Devuelve un listado con los clientes que han realizado algún pedido, pero no han realizado 
ningún pago.*/

SELECT jardineria.cliente.nombre_cliente FROM jardineria.cliente
RIGHT JOIN jardineria.pedido ON jardineria.cliente.codigo_cliente= jardineria.pedido.codigo_cliente
WHERE jardineria.cliente.codigo_cliente
NOT IN (SELECT jardineria.pago.codigo_cliente FROM jardineria.pago)
GROUP BY jardineria.cliente.nombre_cliente;

/*10. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el 
nombre de su jefe asociado.*/

SELECT CONCAT(e1.nombre, ' ', e1.apellido1,' ', e1.apellido2) AS Empleado,
CONCAT(e2.nombre, ' ', e2.apellido1,' ', e2.apellido2) AS Jefe
FROM jardineria.empleado e1
INNER JOIN jardineria.empleado e2 ON e1.codigo_jefe=e2.codigo_empleado
WHERE e1.codigo_empleado IN(
			SELECT e1.codigo_empleado FROM jardineria.empleado
			INNER JOIN jardineria.cliente c1 ON e1.codigo_empleado= c1.codigo_empleado_rep_ventas)
GROUP BY Empleado,Jefe;


				/*Consultas resumen*/
/*1. ¿Cuántos empleados hay en la compañía?*/

SELECT COUNT(*) FROM jardineria.empleado;

/*2. ¿Cuántos clientes tiene cada país?*/

SELECT jardineria.cliente.pais, COUNT(jardineria.cliente.codigo_cliente) FROM jardineria.cliente
GROUP BY jardineria.cliente.pais;

/*3. ¿Cuál fue el pago medio en 2009?*/

SELECT AVG(jardineria.pago.total) FROM jardineria.pago
WHERE YEAR(jardineria.pago.fecha_pago)=2009;

/*4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el 
número de pedidos.*/

SELECT jardineria.pedido.estado, COUNT(jardineria.pedido.codigo_cliente) FROM jardineria.pedido
GROUP BY jardineria.pedido.estado;

/*5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.*/

SELECT MIN(jardineria.producto.precio_venta) AS Valor_Minimo, MAX(jardineria.producto.precio_venta) AS Valor_Maximo
FROM jardineria.producto;

/*6. Calcula el número de clientes que tiene la empresa.*/

SELECT COUNT(*) FROM jardineria.cliente;

/*7. ¿Cuántos clientes tiene la ciudad de Madrid?*/

SELECT COUNT(*) FROM jardineria.cliente
WHERE jardineria.cliente.ciudad = 'Madrid';

/*8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?*/

SELECT COUNT(*) FROM jardineria.cliente
WHERE jardineria.cliente.ciudad LIKE 'M%';

/*9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende 
cada uno*/

SELECT jardineria.empleado.nombre, jardineria.cliente.codigo_cliente FROM jardineria.empleado, jardineria.cliente
WHERE jardineria.empleado.puesto LIKE 'representant%venta%'
AND jardineria.cliente.codigo_cliente=jardineria.empleado.codigo_empleado;

/*10. Calcula el número de clientes que no tiene asignado representante de ventas.*/

SELECT COUNT(*) FROM jardineria.cliente
WHERE jardineria.cliente.codigo_empleado_rep_ventas IS NULL;

/*11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado 
deberá mostrar el nombre y los apellidos de cada cliente.*/

SELECT jardineria.cliente.nombre_cliente, MIN(jardineria.pago.fecha_pago) AS Menor,
MAX(jardineria.pago.fecha_pago) AS Mayor FROM jardineria.cliente
INNER JOIN jardineria.pago ON jardineria.cliente.codigo_cliente= jardineria.pago.codigo_cliente
GROUP BY jardineria.cliente.nombre_cliente;

/*12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.*/

SELECT jardineria.detalle_pedido.codigo_pedido, COUNT(jardineria.detalle_pedido.codigo_producto) AS Productos
FROM jardineria.detalle_pedido
GROUP BY jardineria.detalle_pedido.codigo_pedido;

/*13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de 
los pedidos.*/

SELECT jardineria.detalle_pedido.codigo_pedido, SUM(jardineria.detalle_pedido.cantidad) AS Cantidad
FROM jardineria.detalle_pedido
GROUP BY jardineria.detalle_pedido.codigo_pedido;

/*14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que 
se han vendido de cada uno. El listado deberá estar ordenado por el número total de 
unidades vendidas.*/

SELECT jardineria.producto.nombre, SUM(jardineria.detalle_pedido.cantidad) AS Total 
FROM jardineria.producto, jardineria.detalle_pedido
WHERE jardineria.detalle_pedido.codigo_producto= jardineria.producto.codigo_producto
GROUP BY jardineria.producto.nombre
ORDER BY Total desc
LIMIT 20;

/*15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el 
IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el 
número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base 
imponible, y el total la suma de los dos campos anteriores.*/

SELECT SUM((dp.cantidad*dp.precio_unidad)) AS BaseImponible,
SUM(((dp.cantidad*dp.precio_unidad)*0.21)) AS IVA, 
SUM(((dp.cantidad*dp.precio_unidad)+((dp.cantidad*dp.precio_unidad)*0.21))) AS Total
FROM jardineria.detalle_pedido dp;

/*16. La misma información que en la pregunta anterior, pero agrupada por código de producto.*/

SELECT dp.codigo_producto, dp.cantidad, dp.precio_unidad, (dp.cantidad*dp.precio_unidad) AS BaseImponible,
((dp.cantidad*dp.precio_unidad)*0.21) AS IVA, 
((dp.cantidad*dp.precio_unidad)+((dp.cantidad*dp.precio_unidad)*0.21)) AS Total
FROM jardineria.detalle_pedido dp
GROUP BY dp.codigo_producto, dp.cantidad, dp.precio_unidad;

/*17. La misma información que en la pregunta anterior, pero agrupada por código de producto 
filtrada por los códigos que empiecen por OR.*/

SELECT dp.codigo_producto, dp.cantidad, dp.precio_unidad, (dp.cantidad*dp.precio_unidad) AS BaseImponible,
((dp.cantidad*dp.precio_unidad)*0.21) AS IVA, 
((dp.cantidad*dp.precio_unidad)+((dp.cantidad*dp.precio_unidad)*0.21)) AS Total
FROM jardineria.detalle_pedido dp
WHERE dp.codigo_producto LIKE 'OR%'
GROUP BY dp.codigo_producto, dp.cantidad, dp.precio_unidad;

/*18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se 
mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% 
IVA)*/

SELECT dp.codigo_producto, dp.cantidad, dp.precio_unidad, (dp.cantidad*dp.precio_unidad) AS BaseImponible,
((dp.cantidad*dp.precio_unidad)*0.21) AS IVA, 
((dp.cantidad*dp.precio_unidad)+((dp.cantidad*dp.precio_unidad)*0.21)) AS Total
FROM jardineria.detalle_pedido dp
WHERE ((dp.cantidad*dp.precio_unidad)+((dp.cantidad*dp.precio_unidad)*0.21))>3000
GROUP BY dp.codigo_producto, dp.cantidad, dp.precio_unidad;


				/*Subconsultas con operadores básicos de comparación*/
                
/*1. Devuelve el nombre del cliente con mayor límite de crédito.*/

SELECT * FROM jardineria.cliente
ORDER BY jardineria.cliente.limite_credito DESC
LIMIT 1;

/*2. Devuelve el nombre del producto que tenga el precio de venta más caro.*/

SELECT jardineria.producto.nombre FROM jardineria.producto
ORDER BY jardineria.producto.precio_venta DESC
LIMIT 1;

/*3. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta 
que tendrá que calcular cuál es el número total de unidades que se han vendido de cada 
producto a partir de los datos de la tabla detalle_pedido. Una vez que sepa cuál es el código 
del producto, puede obtener su nombre fácilmente.)*/

SELECT jardineria.producto.nombre,jardineria.detalle_pedido.codigo_producto, SUM(jardineria.detalle_pedido.cantidad) AS Total 
FROM jardineria.detalle_pedido
INNER JOIN jardineria.producto ON jardineria.detalle_pedido.codigo_producto=jardineria.producto.codigo_producto
GROUP BY jardineria.detalle_pedido.codigo_producto,jardineria.producto.nombre
ORDER BY jardineria.detalle_pedido.codigo_producto DESC
LIMIT 1;

/*4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar 
INNER JOIN).*/

SELECT jardineria.cliente.nombre_cliente, jardineria.cliente.limite_credito, SUM(jardineria.pago.total) AS Pagos
FROM jardineria.cliente, jardineria.pago
WHERE jardineria.cliente.codigo_cliente=jardineria.pago.codigo_cliente
GROUP BY Jardineria.cliente.nombre_cliente, jardineria.cliente.limite_credito
HAVING jardineria.cliente.limite_credito>SUM(jardineria.pago.total)
ORDER BY jardineria.cliente.nombre_cliente;

/*5. Devuelve el producto que más unidades tiene en stock.*/

SELECT jardineria.producto.nombre, jardineria.producto.cantidad_en_stock FROM jardineria.producto
ORDER BY jardineria.producto.cantidad_en_stock DESC 
LIMIT 1;

/*6. Devuelve el producto que menos unidades tiene en stock.*/

SELECT jardineria.producto.nombre, jardineria.producto.cantidad_en_stock FROM jardineria.producto
ORDER BY jardineria.producto.cantidad_en_stock ASC 
LIMIT 1;

/*7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto 
Soria.*/

SELECT CONCAT(e1.nombre,' ', e1.apellido1,' ', e1.apellido2) AS Nombre, e1.email
FROM jardineria.empleado e1
INNER JOIN jardineria.empleado e2 ON e1.codigo_jefe = e2.codigo_empleado
WHERE e2.nombre LIKE 'Alberto'
AND (e2.apellido1 LIKE 'Soria%'  OR e2.apellido2  LIKE 'Soria%' );

				/*Subconsultas con ALL y ANY*/
                
/*1. Devuelve el nombre del cliente con mayor límite de crédito.*/

SELECT jardineria.cliente.nombre_cliente FROM jardineria.cliente
WHERE jardineria.cliente.limite_credito=ALL 
(SELECT MAX(jardineria.cliente.limite_credito) FROM jardineria.cliente);

/*2. Devuelve el nombre del producto que tenga el precio de venta más caro.*/

SELECT jardineria.producto.nombre FROM jardineria.producto
WHERE jardineria.producto.precio_venta=ALL 
(SELECT MAX(jardineria.producto.precio_venta) FROM jardineria.producto);

/*3. Devuelve el producto que menos unidades tiene en stock.*/

SELECT jardineria.producto.nombre FROM jardineria.producto
WHERE jardineria.producto.cantidad_en_stock=ALL
(SELECT MIN(jardineria.producto.cantidad_en_stock) FROM jardineria.producto);

				/*Subconsultas con IN y NOT IN*/
                
/*1. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún 
cliente.*/

SELECT CONCAT(jardineria.empleado.nombre,' ', jardineria.empleado.apellido1,' ', jardineria.empleado.apellido2)
AS NombreEmpleado
FROM jardineria.empleado
WHERE jardineria.empleado.codigo_empleado NOT IN 
		(SELECT jardineria.cliente.codigo_empleado_rep_ventas FROM jardineria.cliente);


/*2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.*/

SELECT jardineria.cliente.nombre_cliente FROM jardineria.cliente
WHERE jardineria.cliente.codigo_cliente NOT IN 
		(SELECT jardineria.pago.codigo_cliente FROM jardineria.pago);

/*3. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún pago.*/

SELECT jardineria.cliente.nombre_cliente FROM jardineria.cliente
WHERE jardineria.cliente.codigo_cliente IN 
		(SELECT jardineria.pago.codigo_cliente FROM jardineria.pago);

/*4. Devuelve un listado de los productos que nunca han aparecido en un pedido.*/

SELECT jardineria.producto.nombre FROM jardineria.producto
WHERE jardineria.producto.codigo_producto NOT IN
		(SELECT jardineria.detalle_pedido.codigo_producto FROM jardineria.detalle_pedido);

/*5. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que 
no sean representante de ventas de ningún cliente.*/

SELECT CONCAT(jardineria.empleado.nombre,' ', jardineria.empleado.apellido1,' ', jardineria.empleado.apellido2)
AS Nombre_Empleado, jardineria.empleado.puesto, jardineria.empleado.extension
FROM jardineria.empleado
WHERE jardineria.empleado.codigo_empleado NOT IN
		(SELECT jardineria.cliente.codigo_empleado_rep_ventas FROM jardineria.cliente);



				/*Subconsultas con EXISTS y NOT EXISTS*/
                
/*1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún 
pago.*/

SELECT * FROM jardineria.cliente
WHERE NOT EXISTS(SELECT * FROM jardineria.pago
					WHERE jardineria.pago.codigo_cliente=jardineria.cliente.codigo_cliente); 

/*2. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún pago.*/

SELECT * FROM jardineria.cliente
WHERE EXISTS(SELECT * FROM jardineria.pago
					WHERE jardineria.pago.codigo_cliente=jardineria.cliente.codigo_cliente);

/*3. Devuelve un listado de los productos que nunca han aparecido en un pedido.*/

SELECT * FROM jardineria.producto
WHERE NOT EXISTS(SELECT * FROM jardineria.detalle_pedido
					WHERE jardineria.detalle_pedido.codigo_producto=jardineria.producto.codigo_producto); 

/*4. Devuelve un listado de los productos que han aparecido en un pedido alguna vez*/

SELECT * FROM jardineria.producto
WHERE EXISTS(SELECT * FROM jardineria.detalle_pedido
					WHERE jardineria.detalle_pedido.codigo_producto=jardineria.producto.codigo_producto); 
