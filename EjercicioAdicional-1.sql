			/*A continuación, se deben realizar las siguientes consultas sobre la base de datos:*/
/*1. Mostrar el nombre de todos los jugadores ordenados alfabéticamente.*/

SELECT nba.jugadores.Nombre FROM nba.jugadores
ORDER BY nba.jugadores.Nombre ASC;

/*2. Mostrar el nombre de los jugadores que sean pivots (‘C’) y que pesen más de 200 libras, 
ordenados por nombre alfabéticamente.*/

SELECT nba.jugadores.Nombre FROM nba.jugadores
WHERE nba.jugadores.Posicion LIKE '%C%'
AND nba.jugadores.Peso>200
ORDER BY nba.jugadores.Nombre ASC;

/*3. Mostrar el nombre de todos los equipos ordenados alfabéticamente.*/

SELECT nba.equipos.Nombre FROM nba.equipos
ORDER BY nba.equipos.Nombre ASC;

/*4. Mostrar el nombre de los equipos del este (East).*/

SELECT nba.equipos.Nombre FROM nba.equipos
WHERE nba.equipos.Conferencia = 'East';

/*5. Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.*/

SELECT nba.equipos.Nombre FROM nba.equipos
WHERE nba.equipos.Ciudad LIKE 'C%';

/*6. Mostrar todos los jugadores y su equipo ordenados por nombre del equipo.*/

SELECT nba.jugadores.Nombre, nba.jugadores.Nombre_equipo FROM nba.jugadores
ORDER BY nba.jugadores.Nombre ASC;

/*7. Mostrar todos los jugadores del equipo “Raptors” ordenados por nombre.*/

SELECT nba.jugadores.Nombre, nba.jugadores.Nombre_equipo FROM nba.jugadores
WHERE nba.jugadores.Nombre_equipo = 'Raptors'
ORDER BY nba.jugadores.Nombre ASC;

/*8. Mostrar los puntos por partido del jugador ‘Pau Gasol’.*/

SELECT nba.estadisticas.temporada,nba.estadisticas.Puntos_por_partido,nba.estadisticas.Rebotes_por_partido,
nba.estadisticas.Tapones_por_partido FROM nba.estadisticas, nba.jugadores
WHERE nba.jugadores.codigo = nba.estadisticas.jugador
AND nba.jugadores.Nombre = 'Pau Gasol';

/*9. Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′.*/

SELECT nba.estadisticas.Puntos_por_partido FROM nba.estadisticas, nba.jugadores
WHERE nba.jugadores.codigo = nba.estadisticas.jugador
AND nba.estadisticas.temporada LIKE '04/05'
AND nba.jugadores.Nombre = 'Pau Gasol';

/*10. Mostrar el número de puntos de cada jugador en toda su carrera.*/

SELECT nba.jugadores.Nombre,SUM(nba.estadisticas.Puntos_por_partido), SUM(nba.estadisticas.Rebotes_por_partido), SUM(nba.estadisticas.Tapones_por_partido)
FROM nba.estadisticas, nba.jugadores
WHERE nba.estadisticas.jugador = nba.jugadores.codigo
GROUP BY nba.jugadores.Nombre;

/*11. Mostrar el número de jugadores de cada equipo.*/

SELECT nba.jugadores.Nombre_equipo, COUNT(nba.jugadores.codigo) FROM nba.jugadores
GROUP BY nba.jugadores.Nombre_equipo;

/*12. Mostrar el jugador que más puntos ha realizado en toda su carrera.*/

SELECT nba.jugadores.Nombre, SUM(nba.estadisticas.Puntos_por_partido) AS Total_Puntos
FROM nba.jugadores 
INNER JOIN nba.estadisticas  ON nba.estadisticas.jugador = nba.jugadores.codigo
GROUP BY nba.jugadores.codigo
ORDER BY Total_Puntos DESC
LIMIT 1;


/*13. Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.*/


