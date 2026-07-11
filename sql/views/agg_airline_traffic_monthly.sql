CREATE OR ALTER VIEW dbo.vw_agg_airline_traffic_monthly
AS

SELECT
    date_key,
    airline_key,

    SUM(departures_scheduled) AS departures_scheduled,

    SUM(payload) AS total_payload,
    SUM(seats) AS total_seats,
    SUM(passengers) AS total_passengers,

    SUM(freight) AS total_freight,
    SUM(mail) AS total_mail,

    SUM(ramp_to_ramp) AS total_ramp_to_ramp_time,
    SUM(air_time) AS total_air_time,

    COUNT(*) AS traffic_segment_records,
    COUNT(DISTINCT route_key) AS routes_served,
    COUNT(DISTINCT aircraft_type) AS aircraft_types_used

FROM dbo.fact_airline_traffic

GROUP BY
    date_key,
    airline_key;
