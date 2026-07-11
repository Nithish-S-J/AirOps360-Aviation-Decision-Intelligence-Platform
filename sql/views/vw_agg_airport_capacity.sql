CREATE OR ALTER VIEW dbo.vw_agg_airport_capacity
AS

SELECT
    date_key,
    airport_key,

    SUM(air_carrier_operations)
        AS air_carrier_operations,

    SUM(air_taxi_operations)
        AS air_taxi_operations,

    SUM(general_aviation_operations)
        AS general_aviation_operations,

    SUM(itinerant_military_operations)
        AS itinerant_military_operations,

    SUM(itinerant_total_operations)
        AS itinerant_total_operations,

    SUM(local_civil_operations)
        AS local_civil_operations,

    SUM(local_military_operations)
        AS local_military_operations,

    SUM(local_total_operations)
        AS local_total_operations,

    SUM(total_operations)
        AS total_operations

FROM dbo.fact_airport_capacity

GROUP BY
    date_key,
    airport_key;
