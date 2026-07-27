{{ config(
    materialized='table'
) }}

select
    raw_data:id::int as character_id,
    raw_data:name::string as name,
    raw_data:status::string as status,
    raw_data:species::string as species,
    raw_data:gender::string as gender,
    raw_data:type::string as type,
    raw_data:created::timestamp as created,
    raw_data:image::string as image,
    raw_data:url::string as character_url,
    raw_data:origin.name::string as origin_name,
    raw_data:origin.url::string as origin_url,
    raw_data:location.name::string as location_name,
    raw_data:location.url::string as location_url
from RAW.CHARACTER.char