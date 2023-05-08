# Ejercicios_MySQL

EJERCICIOS DE APRENDIZAJE

1. Abrir el script llamado “personal” y ejecutarlo de modo tal que se cree la base de datos 
   “personal”, se creen las tablas y se inserten todos los datos en las tablas para que quede de la 
   siguiente manera: 
	a) A continuación, realizar las siguientes consultas sobre la base de datos personal:
		1. Obtener los datos completos de los empleados.
		2. Obtener los datos completos de los departamentos.
		3. Listar el nombre de los departamentos.
		4. Obtener el nombre y salario de todos los empleados.
		5. Listar todas las comisiones.
		6. Obtener los datos de los empleados cuyo cargo sea ‘Secretaria’.
		7. Obtener los datos de los empleados vendedores, ordenados por nombre 
		   alfabéticamente.
		8. Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a 
		   mayor.
		9. Obtener el nombre de o de los jefes que tengan su departamento situado en la ciudad 
		   de “Ciudad Real”
		10.Elabore un listado donde para cada fila, figure el alias ‘Nombre’ y ‘Cargo’ para las 
		   respectivas tablas de empleados.
		11.Listar los salarios y comisiones de los empleados del departamento 2000, ordenado 
		   por comisión de menor a mayor.
		12.Obtener el valor total a pagar a cada empleado del departamento 3000, que resulta 
		   de: sumar el salario y la comisión, más una bonificación de 500. Mostrar el nombre del 
		   empleado y el total a pagar, en orden alfabético. 
		13.Muestra los empleados cuyo nombre empiece con la letra J.
		14.Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos 
		   empleados que tienen comisión superior a 1000.
		15.Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen 
		   comisión.
		16.Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
		17.Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
		18.Hallar los empleados cuyo nombre no contiene la cadena “MA”
		19.Obtener los nombres de los departamentos que sean “Ventas”, “Investigación” o
		   ‘Mantenimiento.
		20.Ahora obtener el contrario, los nombres de los departamentos que no sean “Ventas” ni 
		   “Investigación” ni ‘Mantenimiento.
		21.Mostrar el salario más alto de la empresa.
		22.Mostrar el nombre del último empleado de la lista por orden alfabético.
		23.Hallar el salario más alto, el más bajo y la diferencia entre ellos.
		24.Hallar el salario promedio por departamento.
	Consultas con Having 
		25.Hallar los departamentos que tienen más de tres empleados. Mostrar el número de 
		   empleados de esos departamentos.
		26.Hallar los departamentos que no tienen empleados
	Consulta Multitabla (Uso de la sentencia JOIN/LEFT JOIN/RIGHT JOIN)
		27.Mostrar la lista de empleados, con su respectivo departamento y el jefe de cada 
		   departamento
	Consulta con Subconsulta
		28.Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la 
		   empresa. Ordenarlo por departamento


2. Abrir el script de la base de datos llamada “tienda.sql” y ejecutarlo para crear sus tablas e 
   insertar datos en las mismas. A continuación, generar el modelo de entidad relación. Deberá 
   obtener un diagrama de entidad relación igual al que se muestra a continuación:
   A continuación, se deben realizar las siguientes consultas sobre la base de datos:
		1. Lista el nombre de todos los productos que hay en la tabla producto.
		2. Lista los nombres y los precios de todos los productos de la tabla producto.
		3. Lista todas las columnas de la tabla producto.
		4. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando 
		   el valor del precio.
		5. Lista el código de los fabricantes que tienen productos en la tabla producto.
		6. Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar 
		   los repetidos.
		7. Lista los nombres de los fabricantes ordenados de forma ascendente.
		8. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma 
		   ascendente y en segundo lugar por el precio de forma descendente.
		9. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
		10.Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas 		    
		11.Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER 
		   BY y LIMIT)
		12.Lista el nombre de los productos que tienen un precio menor o igual a $120.
		13.Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador 
		   BETWEEN.
		14.Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador 
		   IN.
		15.Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil 
		   en el nombre.
		   ORDER BY y LIMIT)
	Consultas Multitabla 
		1. Devuelve una lista con el código del producto, nombre del producto, código del fabricante 
		   y nombre del fabricante, de todos los productos de la base de datos.
		2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos 
		   los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por 
		   orden alfabético.
		3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto 
		   más barato. 
		4. Devuelve una lista de todos los productos del fabricante Lenovo.
		5. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio 
		   mayor que $200.
		6. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard. 
		   Utilizando el operador IN
		7. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos 
		   los productos que tengan un precio mayor o igual a $180. Ordene el resultado en primer 
		   lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden 
		   ascendente)
	Consultas Multitabla 
	Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
		1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los 
		   productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos 
		   fabricantes que no tienen productos asociados.
		2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún 
		   producto asociado.
	Subconsultas (En la cláusula WHERE)
	Con operadores básicos de comparación
		1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
		2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto 
		   más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
		3. Lista el nombre del producto más caro del fabricante Lenovo.
		4. Lista todos los productos del fabricante Asus que tienen un precio superior al precio 
		   medio de todos sus productos.
	Subconsultas con IN y NOT IN
		1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o 
		   NOT IN).
		2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando 
		   IN o NOT IN).
	Subconsultas (En la cláusula HAVING)
		1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número 
		   de productos que el fabricante Lenovo

