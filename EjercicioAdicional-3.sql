/*1. Mostrar el nombre de todos los pokemon.*/

SELECT p.nombre FROM pokemondb.pokemon p;

/*2. Mostrar los pokemon que pesen menos de 10k.*/

SELECT p.nombre, p.peso FROM pokemondb.pokemon p
WHERE p.peso>10;

/*3. Mostrar los pokemon de tipo agua.*/

SELECT p.nombre, t.nombre FROM pokemondb.tipo t, pokemondb.pokemon p
WHERE p.numero_pokedex = t.id_tipo;

/*4. Mostrar los pokemon de tipo agua, fuego o tierra ordenados por tipo.*/

SELECT p.nombre AS Nombre, t.nombre AS Tipo FROM pokemondb.tipo t, pokemondb.pokemon p
WHERE p.numero_pokedex = t.id_tipo
AND t.nombre IN ('agua','fuego','tierra')
ORDER BY t.nombre;

/*5. Mostrar los pokemon que son de tipo fuego y volador.*/

SELECT p.nombre AS Nombre, t.nombre AS Tipo FROM pokemondb.tipo t, pokemondb.pokemon p
WHERE p.numero_pokedex = t.id_tipo
AND t.nombre IN ('fuego','volador')
ORDER BY t.nombre;

/*6. Mostrar los pokemon con una estadística base de ps mayor que 200.*/

SELECT * FROM pokemondb.estadisticas_base;

SELECT p.nombre  FROM pokemondb.pokemon p
INNER JOIN pokemondb.estadisticas_base es ON p.numero_pokedex= es.numero_pokedex
WHERE (es.ataque+es.defensa+es.especial+es.ps+es.velocidad)>200
GROUP BY p.nombre;

/*7. Mostrar los datos (nombre, peso, altura) de la prevolución de Arbok.*/

SELECT p1.nombre, p1.peso, p1.altura
FROM pokemondb.pokemon p1
INNER JOIN pokemondb.evoluciona_de ev ON ev.pokemon_origen = p1.numero_pokedex
INNER JOIN pokemondb.pokemon p2 ON p2.numero_pokedex = ev.pokemon_evolucionado
WHERE p2.nombre LIKE 'Arbok';

/*8. Mostrar aquellos pokemon que evolucionan por intercambio.*/

SELECT pokemondb.pokemon.nombre FROM pokemondb.pokemon
INNER JOIN pokemondb.pokemon_forma_evolucion ON pokemondb.pokemon.numero_pokedex = pokemondb.pokemon.numero_pokedex
INNER JOIN pokemondb.forma_evolucion ON pokemondb.pokemon_forma_evolucion.id_forma_evolucion = pokemondb.forma_evolucion.id_forma_evolucion
INNER JOIN pokemondb.tipo_evolucion ON pokemondb.forma_evolucion.id_forma_evolucion = pokemondb.tipo_evolucion.id_tipo_evolucion
WHERE pokemondb.tipo_evolucion.tipo_evolucion = 'intercambio'
GROUP BY pokemondb.pokemon.nombre;

/*9. Mostrar el nombre del movimiento con más prioridad*/

SELECT * FROM pokemondb.movimiento
ORDER BY pokemondb.movimiento.prioridad DESC
LIMIT 1;

/*10. Mostrar el pokemon más pesado.*/

SELECT pokemondb.pokemon.nombre FROM pokemondb.pokemon
ORDER BY pokemondb.pokemon.peso DESC
LIMIT 1;

/*11. Mostrar el nombre y tipo del ataque con más potencia.*/

SELECT pokemondb.movimiento.nombre, pokemondb.tipo_ataque.tipo FROM pokemondb.movimiento
INNER JOIN pokemondb.tipo ON pokemondb.movimiento.id_tipo = pokemondb.tipo.id_tipo
INNER JOIN pokemondb.tipo_ataque ON pokemondb.tipo.id_tipo_ataque = pokemondb.tipo_ataque.id_tipo_ataque
ORDER BY pokemondb.movimiento.potencia DESC
LIMIT 1;

/*12. Mostrar el número de movimientos de cada tipo.*/

SELECT pokemondb.movimiento.nombre, pokemondb.tipo_ataque.tipo FROM pokemondb.movimiento
INNER JOIN pokemondb.tipo ON pokemondb.movimiento.id_tipo = pokemondb.tipo.id_tipo
INNER JOIN pokemondb.tipo_ataque ON pokemondb.tipo.id_tipo_ataque = pokemondb.tipo_ataque.id_tipo_ataque
ORDER BY pokemondb.tipo_ataque.tipo;

/*13. Mostrar todos los movimientos que puedan envenenar.*/

SELECT pokemondb.movimiento.nombre FROM pokemondb.movimiento
INNER JOIN pokemondb.tipo ON pokemondb.movimiento.id_tipo = pokemondb.tipo.id_tipo
WHERE pokemondb.tipo.nombre = 'veneno';

