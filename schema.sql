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

-- Day 4 

CREATE TABLE vets (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    "name" text NULL,
    age int NULL,
    date_of_graduation date NULL,
    CONSTRAINT vets_pk PRIMARY KEY (id)
);

CREATE TABLE specializations (
    vet_id int NOT NULL,
    species_id int NOT NULL,
    CONSTRAINT specializations_pk PRIMARY KEY (vet_id,species_id),
    CONSTRAINT specializations_fk FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT specializations_fk_1 FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE visits (
    "date" date NULL,
    vet_id int NULL,
    animal_id int NULL,
    CONSTRAINT visits_fk_1 FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT visits_fk FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE ON UPDATE CASCADE
); 

-- Second Week
-- Day 1

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
