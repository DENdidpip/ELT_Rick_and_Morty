{{ config(
    materialized='table'
) }}

select
    raw_data:id::int as id,
    raw_data:name::string as name,
    raw_data:dimension::string as dimension,
    raw_data:type::string as type,
    raw_data:created::timestamp as created,
    raw_data:url::string as url
from raw.location.loc

