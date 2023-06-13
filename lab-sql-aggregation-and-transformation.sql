USE sakila;

show tables;

SELECT * FROM actor, address, category;

SELECT *
FROM actor
WHERE first_name = 'SCARLETT';

SELECT *
FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

SELECT * 
from film;

SELECT * 
from film
WHERE special_features LIKE '%Behind the Scenes%';



SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;


SELECT DISTINCT language_id AS language
FROM film;

SELECT title, language_id
FROM film;

SELECT DISTINCT store_id FROM store;

SELECT COUNT(DISTINCT store_id) AS count
FROM store;

SELECT COUNT(DISTINCT staff_id) as count
FROM staff;

SELECT * FROM staff;
SELECT COUNT(staff_id) AS employee_count
FROM staff;

SELECT COUNT(title) FROM film;
SELECT COUNT(rental_id) from rental;
SELECT COUNT(inventory_id) from rental;

SELECT COUNT(rental_id) FROM payment WHERE rental_id IN(SELECT rental_id FROM payment GROUP BY
rental_id HAVING COUNT(rental_id) < 2); 

SELECT COUNT(payment_id) FROM payment WHERE rental_id IN(SELECT rental_id FROM payment GROUP BY
rental_id HAVING COUNT(rental_id) < 2); 



SELECT COUNT(DISTINCT release_year) FROM film;


SELECT* FROM rental;

SELECT first_name FROM staff;

SELECT max(length) FROM film as max_duration;
SELECT min(length) FROM film as min_duration;

SELECT floor(avg(length)) FROM film as average_length;
SELECT min(rental_date) FROM rental as store_opening; 2005-05-24 22:53:30
SELECT max(rental_date) FROM rental as present; 2006-02-14 15:16:03
SELECT datediff((SELECT min(rental_date) FROM rental),(SELECT max(rental_date) FROM rental))AS date_difference;
SELECT * FROM rental;
SELECT *,DATE_FORMAT(rental_date, '%M') AS rental_month,DATE_FORMAT(rental_date, '%W') AS rental_weekday
FROM rental LIMIT 20;

SELECT *,CASE WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
ELSE 'workday' END AS DAY_TYPE
FROM rental;

SELECT *,CASE WHEN DAYOFWEEK(rental_date) IN (2, 3, 4, 5, 6) THEN 'workday'
ELSE 'weekend' END AS DAY_TYPE
FROM rental;

ALTER TABLE rental
ADD rental_duration INT;

UPDATE rental SET rental_duration = DATEDIFF(return_date, rental_date);

SELECT title, COALESCE(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY title;

SELECT title FROM film, SELECT rental_duration
FROM rental
JOIN rental ON title;

SELECT * from film;
SELECT * from rental;



SELECT CONCAT(first_name, ' ', last_name) AS full_name, LEFT(email, 3) AS email_prefix
FROM customer
ORDER BY last_name ASC;

SELECT rating, count(film_id) AS film_count
FROM film
GROUP BY rating ORDER BY film_count DESC;

SELECT staff_id, COUNT(rental_id) AS rental_count
FROM rental
GROUP BY staff_id;


SELECT rating, ROUND(AVG(length), 2) AS mean_length FROM film
WHERE rating IN ('PG-13', 'NC-17', 'R','PG','G')
GROUP BY rating
ORDER BY mean_length DESC;

SELECT rating, ROUND(AVG(length), 2) AS mean_length FROM film
WHERE rating IN ('PG-13', 'NC-17', 'R','PG','G')
GROUP BY rating Having mean_length > 120.00;

SELECT last_name FROM actor GROUP BY last_name Having COUNT(last_name) < 2;



