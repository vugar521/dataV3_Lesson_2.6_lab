-- 1.
 -- In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
-- So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

use sakila;
select * from actor;
select distinct(last_name) from actor;


-- 2.
-- Which last names appear more than once? 
-- We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

select last_name from actor
GROUP BY last_name
having count(last_name)>1;

-- 3.
-- Using the rental table, find out how many rentals were processed by each employee.
select * from rental;

select staff_id, count(rental_id) from rental
GROUP BY staff_id;

-- 4.Using the film table, find out how many films were released each year.

select * from film;
select release_year, count(film_id) from film
GROUP BY release_year;



-- 5. Using the film table, find out for each rating how many films were there.
select * from film;

select rating, count(film_id) from film
GROUP BY rating;



-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select * from film;

select rating, avg(length) from film
GROUP BY rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?

select rating, avg(length) from film
where avg > 120
GROUP BY rating;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank
select * from film;

select title, length,
rank() OVER (order by length) as rank_
from sakila.film
WHERE length IS not NULL and length <> 0;