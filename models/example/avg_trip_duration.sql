with source_data as (

  select *
  from {{ source('citibike', 'citibike_trips') }}

),

aggregated as (

  select
    start_station_name,
    avg(tripduration) as avg_trip_duration
  from source_data
  group by 1

)

select * from aggregated
