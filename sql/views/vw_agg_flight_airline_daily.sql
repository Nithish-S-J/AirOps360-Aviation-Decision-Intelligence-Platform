ALTER VIEW dbo.vw_agg_flight_airline_daily
AS

SELECT
    date_key,
    airline_key,

    COUNT(*) AS total_flights,

    AVG(DEP_DELAY) AS avg_departure_delay,
    AVG(ARR_DELAY) AS avg_arrival_delay,

    SUM(DEP_DELAY) AS total_departure_delay_minutes,
    SUM(ARR_DELAY) AS total_arrival_delay_minutes,

    COUNT(DEP_DELAY) AS departure_delay_observations,
    COUNT(ARR_DELAY) AS arrival_delay_observations,

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

    SUM(AIR_TIME) AS total_air_time

FROM dbo.fact_flights

GROUP BY
    date_key,
    airline_key;
