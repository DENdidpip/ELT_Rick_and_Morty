{{ config(
    materialized='table'
) }}
select
    raw_data:id::int as character_id,
    split_part(
        episode.value::string,
        '/',
        6
    )::int as episode_id

from RAW.CHARACTER.char,

lateral flatten(
    input => raw_data:episode
) as episode

