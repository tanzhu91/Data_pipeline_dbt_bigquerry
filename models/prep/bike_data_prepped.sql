{{ config(materialized='view') }}


WITH bike_reordered AS (
    SELECT * ,
    TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, MINUTE) AS trip_duration_minutes
    FROM {{ref('stg_citibike_trips')}}
)
SELECT * 
FROM bike_reordered