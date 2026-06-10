# Bronze Layer

## Overview

The Bronze layer stores raw aviation datasets ingested into Microsoft Fabric Lakehouse without applying business transformations.

## Objective

- Preserve source data integrity
- Enable auditability and traceability
- Support downstream Silver transformations

## Data Sources

| Source | Dataset |
|----------|----------|
| BTS | Flight Operations & Delay Data |
| OpenFlights | Airports |
| OpenFlights | Airlines |
| OpenFlights | Routes |

## Fabric Components

- Microsoft Fabric Lakehouse
- PySpark Notebooks
- OneLake Storage

## Bronze Tables

- bronze_bts_flights
- bronze_airports
- bronze_airlines
- bronze_routes

## Output

Raw aviation data available for cleansing, standardization, and enrichment in the Silver layer.
