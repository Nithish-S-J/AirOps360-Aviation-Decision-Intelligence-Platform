CREATE OR ALTER VIEW dbo.vw_ops_airport_capacity
AS

SELECT

    /*==========================================================
      AIRPORT
    ==========================================================*/

    ap.airport_key,

    ap.iata_code,

    ap.airport_name,

    ap.city,

    ap.country,

    ap.latitude,

    ap.longitude,

    /*==========================================================
      DATE
    ==========================================================*/

    dd.year,

    dd.quarter,

    dd.month,

    dd.month_name,

    /*==========================================================
      AIRPORT CAPACITY METRICS
    ==========================================================*/

    SUM(f.air_carrier_operations)               AS air_carrier_operations,

    SUM(f.air_taxi_operations)                  AS air_taxi_operations,

    SUM(f.general_aviation_operations)          AS general_aviation_operations,

    SUM(f.itinerant_military_operations)        AS itinerant_military_operations,

    SUM(f.itinerant_total_operations)           AS itinerant_total_operations,

    SUM(f.local_civil_operations)               AS local_civil_operations,

    SUM(f.local_military_operations)            AS local_military_operations,

    SUM(f.local_total_operations)               AS local_total_operations,

    SUM(f.total_operations)                     AS total_operations,

    COUNT(*)                                    AS capacity_records

FROM fact_airport_capacity f

INNER JOIN dim_airport ap

ON f.airport_key = ap.airport_key

INNER JOIN dim_date dd

ON f.date_key = dd.date_key

GROUP BY

    ap.airport_key,

    ap.iata_code,

    ap.airport_name,

    ap.city,

    ap.country,

    ap.latitude,

    ap.longitude,

    dd.year,

    dd.quarter,

    dd.month,

    dd.month_name;
GO
