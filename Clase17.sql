CREATE TABLE posts (
  id int(4) NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  post_content text,
  PRIMARY KEY (id),
  FULLTEXT KEY post_content (post_content)
);

-- 1
	/* Create two or three queries using address table in sakila db:
	 * 		include postal_code in where (try with in/not it operator) 
	 * 		eventually join the table with city/country tables.
	 * 		measure execution time.
	 * 		Then create an index for postal_code on address table.
	 * 		measure execution time again and compare with the previous ones.
	 * 		Explain the results
	 */

SELECT * from address 
WHERE postal_code IN (SELECT postal_code FROM address AS ad WHERE ad.postal_code like "%420%");

CREATE INDEX address_code ON address(postal_code);



-- 2
	/* Run queries using actor table, searching for first and last
	 * 	name columns independently.
	 * Explain the differences and why is that happening?
 	 */

SELECT first_name FROM actor WHERE first_name LIKE "%ed%";
SELECT last_name FROM actor WHERE last_name LIKE "%crowe%";

-- La columna last_name deberia ser mas performante



-- 3
	/* Compare results finding text in the description on table film with LIKE and in the
	 * 	film_text using MATCH ... AGAINST. Explain the results.
	 */

ALTER TABLE film_text
ADD FULLTEXT(description);


SELECT description
FROM film_text
WHERE description like '%Astounding%';

SELECT description
FROM film_text
WHERE MATCH(description) AGAINST('Astounding');

-- Debido al fulltext la query en la que uso match es muchisimo mas performante.