EJERCICIOS DE APRENDIZAJE EXTRA


1. Abrir el script de la base de datos llamada “nba.sql” y ejecutarlo para crear todas las tablas e 
   insertar datos en las mismas. A continuación, generar el modelo de entidad relación. Deberá 
   obtener un diagrama de entidad relación igual al que se muestra a continuación:
   A continuación, se deben realizar las siguientes consultas sobre la base de datos:
	1. Mostrar el nombre de todos los jugadores ordenados alfabéticamente.
	2. Mostrar el nombre de los jugadores que sean pivots (‘C’) y que pesen más de 200 libras, 
	   ordenados por nombre alfabéticamente.
	3. Mostrar el nombre de todos los equipos ordenados alfabéticamente.
	4. Mostrar el nombre de los equipos del este (East).
	5. Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.
	6. Mostrar todos los jugadores y su equipo ordenados por nombre del equipo.
	7. Mostrar todos los jugadores del equipo “Raptors” ordenados por nombre.
	8. Mostrar los puntos por partido del jugador ‘Pau Gasol’.
	9. Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′.
	10.Mostrar el número de puntos de cada jugador en toda su carrera.
	11.Mostrar el número de jugadores de cada equipo.
	12.Mostrar el jugador que más puntos ha realizado en toda su carrera.
	13.Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.
	14.Mostrar la media de puntos en partidos de los equipos de la división Pacific.
	15.Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor 
	   diferencia de puntos.
	16.Mostrar la media de puntos en partidos de los equipos de la división Pacific.
	17.Mostrar los puntos de cada equipo en los partidos, tanto de local como de visitante. 
	18.Mostrar quien gana en cada partido (codigo, equipo_local, equipo_visitante, 

	    equipo_ganador), en caso de empate sera null

