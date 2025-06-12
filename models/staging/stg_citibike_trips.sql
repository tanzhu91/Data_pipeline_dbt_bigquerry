{{ config(materialized='view') }}

SELECT *
FROM {{ source('citibike', 'citibike_trips') }}
WHERE starttime IS NOT NULL
  AND stoptime IS NOT NULL
  AND birth_year IS NOT NULL
  AND tripduration IS NOT NULL
