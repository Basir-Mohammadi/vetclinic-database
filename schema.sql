/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY NOT NULL,
    Name varchar(100),
    Date_of_birth date NOT Null,
    Escape_attempts integer,
    Neutered boolean NOT NULL,
    Weight_kg decimal NOT NULL,
    species_id,
    owners_id,
    FOREIGN KEY (owners_id) REFERENCES owners(id),
    FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE owners (
    id int SERIAL PRIMARY KEY NOT NULL,
    full_name varchar(100) NOT NULL,
    age int NOT NULL,
    email varchar(120)
);

CREATE TABLE species(
    id int SERIAL PRIMARY KEY NOT NULL,
    name varchar(100) NOT NULL
)

-- create table name vets

CREATE TABLE vets ( 
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id) 
);

-- Create a join table named specializations
CREATE TABLE specializations (
    vets_id INT,
    species_id INT,
    PRIMARY KEY(vets_id, species_id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
);


-- Create a join table named visits
CREATE TABLE visits (
    animals_id INT,
    vets_id INT,
    date_of_visit DATE,
    PRIMARY KEY(animals_id,vets_id,date_of_visit),
    FOREIGN KEY(animals_id) REFERENCES animals(id),
    FOREIGN KEY(vets_id) REFERENCES vets(id)
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

