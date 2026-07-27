{{ config(
    materialized='table'
) }}

select
    raw_data:id::int as location_id,
    split_part(
        residents.value::string,
        '/',
        6
    )::int as resident_id
from raw.location.loc,

lateral flatten(
    input => raw_data:residents
)as residents