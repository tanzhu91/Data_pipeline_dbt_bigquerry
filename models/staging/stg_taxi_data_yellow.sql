{{ config(materialized='view') }}

-- This is your raw, materialized table
select *
from {{ source('nyc_taxi', 'tlc_yellow_trips_2022') }}