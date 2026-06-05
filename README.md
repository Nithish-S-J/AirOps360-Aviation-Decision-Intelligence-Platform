# AirOps360-Aviation-Decision-Intelligence-Platform
End-to-end cloud data platform engineering project integrating FAA, BTS, and NOAA API data streams into Microsoft Fabric Lakehouse with Delta Lake, dbt, and Power BI

![Project_Preview](https://github.com/Nithish-S-J/AirOps360-Aviation-Decision-Intelligence-Platform/blob/main/02_Architecture/AirOps360_project_architecture.png)
```
AirOps360-Aviation-Decision-Intelligence-Platform
│
├── README.md
├── LICENSE
├── .gitignore
│
├── 01_Business_Requirements
│   ├── AirOps360_BRD.docx
│   ├── Business_Case.docx
│   ├── Stakeholder_Analysis.xlsx
│   ├── Scope_Definition.docx
│   └── Project_Roadmap.pptx
│
├── 02_Architecture
│   ├── Solution_Architecture.png
│   ├── Medallion_Architecture.png
│   ├── Data_Flow_Diagram.png
│   ├── Security_Architecture.png
│   └── Architecture_Decisions.md
│
├── 03_Data_Sources
│   ├── Data_Source_Register.xlsx
│   ├── Source_to_Target_Mapping.xlsx
│   ├── Data_Dictionary.xlsx
│   ├── API_Documentation
│   │   ├── NOAA_API.md
│   │   ├── OpenSky_API.md
│   │   └── FAA_Data.md
│   └── Dataset_Links.md
│
├── 04_Bronze
│   ├── Ingestion_Design.docx
│   ├── Fabric_Pipelines
│   ├── PySpark_Notebooks
│   └── Bronze_Load_Logs
│
├── 05_Silver
│   ├── Cleansing_Rules.md
│   ├── Standardization_Rules.md
│   ├── Transformation_Mapping.xlsx
│   └── PySpark_Notebooks
│
├── 06_Gold
│   ├── Business_Rules.md
│   ├── KPI_Transformations.md
│   ├── Gold_Model_Design.docx
│   └── SQL_Views
│
├── 07_dbt
│   ├── dbt_project.yml
│   ├── models
│   │   ├── staging
│   │   ├── intermediate
│   │   └── marts
│   │
│   ├── snapshots
│   ├── tests
│   ├── macros
│   ├── seeds
│   └── docs
│
├── 08_Data_Model
│   ├── Star_Schema.png
│   ├── Data_Model_Design.docx
│   ├── Fact_Tables.docx
│   ├── Dimension_Tables.docx
│   └── SCD_Strategy.docx
│
├── 09_SQL
│   ├── Bronze_SQL
│   ├── Silver_SQL
│   ├── Gold_SQL
│   ├── Stored_Procedures
│   └── Views
│
├── 10_Data_Quality
│   ├── Data_Quality_Framework.docx
│   ├── Great_Expectations
│   ├── Freshness_Checks.sql
│   ├── Null_Checks.sql
│   ├── Volume_Checks.sql
│   └── Referential_Integrity.sql
│
├── 11_Machine_Learning
│   ├── Delay_Prediction
│   ├── Sentiment_Analysis
│   ├── MLflow
│   ├── Feature_Engineering
│   └── Model_Evaluation
│
├── 12_PowerBI
│   ├── Semantic_Model
│   ├── DAX_Measures
│   ├── Dashboard_Requirements.docx
│   ├── Executive_Command_Center.pbix
│   ├── Flight_Disruption.pbix
│   ├── Airport_Performance.pbix
│   └── Customer_Experience.pbix
│
├── 13_Governance
│   ├── Data_Lineage.png
│   ├── RBAC_Model.docx
│   ├── Security_Model.docx
│   └── Purview_Documentation
│
├── 14_DevOps
│   ├── GitHub_Actions
│   ├── Deployment_Strategy.docx
│   ├── Release_Notes
│   └── Environment_Promotion.md
│
├── 15_Documentation
│   ├── KPI_Dictionary.xlsx
│   ├── User_Guide.docx
│   ├── Technical_Guide.docx
│   ├── Lessons_Learned.md
│   └── Portfolio_Summary.md
│
└── assets
    ├── screenshots
    ├── architecture
    ├── dashboard_mockups
    └── presentation
