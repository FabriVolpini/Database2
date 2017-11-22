/*Exercises

We try translate class 4 exercises to mongodb. Please download sakila db json's from here.


1_Show title and special_features of films that are PG-13
2_Get a list of all the different films duration.
3_Show title, rental_rate and replacement_cost of films that have replacement_cost from 20.00 up to 24.00
4_Show title, category and rating of films that have 'Behind the Scenes'   as special_features 
5_Show first name and last name of actors that acted in 'ZOOLANDER FICTION'
6_Show the address, city and country of the store with id 1
7_Show pair of film titles and rating of films that have the same rating.
8_Get all the films that are available in store id 2 and the manager first/last name of this store (the manager will appear in all the rows).



Solutions:


 db.getCollection('films').find({ Rating:'PG-13' },{ Title:  1, 'Special Features':1})

 Pitri try...
*/