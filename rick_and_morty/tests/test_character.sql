select * from DWH.CHARACTER_STAGING.STG_CHARACTER
where CHARACTER_ID is null
   or NAME is null
   or STATUS is null
   or SPECIES is null
   or GENDER is null
   or TYPE is null
   or CREATED is null
   or IMAGE is null
   or CHARACTER_URL is null
   or ORIGIN_NAME is null
   or ORIGIN_URL is null
   or LOCATION_NAME is null
   or LOCATION_URL is null

select * from DWH.CHARACTER_STAGING.STG_CHARACTER
group by character_id
having count(*) > 1
