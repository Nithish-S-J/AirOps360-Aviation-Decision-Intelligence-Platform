# AirOps360 – DAX Measure Library

## Overview

The AirOps360 DAX Measure Library provides the semantic business layer for the Enterprise Aviation Decision Intelligence Platform.

Measures are organized into logical business domains to promote consistency, reusability, maintainability, and enterprise reporting standards. The library supports executive decision-making across airline operations, airport performance, route intelligence, fuel economics, operational reliability, and network health.

---

# Measure Architecture

```
Base Measures
      │
      ▼
Business KPIs
      │
      ▼
Time Intelligence
      │
      ▼
Ranking & Benchmarking
      │
      ▼
Decision Intelligence
      │
      ▼
Utility & Report Experience
```

---

# Measure Organization

| Folder | Purpose |
|----------|---------|
| **01 Base Measures** | Core aggregations from the warehouse fact tables |
| **02 Executive KPIs** | Business KPIs, ratios, averages, and operational metrics |
| **03 Time Intelligence** | Daily trends, rolling averages, running totals, operational trends |
| **04 Ranking & Benchmarking** | Airline, airport, and network comparisons |
| **05 Decision Intelligence** | Composite indices, executive scores, risk analytics, operational intelligence |
| **06 Utility** | Dynamic titles, labels, filter context, report metadata, UX enhancements |

---

# Measure Categories

## 01 Base Measures

Foundation measures built directly from Warehouse facts.

Examples

- Total Flights
- Total Passengers
- Total Seats
- Total Freight
- Total Mail
- Total Fuel Gallons
- Total Fuel Cost
- Total Airport Operations
- Total Airport Capacity

---

## 02 Executive KPIs

Business calculations consumed directly by reports.

Examples

- On-Time Arrival %
- Cancellation Rate %
- Diversion Rate %
- Passenger Load Factor %
- Average Arrival Delay
- Average Departure Delay
- Fuel Cost per Passenger
- Fuel Cost per Flight
- Airport Capacity Utilization %
- Airline Market Share %

---

## 03 Time Intelligence

Operational trend analysis for the January 2024 analysis period.

Includes

- Previous Day Flights
- Daily Flight Change
- Daily Flight Change %
- Rolling 7-Day Flights
- Rolling 7-Day Average Flights
- Rolling 7-Day Passengers
- Running Total Flights
- Running Total Passengers
- Daily Variance
- Operational Trend Status

> **Note**
>
> The project dataset covers January 2024. Therefore, only day-based time intelligence is implemented. Month-over-month and year-over-year calculations are intentionally excluded.

---

## 04 Ranking & Benchmarking

Entity comparison across airlines and airports.

Examples

- Airline Rank by Flights
- Airline Rank by Passengers
- Airline Rank by On-Time Performance
- Airline Rank by Arrival Delay
- Airport Rank by Operations
- Airport Rank by Arrivals
- Airport Rank by Departures
- Network Benchmark Measures
- Performance vs Network

---

## 05 Decision Intelligence

Composite business intelligence measures developed specifically for AirOps360.

Examples

### Operational Intelligence

- Operational Reliability Score
- Operational Risk Score
- Delay Severity Index
- Network Health Index

### Airline Intelligence

- Airline Efficiency Score
- Airline Performance Index
- Fuel Efficiency Index
- Passenger Demand Index

### Airport Intelligence

- Airport Pressure Index
- Airport Capacity Headroom
- Airport Throughput

### Executive Intelligence

- Network Health Status
- Operational Reliability Tier
- Operational Risk Tier
- Airline Performance Tier
- Airport Pressure Tier

---

## 06 Utility

Presentation layer measures supporting report usability.

Includes

### Dynamic Titles

- Executive Overview
- Operational Performance
- Airline Intelligence
- Airport Operations
- Fuel Economics

### Dynamic Labels

- Network Health Label
- Operational Reliability Label
- Operational Risk Label
- Airline Performance Label
- Airport Pressure Label

### Filter Context

- Selected Airline
- Selected Airport
- Selected Route
- Selected Date
- Filter Summary

### Report Metadata

- Data Coverage
- Latest Available Data
- Trend Indicators

---

# Design Principles

The DAX layer follows these principles:

- Single source of business logic
- Reusable measures
- Consistent naming conventions
- Business-oriented calculations
- Semantic model optimization
- Enterprise reporting standards
- Minimal duplication
- Layered dependency architecture

---

# Dependency Flow

```
Warehouse Facts
        │
        ▼
Base Measures
        │
        ▼
Business KPIs
        │
        ▼
Advanced Analytics
        │
        ▼
Executive Scores
        │
        ▼
Power BI Reports
```

---

# Power BI Integration

These measures power the following report pages:

- Executive Network Overview
- Operational Performance & Reliability
- Airline & Route Intelligence
- Airport Capacity & Operations
- Fuel Economics
- Executive Decision Intelligence

---

# Enterprise Standards

- Centralized measure table (`All_Measures`)
- Display folders for logical organization
- Reusable KPI definitions
- Business-friendly naming conventions
- Hidden technical columns
- Optimized for Microsoft Fabric Semantic Model
- Designed for enterprise-scale reporting and decision support

---

# Technology Stack

- Microsoft Fabric
- Fabric Warehouse
- Semantic Model
- Power BI Desktop
- DAX
- Star Schema
- Microsoft SQL
