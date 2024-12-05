insert into films 
with preparared_data as (
		select actor as actor_name,
        	   actorid,
    	       film,
               votes,
               rating,
               filmid,
               
               case
               		when rating  <= 6 then 'bad' 
               		when rating  > 6 and rating  <= 7 then 'average' 
               		when rating  > 7 and rating  <= 8  then 'good' 
               		else 'star'::quality_class
               end as quality_class,
               year
		from actor_films 
		
		),
	actors_data as (
		select	actor_name,
				actorid,
				array[
				(film, votes, rating, filmid)
				]::actors[] as actors,
				quality_class,
				year is not null as is_active,
				year
		from preparared_data
	)
	

select  
    *
from actors_data
ON CONFLICT (actor_name, actorid) 
DO NOTHING;

