/*
 
 INSERT Statement
------------------

The INSERT statement is used to insert a single record or multiple records into a table.

Syntax

Single record using the VALUES keyword is:

INSERT INTO table
(column1, column2, ... )
VALUES
(expression1, expression2, ... ),
(expression1, expression2, ... ),
...;

Example - Using VALUES keyword
*/
INSERT INTO suppliers
(supplier_id, supplier_name)
VALUES
(1000, 'Dell');


/*
Multiple records using a sub-select in MySQL is:

INSERT INTO table
(column1, column2, ... )
SELECT expression1, expression2, ...
FROM source_table
[WHERE conditions];


Example - Using sub-query
*/
INSERT INTO suppliers
(supplier_id, supplier_name)
SELECT account_no, name
FROM customers
WHERE customer_id < 5000;


/*
UPDATE Statement
-----------------

The UPDATE statement is used to update existing records in a table in a database. 
There are 3 syntaxes for the UPDATE statement depending on the type of update that you wish to perform.

Syntax

When updating one table in is:

UPDATE table
SET column1 = expression1,
    column2 = expression2,
    ...
[WHERE conditions];


Example - Update single column
*/
UPDATE customers
SET last_name = 'Anderson'
WHERE customer_id = 5000;

/*
When updating one table with data from another table in MySQL is:

UPDATE table1
SET column1 = (SELECT expression1
               FROM table2
               WHERE conditions)
[WHERE conditions];


Example -  Update table with data from another table
*/
UPDATE customers
SET city = (SELECT city
            FROM suppliers
            WHERE suppliers.supplier_name = customers.customer_name)
WHERE customer_id > 2000;
/*


When updating multiple tables is:

UPDATE table1, table2, ... 
SET column1 = expression1,
    column2 = expression2,
    ...
WHERE table1.column = table2.column
AND conditions;

Example - Update multiple Tables
*/
UPDATE customers, suppliers
SET customers.city = suppliers.city
WHERE customers.customer_id = suppliers.supplier_id;
/*


DELETE Statement
------------------

The DELETE statement is used to delete a single record or multiple records from a table.

Syntax

In its simplest form, the syntax for the DELETE statement in is:

DELETE FROM table
[WHERE conditions];


Example - With One condition
*/
DELETE FROM contacts
WHERE last_name = 'Johnson';
/*

Example - With Two conditions

DELETE FROM contacts
WHERE last_name = 'Johnson'
AND contact_id < 1000;


Example - With LIMIT modifier
*/
DELETE FROM contacts
WHERE last_name = 'Johnson'
ORDER BY contact_id DESC
LIMIT 1;
/*

Example - Using EXISTS Condition
*/
DELETE FROM suppliers
WHERE EXISTS
  ( SELECT *
    FROM customers
    WHERE customers.customer_id = suppliers.supplier_id
    AND customer_id > 500 );
/*
This DELETE example would delete all records in the suppliers table where there is a record in the customers 
table whose customer_id is greater than 500, and the customer_id matches the supplier_id.


TRUNCATE TABLE Statement
------------------------

The TRUNCATE TABLE statement is used to remove all records from a table. It performs the same function as a DELETE statement without a WHERE clause.
Warning: If you truncate a table, the TRUNCATE TABLE statement can not be rolled back.

Syntax
The syntax for the TRUNCATE TABLE statement is:

TRUNCATE TABLE [database_name.]table_name;


Notes
When you truncate a table, the AUTO_INCREMENT counters on the table will be reset.
MySQL truncates the table by dropping and creating the table. Thus, the DELETE triggers for the table do not fire during the truncation.
Starting in MySQL 5.5, you can not truncate an InnoDB table that is referenced by a foreign key in another table.
Starting in MySQL 5.6, you can not truncate a NDB table that is referenced by a foreign key in another table.


Example
*/
TRUNCATE TABLE customers;
/*
This example would truncate the table called customers and remove all records from that table.

*/
IS NULL Condition
/*
The IS NULL Condition is used to test for a NULL value in a SELECT, INSERT, UPDATE, or DELETE statement.

Syntax
The syntax for the IS NULL Condition in MySQL is:

expression IS NULL



Example - With INSERT Statement
*/
INSERT INTO contacts
(contact_id, contact_name)
SELECT account_no, supplier_name
FROM suppliers
WHERE category IS NULL;


