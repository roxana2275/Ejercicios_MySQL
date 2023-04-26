/*1. Obtener los datos completos de los empleados.*/
SELECT * FROM personal.empleados;
/*2.Obtener los datos completos de los departamentos*/
SELECT * FROM personal.departamentos;
/*3. Listar el nombre de los departamentos.*/

SELECT personal.departamentos.nombre_depto
FROM personal.departamentos
GROUP BY personal.departamentos.nombre_depto;

/*4. Obtener el nombre y salario de todos los empleados*/

SELECT personal.empleados.nombre, personal.empleados.sal_emp
FROM personal.empleados;

/*5. Listar todas las comisiones.*/

SELECT personal.empleados.comision_emp FROM personal.empleados;

/*6. Obtener los datos de los empleados cuyo cargo sea ‘Secretaria’.*/

SELECT * FROM personal.empleados
WHERE personal.empleados.cargo_emp LIKE 'Secretaria';

/*7. Obtener los datos de los empleados vendedores, ordenados por nombre 
alfabéticamente*/

SELECT * FROM personal.empleados
WHERE personal.empleados.cargo_emp LIKE '%endedor%'
ORDER BY personal.empleados.nombre ASC;

/*. Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a 
mayor.*/

SELECT personal.empleados.nombre, personal.empleados.cargo_emp
FROM personal.empleados
ORDER BY personal.empleados.sal_emp;

/*9. Obtener el nombre de o de los jefes que tengan su departamento situado en la ciudad 
de “Ciudad Real”*/

SELECT personal.departamentos.nombre_jefe_depto
FROM personal.departamentos
WHERE personal.departamentos.ciudad = 'Ciudad Real';

/*10-Elabore un listado donde para cada fila, figure el alias ‘Nombre’ y ‘Cargo’ para las 
respectivas tablas de empleados*/

SELECT personal.empleados.nombre AS Nombre, personal.empleados.cargo_emp AS Cargo FROM personal.empleados;

/*11. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado 
por comisión de menor a mayor.*/

SELECT personal.empleados.sal_emp, personal.empleados.comision_emp,personal.empleados.id_depto FROM personal.empleados
WHERE personal.empleados.id_depto=2000
ORDER BY personal.empleados.comision_emp asc;

/*12. Obtener el valor total a pagar a cada empleado del departamento 3000, que resulta 
de: sumar el salario y la comisión, más una bonificación de 500. Mostrar el nombre del 
empleado y el total a pagar, en orden alfabético. */

SELECT personal.empleados.nombre, sum(personal.empleados.sal_emp+personal.empleados.comision_emp+500) AS Total
FROM personal.empleados
GROUP BY personal.empleados.nombre
ORDER BY personal.empleados.nombre;

/*13. Muestra los empleados cuyo nombre empiece con la letra J.*/

SELECT * from personal.empleados
WHERE personal.empleados.nombre LIKE 'J%';

/*14. Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos 
empleados que tienen comisión superior a 1000.*/

SELECT personal.empleados.nombre, personal.empleados.sal_emp, personal.empleados.comision_emp,
SUM(personal.empleados.sal_emp + personal.empleados.comision_emp) AS Total
FROM personal.empleados
WHERE personal.empleados.comision_emp>1000
GROUP BY personal.empleados.nombre,personal.empleados.sal_emp, personal.empleados.comision_emp;

/*15. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen 
comisión.*/

SELECT personal.empleados.nombre, personal.empleados.sal_emp, personal.empleados.comision_emp,
SUM(personal.empleados.sal_emp + personal.empleados.comision_emp) AS Total
FROM personal.empleados
WHERE personal.empleados.comision_emp =0
GROUP BY personal.empleados.nombre,personal.empleados.sal_emp, personal.empleados.comision_emp;

/*16. Obtener la lista de los empleados que ganan una comisión superior a su sueldo*/

SELECT personal.empleados.nombre
FROM personal.empleados
WHERE personal.empleados.comision_emp>personal.empleados.sal_emp;

/*17. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.*/

