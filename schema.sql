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
    age int NOT NULL
);

CREATE TABLE species(
    id int SERIAL PRIMARY KEY NOT NULL,
    name varchar(100) NOT NULL
)
