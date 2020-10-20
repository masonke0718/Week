-- Hello World SQL Query, SELECT all records from actor table
SELECT *
FROM actor;

-- Query for First_name and last_name in the actor table
SELECT first_name, last_name
FROM actor;

-- Query for a first_name that equals Nick using the LIKE clause with WHERE clause

SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query for a first_name that is equal to Nick using the LIKE and WHERE clauses
SELECT first_name,last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_name data that starts with a J using the LIKE and WHERE clauses using the wildcard
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that starts with K and 2 letters after the K using LIKE and WHERE clauses -- using underscore
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_name data that starts with a K and ends with th
-- using the LIKE and WHERE clauses -- using BOTH wildcard AND underscore

SELECT first_name,last_name,actor_id
FROM actor
WHERE first_name LIKE 'K__%th';

-- Camparing operators are:
-- Greater Than (>) -- Less Than (<)
-- Not Equal (<>)

-- Explore Data with SELECT ALL Query (Specific to changing into new table)
SELECT *
FROM payment;

-- Query for data that shows customers who paid
-- an amount GREATER than $2
SELECT customer_id,amount
FROM payment
WHERE amount > 2.00;

-- Query for data that shows customers who paid
-- an amount LESS Than $7.99
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- Query for data that shows customers who paid
-- an amount LESS Than or EQUAL to $7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- Query for data that shows customers who paid
-- an amount GREATER Than or EQUAL to $2.00
-- in Ascending order
SELECT customer_id,amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

-- Query for data that shows customers who paid
-- an amount BETWEEN $2.00 and $7.99.  Using the BETWEEN with the AND clauses
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query for data that shows customers who paid
-- and amount NOT EQUAL to $0.00
-- Ordered in DESCENDING order
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- SQL Aggregations => SUM(),AVG(),COUNT(),MIN(),MAX()
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display average of amounts payed that are greater than $5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of amounts payed that are Greater Than $5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of DISTINCT amounts payed that are Greater Than $5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Query to display MIN amount Greater Than $7.99
SELECT MIN(amount) as Min_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Query to display MAX amount Greater Than $7.99
SELECT MAX(amount) AS Max_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Query to display all amounts(quick demo of Group By)
SELECT amount
FROM payment
WHERE amount = 10.99;

-- Query to display different amounts grouped together
-- and count the amounts
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

--Query to display customer_ids with the summed amounts for each customer_id
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

--Query to display customer_ids with the summed amounts for each customer_id -- Separate example
-- of a different way to use Group By
SELECT customer_id, amount
FROM payment
GROUP BY amount,customer_id
ORDER BY customer_id DESC;

-- Query to explore the data inside of the customer table
Select *
FROM customer;

-- Query to display customer_ids that show up more than 5 times
-- Grouping by the customer's email
SELECT COUNT(customer_id),email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 5;


-- HOMEWORK

-- Question 1

SELECT *
FROM actor;

SELECT COUNT(last_name)
FROM Actor
WHERE last_name = 'Wahlberg';

-- Question 2

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Question 3

SELECT *
FROM inventory;

--SELECT store_id, film_id
--FROM inventory
--GROUP BY film_id
--ORDER BY film_id DESC;

-- Question #4

SELECT COUNT (last_name)
FROM customer
WHERE last_name = 'William';

-- Question #5

SELECT staff_id, SUM(amount)
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount);
--Store employee (staff_id = 2) sold the most rentals

-- Question #6

SELECT COUNT(DISTINCT district)
FROM address;
-- There are 378 distinct district names

-- Question #7
SELECT film_id, COUNT(DISTINCT actor_id)
FROM film_actor
GROUP BY film_id, actor_id
ORDER BY actor_id;

-- Question #8

SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '__%es';
--21 Customers have a last name ending with 'es'

--Question #9

SELECT COUNT(rental_id), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;
-- 3 payment amounts had a number of rentals above 250 for customers with ids between 380 and 430

SELECT film_id, COUNT(DISTINCT actor_id)
FROM film_actor
GROUP BY film_id, actor_id
ORDER BY actor_id;