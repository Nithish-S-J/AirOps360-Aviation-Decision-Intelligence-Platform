CREATE OR ALTER VIEW dbo.vw_agg_route_reliability
AS

SELECT
    date_key,
    route_key,

    COUNT(*) AS total_flights,

    AVG(DEP_DELAY) AS avg_departure_delay,
    AVG(ARR_DELAY) AS avg_arrival_delay,

    SUM(
        CASE
            WHEN DEP_DELAY > 15 THEN 1
            ELSE 0
        END
    ) AS delayed_departures,

    SUM(
        CASE
            WHEN ARR_DELAY > 15 THEN 1
            ELSE 0
        END
    ) AS delayed_arrivals,

    SUM(
        CASE
            WHEN CANCELLED = 1 THEN 1
            ELSE 0
        END
    ) AS cancelled_flights,

    SUM(
        CASE
            WHEN DIVERTED = 1 THEN 1
            ELSE 0
        END
    ) AS diverted_flights,

    AVG(DISTANCE) AS avg_distance,

    AVG(AIR_TIME) AS avg_air_time

FROM dbo.fact_flights

WHERE route_key IS NOT NULL

GROUP BY
    date_key,
    route_key;
