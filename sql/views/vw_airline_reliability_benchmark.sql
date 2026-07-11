CREATE VIEW dbo.vw_airline_reliability_benchmark
AS

SELECT
    f.airline_key,

    a.airline_id,
    a.unique_carrier,
    a.airline_name,

    /* ========================================================
       OPERATIONAL BASE
       ======================================================== */

    SUM(f.total_flights) AS total_flights,

    SUM(f.delayed_departures) AS delayed_departures,
    SUM(f.delayed_arrivals) AS delayed_arrivals,

    SUM(f.cancelled_flights) AS cancelled_flights,
    SUM(f.diverted_flights) AS diverted_flights,

    SUM(f.total_departure_delay_minutes)
        AS total_departure_delay_minutes,

    SUM(f.total_arrival_delay_minutes)
        AS total_arrival_delay_minutes,

    SUM(f.departure_delay_observations)
        AS departure_delay_observations,

    SUM(f.arrival_delay_observations)
        AS arrival_delay_observations,


    /* ========================================================
       EXACT DELAY METRICS
       ======================================================== */

    CAST(
        SUM(f.total_departure_delay_minutes) * 1.0
        / NULLIF(
            SUM(f.departure_delay_observations),
            0
        )
        AS DECIMAL(18,4)
    ) AS avg_departure_delay_minutes,

    CAST(
        SUM(f.total_arrival_delay_minutes) * 1.0
        / NULLIF(
            SUM(f.arrival_delay_observations),
            0
        )
        AS DECIMAL(18,4)
    ) AS avg_arrival_delay_minutes,


    /* ========================================================
       RELIABILITY RATES
       ======================================================== */

    CAST(
        SUM(f.delayed_departures) * 100.0
        / NULLIF(SUM(f.total_flights), 0)
        AS DECIMAL(18,4)
    ) AS departure_delay_rate_pct,

    CAST(
        SUM(f.delayed_arrivals) * 100.0
        / NULLIF(SUM(f.total_flights), 0)
        AS DECIMAL(18,4)
    ) AS arrival_delay_rate_pct,

    CAST(
        SUM(f.cancelled_flights) * 100.0
        / NULLIF(SUM(f.total_flights), 0)
        AS DECIMAL(18,4)
    ) AS cancellation_rate_pct,

    CAST(
        SUM(f.diverted_flights) * 100.0
        / NULLIF(SUM(f.total_flights), 0)
        AS DECIMAL(18,4)
    ) AS diversion_rate_pct

FROM dbo.vw_agg_flight_airline_daily f

INNER JOIN dbo.dim_airline a
    ON f.airline_key = a.airline_key

GROUP BY
    f.airline_key,
    a.airline_id,
    a.unique_carrier,
    a.airline_name;
