/* Populate database with sample data. */

INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg) 
VALUES (1, 'Agumon', '2020-02-03', 0, 'true', '10.23');
INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg) 
VALUES (2, 'Gabumon', '2018-15-11', 2, 'true', '8');
INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg) 
VALUES (3, 'Pikachu', '2021-07-01', 1, 'false', '15.04');
INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg) 
VALUES (4, 'Devimon', '2017-12-06', 5, 'true', '11');
INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg, Species) 
VALUES (5, 'Charmander', '2020-02-20', 0, 'false', '-11','');
INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg, Species) 
VALUES (6, 'Plantmon', '2021-11-15', 2, 'true', '-5.7', '');
INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg, Species) 
VALUES (7, 'Squirtle', '1993-4-02', 3, 'false', '-12.13', '');
INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg, Species) 
VALUES (8, 'Angemon', '2005-06-12', 1, 'true', '-45', '');
INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg, Species) 
VALUES (9, 'Boarmon', '2005-07-06', 7, 'true', '20.4', '');
INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg, Species) 
VALUES (10, 'Blossom', '1998-10-13', 3, 'true', '17', '');
INSERT INTO animals (Id, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg, Species) 
VALUES (11, 'Ditto', '2022-05-14', 4, 'true', '22', '');

/* Owner's table data */
INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

/* Species's table data */
INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');


-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id =1 WHERE species_id IS NULL;

/* Update the owner_id in animals */
UPDATE animals SET owners_id= 1 WHERE name='Agumon';
UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name IN( 'Gabumon', 'Pikachu');
UPDATE animals SET owners_id = 3 WHERE name IN( 'Devimon', 'Plantmon');
UPDATE animals SET owners_id = 4 WHERE name IN( 'Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owners_id = 5 WHERE name IN( 'Angemon', 'Boarmon');

-- Insert data for vets:
INSERT INTO vets (name, age, date_of_graduation )
    VALUES 
        ('William Tatcher', 45, '2000-04-23'),
        ('Maisy Smith', 26, '2019-01-17');
        ('Stephanie Mendez', 64, '1981-05-04'),
        ('Jack Harkness', 38, '2008-06-08');

-- Insert data for specialties:
INSERT INTO specializations (vets_id, species_id ) 
    VALUES 
        ( 1, 1),
        ( 3, 1),
        ( 3, 2),
        ( 4, 2);

-- Insert data for visits:
INSERT INTO visits (animals_id, vets_id, date_of_visit ) 
    VALUES 
        ( 1, 1, '2020-05-24'),
        ( 1, 3, '2020-07-22'),
        ( 2, 4, '2021-02-02'),
        ( 3, 2, '2020-01-05'),
        ( 3, 2, '2020-03-08'),
        ( 3, 2, '2020-05-14'),
        ( 4, 3, '2021-05-04'),
        ( 5, 4, '2021-02-24'),
        ( 6, 2, '2019-12-21'),
        ( 6, 1, '2020-08-10'),
        ( 6, 2, '2021-04-07'),
        ( 7, 3, '2019-09-29'),
        ( 8, 4, '2020-10-03'),
        ( 8, 4, '2020-11-04'),
        ( 9, 2, '2019-01-24'),
        ( 9, 2, '2019-05-15'),
        ( 9, 2, '2019-08-16'),
        ( 9, 2, '2019-12-17'),
        ( 12, 3, '2020-12-17'),
        ( 12, 3, '2020-12-21');