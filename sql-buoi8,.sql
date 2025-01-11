use sakila;
 
/*
1. I’m going to send an email letting our customers know there has been a management change.
Could you pull a list of the first name, last name, and email of each of our customers?
*/
SELECT first_name, last_name, email FROM customer;

/*
2. My understanding is that we have titles that we rent for durations of 3, 5, or 7 days. 
Could you pull the records of our films and see if there are any other rental durations?
*/
SELECT DISTINCT rental_duration FROM film;

/*
3. I’d like to look at payment records for our long-term customers to learn about their purchase patterns.
Could you pull all payments from our first 100 customers (based on customer ID)?
*/
SELECT * FROM payment WHERE customer_id < 101;

SELECT * 
FROM payment
WHERE customer_id IN 
	(SELECT customer_id 
     FROM (SELECT * FROM customer LIMIT 100) AS temp);
    
SELECT * FROM customer LIMIT 100;

/*
4. 	The payment data you gave me on our first 100 customers was great – thank you! 
Now I’d love to see just payments over $5 for those same customers, since June 1, 2005.
*/
SELECT * 
FROM payment
WHERE customer_id IN 
	(SELECT customer_id FROM (SELECT * FROM customer LIMIT 100) AS temp)
     AND amount > 5 AND payment_date > '2005-06-01' ;

/*
5. The data you shared previously on customers 42, 53, 60, and 75 was good to see.
Now, could you please write a query to pull all payments from those specific customers, 
along with payments over $5, from any customer?
*/
SELECT * 
FROM payment 
WHERE customer_id IN (42,53,60,75) AND amount > 5;


/*
6. We need to understand the special features in our films.
Could you pull a list of films which include a 'Behind the Scenes' special feature?
*/
SELECT *
FROM film
WHERE special_features LIKE '%Behind the Scenes%';

/*
7.	I need to get a quick overview of how long our movies tend to be rented out for.
Could you please pull a count of titles sliced by rental duration?
*/
SELECT rental_duration, COUNT(*) AS num_film_with_duration
FROM film
GROUP BY rental_duration;

/*
8.	I’m wondering if we charge more for a rental when the replacement cost is higher. 
Can you help me pull a count of films, along with the average, min, and max rental rate, grouped by replacement cost?
*/
SELECT replacement_cost, 
		COUNT(film_id) AS num_film,
        MIN(rental_rate) AS cheapest_rental, 
        MAX(rental_rate) AS most_expensive_rental,
        AVG(rental_rate) AS average_rental
FROM film
GROUP BY replacement_cost;

/*
9.	I’d like to talk to customers that have not rented ucmh from us to understand if there is something we could be doing better.
Could you pull a list of customer_ids with less than 15 rentals all-time?
*/
select customer_id, count(*) AS total_rentals
from rental
group by customer_id
having count(*) < 15;


/*
10.	I’d like to see if our longest films also tend to be our most expensive rentals.
Could you pull me a list of all film titles along with their lengths and rental rates, and sort them from longest to shortest?
*/
SELECT 
    title, 
    length, 
    rental_rate
FROM film
ORDER BY length DESC;

-- CASE STATEMENT --
/*
11.	I’m curious how many inactive customers we have at each store.
Could you please create a table to count the number of customers broken down by store_id (in rows), and active status (in columns)?
*/
SELECT first_name, last_name, 
	CASE
		WHEN store_id = 1 AND active = 1 THEN 'active in store 1'
        WHEN store_id = 1 AND active = 0 THEN 'inactive in store 1'
        WHEN store_id = 2 AND active = 1 THEN 'active in store 2'
        WHEN store_id = 2 AND active = 0 THEN 'inactive in store 2'
	END AS status_in_store
FROM customer;

SELECT store_id,
	CASE WHEN active = 0 THEN 1 END AS inactive_customer,
    CASE WHEN active = 1 THEN 1 END AS active_customer,
    first_name, last_name, active
FROM customer;

SELECT store_id,
	COUNT(CASE WHEN active = 0 THEN 1 END) AS inactive_customer,
    COUNT(CASE WHEN active = 1 THEN 1 END) AS active_customer
FROM customer
GROUP BY store_id;

SELECT store_id, COUNT(*) 
FROM customer 
WHERE active = 1
GROUP BY store_id

UNION 

SELECT store_id, COUNT(*) 
FROM customer 
WHERE active = 0
GROUP BY store_id;
/*
12.	Can you pull for me a list of each film we have in inventory?
I would like to see the film’s title, description, and the store_id value associated with each item, and its inventory_id. Thanks!
*/
select f.film_id ,i.store_id, i.inventory_id, f.title, f.description
from inventory i inner join film f using(film_id)
order by i.store_id, i.inventory_id;

/*
13.	One of our investors is interested in the films we carry and how many actors are listed for each film title.
Can you pull a list of all titles, and figure out how many actors are associated with each title?
*/
SELECT f.title, COUNT(fa.actor_id) AS num_actor
FROM film f JOIN film_actor fa USING (film_id)
GROUP BY f.title
ORDER BY num_actor;


SELECT f.title, COUNT(fa.actor_id) AS num_actor
FROM film f LEFT JOIN film_actor fa USING (film_id)
GROUP BY f.title
ORDER BY num_actor;

/*
14.	Customers often ask which films their favorite actors appear in.
It would be great to have a list of all actors, with each film title that they appear in. 
Could you please pull that for me?
*/
SELECT a.actor_id, a.first_name, a.last_name, f.title
FROM actor a LEFT JOIN  film_actor fa USING (actor_id)
	LEFT JOIN film f USING (film_id)
ORDER BY last_name, first_name;

/*
15.	The Manager from Store 2 is working on expanding our film collection there.
Could you pull a list of distinct titles and their descriptions, currently available in inventory at store 2?
*/
SELECT DISTINCT f.title, f.description 
FROM film f JOIN inventory i USING(film_id) 
WHERE i.store_id = 2;

