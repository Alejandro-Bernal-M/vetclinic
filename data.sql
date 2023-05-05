/* Populate database with sample data. */

INSERT INTO animals values( 1, 'Agumon', '2020-02-03', 0, '1', 10.23);
INSERT INTO animals values( 2, 'Gabumon', '2018-11-15', 2, '1', 8.0);
INSERT INTO animals values( 3, 'Pikachu', '2021-01-07', 1, '0', 15.04);
INSERT INTO animals values( 4, 'Devimon', '2017-05-12', 5, '1', 11.0);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) values( 5, 'Charmander', '2020-02-8', 0, '0', -11.0);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) values( 6, 'Plantmon', '2021-11-15', 2, '1', -5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) values( 7, 'Squirtle', '1993-04-02', 3, '0', -12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) values( 8, 'Angemon', '2005-06-12', 1, '1', -45);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) values( 9, 'Boarmon', '2005-06-07', 7, '1', 20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) values( 10, 'Blossom', '1998-10-13', 3, '1', 17);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) values( 11, 'Ditto', '2022-05-2', 4, '1', 22);

/* Inserting data in owners table*/
insert into owners (full_name, age)
values('Sam Smith', 34 ),('Jennifer Orwell', 19),('Bob', 45), ('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker', 38);

/* Inserting data in species table*/
insert into species (name)
values('pokemon'),('Digimon');

/* Modifying species_id on animals table */
update animals
set species_id = 2
where name like '%mon';

update animals
set species_id = 1
where species_id is null;

/*Modifying owner_id information */
update animals
set owner_id = 1
where name like 'Agumon';

update animals
set owner_id = 2
where name like 'Gabumon';

update animals
set owner_id = 2
where name like 'Pikachu';

update animals
set owner_id = 3
where name like 'Devimon';

update animals
set owner_id = 3
where name like 'Plantmon';

update animals
set owner_id = 4
where name like 'Charmander';

update animals
set owner_id = 4
where name like 'Squirtle';

update animals
set owner_id = 4
where name like 'Blossom';

update animals
set owner_id = 5
where name like 'Angemon';

update animals
set owner_id = 5
where name like 'Boarmon';

/* Inserting data for vets table */
insert into vets(name, age, date_of_graduation)
values('William Tatcher', 45, '2000-04-23'),('Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez', 64, '1981-05-04'),('Jack Harkness', 38, '2008-06-08')

/* Inserting data for specializations table */
insert into specializations(vet_id, species_id)
values(1, 1), (3,1), (3,2),(4,2)

/* Inserting data for visits table */
insert into visits (animal_id, vet_id, date_of_visit)
values
(1,1,'2020-05-24'),
(1,3,'2021-02-02'),
(2,4,'2021-02-02'),
(3,2,'2020-01-05'),
(3,2,'2020-03-08'),
(3,2,'2020-05-14'),
(4,3,'2021-05-04'),
(5,4,'2021-02-24'),
(6,2,'2019-12-21'),
(6,1,'2020-08-10'),
(6,2,'2021-04-07'),
(7,3,'2019,09,29'),
(8,4,'2020-10-03'),
(8,4,'2020-11-04'),
(9,2,'2019-01-24'),
(9,2,'2019-05-15'),
(9,2,'2020-02-27'),
(9,2,'2020-08-03'),
(10,3,'2020-05-24'),
(10,1,'2021-01-11');
