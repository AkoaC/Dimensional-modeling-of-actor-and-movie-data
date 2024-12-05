do $$
begin
	if not exists ( select 1 from pg_type where typname = 'quality_class' ) 
				then create type quality_class as enum
					( 'star', 'good' , 'average' , 'bad' );
	end if;
end $$;



do $$
begin
	if not exists ( select 1 from pg_type where typname = 'actors' ) 
				then create type actors as (
				    film text,
					votes Integer,
					rating real,
					filmid text
          );
	end if;
end $$;


create table if not exists films (
					actor_name text,
					actorid text,
					actors actors[],
					quality_class quality_class,
					is_active BOOLEAN,
					year integer,
					primary key (actor_name, actorid)
						

);


--drop table films;