/*14. Mostrar todos los movimientos que causan daño, ordenados alfabéticamente por nombre.*/

SELECT * FROM pokemondb.movimiento
WHERE pokemondb.movimiento.descripcion = 'causa daño'
ORDER BY pokemondb.movimiento.nombre;

/*15. Mostrar todos los movimientos que aprende pikachu.*/

SELECT pokemondb.movimiento.nombre FROM pokemondb.movimiento
INNER JOIN pokemondb.pokemon_movimiento_forma ON pokemondb.movimiento.id_movimiento = pokemondb.pokemon_movimiento_forma.id_movimiento
INNER JOIN pokemondb.pokemon ON pokemondb.pokemon_movimiento_forma.numero_pokedex = pokemondb.pokemon.numero_pokedex
WHERE pokemondb.pokemon.nombre = 'pikachu'
GROUP BY pokemondb.movimiento.nombre;

/*16. Mostrar todos los movimientos que aprende pikachu por MT (tipo de aprendizaje).*/

SELECT pokemondb.movimiento.nombre FROM pokemondb.movimiento
INNER JOIN pokemondb.pokemon_movimiento_forma ON pokemondb.movimiento.id_movimiento= pokemondb.pokemon_movimiento_forma.id_movimiento
INNER JOIN pokemondb.pokemon ON pokemondb.pokemon_movimiento_forma.numero_pokedex = pokemondb.pokemon.numero_pokedex
INNER JOIN pokemondb.forma_aprendizaje ON pokemondb.pokemon_movimiento_forma.id_forma_aprendizaje = pokemondb.forma_aprendizaje.id_forma_aprendizaje
INNER JOIN pokemondb.mt ON pokemondb.forma_aprendizaje.id_forma_aprendizaje = pokemondb.mt.id_forma_aprendizaje
WHERE pokemondb.pokemon.nombre = 'pikachu';

/*17. Mostrar todos los movimientos de tipo normal que aprende pikachu por nivel.*/

SELECT * FROM pokemondb.movimiento
INNER JOIN pokemondb.tipo ON pokemondb.movimiento.id_tipo = pokemondb.tipo.id_tipo
INNER JOIN pokemondb.pokemon_movimiento_forma ON pokemondb.movimiento.id_movimiento= pokemondb.pokemon_movimiento_forma.id_movimiento
INNER JOIN pokemondb.pokemon ON pokemondb.pokemon_movimiento_forma.numero_pokedex = pokemondb.pokemon.numero_pokedex
INNER JOIN pokemondb.forma_aprendizaje ON pokemondb.pokemon_movimiento_forma.id_forma_aprendizaje = pokemondb.forma_aprendizaje.id_forma_aprendizaje
WHERE pokemondb.pokemon.nombre = 'pikachu'
AND pokemondb.tipo.nombre = 'Normal';

/*18. Mostrar todos los movimientos de efecto secundario cuya probabilidad sea mayor al 30%.*/

SELECT pokemondb.movimiento.nombre FROM pokemondb.movimiento
INNER JOIN pokemondb.movimiento_efecto_secundario ON pokemondb.movimiento.id_movimiento = pokemondb.movimiento_efecto_secundario.id_movimiento
where pokemondb.movimiento_efecto_secundario.probabilidad>30;

/*19. Mostrar todos los pokemon que evolucionan por piedra. */

SELECT pokemondb.pokemon.nombre FROM pokemondb.pokemon
INNER JOIN pokemondb.pokemon_forma_evolucion ON pokemondb.pokemon.numero_pokedex = pokemondb.pokemon_forma_evolucion.numero_pokedex
INNER JOIN pokemondb.forma_evolucion ON pokemondb.pokemon_forma_evolucion.id_forma_evolucion=pokemondb.forma_evolucion.id_forma_evolucion
INNER JOIN pokemondb.piedra ON pokemondb.forma_evolucion.id_forma_evolucion=pokemondb.piedra.id_forma_evolucion
GROUP BY pokemondb.pokemon.nombre;

/*20. Mostrar todos los pokemon que no pueden evolucionar.*/ 

SELECT * FROM pokemondb.pokemon_no_evolucionan;

/*21. Mostrar la cantidad de los pokemon de cada tipo.*/

SELECT pokemondb.tipo.nombre, COUNT(pokemondb.pokemon.nombre) FROM pokemondb.pokemon
INNER JOIN pokemondb.pokemon_tipo ON pokemondb.pokemon.numero_pokedex = pokemondb.pokemon_tipo.numero_pokedex
INNER JOIN pokemondb.tipo ON pokemondb.pokemon_tipo.id_tipo = pokemondb.tipo.id_tipo
GROUP BY pokemondb.tipo.nombre;