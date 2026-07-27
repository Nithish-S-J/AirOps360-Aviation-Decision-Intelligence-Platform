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

![Workspace](https://github.com/Nithish-S-J/AirOps360-Aviation-Decision-Intelligence-Platform/blob/main/assets/workspace_file_vw.png)

![Workspace](https://github.com/Nithish-S-J/AirOps360-Aviation-Decision-Intelligence-Platform/blob/main/assets/workspace_L1.png)

![Workspace](https://github.com/Nithish-S-J/AirOps360-Aviation-Decision-Intelligence-Platform/blob/main/assets/workspace_L2.png)

![Pipeline](https://github.com/Nithish-S-J/AirOps360-Aviation-Decision-Intelligence-Platform/blob/main/assets/pipeline_copy_activity.png)

![Bronze Assets](https://github.com/Nithish-S-J/AirOps360-Aviation-Decision-Intelligence-Platform/blob/main/assets/bronze_injestion.png)

![Silver Assets](https://github.com/Nithish-S-J/AirOps360-Aviation-Decision-Intelligence-Platform/blob/main/assets/silver_notebooks.png)

