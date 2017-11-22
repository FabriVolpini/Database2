😁

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