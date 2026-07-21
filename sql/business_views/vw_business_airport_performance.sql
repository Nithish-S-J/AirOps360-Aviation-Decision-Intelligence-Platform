CREATE OR ALTER VIEW dbo.vw_business_airport_performance
AS

SELECT

/*==========================================================
    AIRPORT INFORMATION
==========================================================*/

o.airport_key,

o.iata_code,

o.airport_name,

o.city,

o.country,

o.latitude,

o.longitude,

o.year,

o.quarter,

o.month,

o.month_name,

/*==========================================================
    OPERATIONAL METRICS
==========================================================*/

o.actual_departures,

o.actual_arrivals,

o.departure_cancellations,

o.arrival_cancellations,

o.departure_diversions,

o.arrival_diversions,

o.avg_on_time_departure_pct,

o.avg_on_time_arrival_pct,

o.avg_gate_departure_delay,

o.avg_gate_arrival_delay,

o.avg_block_delay,

o.avg_taxi_out_time,

o.avg_taxi_in_time,

o.delayed_arrivals,

o.avg_delay_per_delayed_arrival,

/*==========================================================
    CAPACITY METRICS
==========================================================*/

COALESCE(c.air_carrier_operations,0)          AS air_carrier_operations,

COALESCE(c.air_taxi_operations,0)             AS air_taxi_operations,

COALESCE(c.general_aviation_operations,0)     AS general_aviation_operations,

COALESCE(c.itinerant_military_operations,0)   AS itinerant_military_operations,

COALESCE(c.itinerant_total_operations,0)      AS itinerant_total_operations,

COALESCE(c.local_civil_operations,0)          AS local_civil_operations,

COALESCE(c.local_military_operations,0)       AS local_military_operations,

COALESCE(c.local_total_operations,0)          AS local_total_operations,

COALESCE(c.total_operations,0)                AS total_operations,

/*==========================================================
    BUSINESS CLASSIFICATION
==========================================================*/

CASE

    WHEN COALESCE(c.total_operations,0) >= 50000
        THEN 'Large Hub'

    WHEN COALESCE(c.total_operations,0) >= 20000
        THEN 'Medium Hub'

    WHEN COALESCE(c.total_operations,0) >= 5000
        THEN 'Regional'

    WHEN COALESCE(c.total_operations,0) > 0
        THEN 'Local'

    ELSE 'No Activity'

END AS airport_classification,

/*==========================================================
    DATA QUALITY FLAGS
==========================================================*/

CASE

    WHEN c.airport_key IS NULL
        THEN 'No'

    ELSE 'Yes'

END AS has_capacity_data,

CASE

    WHEN o.airport_key IS NULL
        THEN 'No'

    ELSE 'Yes'

END AS has_operations_data

FROM vw_ops_airport_operations o

LEFT JOIN vw_ops_airport_capacity c

ON o.airport_key = c.airport_key
AND o.year = c.year
AND o.month = c.month;

GO
