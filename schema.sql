/* Database schema to keep the structure of entire database. */

-- Day 1

CREATE TABLE animals (
    id integer NOT NULL,
    name text,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    PRIMARY KEY (id)
);

-- Day 2 

ALTER TABLE animals
    ADD COLUMN species text;

-- Day 3

CREATE
TABLE owners
(
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name text,
    age numeric
);

CREATE
TABLE species
(
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name text
);

ALTER TABLE animals
DROP COLUMN id;

ALTER TABLE animals
ADD COLUMN IF NOT EXISTS id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN IF NOT EXISTS species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN IF NOT EXISTS owner_id INT REFERENCES owners(id);