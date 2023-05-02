/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals where weight_kg > 10.5;
SELECT * from animals where neutered = true;
SELECT * from animals where name != 'Gabumon';
SELECT * from animals where weight_kg BETWEEN 10.4 AND 17.3;

/* Transaction 1 */
begin;
update animals
set species = 'unspecified';
rollback;

/* Transaction 2 */
begin;
update animals
set species = 'digimon' where name like '%mon';
update animals
set species = 'pokemon'
where species is null;
commit;

/* Transaction 3 */
begin;
delete from animals;
rollback;

/* Transaction 4 */
begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint sp1;
update animals
set weight_kg = weight_kg * -1;
rollback to sp1;
update animals
set weight_kg = weight_kg * -1
where weight_kg < 0 ;
commit;

