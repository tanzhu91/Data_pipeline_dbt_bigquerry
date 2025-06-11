{{ config(materialized='view') }}

-- This is your raw, materialized table
select *
from {{ source('citibike', 'citibike_trips') }}
