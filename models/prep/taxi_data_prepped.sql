{{ config(materialized='view') }}


WITH taxi_reordered AS (
    SELECT * ,
    TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, SECOND) AS trip_duration_seconds,
    TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, SECOND) / 60.0 AS trip_duration_minutes
    FROM {{ref('stg_taxi_data')}}
)
SELECT * 
FROM taxi_reordered