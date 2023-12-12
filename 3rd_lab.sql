use sakila;

-- 1. How many distinct (different) actors' last names are there?
select COUNT(distinct last_name) as distinct_last_names_count
from actor;
-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)film
select COUNT(distinct language_id) as distinct_languages_count
from film;

-- 3. How many movies were released with "PG-13" rating?

select count(*) as "Number of movies with PG" from sakila.film
where rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006.
 
select film_id, title, length, release_year
from film
where release_year = 2006
order by length desc
limit 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)

select DATEDIFF(CURDATE(), last_update) AS days_operating
from store;

-- 6. Show rental info with additional columns month and weekday. Get 20
select *,
       month(rental_date) as rental_month,
       DAYNAME(rental_date) as rental_weekday
from rental
limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
       month(rental_date) as rental_month,
       DAYNAME(rental_date) as rental_weekday,
       case 
           when DAYOFWEEK(rental_date) in (1, 7) then 'weekend'
           else 'workday'
       end as day_type
from rental;

-- 8. How many rentals were in the last month of activity?

select COUNT(*) as rentals_last_month
from rental
where month(rental_date) = month(NOW()) and year(rental_date) = year(NOW());


 
 