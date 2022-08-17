/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY NOT NULL,
    Name varchar(100),
    Date_of_birth date NOT Null,
    Escape_attempts integer,
    Neutered boolean NOT NULL,
    Weight_kg decimal NOT NULL,
    Species varchar(100)
);
