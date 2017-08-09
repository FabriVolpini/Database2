-- 1
	/*
	 * Write a query that gets all the customers that live in Argentina.
	 * Show the first and last name in one column, the address and the city.
	 */

SELECT CONCAT_WS(" ",first_name,last_name), address.address, city.city
FROM customer
	INNER JOIN address USING(address_id)
	INNER JOIN city USING(city_id)
	INNER JOIN country USING(country_id)
WHERE country.country LIKE 'Argentina';



-- 2
	/* 
	 * Write a query that shows the film title, language and rating. Rating shall be shown as
	 * the full text described here: 
	 * 		https://en.wikipedia.org/wiki/Motion_picture_content_rating_system#United_States.
	 * Hint: use case.
	 */

SELECT title,`language`.name,
CASE rating 
	WHEN 'G' THEN 'General Audiences'
	WHEN 'PG' THEN 'Parental Guidance Suggested'
	WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
	WHEN 'R' THEN 'Restricted'
	WHEN 'NC-17' THEN 'Adults Only'
	END AS "Rating"
FROM film
	INNER JOIN `language` USING(language_id);



-- 3
	/*
	 * Write a search query that shows all the films (title and release year) an actor was part of.
	 * Assume the actor comes from a text box introduced by hand from a web page. Make sure to "adjust"
	 * 	the input text to try to find the films as effectively as you think is possible. 
	 */

SELECT title, release_year
FROM film
	INNER JOIN film_actor USING(film_id)
	INNER JOIN actor USING(actor_id)	
WHERE first_name = LTRIM(UPPER('joe'))
AND last_name = LTRIM(UPPER('swank'));



-- 4
	/* Find all the rentals done in the months of May and June. Show the film title, customer name 
	 *	and if it was returned or not. There should be returned column with two possible values 
	 *	'Yes' and 'No'.
	 */

SELECT title,CONCAT_WS(" ", first_name,last_name) AS Nombre,
    CASE WHEN rental.return_date IS NOT NULL THEN 'YES'
    ELSE 'NO' END AS Returned,
	MONTHNAME(rental.rental_date) AS month
FROM film
  	INNER JOIN inventory USING(film_id)
  	INNER JOIN rental USING(inventory_id)
  	INNER JOIN customer USING(customer_id)
WHERE MONTHNAME(rental.rental_date) LIKE 'May'
	OR MONTHNAME(rental.rental_date) LIKE 'June';

	
	
-- 5
	/* Investigate CAST and CONVERT functions. Explain the differences if any,
	 *	write examples based on sakila DB.
	 */

-- CAST y CONVERT son similares, si bien sus syntaxis son diferentes, ambos se utilizan para la conversion de
--  informacion. CONVERT es exclusivo de sql.

SELECT CAST(last_update AS DATE) as only_date
FROM address;

SELECT CONVERT("2006-02-15", DATETIME);