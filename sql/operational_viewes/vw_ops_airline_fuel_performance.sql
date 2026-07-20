CREATE OR ALTER VIEW dbo.vw_ops_airline_fuel_performance
AS

SELECT

    -- =========================================
    -- Business Keys
    -- =========================================

    da.airline_key,
    da.unique_carrier,
    da.airline_name,

    dd.year,
    dd.quarter,
    dd.month,
    dd.month_name,

    -- =========================================
    -- Fuel Consumption
    -- =========================================

    SUM(ff.total_gallons)             AS total_gallons,

    SUM(ff.domestic_gallons)          AS domestic_gallons,

    SUM(ff.international_gallons)     AS international_gallons,

    -- =========================================
    -- Fuel Cost
    -- =========================================

    SUM(ff.total_cost)                AS total_fuel_cost,

    SUM(ff.domestic_cost)             AS domestic_fuel_cost,

    SUM(ff.international_cost)        AS international_fuel_cost,

    -- =========================================
    -- Records
    -- =========================================

    COUNT(*)                          AS fuel_records

FROM fact_fuel_consumption ff

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