SELECT * FROM personal.empleados
WHERE personal.empleados.comision_emp<=(personal.empleados.sal_emp*30/100);

/*18. Hallar los empleados cuyo nombre no contiene la cadena “MA”*/

SELECT * FROM personal.empleados
WHERE personal.empleados.nombre NOT LIKE '%MA%';

/*19. Obtener los nombres de los departamentos que sean “Ventas”, “Investigación” o
‘Mantenimiento.*/

SELECT * FROM personal.departamentos
WHERE personal.departamentos.nombre_depto IN ('Ventas','Investigación','Mantenimiento');

/*20. Ahora obtener el contrario, los nombres de los departamentos que no sean “Ventas” ni 
“Investigación” ni ‘Mantenimiento.*/

SELECT * FROM personal.departamentos
WHERE personal.departamentos.nombre_depto NOT IN ('Ventas','Investigación','Mantenimiento');

/*21. Mostrar el salario más alto de la empresa.*/

SELECT MAX(personal.empleados.sal_emp) FROM personal.empleados;

/*22. Mostrar el nombre del último empleado de la lista por orden alfabético*/

SELECT MAX(personal.empleados.nombre) FROM personal.empleados;

/*23. Hallar el salario más alto, el más bajo y la diferencia entre ellos*/

SELECT MAX(personal.empleados.sal_emp) AS Salario_Maximo, MIN(personal.empleados.sal_emp) AS Salario_Minimo,
MAX(personal.empleados.sal_emp)-MIN(personal.empleados.sal_emp) AS Diferencia
FROM personal.empleados;

/*24. Hallar el salario promedio por departamento.*/

SELECT personal.departamentos.nombre_depto, AVG(personal.empleados.sal_emp) AS Promedio 
FROM personal.empleados, personal.departamentos
WHERE personal.empleados.id_depto = personal.departamentos.id_depto
GROUP BY personal.departamentos.nombre_depto;

/*25. Hallar los departamentos que tienen más de tres empleados. Mostrar el número de 
empleados de esos departamentos.*/

SELECT personal.departamentos.nombre_depto, COUNT(personal.empleados.nombre) AS Total
FROM personal.departamentos,personal.empleados
WHERE personal.departamentos.id_depto = personal.empleados.id_depto
GROUP BY personal.departamentos.nombre_depto HAVING COUNT(personal.empleados.nombre)>3;

/*26. Hallar los departamentos que no tienen empleados*/

SELECT personal.departamentos.nombre_depto, COUNT(personal.empleados.nombre) AS Total
FROM personal.departamentos,personal.empleados
WHERE personal.departamentos.id_depto = personal.empleados.id_depto
GROUP BY personal.departamentos.nombre_depto HAVING COUNT(personal.empleados.nombre)=0;

/*27. Mostrar la lista de empleados, con su respectivo departamento y el jefe de cada 
departamento.*/

SELECT personal.empleados.nombre, personal.departamentos.nombre_depto, personal.departamentos.nombre_jefe_depto
FROM personal.empleados
INNER JOIN personal.departamentos ON personal.empleados.id_depto=personal.departamentos.id_depto;

SELECT personal.empleados.nombre, personal.departamentos.nombre_depto, personal.departamentos.nombre_jefe_depto
FROM personal.empleados
RIGHT JOIN personal.departamentos ON personal.empleados.id_depto=personal.departamentos.id_depto;

SELECT personal.empleados.nombre, personal.departamentos.nombre_depto, personal.departamentos.nombre_jefe_depto
FROM personal.empleados
LEFT JOIN personal.departamentos ON personal.empleados.id_depto=personal.departamentos.id_depto;

/*28. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la 
empresa. Ordenarlo por departamento.*/

SELECT personal.empleados.nombre, personal.empleados.sal_emp
FROM personal.empleados
WHERE personal.empleados.sal_emp>=(SELECT AVG(personal.empleados.sal_emp) FROM personal.empleados)
GROUP BY  personal.empleados.nombre,personal.empleados.sal_emp;