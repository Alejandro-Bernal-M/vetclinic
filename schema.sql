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
