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