/*Queries that provide answers to the questions from all projects.*/
SELECT * from animals;
SELECT * from animals WHERE name like '%mon';
SELECT * from animals WHERE Date_of_birth >= '2016-01-01' AND Date_of_birth <= '2019-12-31';
SELECT * from animals WHERE Escape_attempts < 3 AND Neutered = 'true';
SELECT Date_of_birth from animals WHERE Name = 'Agumon' OR Name = 'Pikachu';
SELECT Name, Escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE Name != 'Gabumon'; 
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3

ALTER TABLE animals DROP COLUMN ID; -----> deletes a specific column(ID)
ALTER TABLE animals ADD ID SERIAL PRIMARY KEY;
UPDATE animals SET Species='unspecified';
UPDATE animals SET Species= 'digimon' WHERE name like '%mon';
UPDATE animals SET Species= 'pokemom' WHERE Species='unspecified';


DELETE * FROM animals;
BEGIN;
DELETE FROM animals WHERE name='Bolossom';
COMMIT;

DELETE FROM animals WHERE weight_kg=11;
ROLLBACK;

SAVEPOINT save_point1;
DELETE FROM animals WHERE name='Agumon';
ROLLBACK to save_point1;

SELECT * FROM animals;

UPDATE animals SET weight_kg= weight_kg * -1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg<0;
COMMIT;

SELECT COUNT(*) AS number_of_animals FROM animals;
SELECT COUNT(*) As number_of_animals FROM animals WHERE Escape_attempts<=0;
SELECT AVG(weight_kg) AS Weight_kg_of_animals FROM animals;
SELECT name, Escape_attempts, neutered FROM animals WHERE Escape_attempts=(SELECT MAX(Escape_attempts) FROM animals);
SELECT name, weight_kg FROM animals WHERE weight_kg=(SELECT MAX(weight_kg) FROM animals) AND weight_kg=(SELECT MIN(weight_kg) FROM animals);
SELECT AVG( Escape_attempts) AS Escape_attempts FROM animals WHERE Date_of_birth>='1990-01-01' AND Date_of_birth<='2000-01-01';
