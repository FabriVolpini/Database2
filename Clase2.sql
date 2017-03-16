CREATE TABLE film (
	film_id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(36) NOT NULL,
	description TEXT,
	release_year DATE NOT NULL,
	CONSTRAINT films_pk PRIMARY KEY (film_id)
);

CREATE TABLE actor (
	actor_id INT(6) AUTO_INCREMENT NOT NULL,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	CONSTRAINT actors_pk PRIMARY KEY (actor_id)
);

CREATE TABLE film_actor (
	actor_id INT,
	film_id INT,
	CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
	CONSTRAINT fk_film FOREIGN KEY (film_id) REFERENCES film(film_id)
);

ALTER TABLE film
	ADD COLUMN last_update DATE DEFAULT '2017-01-01';
	
ALTER TABLE actor
	ADD COLUMN last_update DATE DEFAULT '2017-01-01';

INSERT INTO imdb.film (title, description, release_year)
VALUES ('Marcos y sus hermanos', 'Ellos sabenn lo que paso despues de la primera', '2017-04-05');

INSERT INTO imdb.actor (actor_id, first_name, last_name)
VALUES (1, 'Brando', 'Marquez');

INSERT INTO imdb.film_actor (actor_id, film_id)
VALUES (1, 1);