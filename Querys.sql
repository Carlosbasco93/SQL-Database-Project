-- Cuantos actores tenemos en nuestra BBDD
select count(full_name) from actor; -- 199 Nº de actores 

select count(film_id) from film; -- 1000 películas

select store_id ,count(film_id) as num_films from inventory group by store_id; -- 503 en el almacén 1 y 497 en el almacen 2

select title, length, rating from film order by length desc limit 3; -- Top 3 películas más largas

select c.name as Category, count(c.name) as Count, count(c.name)/1000*100 as "%" from film as f inner join old_HDD as o on o.film_id = f.film_id inner join category as c on c.category_id = o.category_id group by c.name; -- % de Categorias / Num pelis

select count(f.film_id) as Count from film as f left join old_HDD as o on o.film_id = f.film_id where o.film_id is null group by o.film_id; -- Nº de películas sin actores 386

select ceil(avg(timestampdiff(DAY, rental_date, return_date))) as Rental_avg from rental; -- Promedio de días de devolución de alquiler

select title, length,c.name as category,count(o.actor_id) as num_actors -- Top 10 peliculas con más actores
from film as f left join old_HDD as o on f.film_id = o.film_id 
left join category as c on c.category_id = o.category_id 
group by f.title, c.name, length 
order by num_actors desc 
limit 10;

select title, length,c.name as category, ceil(avg(rental_rate)) as avr_rate,count(o.actor_id) as num_actors -- Top 5 films mejor valoradas y con más actores
from film as f left join old_HDD as o on f.film_id = o.film_id 
left join category as c on c.category_id = o.category_id 
where c.name != 'New' 
group by f.title, c.name, length, rental_rate 
order by avr_rate desc, num_actors desc
limit 5;
