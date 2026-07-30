{{ config(
    materialized='table'
) }}

select distinct
    raw_data:id::int as episode_id,
    {{ extract_id("character.value::string")}} as character_id

from RAW.EPISODE.EP,

lateral flatten(
    input => raw_data:characters
) as character