SELECT nba.jugadores.Nombre, nba.equipos.Nombre, nba.equipos.Conferencia, nba.equipos.Division, nba.jugadores.Altura,
CONCAT(SUBSTRING_INDEX(nba.jugadores.Altura, '-', 1), ',', SUBSTRING_INDEX(nba.jugadores.Altura, '-', -1)) AS Conversion_Altura
FROM nba.equipos, nba.jugadores
WHERE nba.jugadores.Nombre_equipo = nba.equipos.Nombre
ORDER BY Conversion_Altura DESC
LIMIT 1;

/*14. Mostrar la media de puntos en partidos de los equipos de la división Pacific.*/

SELECT nba.equipos.Nombre, 
AVG(CASE WHEN nba.equipos.Nombre = nba.partidos.equipo_local 
	THEN nba.partidos.puntos_local ELSE NULL END) AS puntos_local, 
AVG(CASE WHEN nba.equipos.Nombre = nba.partidos.equipo_visitante 
	THEN nba.partidos.puntos_visitante ELSE NULL END) AS puntos_visitante
FROM nba.equipos 
INNER JOIN nba.partidos ON nba.equipos.Nombre = nba.partidos.equipo_local 
OR nba.equipos.Nombre = nba.partidos.equipo_visitante 
WHERE nba.equipos.Division='Pacific'
GROUP BY nba.equipos.Nombre
ORDER BY nba.equipos.Nombre;

/*15. Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor 
diferencia de puntos.*/

SELECT nba.partidos.equipo_local, nba.partidos.equipo_visitante, 
SUM(nba.partidos.puntos_local-nba.partidos.puntos_visitante) AS Diferencia 
FROM nba.partidos
GROUP BY  nba.partidos.equipo_local, nba.partidos.equipo_visitante
ORDER BY Diferencia DESC
LIMIT 1;

/*16. Mostrar la media de puntos en partidos de los equipos de la división Pacific.*/
/*Igual a punto 14*/

SELECT nba.equipos.Nombre, 
AVG(CASE WHEN nba.equipos.Nombre = nba.partidos.equipo_local 
	THEN nba.partidos.puntos_local ELSE NULL END) AS puntos_local, 
AVG(CASE WHEN nba.equipos.Nombre = nba.partidos.equipo_visitante 
	THEN nba.partidos.puntos_visitante ELSE NULL END) AS puntos_visitante
FROM nba.equipos 
INNER JOIN nba.partidos ON nba.equipos.Nombre = nba.partidos.equipo_local 
OR nba.equipos.Nombre = nba.partidos.equipo_visitante 
WHERE nba.equipos.Division='Pacific'
GROUP BY nba.equipos.Nombre
ORDER BY nba.equipos.Nombre;

/*17. Mostrar los puntos de cada equipo en los partidos, tanto de local como de visitante. */

SELECT nba.equipos.Nombre, 
SUM(CASE WHEN nba.equipos.Nombre = nba.partidos.equipo_local 
	THEN nba.partidos.puntos_local ELSE NULL END) AS puntos_local, 
SUM(CASE WHEN nba.equipos.Nombre = nba.partidos.equipo_visitante 
	THEN nba.partidos.puntos_visitante ELSE NULL END) AS puntos_visitante
FROM nba.equipos 
INNER JOIN nba.partidos ON nba.equipos.Nombre = nba.partidos.equipo_local 
OR nba.equipos.Nombre = nba.partidos.equipo_visitante 
GROUP BY nba.equipos.Nombre
ORDER BY nba.equipos.Nombre;

/*18. Mostrar quien gana en cada partido (codigo, equipo_local, equipo_visitante, 
equipo_ganador), en caso de empate sera null.*/

SELECT nba.partidos.Codigo, nba.partidos.equipo_local, nba.partidos.equipo_visitante, 
CASE 
	WHEN nba.partidos.puntos_local > nba.partidos.puntos_visitante THEN nba.partidos.equipo_local 
	WHEN nba.partidos.puntos_local < nba.partidos.puntos_visitante THEN nba.partidos.equipo_visitante 
	ELSE NULL 
	END AS equipo_ganador 
FROM nba.partidos;
