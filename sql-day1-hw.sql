-- Homework Day 1 SQL

-- 1. How many actors are there with the last name ‘Wahlberg’?
-- Answer: 2
select last_name
from actor where last_name like 'Wahlberg';



-- 2. How many payments were made between $3.99 and $5.99?
-- Answer: 4,764
select count(amount)
from payment
where amount between 3.99 and 5.99;



-- 3. What film does the store have the most of? (search in inventory)
-- Answer: film 200 with 9
select film_id, count(film_id)
from inventory
group by film_id
order by count(film_id) desc;


-- 4. How many customers have the last name ‘William’?
-- Answer: 0
select last_name, count(last_name)
from customer
where last_name = 'William'
group by last_name;



-- 5. What store employee (get the id) sold the most rentals?
-- Answer: Staff 1 with 8,040 rentals
select staff_id, count(rental_id)
from rental
group by staff_id 
order by count(rental_id) desc;



-- 6. How many different district names are there?
-- Answer: 378
select count(distinct district)
from address;



-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Answer: film 508 with 16 actors
select film_id, count(actor_id)
from film_actor
group by film_id
order by count(actor_id) desc;



-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- Answer: 21
select count(last_name)
from customer
where last_name like '%es';

-- To show the last names (there's 21 of them)
select last_name
from customer
where last_name like '%es';


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--    with ids between 380 and 430? (use group by and having > 250)
-- Answer: 0
select customer_id, count(amount)
from payment
where amount > 250.00 and customer_id between 380 and 430
group by customer_id;

-- Checking work to show there aren't any
select customer_id, amount
from payment
where amount > 250.00;



-- 10. Within the film table, how many rating categories are there? And what rating has the most
--     movies total?
-- Answer: 5 rating categories, PG-13 has the most with 223

-- Count the number of rating categories
select count(distinct rating)
from film;

-- Show the rating categories with number of movies rated in descending order
select rating, count(rating)
from film
group by rating
order by count(rating) desc;