-- Example - With UPDATE Statement

UPDATE contacts
SET last_name = 'TBD'
WHERE last_name IS NULL;


-- Example - With DELETE Statement

DELETE FROM contacts
WHERE last_name IS NULL;



IS NOT NULL
/*
The IS NOT NULL condition is used to test for a NOT NULL value in a SELECT, INSERT, UPDATE, or DELETE statement.

Syntax
The syntax for the IS NOT NULL Condition in MySQL is:

expression IS NOT NULL


Example - With SELECT Statement
*/
SELECT *
FROM contacts
WHERE last_name IS NOT NULL;
/*


Excersises

Write the statements with all the needed subqueries, do not use hard-coded ids unless is specified.
Check which fields are mandatory and which ones can be ommited (use default value).



1_Add a new customer


To store 1
For address use an existing address. The one that has the biggest address_id in 'United States'



2_Add a rental


Make easy to select any film title. I.e. I sould be able to put 'film tile' in the where, and not the id.
Do not check if the film is already rented, just use any from the inventory, e.g. the one with higest id.
Select any staff_id from Store 2. 



3_Update film year based on the rating


For example if rating is 'G' release date will be '2001'
You can choose the mapping between rating and year.
Write as many statements are needed.



4_Return a film


Write the necessary statements and queries for the following steps.
Find a film that was not yet returned. And use that rental id.
Use the id to return the film.
Use the id to add the payment. Other ids/amounts should be calculated with subqueries.



5_Try to delete a film


Check what happens, describe what to do.
Write all the necessary delete statements to entirely remove the film from the DB.




Once you're done. Restore the database data using the populate script from class 3.
*/


SELECT 1, MAX(address_id) as ID FROM address
INNER JOIN ;


SELECT MAX(address_id), address
FROM address
JOIN city USING (city_id)
JOIN country USING (country_id)
WHERE country = "United States";

-- MAX(addres_id)= 599

INSERT INTO customer
(store_id, first_name, last_name, email, address_id, active, create_date)
VALUES(1, 'Fabrizio', 'Volpini', 'fabrivol@gmail.com', 599, 1, CURRENT_TIMESTAMP);
















SELECT MAX(inventory_id)
FROM film
JOIN inventory USING (film_id)
WHERE title = "Coma Head";

-- Inventory_id = 770

SELECT staff_id
FROM staff
WHERE store_id = 2;

-- Staff_id = 2

INSERT INTO rental
(rental_date, inventory_id, customer_id, staff_id)
VALUES(CURRENT_TIMESTAMP, 770, 1, 2);

4,582

INSERT INTO sakila.rental
(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES(0, '', 0, 0, '', 0, CURRENT_TIMESTAMP);






SELECT inventory_id
FROM inventory
WHERE film_id = 999;

-- Inventory_id = 4569, 4570, 4571, 4572, 4573

DELETE FROM rental
WHERE inventory_id IN (4569, 4570, 4571, 4572, 4573);

DELETE FROM inventory
WHERE film_id = 999;

DELETE FROM film_actor
WHERE film_id = 999;

DELETE FROM film_category
WHERE film_id = 999;

DELETE FROM film
WHERE title = "Zoolander Fiction";


SELECT inventory_id
FROM inventory
WHERE film_id = 999;

















UPDATE film
SET film.release_year = 2001
WHERE rating = 'G';

UPDATE film
SET film.release_year = 1942
WHERE rating = 'PG';

UPDATE film
SET film.release_year = 1969
WHERE rating = 'R';

UPDATE film
SET film.release_year = 1999
WHERE rating = 'NC-17';

UPDATE film
SET film.release_year = 2011
WHERE rating = 'PG-13';