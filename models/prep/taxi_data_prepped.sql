{{ config(materialized='view') }}


WITH taxi_reordered AS (
    SELECT * ,
    TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, MINUTE) AS trip_duration_minutes,
    TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, SECOND) AS trip_duration_seconds
    FROM {{ref('stg_taxi_data')}}
)
SELECT * 
FROM taxi_reordered