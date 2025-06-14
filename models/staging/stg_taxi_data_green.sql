{{ config(materialized='view') }}

-- This is your raw, materialized table
select *
from {{ source('new_york_taxi_trips', 'tlc_green_trips_2022') }}