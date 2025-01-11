use sakila;
-- create view view_film_summary as 
-- select title,description,release_year
-- from film;
-- select*from view_film_summary;


grant select on film to'customer'@'localhost';
revoke select on film from 'customer'@'localhost';
grant select on view_film_summary to 'customer'@'localhost';
