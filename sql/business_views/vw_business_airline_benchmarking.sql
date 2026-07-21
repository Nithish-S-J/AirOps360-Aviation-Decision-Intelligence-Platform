CREATE OR ALTER VIEW dbo.vw_business_airline_benchmarking
AS

SELECT

    /*==========================================================
      BUSINESS KEYS
    ==========================================================*/

    c.airline_key,
    c.unique_carrier,
    c.airline_name,

    c.year,
    c.quarter,
    c.month,
    c.month_name,

    /*==========================================================
      BUSINESS CLASSIFICATION
    ==========================================================*/

    CASE
        WHEN c.total_passengers = 0
             AND c.total_freight > 0 THEN 'Cargo'

        WHEN c.total_passengers > 1000000
             AND c.total_freight = 0 THEN 'Passenger'

        WHEN c.total_passengers > 0
             AND c.total_freight > 0 THEN 'Mixed'

        WHEN c.total_passengers > 0
             AND c.total_passengers < 1000000
             AND c.total_freight = 0 THEN 'Regional'

        ELSE 'Charter / Other'
    END AS airline_business_model,

    /*==========================================================
      DATA AVAILABILITY FLAGS
    ==========================================================*/

    CASE
        WHEN o.airline_key IS NULL THEN 'No'
        ELSE 'Yes'
    END AS has_operational_data,

    CASE
        WHEN f.airline_key IS NULL THEN 'No'
        ELSE 'Yes'
    END AS has_fuel_data,

    /*==========================================================
      OPERATIONAL METRICS
    ==========================================================*/

    COALESCE(o.total_flights,0)                 AS total_flights,

    o.avg_departure_delay_minutes,

    o.avg_arrival_delay_minutes,

    COALESCE(o.cancelled_flights,0)             AS cancelled_flights,

    COALESCE(o.diverted_flights,0)              AS diverted_flights,

    o.cancellation_rate_pct,

    o.diversion_rate_pct,

    /*==========================================================
      COMMERCIAL METRICS
    ==========================================================*/

    c.scheduled_departures,

    c.total_passengers,

    c.total_seats,

    c.total_freight,

    c.total_mail,

    c.total_payload,

    c.total_distance,

    c.total_air_time,

    c.total_ramp_time,

    c.traffic_records,

    /*==========================================================
      FUEL METRICS
    ==========================================================*/

    COALESCE(f.total_gallons,0)                 AS total_gallons,

    COALESCE(f.domestic_gallons,0)              AS domestic_gallons,

    COALESCE(f.international_gallons,0)         AS international_gallons,

    COALESCE(f.total_fuel_cost,0)               AS total_fuel_cost,

    COALESCE(f.domestic_fuel_cost,0)            AS domestic_fuel_cost,

    COALESCE(f.international_fuel_cost,0)       AS international_fuel_cost,

    f.fuel_records

FROM vw_ops_airline_commercial_performance c

LEFT JOIN vw_ops_airline_operational_performance o
       ON c.airline_key = o.airline_key
      AND c.year        = o.year
      AND c.month       = o.month

LEFT JOIN vw_ops_airline_fuel_performance f
       ON c.airline_key = f.airline_key
      AND c.year        = f.year
      AND c.month       = f.month;
GO