2. Abrir el script de la base de datos llamada “jardineria.sql” y ejecutarlo para crear todas las 
   tablas e insertar datos en las mismas. Deberá obtener un diagrama de entidad relación igual al 
   que se muestra a continuación: 
   A continuación, se deben realizar las siguientes consultas sobre la base de datos:
	Consultas sobre una tabla
		1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
		2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
		3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un 
		   código de jefe igual a 7.
		4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
		5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean 
		   representantes de ventas.
		6. Devuelve un listado con el nombre de los todos los clientes españoles.
		7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
		8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago 
		   en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan 
		   repetidos. Resuelva la consulta:
			o Utilizando la función YEAR de MySQL.
			o Utilizando la función DATE_FORMAT de MySQL.
			o Sin utilizar ninguna de las funciones anteriores.
		9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de 
		   entrega de los pedidos que no han sido entregados a tiempo
		10.Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de 
		   entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha 
		   esperada.
			o Utilizando la función ADDDATE de MySQL.
			o Utilizando la función DATEDIFF de MySQL.
		11.Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
		12.Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de 
		   cualquier año.
		13.Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. 
		   Ordene el resultado de mayor a menor.
		14.Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en 
		   cuenta que no deben aparecer formas de pago repetidas.
		15.Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que 
		   tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de 
		   venta, mostrando en primer lugar los de mayor precio.
		16.Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo 
		   representante de ventas tenga el código de empleado 11 o 30.
	Consultas multitabla (Composición interna)
	Las consultas se deben resolver con INNER JOIN.
		1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante 
		   de ventas.
		2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus 
		   representantes de ventas.
		3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de 
		   sus representantes de ventas.
		4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes 
		   junto con la ciudad de la oficina a la que pertenece el representante.
		5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus 
		   representantes junto con la ciudad de la oficina a la que pertenece el representante.
		6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
		7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad 
		   de la oficina a la que pertenece el representante.
		8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
		9. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
		10.Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
	Consultas multitabla (Composición externa)
	Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, JOIN.
		1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
		2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún 
		   pedido.
		3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que 
		   no han realizado ningún pedido.
		4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina 
		   asociada.
		5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente 
		   asociado
		6. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los 
		   que no tienen un cliente asociado.
		7. Devuelve un listado de los productos que nunca han aparecido en un pedido.
		8. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los 
		   representantes de ventas de algún cliente que haya realizado la compra de algún producto 
		   de la gama Frutales.
		9. Devuelve un listado con los clientes que han realizado algún pedido, pero no han realizado 
		   ningún pago.
		10.Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el 
		   nombre de su jefe asociado.
	Consultas resumen
		1. ¿Cuántos empleados hay en la compañía?
		2. ¿Cuántos clientes tiene cada país?
		3. ¿Cuál fue el pago medio en 2009?
		4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el 
		   número de pedidos.
		5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
		6. Calcula el número de clientes que tiene la empresa.
		7. ¿Cuántos clientes tiene la ciudad de Madrid?
		8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
		9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende 
		   cada uno.
		10.Calcula el número de clientes que no tiene asignado representante de ventas.
		11.Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado 
		   deberá mostrar el nombre y los apellidos de cada cliente.
		12.Calcula el número de productos diferentes que hay en cada uno de los pedidos.
		13.Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de 
		   los pedidos.
		14.Devuelve un listado de los 20 productos más vendidos y el número total de unidades que 
		   se han vendido de cada uno. El listado deberá estar ordenado por el número total de 
		   unidades vendidas.
		15.La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el 
		   IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el 
		   número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base 
		   imponible, y el total la suma de los dos campos anteriores.
		16.La misma información que en la pregunta anterior, pero agrupada por código de producto.
		17.La misma información que en la pregunta anterior, pero agrupada por código de producto 
		   filtrada por los códigos que empiecen por OR.
		18.Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se 
		   mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% 
		   IVA
	Subconsultas con operadores básicos de comparación
		1. Devuelve el nombre del cliente con mayor límite de crédito.
		2. Devuelve el nombre del producto que tenga el precio de venta más caro.
		3. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta 
		   que tendrá que calcular cuál es el número total de unidades que se han vendido de cada 
		   producto a partir de los datos de la tabla detalle_pedido. Una vez que sepa cuál es el código 
		   del producto, puede obtener su nombre fácilmente.)
		4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar 
		   INNER JOIN).
		5. Devuelve el producto que más unidades tiene en stock.
		6. Devuelve el producto que menos unidades tiene en stock.
		7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto 
		   Soria
	Subconsultas con ALL y ANY
		1. Devuelve el nombre del cliente con mayor límite de crédito.
		2. Devuelve el nombre del producto que tenga el precio de venta más caro.
		3. Devuelve el producto que menos unidades tiene en stock.
	Subconsultas con IN y NOT IN
		1. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún 
		   cliente.
		2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
		3. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún pago
		4. Devuelve un listado de los productos que nunca han aparecido en un pedido.
		5. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que 
		   no sean representante de ventas de ningún cliente.
	Subconsultas con EXISTS y NOT EXISTS
		1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún 
		   pago.
		2. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún pago.
		3. Devuelve un listado de los productos que nunca han aparecido en un pedido.
		4. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.


3. Importar el script de la base de datos llamada “pokemondb.sql” y ejecutarlo para crear todas 
   las tablas e insertar los registros en las mismas. A continuación, generar el modelo de entidad 
   relación y reorganizar las tablas para mayor claridad de sus relaciones. Deberá obtener un 
   diagrama de entidad de relación similar al que se muestra a continuación:
	A continuación, se deben realizar las siguientes consultas:
		1. Mostrar el nombre de todos los pokemon.
		2. Mostrar los pokemon que pesen menos de 10k.
		3. Mostrar los pokemon de tipo agua.
		4. Mostrar los pokemon de tipo agua, fuego o tierra ordenados por tipo.
		5. Mostrar los pokemon que son de tipo fuego y volador.
		6. Mostrar los pokemon con una estadística base de ps mayor que 200.
		7. Mostrar los datos (nombre, peso, altura) de la prevolución de Arbok.
		8. Mostrar aquellos pokemon que evolucionan por intercambio.
		9. Mostrar el nombre del movimiento con más prioridad.
		10.Mostrar el pokemon más pesado.
		11.Mostrar el nombre y tipo del ataque con más potencia.
		12.Mostrar el número de movimientos de cada tipo.
		13.Mostrar todos los movimientos que puedan envenenar.
		14.Mostrar todos los movimientos que causan daño, ordenados alfabéticamente por nombre.
		15.Mostrar todos los movimientos que aprende pikachu.
		16.Mostrar todos los movimientos que aprende pikachu por MT (tipo de aprendizaje).
		17.Mostrar todos los movimientos de tipo normal que aprende pikachu por nivel.
		18.Mostrar todos los movimientos de efecto secundario cuya probabilidad sea mayor al 30%.
		19.Mostrar todos los pokemon que evolucionan por piedra. 
		20.Mostrar todos los pokemon que no pueden evolucionar. 
		21.Mostrar la cantidad de los pokemon de cada tipo.
