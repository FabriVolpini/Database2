-- 1
SELECT CONCAT_WS(' ',first_name,last_name), address.address,city.city
FROM customer
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
WHERE country.country = 'Argentina';

-- 2
SELECT title,`language`.name, CASE rating WHEN 'G' THEN 'General Audiences'
										WHEN 'PG' THEN 'Parental Guidance Suggested'
										WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
										WHEN 'R' THEN 'Restricted'
										WHEN 'NC-17' THEN 'Adults Only'
										END AS rating_description
FROM film
INNER JOIN `language` USING(language_id);

-- 3
SELECT film.title, film.release_year
FROM film
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
WHERE first_name = LTRIM(UPPER('joe'))
AND last_name = LTRIM(UPPER('swank'));