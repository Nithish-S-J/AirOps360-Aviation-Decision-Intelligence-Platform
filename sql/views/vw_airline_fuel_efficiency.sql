CREATE VIEW dbo.vw_airline_fuel_efficiency
AS

SELECT
    f.date_key,
    f.airline_key,

    a.airline_id,
    a.unique_carrier,
    a.airline_name,

    /* TRAFFIC BASE */
    t.departures_scheduled,
    t.total_seats,
    t.total_passengers,
    t.total_payload,
    t.total_freight,
    t.total_mail,
    t.total_air_time,
    t.total_ramp_to_ramp_time,
    t.routes_served,
    t.aircraft_types_used,

    /* FUEL BASE */
    f.total_gallons,
    f.domestic_gallons,
    f.international_gallons,
    f.total_cost,
    f.domestic_cost,
    f.international_cost,

    /* ECONOMIC / EFFICIENCY METRICS */

    CAST(
        f.total_cost / NULLIF(f.total_gallons, 0)
        AS DECIMAL(18,4)
    ) AS cost_per_gallon,

    CAST(
        f.total_gallons / NULLIF(t.total_passengers, 0)
        AS DECIMAL(18,4)
    ) AS gallons_per_passenger,

    CAST(
        f.total_cost / NULLIF(t.total_passengers, 0)
        AS DECIMAL(18,4)
    ) AS fuel_cost_per_passenger,

    CAST(
        f.total_gallons / NULLIF(t.departures_scheduled, 0)
        AS DECIMAL(18,4)
    ) AS gallons_per_departure,

    CAST(
        f.total_cost / NULLIF(t.departures_scheduled, 0)
        AS DECIMAL(18,4)
    ) AS fuel_cost_per_departure,

    CAST(
        (t.total_passengers * 100.0)
        / NULLIF(t.total_seats, 0)
        AS DECIMAL(18,2)
    ) AS passenger_load_factor_pct

FROM dbo.vw_agg_airline_fuel_monthly f

INNER JOIN dbo.vw_agg_airline_traffic_monthly t
    ON f.date_key = t.date_key
   AND f.airline_key = t.airline_key

INNER JOIN dbo.dim_airline a
    ON f.airline_key = a.airline_key;
