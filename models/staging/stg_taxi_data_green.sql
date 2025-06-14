{{ config(materialized='view') }}

select *
from {{ source('nyc_taxi', 'tlc_green_trips_2022') }}
