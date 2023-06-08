-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id
WHERE district LIKE 'Texas'
ORDER BY first_name;
-- The customers who live in Texas are Bryan Hardison, Ian Still, Jennifer Davis, Kim Cruz, and Richard McCrary


-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY first_name;
-- There are 27 payments above $6.99 belong to Alfredo McAdams, Alvin Deloach, Douglas Graf, Mary Smith, and Peter Menard


-- 3. Show all customers names who have made payments over $175 (use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);
-- The customers who have made payments over $175 are Mary Smith and Douglas Graf


-- 4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE city_id IN(
    SELECT city_id
    FROM city
    INNER JOIN country
    ON city.country_id = country.country_id
    WHERE country LIKE 'Nepal';
)
-- The only customer that live in Nepal is Kevin Schuler


-- 5. Which staff member had the most transactions?
SELECT *
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
WHERE staff.first_name = 'Mike'; --7292

SELECT *
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
WHERE staff.first_name = 'Jon'; -- 7304
-- Jon Stephens had the most transactions


-- 6. How many movies of each rating are there?
SELECT rating, COUNT(rating) 
FROM film 
GROUP BY rating
ORDER BY rating;
-- There are 178 G rated films, 194 PG rated films, 223 PG-13 rated films, 196 R rated films, and 209 NC-17 rated films


-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY payment.customer_id
    HAVING COUNT(amount) = 1  
)
ORDER BY first_name;
-- There are 3 customers who made a single payment above $6.99: Alfredo McAdams, Alvin Deloach, and Douglas Graf


-- 8. How many free rentals did our stores give away?
SELECT amount 
FROM payment
WHERE amount = 0;
-- The store has given out 0 free rentals