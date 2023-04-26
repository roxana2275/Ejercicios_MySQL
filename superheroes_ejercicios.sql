USE superheroes;

SELECT superheroes.personajes.nombre_real FROM superheroes.personajes;

SELECT superheroes.personajes.nombre_real FROM superheroes.personajes
WHERE superheroes.personajes.nombre_real LIKE 'B%';

SELECT * FROM superheroes.personajes
ORDER BY superheroes.personajes.inteligencia DESC;

