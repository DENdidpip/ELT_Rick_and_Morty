{{ config(
    materialized='table'
) }}
select distinct
    raw_data:id::int as character_id,
    {{ extract_id("episode.value::string") }} as episode_id


from RAW.CHARACTER.char,

lateral flatten(
    input => raw_data:episode
) as episode

order by character_id