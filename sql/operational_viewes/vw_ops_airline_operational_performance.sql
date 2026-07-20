CREATE OR ALTER VIEW dbo.vw_ops_airline_operational_performance
AS

SELECT

    -- ============================
    -- Business Keys
    -- ============================

    da.airline_key,
    da.unique_carrier,
    da.airline_name,

    dd.year,
    dd.quarter,
    dd.month,
    dd.month_name,

    -- ============================
    -- Flight Volume
    -- ============================

    COUNT(*) AS total_flights,

    -- ============================
    -- Delay Metrics
    -- ============================

    AVG(ff.DEP_DELAY) AS avg_departure_delay_minutes,

    AVG(ff.ARR_DELAY) AS avg_arrival_delay_minutes,

    SUM(CASE WHEN ff.DEP_DELAY > 0 THEN 1 ELSE 0 END) AS delayed_departures,

    SUM(CASE WHEN ff.ARR_DELAY > 0 THEN 1 ELSE 0 END) AS delayed_arrivals,

    -- ============================
    -- Disruptions
    -- ============================

    SUM(CASE WHEN ff.CANCELLED = 1 THEN 1 ELSE 0 END) AS cancelled_flights,

    SUM(CASE WHEN ff.DIVERTED = 1 THEN 1 ELSE 0 END) AS diverted_flights,

    -- ============================
    -- Flight Characteristics
    -- ============================

    AVG(ff.DISTANCE) AS avg_distance,

    AVG(ff.AIR_TIME) AS avg_air_time_minutes,

    -- ============================
    -- Operational KPIs
    -- ============================

    CAST(
        100.0 *
        SUM(CASE WHEN ff.DEP_DELAY > 0 THEN 1 ELSE 0 END)
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS departure_delay_rate_pct,

    CAST(
        100.0 *
        SUM(CASE WHEN ff.ARR_DELAY > 0 THEN 1 ELSE 0 END)
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS arrival_delay_rate_pct,

    CAST(
        100.0 *
        SUM(CASE WHEN ff.CANCELLED = 1 THEN 1 ELSE 0 END)
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS cancellation_rate_pct,

    CAST(
        100.0 *
        SUM(CASE WHEN ff.DIVERTED = 1 THEN 1 ELSE 0 END)
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS diversion_rate_pct

FROM fact_flights ff

INNER JOIN dim_airline da
    ON ff.airline_key = da.airline_key

INNER JOIN dim_date dd
    ON ff.date_key = dd.date_key

GROUP BY

    da.airline_key,
    da.unique_carrier,
    da.airline_name,

    dd.year,
    dd.quarter,
    dd.month,
    dd.month_name;
GO
