# AirOps360 Analytical SQL Views

## Overview

This folder contains the analytical SQL views developed in the AirOps360 Microsoft Fabric Warehouse.

These views transform curated Gold-layer fact and dimension tables into business-ready analytical datasets that power the Semantic Model, DAX measures, and Power BI executive dashboards.

---

## Architecture Position

```
Lakehouse
      │
      ▼
Warehouse Star Schema
      │
      ▼
Analytical SQL Views
      │
      ▼
Semantic Model
      │
      ▼
Power BI Reports
```

---

## Analytical Views

| View | Business Purpose |
|------|------------------|
| vw_agg_airline_fuel_monthly | Monthly airline fuel consumption and cost analysis |
| vw_agg_airline_traffic_monthly | Monthly passenger and traffic aggregation |
| vw_agg_airport_capacity | Airport capacity utilization metrics |
| vw_agg_airport_operations | Airport operational performance metrics |
| vw_agg_flight_airline_daily | Daily airline operational KPIs |
| vw_agg_flight_airport_daily | Daily airport operational KPIs |
| vw_agg_route_reliability | Route delay and reliability analysis |
| vw_airline_fuel_efficiency | Airline fuel efficiency metrics |
| vw_airline_fuel_economic_outliers | Fuel cost anomaly detection |
| vw_airline_reliability_benchmark | Airline reliability benchmarking and comparison |

---

## Business Value

These analytical views provide:

- Executive KPI reporting
- Airline operational performance monitoring
- Airport capacity analysis
- Fuel efficiency benchmarking
- Route reliability analytics
- Operational anomaly detection
- Semantic Model optimization
- Power BI reporting layer

---

## Technologies

- Microsoft Fabric Warehouse
- T-SQL
- Star Schema
- Business Views
- Microsoft Fabric SQL Analytics Endpoint
- Power BI Semantic Model
