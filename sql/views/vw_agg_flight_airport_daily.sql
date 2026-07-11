CREATE OR ALTER VIEW dbo.vw_agg_flight_airport_daily
AS

WITH airport_movements AS
(
    -- Departure airport activity
    SELECT
        date_key,
        origin_airport_key AS airport_key,
        'DEPARTURE' AS movement_type,
        DEP_DELAY AS delay_minutes,
        CANCELLED,
        DIVERTED
    FROM dbo.fact_flights
    WHERE origin_airport_key IS NOT NULL

    UNION ALL

    -- Arrival airport activity
    SELECT
        date_key,
        destination_airport_key AS airport_key,
        'ARRIVAL' AS movement_type,
        ARR_DELAY AS delay_minutes,
        CANCELLED,
        DIVERTED
    FROM dbo.fact_flights
    WHERE destination_airport_key IS NOT NULL
)

SELECT
    date_key,
    airport_key,

    COUNT(*) AS total_movements,

    SUM(CASE
        WHEN movement_type = 'DEPARTURE' THEN 1
        ELSE 0
    END) AS departure_movements,

    SUM(CASE
        WHEN movement_type = 'ARRIVAL' THEN 1
        ELSE 0
    END) AS arrival_movements,

    AVG(delay_minutes) AS avg_movement_delay,

    SUM(CASE
        WHEN delay_minutes > 15 THEN 1
        ELSE 0
    END) AS delayed_movements,

    SUM(CASE
        WHEN CANCELLED = 1 THEN 1
        ELSE 0
    END) AS disruption_movements,

    SUM(CASE
        WHEN DIVERTED = 1 THEN 1
        ELSE 0
    END) AS diverted_movements

FROM airport_movements

GROUP BY
    date_key,
    airport_key;
