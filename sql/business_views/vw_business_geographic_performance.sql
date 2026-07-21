CREATE OR ALTER VIEW dbo.vw_business_geographic_performance
AS

SELECT

/*==========================================================
    GEOGRAPHY
==========================================================*/

country,

city,

year,

quarter,

month,

month_name,

/*==========================================================
    AIRPORT FOOTPRINT
==========================================================*/

COUNT(DISTINCT airport_key)                    AS airport_count,

/*==========================================================
    OPERATIONAL METRICS
==========================================================*/

SUM(actual_departures)                         AS total_departures,

SUM(actual_arrivals)                           AS total_arrivals,

SUM(departure_cancellations)                   AS total_departure_cancellations,

SUM(arrival_cancellations)                     AS total_arrival_cancellations,

SUM(departure_diversions)                      AS total_departure_diversions,

SUM(arrival_diversions)                        AS total_arrival_diversions,

AVG(avg_on_time_departure_pct)                 AS avg_on_time_departure_pct,

AVG(avg_on_time_arrival_pct)                   AS avg_on_time_arrival_pct,

AVG(avg_gate_departure_delay)                  AS avg_departure_delay,

AVG(avg_gate_arrival_delay)                    AS avg_arrival_delay,

AVG(avg_block_delay)                           AS avg_block_delay,

AVG(avg_taxi_out_time)                         AS avg_taxi_out_time,

AVG(avg_taxi_in_time)                          AS avg_taxi_in_time,

SUM(delayed_arrivals)                          AS delayed_arrivals,

/*==========================================================
    CAPACITY METRICS
==========================================================*/

SUM(total_operations)                          AS total_operations,

SUM(air_carrier_operations)                    AS air_carrier_operations,

SUM(air_taxi_operations)                       AS air_taxi_operations,

SUM(general_aviation_operations)               AS general_aviation_operations,

SUM(local_total_operations)                    AS local_operations,

SUM(itinerant_total_operations)                AS itinerant_operations,

/*==========================================================
    GEOGRAPHIC CLASSIFICATION
==========================================================*/

CASE

    WHEN COUNT(DISTINCT airport_key) >= 20
        THEN 'Major Aviation Market'

    WHEN COUNT(DISTINCT airport_key) >= 10
        THEN 'Large Aviation Market'

    WHEN COUNT(DISTINCT airport_key) >= 5
        THEN 'Regional Aviation Market'

    ELSE 'Local Aviation Market'

END AS geographic_market_type

FROM vw_business_airport_performance

GROUP BY

country,

city,

year,

quarter,

month,

month_name;
GO
