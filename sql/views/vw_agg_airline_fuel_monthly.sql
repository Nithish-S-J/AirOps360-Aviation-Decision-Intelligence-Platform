CREATE OR ALTER VIEW dbo.vw_agg_airline_fuel_monthly
AS

SELECT
    date_key,
    airline_key,

    total_gallons,
    domestic_gallons,
    international_gallons,

    total_cost,
    domestic_cost,
    international_cost

FROM dbo.fact_fuel_consumption;
