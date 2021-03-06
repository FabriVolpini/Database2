/*
 * Set Operators


UNION
INTERSECT (Not supported by Mysql)
EXCEPT (Not supported by Mysql)



UNION

SELECT name AS val FROM category
WHERE name LIKE 'A%' OR name LIKE 'M%'
UNION 
SELECT title  FROM film
WHERE title LIKE 'A%' OR title LIKE 'S%'


Union eliminates duplicates and sort the result, to see all the values UNION ALL has to be used.


Table Variables

SELECT f.title, f.special_features, f.rental_rate, c.name
 FROM film f, film_category fc,  category c 
WHERE f.film_id = fc.film_id 
  AND fc.category_id = c.category_id
ORDER BY f.rental_rate DESC, f.special_features ASC


SELECT f1.title, f2.title, f1.`length` 
  FROM film f1, film f2
WHERE f1.`length` = f2.`length`


SELECT f1.title, f2.title, f1.`length` 
  FROM film f1, film f2
WHERE f1.`length` = f2.`length` AND f1.film_id <> f2.film_id;



Exercises


1-Show title and special_features of films that are PG-13
2-Get a list of all the different films duration.
3-Show title, rental_rate and replacement_cost of films that have replacement_cost from 20.00 up to 24.00
4-Show title, category and rating of films that have 'Behind the Scenes'   as special_features 
5-Show first name and last name of actors that acted in 'ZOOLANDER FICTION'
6-Show the address, city and country of the store with id 1
7-Show pair of film titles and rating of films that have the same rating.
8-Get all the films that are available in store id 2 and the manager first/last name of this store (the manager will appear in all the rows).
 */

-- 1
SELECT title, special_features
FROM film
WHERE rating = 'PG-13';

-- 2
SELECT f1.title, f2.title, f1.`length`
FROM film f1, film f2
WHERE f1.`length` = f2.`length` AND f1.film_id <> f2.film_id;

-- 3
SELECT title, rental_rate, replacement_cost 
FROM film
WHERE replacement_cost BETWEEN '20,00' AND '24,00';

-- 4
SELECT f.title, f.rating, c.name
FROM film f , category c , film_category fc
WHERE f.film_id = fc.film_id
AND c.category_id = fc.category_id
AND f.special_features LIKE '%Behind the Scenes%';

-- 5
SELECT actor.first_name, actor.last_name
FROM actor, film_actor fa, film f
WHERE f.film_id = fa.film_id
AND fa.actor_id = actor.actor_id
AND f.title = 'ZOOLANDER FICTION';

SELECT `actor`.`first_name`, `actor`.`last_name` 
FROM `actor` INNER JOIN `film_actor` 
ON (`actor`.`actor_id` = `film_actor`.`actor_id`) 
INNER JOIN `film` 
ON (`film_actor`.`film_id` = `film`.`film_id`)
WHERE `film`.`title` = 'ZOOLANDER FICTION';

-- 6
SELECT address.address, city.city, country.country
FROM address, city, country, store
WHERE store_id = 1
AND store.address_id = address.address_id
AND address.city_id = city.city_id
AND city.country_id = country.country_id;

-- 7
SELECT f1.title, f1.rating, f2.title, f2.rating
FROM film f1, film f2
WHERE f1.film_id > f2.film_id
AND f1.rating = f2.rating;

-- 8
SELECT DISTINCT film.title, staff.first_name, staff.last_name
FROM film, inventory inv, store str, staff
WHERE film.film_id = inv.film_id
AND inv.store_id = str.store_id
AND str.store_id = 2
AND str.manager_staff_id = staff.staff_id;