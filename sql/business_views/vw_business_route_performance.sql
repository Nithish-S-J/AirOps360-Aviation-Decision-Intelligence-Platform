CREATE OR ALTER VIEW dbo.vw_business_route_performance
AS

SELECT

/*==========================================================
    ROUTE INFORMATION
==========================================================*/

t.route_key,

t.origin_airport,

t.destination_airport,

t.year,

t.quarter,

t.month,

t.month_name,

/*==========================================================
    OPERATIONAL METRICS
==========================================================*/

COALESCE(o.total_flights,0)                AS total_flights,

o.avg_departure_delay,

o.avg_arrival_delay,

COALESCE(o.cancelled_flights,0)            AS cancelled_flights,

COALESCE(o.diverted_flights,0)             AS diverted_flights,

/*==========================================================
    COMMERCIAL METRICS
==========================================================*/

t.scheduled_departures,

t.total_passengers,

t.total_seats,

t.total_freight,

t.total_mail,

t.total_payload,

t.total_distance,

t.total_air_time,

t.total_ramp_time,

t.traffic_records,

/*==========================================================
    BUSINESS CLASSIFICATION
==========================================================*/

CASE

    WHEN t.total_passengers = 0
         AND t.total_freight > 0
        THEN 'Cargo Route'

    WHEN t.total_passengers > 0
         AND t.total_freight = 0
        THEN 'Passenger Route'

    WHEN t.total_passengers > 0
         AND t.total_freight > 0
        THEN 'Mixed Route'

    ELSE 'Low Activity Route'

END AS route_business_model,

/*==========================================================
    DATA AVAILABILITY
==========================================================*/

CASE

    WHEN o.route_key IS NULL
        THEN 'No'

    ELSE 'Yes'

END AS has_operational_data,

CASE

    WHEN t.route_key IS NULL
        THEN 'No'

    ELSE 'Yes'

END AS has_traffic_data

FROM vw_ops_route_traffic t

LEFT JOIN vw_ops_route_operations o

ON t.route_key = o.route_key
AND t.year = o.year
AND t.month = o.month;

GO
