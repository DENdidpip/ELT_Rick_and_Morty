{{config(
 materialized='table'
)}}

select
    raw_data:id::int as episode_id,
    raw_data:name::string as name,
    raw_data:episode::string as episode,
    raw_data:created::timestamp as created,
    raw_data:url::string as url,
    raw_data:air_date::string as air_date
from raw.episode.ep