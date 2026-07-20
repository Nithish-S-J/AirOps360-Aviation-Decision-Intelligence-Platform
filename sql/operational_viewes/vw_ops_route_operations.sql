CREATE OR ALTER VIEW dbo.vw_ops_route_operations
AS

SELECT

    /*==========================================================
      ROUTE
    ==========================================================*/

    r.route_key,

    r.origin_airport,

    r.destination_airport,

    d.year,

    d.quarter,

    d.month,

    d.month_name,

    /*==========================================================
      FLIGHT OPERATIONS
    ==========================================================*/

    COUNT(*) AS total_flights,

    AVG(f.DEP_DELAY) AS avg_departure_delay,

    AVG(f.ARR_DELAY) AS avg_arrival_delay,

    SUM(CASE WHEN f.CANCELLED = 1 THEN 1 ELSE 0 END) AS cancelled_flights,

    SUM(CASE WHEN f.DIVERTED = 1 THEN 1 ELSE 0 END) AS diverted_flights,

    SUM(f.DISTANCE) AS total_distance,

    AVG(f.AIR_TIME) AS avg_air_time,

    COUNT(*) AS flight_records

FROM fact_flights f

INNER JOIN dim_route r
    ON f.route_key = r.route_key

INNER JOIN dim_date d
    ON f.date_key = d.date_key

GROUP BY

    r.route_key,
    r.origin_airport,
    r.destination_airport,
    d.year,
    d.quarter,
    d.month,
    d.month_name;
GO
