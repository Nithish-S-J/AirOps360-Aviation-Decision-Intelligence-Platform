CREATE OR ALTER VIEW dbo.vw_business_network_intelligence
AS

SELECT

/*==========================================================
    NETWORK HUB
==========================================================*/

origin_airport,

year,

quarter,

month,

month_name,

/*==========================================================
    NETWORK FOOTPRINT
==========================================================*/

COUNT(DISTINCT destination_airport)        AS connected_destinations,

COUNT(DISTINCT route_key)                  AS total_routes,

/*==========================================================
    OPERATIONAL PERFORMANCE
==========================================================*/

SUM(total_flights)                         AS total_flights,

AVG(avg_departure_delay)                   AS avg_departure_delay,

AVG(avg_arrival_delay)                     AS avg_arrival_delay,

SUM(cancelled_flights)                     AS cancelled_flights,

SUM(diverted_flights)                      AS diverted_flights,

/*==========================================================
    COMMERCIAL PERFORMANCE
==========================================================*/

SUM(scheduled_departures)                  AS scheduled_departures,

SUM(total_passengers)                      AS total_passengers,

SUM(total_seats)                           AS total_seats,

SUM(total_freight)                         AS total_freight,

SUM(total_mail)                            AS total_mail,

SUM(total_payload)                         AS total_payload,

SUM(total_distance)                        AS total_network_distance,

SUM(total_air_time)                        AS total_air_time,

SUM(total_ramp_time)                       AS total_ramp_time,

/*==========================================================
    NETWORK CLASSIFICATION
==========================================================*/

CASE

    WHEN COUNT(DISTINCT destination_airport) >= 100
        THEN 'Mega Hub'

    WHEN COUNT(DISTINCT destination_airport) >= 50
        THEN 'Major Hub'

    WHEN COUNT(DISTINCT destination_airport) >= 20
        THEN 'Regional Hub'

    ELSE 'Local Hub'

END AS network_hub_type

FROM vw_business_route_performance

GROUP BY

origin_airport,

year,

quarter,

month,

month_name;

GO
