{{ config(materialized='view') }}


WITH bike_reordered AS (
    SELECT * ,
    DATETIME_DIFF(stoptime, starttime, MINUTE) AS trip_duration_minutes,
    tripduration / 60.0 as trip_duration_minutes_exact
    FROM {{ref('stg_citibike_trips')}}
)
SELECT * 
FROM bike_reordered