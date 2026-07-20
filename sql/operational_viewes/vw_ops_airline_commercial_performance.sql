CREATE OR ALTER VIEW dbo.vw_ops_airline_commercial_performance
AS

SELECT

    -- ======================================
    -- Business Keys
    -- ======================================

    da.airline_key,
    da.unique_carrier,
    da.airline_name,

    dd.year,
    dd.quarter,
    dd.month,
    dd.month_name,

    -- ======================================
    -- Commercial Metrics
    -- ======================================

    SUM(fat.departures_scheduled)     AS scheduled_departures,

    SUM(fat.passengers)               AS total_passengers,

    SUM(fat.seats)                    AS total_seats,

    SUM(fat.freight)                  AS total_freight,

    SUM(fat.mail)                     AS total_mail,

    SUM(fat.payload)                  AS total_payload,

    SUM(fat.distance)                 AS total_distance,

    SUM(fat.air_time)                 AS total_air_time,

    SUM(fat.ramp_to_ramp)             AS total_ramp_time,

    COUNT(*)                          AS traffic_records

FROM fact_airline_traffic fat

INNER JOIN dim_airline da

ON fat.airline_key = da.airline_key

INNER JOIN dim_date dd

ON fat.date_key = dd.date_key

GROUP BY

    da.airline_key,
    da.unique_carrier,
    da.airline_name,

    dd.year,
    dd.quarter,
    dd.month,
    dd.month_name;
GO
