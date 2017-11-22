/*
 * Exercises


1_Get the amount of cities per country in the database. Sort them by country, country_id.
2_Get the amount of cities per country in the database. Show only the countries with more 
	than 10 cities, order from the highest amount of cities to the lowest   
3_Generate a report with customer (first, last) name, address, total films rented and
	 the total money spent renting films. 
		*Show the ones who spent more money first .
4_Find all the film titles that are not in the inventory. 
5_Find all the films that are in the inventory but were never rented. 
		*Show title and inventory_id.
		*This exercise is complicated. 
		*hint: use sub-queries in FROM and in WHERE or use left join and ask if one of the fields is null
6_Generate a report with:
		*customer (first, last) name, store id, film title, 
		*when the film was rented and returned for each of these customers
		*order by store_id, customer last_name
 */

#Ejercicio 1
SELECT DISTINCT country, (SELECT COUNT(city)
 FROM city
 WHERE country.country_id = city.country_id) AS total
FROM country
ORDER BY country.country_id;

SELECT country, COUNT(*)
FROM country
INNER JOIN city USING(country_id)
GROUP BY country
ORDER BY country.country_id;

#Ejercicio 2
SELECT country, COUNT(*)
FROM country
INNER JOIN city USING(country_id)
GROUP BY country
HAVING COUNT(*) > 10
ORDER BY country.country_id

#Ejercicio3
SELECT first_name, last_name, address, COUNT(rental.rental_id) AS Total_Alquiladas, SUM(amount) AS Saldo_Gastado
FROM customer
JOIN address USING (address_id)
JOIN rental USING (customer_id)
JOIN payment USING (rental_id)
GROUP BY 1, 2, 3