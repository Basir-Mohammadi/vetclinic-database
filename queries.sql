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
ALTER TABLE animals ADD COLUMN species varchar(100);

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

-- JOIN queries one to many ralationship

-- What animals belong to Melody Pond?
SELECT name,full_name FROM animals JOIN owners ON owners_id= owners.id AND owners.full_name='Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name AS Pokemon FROM animals JOIN species ON species_id=species.id AND name='Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT name, full_name FROM animals FULL OUTER JOIN owners owner_id=owners.id;

-- How many animals are there per species?
SELECT species.name AS species FROM species JOIN animals ON species.id = species_id GROUP BY species;

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name AS owners, animals.name AS animals FROM owners INNER JOIN species ON owners.full_name= 'Jenifer Orwell' AND species.name =' Digimon'INNER  JOIN animals ON owners.id= owners_id AND species.id= species_id;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.full_name as Owners,animals.name as Animals FROM owners JOIN  animals ON   Owners.id = owner_id AND owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name AS Owners,count(*) FROM owners JOIN  animals ON  owners.id = owner_id GROUP BY Owners ORDER BY count DESC LIMIT 1;