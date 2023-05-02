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

/* how many animals ? */
select count(*) from animals

/*How many animals have never tried to escape? */
select count(*) from animals
where escape_attempts = 0

/* What is the average weight of animals?*/
select avg(weight_kg) from animals

/* Who escapes the most, neutered or not neutered animals?*/
SELECT neutered,  name, MAX(escape_attempts) AS max_escapes
FROM animals
GROUP BY neutered, name
ORDER BY neutered ASC, max_escapes DESC

/* What is the minimum and maximum weight of each type of animal?*/
SELECT min(weight_kg) as min_weight, max(weight_kg) as max_weight, species
FROM animals
GROUP BY species

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/

SELECT species, AVG(escape_attempts) AS avg_escapes
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


/* ---------------------- Using join -------------------------------*/

/* What animals belong to Melody Pond? */
select owner_id, full_name, name 
from animals
join owners
on animals.owner_id = owners.id
order by full_name;

/* List of all animals that are pokemon (their type is Pokemon) */
select animals.name, species
from animals
join species
on animals.species_id = species.id
where animals.species_id = 1;

/* List all owners and their animals, remember to include those that don't own any animal. */
select owners.full_name, animals.name
from owners
left join animals
on owners.id = animals.owner_id
order by full_name;

/* How many animals are there per species? */
select species, count(species) as total
from animals
join species
on animals.species_id = species.id
group by species;

/* List all Digimon owned by Jennifer Orwell. */
select owners.full_name, animals.name, species
from owners
join animals
on owners.id = animals.owner_id
join species
on animals.species_id = species.id
where owners.full_name = 'Jennifer Orwell' and species = 'Digimon';

/* List all animals owned by Dean Winchester that haven't tried to escape. */
select owners.full_name, animals.name, escape_attempts 
from owners
join animals
on owners.id = animals.owner_id
where owners.full_name = 'Dean Winchester' and escape_attempts = 0;

/* Who owns the most animals? */
select owners.full_name, count(animals.name) as total
from owners
join animals
on owners.id = animals.owner_id
group by owners.full_name
order by total desc
limit 1;
