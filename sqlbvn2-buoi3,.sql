-- Từ bảng DB “coffee_store” đã xây dựng trong buổi học.
-- Hãy hoàn thành các câu truy vấn tương ứng trong file đính kèm “”USE coffee_store;

USE ca_phe;
/* 1. From the customers table, 
select the first name and phone number of all the females who have a last name of Bluth. */

SELECT first_name, phone_number FROM customers
WHERE gender = 'Female' AND last_name = 'Bluth';

/* 2. From the products table, select the name for all products that have a price greater than 3.00 or a coffee origin of Sri Lanka. */
SELECT name FROM products
WHERE price > 3.00 OR coffee_origin = 'Sri Lanka';

/* 3. How many male customers don’t have a phone number entered into the customers table? */
SELECT COUNT(*) AS male_customers_without_phone FROM customers

WHERE gender = 'Male' AND phone_number IS NULL;
/* 4. From the products table, select the name and price of all products with a coffee origin equal to Colombia or Indonesia. Ordered by name from A-Z. */
SELECT name, price FROM products
WHERE coffee_origin IN ('Colombia', 'Indonesia') ORDER BY name ASC;

/* 5. From the orders table, select all the orders from February 2017 for customers with id’s of 2, 4, 6 or 8. */
SELECT *FROM orders
WHERE customer_id IN (2, 4, 6, 8)  AND order_date BETWEEN '2017-02-01' AND '2017-02-28';


/* 6. From the customers table, select the first name and phone number of all customers who’s last name contains the pattern ‘ar’. */
SELECT first_name, phone_number FROM customers
WHERE last_name LIKE '%ar%';

/* 7. From the customers table, select distinct last names and order alphabetically from A-Z. */
SELECT DISTINCT last_name FROM customers
ORDER BY last_name ASC;

/* 8. From the orders table, select the first 3 orders placed by customer with id 1, in February 2017. */

SELECT * FROM orders
WHERE customer_id = 1 AND order_date BETWEEN '2017-02-01' AND '2017-02-28'
ORDER BY order_date ASC
LIMIT 3;

/* 9. From the products table, select the name, price and coffee origin but rename the price to retail_price in the results set. */
SELECT name, price AS retail_price, coffee_origin FROM products;

/* 10. Select the order id and customers phone number for all orders of product id 4. */

SELECT orders.order_id, customers.phone_number FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
WHERE product_id = 4;

/* 11. Select the product name and order time for filter coffees sold between January 15th 2017 and February 14th 2017. */
SELECT products.name, orders.order_time FROM orders
JOIN products ON orders.product_id = products.product_id
WHERE products.name LIKE '%filter coffee%' AND orders.order_date BETWEEN '2017-01-15' AND '2017-02-14';

 
/* 12. Select the product name and price and order time for all orders from females in January 2017. */
SELECT products.name, products.price, orders.order_time FROM orders

JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id
WHERE customers.gender = 'Female' AND orders.order_date BETWEEN '2017-01-01' AND '2017-01-31';




 