/* Populate database with sample data. */

-- Day 1

INSERT INTO animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ( 2, 'Gabumon', '11-15-2018', 2, 'true', 8);

INSERT INTO animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ( 1, 'Agumon', '02-03-2020', 0, 'true', 10.23);

INSERT INTO animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ( 3, 'Pikachu', '01-07-2021', 1, ''false'', 15.04);

INSERT INTO animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ( 4, 'Devimon', '05-12-2017', 5, 'true', 11);

-- Day 2

INSERT INTO animals (
    id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (5, 'Charmander', '02-08-2020', 0, 'false', -11);

INSERT INTO animals (
    id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (6, 'Plantmon', '11-15-2022', 2, 'true', -5.7);

INSERT INTO animals (
    id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (7, 'Squirtle', '04-02-1993', 3, 'false', -12.13);

INSERT INTO animals (
    id, name , date_of_birth , escape_attempts , neutered , weight_kg)
VALUES (8, 'Angemon', '06-12-2005', 1, 'true', -45);

INSERT INTO animals (
    id, name , date_of_birth , escape_attempts , neutered , weight_kg)
VALUES (9, 'Boarmon', '06-07-2005', 7, 'true', 20.4);

INSERT INTO animals (
    id, name , date_of_birth , escape_attempts , neutered , weight_kg)
VALUES (10, 'Blossom', '10-13-1998', 3, 'true', 17);

-- Day 3 

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
	   ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'),
       ('Digimon');


UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.name LIKE '%mon'
  AND species.name LIKE 'Digimon';

UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.species_id IS NULL
  AND species.name ~'Pokemon';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon'
  AND owners.full_name = 'Sam Smith';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Gabumon'
  AND owners.full_name = 'Jennifer Orwell'
  OR animals.name = 'Pikachu'
  AND owners.full_name = 'Jennifer Orwell';


UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Devimon'
  AND owners.full_name = 'Bob'
  OR animals.name = 'Plantmon'
  AND owners.full_name = 'Bob';


UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Charmander'
  AND owners.full_name = 'Melody Pond'
  OR animals.name = 'Squirtle'
  AND owners.full_name = 'Melody Pond'
  OR animals.name = 'Blossom'
  AND owners.full_name = 'Melody Pond';


UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Angemon'
  AND owners.full_name = 'Dean Winchester'
  OR animals.name = 'Boarmon'
  AND owners.full_name = 'Dean Winchester';

-- Day 4 

INSERT INTO vets ("name",age,date_of_graduation)
VALUES ('William Tatcher',45,'2000-04-23'),
	   ('Maisy Smith',26,'2019-01-17'),
	   ('Stephanie Mendez',64,'1981-05-04'),
	   ('Jack Harkness',38,'2008-06-08'); 

INSERT INTO specializations (species_id, vet_id)
SELECT s.id, v.id
FROM species s
JOIN vets v
ON s.name = 'Pokemon' AND v.name = 'William Tatcher';

INSERT INTO specializations (species_id, vet_id) 
SELECT s.id, v.id 
FROM species s 
JOIN vets v 
ON s.name = 'Pokemon' AND v.name = 'Stephanie Mendez';

INSERT INTO specializations (species_id, vet_id) 
SELECT s.id, v.id 
FROM species s 
JOIN vets v 
ON s.name = 'Digimon' AND v.name = 'Stephanie Mendez';

INSERT INTO specializations (species_id, vet_id) 
SELECT s.id, v.id 
FROM species s 
JOIN vets v 
ON s.name = 'Digimon' AND v.name = 'Jack Harkness';

-- Visits

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-05-24' 
FROM animals a 
JOIN vets v 
ON a.name = 'Agumon' AND v.name = 'William Tatcher';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-07-22' 
FROM animals a 
JOIN vets v 
ON a.name = 'Agumon' AND v.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2021-02-02' 
FROM animals a 
JOIN vets v 
ON a.name = 'Gabumon' AND v.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-01-05' 
FROM animals a 
JOIN vets v 
ON a.name = 'Pikachu' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-03-08' 
FROM animals a 
JOIN vets v 
ON a.name = 'Pikachu' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-05-14' 
FROM animals a 
JOIN vets v 
ON a.name = 'Pikachu' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2021-05-04' 
FROM animals a 
JOIN vets v 
ON a.name = 'Devimon' AND v.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2021-02-24' 
FROM animals a 
JOIN vets v 
ON a.name = 'Charmander' AND v.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2019-12-21' 
FROM animals a 
JOIN vets v 
ON a.name = 'Plantmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-08-10' 
FROM animals a 
JOIN vets v 
ON a.name = 'Plantmon' AND v.name = 'William Tatcher';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2021-04-07' 
FROM animals a 
JOIN vets v 
ON a.name = 'Plantmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2019-09-29' 
FROM animals a 
JOIN vets v 
ON a.name = 'Squirtle' AND v.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-10-03' 
FROM animals a 
JOIN vets v 
ON a.name = 'Angemon' AND v.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-11-04' 
FROM animals a 
JOIN vets v 
ON a.name = 'Angemon' AND v.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2019-01-24' 
FROM animals a 
JOIN vets v 
ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2019-05-15' 
FROM animals a 
JOIN vets v 
ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-02-27' 
FROM animals a 
JOIN vets v 
ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-08-03' 
FROM animals a 
JOIN vets v 
ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-05-24' 
FROM animals a 
JOIN vets v 
ON a.name = 'Blossom' AND v.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date) 
SELECT a.id, v.id, '2020-01-11' 
FROM animals a 
JOIN vets v 
ON a.name = 'Blossom' AND v.name = 'William Tatcher';
