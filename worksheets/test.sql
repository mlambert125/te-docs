select title, length_minutes 
from movie 
where length_minutes = (select max(length_minutes) from movie)
limit 3;

select title, length_minutes 
from movie 
where director_id in (select person_id from person where birthday > '1970-01-01') 
limit 3;
