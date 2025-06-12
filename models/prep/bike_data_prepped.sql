{{ config(materialized='view') }}


WITH bike_reordered AS (
    SELECT * ,
    DATETIME_DIFF(stoptime, starttime, MINUTE) AS trip_duration_minutes
    FROM {{ref('stg_citibike_trips')}}
)
SELECT * 
FROM bike_reordered