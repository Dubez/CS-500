--Dubem Ezeh (HW3)

-- this is for Q1

select count(distinct team) 
from nba 
where season_start=2017;

-- this is for Q2

select player, salary 
from nba 
where salary=(select max(salary) from nba);

-- this is for Q3

select player, salary, team, season 
from nba 
where salary=(select min(salary) from nba);

-- this is for Q4

select player, count(*) number_of_years 
from nba 
where team='Philadelphia 76ers' 
group by player 
having count(*)>5 
order by number_of_years desc;

-- this is for Q5

select player, team, salary, season 
from nba 
where player='Allen Iverson' 
order by season;

-- this is for Q6

select player, count(*) years_played, min(season_start) as first_year 
from nba 
group by player 
having count(*)>20;

-- this is for Q7

select team, min(season_start) as first, max(season_end) as last, count(distinct season) no_years 
from nba 
group by team 
order by team;

-- this is for Q8

select team, min(season_start) as first_year 
from nba 
group by team 
having min(season_start) = (select max(n.first_year) from (select team, min(season_start) as first_year from nba group by team) as n);

-- this is for Q9

select team, count(distinct player) number_of_players 
from nba 
group by team 
having count(distinct player) = (select max(n.number_of_players) from (select team, count(distinct player) number_of_players from nba group by team) as n);

-- this is for Q10

select player, count(distinct team) number_of_teams 
from nba 
group by player 
having count(distinct team)= (select max(n.num_of_teams) from (select player, count(distinct team) num_of_teams from nba group by player) as n);


