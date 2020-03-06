/*Q2a.*/

select distinct d.dish 
from dishes d, foods f 
where f.food = d.food 
and f.category='meat' 
intersect 
select d.dish 
from dishes d, foods f 
where f.food = d.food 
and f.category='veg' 
order by dish;


/*Q2b.*/

select category 
from foods 
except 
select f.category 
from foods f, dishes d  
where d.food = f.food;


/*Q2c.*/

select dish, count(*) as num_ingredients 
from dishes 
group by dish;


/*Q2d*/

select d.dish, count(*) as num_ingredients, sum(f.calories) as total_calories 
from dishes d, foods f 
where f.food=d.food 
group by d.dish 
having sum(f.calories)<250;


/*Q2e*/

select d.dish, sum(f.calories) as total_calories 
from dishes d, foods f 
where f.food=d.food 
group by d.dish 
having count(*)=3;

