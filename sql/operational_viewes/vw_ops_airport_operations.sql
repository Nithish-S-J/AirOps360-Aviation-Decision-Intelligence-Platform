CREATE OR ALTER VIEW dbo.vw_ops_airport_operations
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
      OPERATIONS
    ==========================================================*/

    SUM(f.actual_departures)                    AS actual_departures,

    SUM(f.actual_arrivals)                      AS actual_arrivals,

    SUM(f.departure_cancellations)              AS departure_cancellations,

    SUM(f.arrival_cancellations)                AS arrival_cancellations,

    SUM(f.departure_diversions)                 AS departure_diversions,

    SUM(f.arrival_diversions)                   AS arrival_diversions,

    AVG(f.on_time_gate_departure_pct)           AS avg_on_time_departure_pct,

    AVG(f.on_time_gate_arrival_pct)             AS avg_on_time_arrival_pct,

    AVG(f.avg_gate_departure_delay)             AS avg_gate_departure_delay,

    AVG(f.avg_gate_arrival_delay)               AS avg_gate_arrival_delay,

    AVG(f.avg_block_delay)                      AS avg_block_delay,

    AVG(f.avg_taxi_out_time)                    AS avg_taxi_out_time,

    AVG(f.avg_taxi_in_time)                     AS avg_taxi_in_time,

    SUM(f.delayed_arrivals)                     AS delayed_arrivals,

    AVG(f.avg_delay_per_delayed_arrival)        AS avg_delay_per_delayed_arrival,

    COUNT(*)                                    AS operation_records

FROM fact_airport_operations f

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
