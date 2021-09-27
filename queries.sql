/*Queries that provide answers to the questions from all projects.*/

-- Day 1

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-31-2019';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Day 2

BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

BEGIN;

DELETE FROM animals;

ROLLBACK;

BEGIN;

DELETE FROM animals
WHERE date_of_birth > '01-01-2022';

SAVEPOINT p1;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO p1;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, AVG(escape_attempts)
FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '01-01-1990' AND '12-31-2000'
GROUP BY species;

-- Day 3

SELECT name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals)
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT MAX(newcount.count),
       newcount.name
FROM
  (SELECT COUNT(animals),
          owners.full_name as name
   FROM animals
   JOIN owners ON animals.owner_id = owners.id
   GROUP BY owners.full_name) AS newcount
GROUP BY newcount.name
HAVING MAX(newcount.count) =
  (SELECT MAX(newcount.count)
   FROM
     (SELECT COUNT(animals),
             owners.full_name as name
      FROM animals
      JOIN owners ON animals.owner_id = owners.id
      GROUP BY owners.full_name) AS newcount);

-- Day 4

SELECT a.date, b.name as pokemon, c."name" as vet 
FROM visits a 
JOIN animals b ON a.animal_id = b.id 
JOIN vets c ON a.vet_id = c.id
where c."name" = 'William Tatcher'
order by a."date" desc limit 1;

SELECT count(distinct a.animal_id), c."name" as vet
FROM visits a 
JOIN animals b ON a.animal_id = b.id 
JOIN vets c ON a.vet_id = c.id
where c."name" = 'Stephanie Mendez'
group by c."name";

SELECT a."name", c."name" 
FROM vets a 
left JOIN specializations b on b.vet_id = a.id 
left join species c on b.species_id = c.id ;

SELECT a.date, b.name as pokemon, c."name" as vet 
FROM visits a 
JOIN animals b ON a.animal_id = b.id 
JOIN vets c ON a.vet_id = c.id
where c."name" = 'Stephanie Mendez' and a."date" between '04-01-2020' and '08-30-2020';

--  most visits start

select max(newcount.count), newcount.name

from (
	select count(a."date"), b."name" 
	from visits a 
	join animals b on a.animal_id = b.id
	group by b."name"
) as newcount

group by newcount.name

having max(newcount.count) = (
	select max(newcount.count)
	from (
		select count(a."date"), b."name" 
		from visits a 
		join animals b on a.animal_id = b.id 
		group by b."name"
	) as newcount
);

--  most visits end

SELECT a.date, b.name as pokemon, c."name" as vet 
FROM visits a 
JOIN animals b ON a.animal_id = b.id 
JOIN vets c ON a.vet_id = c.id
where c."name" = 'Maisy Smith'
order by a."date" asc limit 1;

SELECT a.date, b.name as pokemon, c."name" as vet
FROM visits a 
JOIN animals b ON a.animal_id = b.id 
JOIN vets c ON a.vet_id = c.id
order by a."date" desc limit 1;

SELECT a.date, animals, vets
FROM visits a 
JOIN animals ON a.animal_id = animals.id 
JOIN vets ON a.vet_id = vets.id
order by a."date" desc limit 1;

select count(visits.animal_id), species."name" as specie
from visits
join animals on visits.animal_id = animals.id 
join species on animals.species_id = species.id
join vets on visits.vet_id = vets.id
where vets."name" = 'Maisy Smith'
group by  species."name"
order by count(visits.animal_id ) desc limit 1;


-- Second Week
-- Day 1

SELECT COUNT(*) FROM visits where animal_id = 4;

SELECT * FROM visits where vet_id = 2;

SELECT * FROM owners where email = 'owner_18327@mail.com';
