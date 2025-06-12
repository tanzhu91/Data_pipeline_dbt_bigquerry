{{ config(materialized='view') }}

SELECT *
FROM {{ source('citibike', 'citibike_trips') }}
WHERE starttime IS NOT NULL , stoptime IS NOT NULL , birth_year IS NOT NULL  AND tipduration IS NOT NULL
