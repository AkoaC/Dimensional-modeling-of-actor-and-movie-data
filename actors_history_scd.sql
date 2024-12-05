create table if not exists actors_history_scd (
					actor_name text,
					actorid text,
					actors actors[],
					quality_class quality_class,
					is_active boolean,
					start_date integer,
					end_date integer,
					primary key (actor_name, actorid)
						

);

--drop table actors_history_scd;


insert into actors_history_scd 

with pipeline_query as (
			select 
				actor_name,
				actorid,
				actors,
				quality_class,
				is_active,
				year
			from films
			
    ),
    
     actors_data as (
            select   	
    			actor_name,
				actorid,
				actors,
				quality_class,
				is_active,
				MAX(year) AS start_date,
        		MIN(year) AS end_date
        		
    		FROM pipeline_query
  			GROUP BY actor_name, actorid, actors, quality_class, is_active
    )
    

select * from actors_data
ON CONFLICT (actor_name, actorid) 
DO NOTHING;

