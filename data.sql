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
VALUES ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);