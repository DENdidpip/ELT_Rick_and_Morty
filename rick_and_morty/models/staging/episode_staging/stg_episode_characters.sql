{{ config(
    materialized='table'
) }}

select
    raw_data:id::int as episode_id,
    split_part(
        character.value::string,
        '/',
        6
    )::int as character_id

from RAW.EPISODE.EP,

lateral flatten(
    input => raw_data:characters
) as character