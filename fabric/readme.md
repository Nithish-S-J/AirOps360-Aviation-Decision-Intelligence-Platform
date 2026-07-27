# Microsoft Fabric

This directory contains the core Microsoft Fabric assets powering the AirOps360 Aviation Decision Intelligence Platform.

It implements the complete data engineering workflow from raw aviation data ingestion through business-ready analytical datasets using the Medallion Architecture.

## Components

- Dataflow Gen2 ingestion
- PySpark notebooks
- Lakehouse transformations
- Gold business marts
- Pipeline orchestration

## Data Engineering Flow

Bronze → Silver → Gold → Warehouse → Semantic Model

## Key Capabilities

- Multi-source aviation data ingestion
- Data cleansing and standardization
- Conformed dimension generation
- Fact table construction
- Business mart creation
- Automated orchestration

## Architecture

![Workspace](../assets/screenshots/02_fabric_workspace/01_workspace_overview.png)

![Pipeline](../assets/screenshots/02_fabric_workspace/05_pipeline.png)

![Bronze Assets](../assets/screenshots/02_fabric_workspace/02_bronze_assets.png)

![Silver Assets](../assets/screenshots/02_fabric_workspace/03_silver_assets.png)

![Gold Assets](../assets/screenshots/02_fabric_workspace/04_gold_assets.png)
