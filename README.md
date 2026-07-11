# AirOps360-Aviation-Decision-Intelligence-Platform
End-to-end cloud data platform engineering project integrating FAA, BTS, and NOAA API data streams into Microsoft Fabric Lakehouse with Delta Lake, dbt, and Power BI

![Project_Preview](https://github.com/Nithish-S-J/AirOps360-Aviation-Decision-Intelligence-Platform/blob/main/docs/architecture/diagrams/AirOps360_project_architecture.png)
```
AirOps360-Aviation-Decision-Intelligence-Platform
│
├── README.md
├── LICENSE
├── .gitignore
│
├── data
│   ├── README.md
│   ├── bts/
│   ├── bts-form41/
│   ├── bts-t100/
│   ├── faa-asqp/
│   ├── faa-opsnet/
│   └── openflights/
│
├── docs
│   ├── README.md
│   │
│   ├── architecture/
│   │   ├── README.md
│   │   ├── diagrams/
│   │   └── screenshots/
│   │
│   ├── business/
│   │   ├── README.md
│   │   ├── business-requirements/
│   │   ├── business-scenarios/
│   │   └── kpi-dictionary/
│   │
│   ├── data-model/
│   │   ├── README.md
│   │   ├── star-schema/
│   │   ├── semantic-model-design/
│   │   └── warehouse-model/
│   │
│   ├── data-sources/
│   │
│   └── governance/
│
├── fabric
│   ├── README.md
│   │
│   ├── dataflows/
│   │   ├── README.md
│   │   ├── df_bronze_faa_opsnet/
│   │   ├── df_bronze_faa_asqp/
│   │   └── df_bronze_bts_t100/
│   │
│   ├── notebooks/
│   │   ├── README.md
│   │   │
│   │   ├── bronze/
│   │   ├── silver/
│   │   ├── gold/
│   │   └── validation/
│   │
│   └── pipelines/
│       ├── README.md
│       └── pl_load_wh_airops360/
│
├── warehouse
│   ├── README.md
│   ├── schema/
│   ├── validation/
│   └── screenshots/
│
├── sql
│   ├── README.md
│   │
│   ├── views/
│   │
│   ├── analysis/
│   │
│   ├── data-quality/
│   │
│   └── screenshots/
│
├── semantic-model
│   ├── README.md
│   ├── model-design/
│   ├── dax/
│   ├── security/
│   └── screenshots/
│
├── power-bi
│   ├── README.md
│   ├── report-design/
│   ├── reports/
│   └── screenshots/
│
└── monitoring
    ├── README.md
    ├── pipeline/
    ├── refresh/
    ├── data-quality/
    └── screenshots/
