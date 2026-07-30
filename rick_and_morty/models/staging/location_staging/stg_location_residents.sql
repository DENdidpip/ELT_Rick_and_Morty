{{ config(
    materialized='table'
) }}

select
    raw_data:id::int as location_id,
    {{ extract_id("residents.value::string")}} as resident_id
from raw.location.loc,

lateral flatten(
    input => raw_data:residents
)as residents