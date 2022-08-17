/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    Id int NOT NULL AUTO_INCREMENT,
    Name varchar(100),
    Date_of_birth date,
    Escape_attempts integer,
    Neutered boolean,
    Weight_kg decimal,
    Species varchar(100)
);
