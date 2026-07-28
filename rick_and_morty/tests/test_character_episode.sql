select
    character_id,
    episode_id,
    count(*) as cnt
from DWH.CHARACTER_STAGING.STG_CHARACTER_EPISODE
group by
    character_id,
    episode_id
having count(*) > 1;