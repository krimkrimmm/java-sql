use sakila;

/*
1. I’m going to send an email letting our customers know there has been a management change.
Could you pull a list of the first name, last name, and email of each of our customers?
*/

SELECT first_name, last_name, email
FROM customer;
/*
2. My understanding is that we have titles that we rent for durations of 3, 5, or 7 days. 
Could you pull the records of our films and see if there are any other rental durations?
*/
SELECT DISTINCT rental_duration
FROM film
WHERE rental_duration NOT IN (3, 5, 7);

/*
3. I’d like to look at payment records for our long-term customers to learn about their purchase patterns.
Could you pull all payments from our first 100 customers (based on customer ID)?
*/
SELECT *
FROM payment
WHERE customer_id <= 100;


/*
4. 	The payment data you gave me on our first 100 customers was great – thank you! 
Now I’d love to see just payments over $5 for those same customers, since June 1, 2005.
*/
SELECT *
FROM payment
WHERE customer_id <= 100 AND amount > 5 AND payment_date >= '2005-06-01';

/*
5. The data you shared previously on customers 42, 53, 60, and 75 was good to see.
Now, could you please write a query to pull all payments from those specific customers, 
along with payments over $5, from any customer?
*/
SELECT *
FROM payment
WHERE customer_id IN (42, 53, 60, 75) OR amount > 5;


/*
6. We need to understand the special features in our films.
Could you pull a list of films which include a 'Behind the Scenes' special feature?
*/
SELECT title
FROM film
WHERE FIND_IN_SET('Behind the Scenes', special_features);

/*
7.	I need to get a quick overview of how long our movies tend to be rented out for.
Could you please pull a count of titles sliced by rental duration?
*/

SELECT rental_duration, COUNT(*) AS title_count
FROM film
GROUP BY rental_duration;

/*
8.	I’m wondering if we charge more for a rental when the replacement cost is higher. 
Can you help me pull a count of films, along with the average, min, and max rental rate, grouped by replacement cost?
*/
SELECT replacement_cost, 
       COUNT(*) AS film_count, 
       AVG(rental_rate) AS avg_rental_rate,
       MIN(rental_rate) AS min_rental_rate,
       MAX(rental_rate) AS max_rental_rate
FROM film
GROUP BY replacement_cost;
/*
9.	I’d like to talk to customers that have not rented ucmh from us to understand if there is something we could be doing better.
Could you pull a list of customer_ids with less than 15 rentals all-time?
*/
SELECT customer_id
FROM rental
GROUP BY customer_id
HAVING COUNT(*) < 15;


/*
10.	I’d like to see if our longest films also tend to be our most expensive rentals.
Could you pull me a list of all film titles along with their lengths and rental rates, and sort them from longest to shortest?
*/

SELECT title, length, rental_rate
FROM film
ORDER BY length DESC;
-- CASE STATEMENT --
/*
11.	I’m curious how many inactive customers we have at each store.
Could you please create a table to count the number of customers broken down by store_id (in rows), and active status (in columns)?
*/
SELECT store_id,
       SUM(CASE WHEN active = 1 THEN 1 ELSE 0 END) AS active_customers,
       SUM(CASE WHEN active = 0 THEN 1 ELSE 0 END) AS inactive_customers
FROM customer
GROUP BY store_id;
/*
12.	Can you pull for me a list of each film we have in inventory?
I would like to see the film’s title, description, and the store_id value associated with each item, and its inventory_id. Thanks!
*/
SELECT f.title, f.description, i.store_id, i.inventory_id
FROM inventory i
JOIN film f ON i.film_id = f.film_id;

/*
13.	One of our investors is interested in the films we carry and how many actors are listed for each film title.
Can you pull a list of all titles, and figure out how many actors are associated with each title?
*/
SELECT f.title, COUNT(fa.actor_id) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title;



/*
14.	Customers often ask which films their favorite actors appear in.
It would be great to have a list of all actors, with each film title that they appear in. 
Could you please pull that for me?
*/
SELECT a.first_name, a.last_name, f.title
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id;

/*
15.	The Manager from Store 2 is working on expanding our film collection there.
Could you pull a list of distinct titles and their descriptions, currently available in inventory at store 2?
*/

SELECT DISTINCT f.title, f.description
FROM inventory i
JOIN film f ON i.film_id = f.film_id
WHERE i.store_id = 2;

 