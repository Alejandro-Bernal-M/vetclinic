/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id INT PRIMARY KEY,
	name varchar(50),
	date_of_birth DATE,
	escape_attempts int,
	neutered bool,
	weight_kg float
);

alter table animals add species varchar(20);

/* Creating owners table*/
create table owners (
	id SERIAL PRIMARY KEY,
	full_name varchar(30),
	age int
)

/* Creating species table*/
create table species (
	id SERIAL PRIMARY KEY,
	name varchar(15)
)

/* Modifying animals table id to generated always as identity*/
alter table animals
	alter id add generated always as identity;

/* Deleting species column*/
alter table animals
	drop column species;


/* Adding species_id column and making it foreign key*/
alter table animals
add  species_id int;

alter table animals
add constraint constraint_fk
foreign key (species_id)
references species(id)
on delete cascade;

/* Adding owner_id column and making it foreign key*/

alter table animals
add owner_id int;

alter table animals
add constraint contraint_fk
foreign key (owner_id)
references owners(id)
on delete cascade;

/* Creating veterinarians table*/
create table vets (
	id int generated always as identity primary key,
	name varchar(50),
	age int,
	date_of_graduation date
)

/* Creating specializaton table for handle many to many relationship*/
create table specializations (
	vet_id int, 
	species_id int,
	foreign key(vet_id) references vets(id),
	foreign key(species_id) references species(id)
)
