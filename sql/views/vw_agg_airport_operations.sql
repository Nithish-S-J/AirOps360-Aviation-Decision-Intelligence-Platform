CREATE OR ALTER VIEW dbo.vw_agg_airport_operations
AS

SELECT
    date_key,
    airport_key,

    actual_departures,
    actual_arrivals,

    departure_cancellations,
    arrival_cancellations,

    departure_diversions,
    arrival_diversions,

    on_time_gate_departure_pct,
    on_time_gate_arrival_pct,

    avg_gate_departure_delay,
    avg_gate_arrival_delay,
    avg_block_delay,

    avg_taxi_out_time,
    avg_taxi_in_time,

    delayed_arrivals,
    avg_delay_per_delayed_arrival

FROM dbo.fact_airport_operations;
