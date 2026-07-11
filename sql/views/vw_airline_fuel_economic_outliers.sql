ALTER VIEW dbo.vw_airline_fuel_economic_outliers
AS

WITH metric_values AS
(
    SELECT
        'cost_per_gallon' AS metric_name,
        CAST(cost_per_gallon AS FLOAT) AS metric_value
    FROM dbo.vw_airline_fuel_efficiency
    WHERE total_gallons > 0

    UNION ALL

    SELECT
        'gallons_per_passenger',
        CAST(gallons_per_passenger AS FLOAT)
    FROM dbo.vw_airline_fuel_efficiency
    WHERE total_gallons > 0
      AND total_passengers > 0

    UNION ALL

    SELECT
        'fuel_cost_per_passenger',
        CAST(fuel_cost_per_passenger AS FLOAT)
    FROM dbo.vw_airline_fuel_efficiency
    WHERE total_gallons > 0
      AND total_passengers > 0

    UNION ALL

    SELECT
        'gallons_per_departure',
        CAST(gallons_per_departure AS FLOAT)
    FROM dbo.vw_airline_fuel_efficiency
    WHERE total_gallons > 0
      AND departures_scheduled > 0

    UNION ALL

    SELECT
        'fuel_cost_per_departure',
        CAST(fuel_cost_per_departure AS FLOAT)
    FROM dbo.vw_airline_fuel_efficiency
    WHERE total_gallons > 0
      AND departures_scheduled > 0
),

quartiles AS
(
    SELECT DISTINCT
        metric_name,

        PERCENTILE_CONT(0.25)
        WITHIN GROUP (ORDER BY metric_value)
        OVER (PARTITION BY metric_name) AS q1,

        PERCENTILE_CONT(0.75)
        WITHIN GROUP (ORDER BY metric_value)
        OVER (PARTITION BY metric_name) AS q3

    FROM metric_values
),

thresholds AS
(
    SELECT
        metric_name,
        q3 + (1.5 * (q3 - q1)) AS upper_bound
    FROM quartiles
),

threshold_profile AS
(
    SELECT
        MAX(CASE
            WHEN metric_name = 'cost_per_gallon'
            THEN upper_bound
        END) AS cost_per_gallon_upper,

        MAX(CASE
            WHEN metric_name = 'gallons_per_passenger'
            THEN upper_bound
        END) AS gallons_per_passenger_upper,

        MAX(CASE
            WHEN metric_name = 'fuel_cost_per_passenger'
            THEN upper_bound
        END) AS fuel_cost_per_passenger_upper,

        MAX(CASE
            WHEN metric_name = 'gallons_per_departure'
            THEN upper_bound
        END) AS gallons_per_departure_upper,

        MAX(CASE
            WHEN metric_name = 'fuel_cost_per_departure'
            THEN upper_bound
        END) AS fuel_cost_per_departure_upper

    FROM thresholds
),

metric_flags AS
(
    SELECT
        e.*,

        CASE
            WHEN e.cost_per_gallon IS NOT NULL
             AND e.cost_per_gallon > t.cost_per_gallon_upper
            THEN 1 ELSE 0
        END AS cost_per_gallon_outlier_flag,

        CASE
            WHEN e.gallons_per_passenger IS NOT NULL
             AND e.gallons_per_passenger > t.gallons_per_passenger_upper
            THEN 1 ELSE 0
        END AS gallons_per_passenger_outlier_flag,

        CASE
            WHEN e.fuel_cost_per_passenger IS NOT NULL
             AND e.fuel_cost_per_passenger > t.fuel_cost_per_passenger_upper
            THEN 1 ELSE 0
        END AS fuel_cost_per_passenger_outlier_flag,

        CASE
            WHEN e.gallons_per_departure IS NOT NULL
             AND e.gallons_per_departure > t.gallons_per_departure_upper
            THEN 1 ELSE 0
        END AS gallons_per_departure_outlier_flag,

        CASE
            WHEN e.fuel_cost_per_departure IS NOT NULL
             AND e.fuel_cost_per_departure > t.fuel_cost_per_departure_upper
            THEN 1 ELSE 0
        END AS fuel_cost_per_departure_outlier_flag

    FROM dbo.vw_airline_fuel_efficiency e
    CROSS JOIN threshold_profile t
),

dimension_flags AS
(
    SELECT
        *,

        cost_per_gallon_outlier_flag
            AS fuel_price_outlier_flag,

        CASE
            WHEN gallons_per_passenger_outlier_flag = 1
              OR fuel_cost_per_passenger_outlier_flag = 1
            THEN 1 ELSE 0
        END AS passenger_efficiency_outlier_flag,

        CASE
            WHEN gallons_per_departure_outlier_flag = 1
              OR fuel_cost_per_departure_outlier_flag = 1
            THEN 1 ELSE 0
        END AS departure_efficiency_outlier_flag

    FROM metric_flags
),

scored_airlines AS
(
    SELECT
        *,

        (
            fuel_price_outlier_flag
            + passenger_efficiency_outlier_flag
            + departure_efficiency_outlier_flag
        ) AS economic_outlier_score

    FROM dimension_flags
)

SELECT
    *,

    CASE
        WHEN economic_outlier_score = 3
            THEN 'Critical Outlier'

        WHEN economic_outlier_score = 2
            THEN 'High Outlier'

        WHEN economic_outlier_score = 1
            THEN 'Metric Outlier'

        ELSE 'Within Peer Range'
    END AS economic_outlier_class

FROM scored_airlines;
