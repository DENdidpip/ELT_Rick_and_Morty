select
    c.name,
    count(ec.episode_id) as episodes_count

from dwh.character_staging.stg_character c

join dwh.character_staging.stg_character_episode ec
    on ec.character_id = c.character_id

group by c.name
order by c.name