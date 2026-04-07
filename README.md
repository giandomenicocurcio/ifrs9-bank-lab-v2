# IFRS9 Banking Data Platform (Swiss Bank Lab)

## Overview

This project simulates a full IFRS9 data platform used in a banking environment, covering the complete flow from raw data ingestion to risk calculation, financial reporting, and dashboard visualization.

The objective is to bridge **credit risk modeling and financial impact**, providing transparency on how changes in credit quality affect impairment and P&L.

---

## Key Features

* End-to-end data pipeline using **PostgreSQL, SQL, and Python**
* IFRS9 Expected Credit Loss (ECL) calculation:

  * PD × LGD × Exposure
* Credit risk staging:

  * Stage 1 (performing)
  * Stage 2 (significant increase in risk)
  * Stage 3 (credit-impaired)
* Stage migration analysis (risk evolution)
* Impairment calculation and P&L impact
* Reconciliation controls between risk and finance layers
* Automated data extraction and reporting
* Interactive dashboard built in Power BI

---

## Architecture

The platform is structured into three main layers:

* **Core layer**: customers, accounts, transactions, exposures
* **Risk layer**: ECL calculation, staging, exposure snapshots
* **Finance layer**: impairment reporting and P&L impact

---

## Tech Stack

* SQL (PostgreSQL)
* Python (pandas, SQLAlchemy)
* Power BI
* Excel (for exports)

---

## Dashboard

The Power BI dashboard provides:

* Impairment movement (waterfall)
* ECL distribution by credit stage
* ECL trend over time

---

## Business Value

This project demonstrates how to:

* Translate credit risk into financial impact
* Analyze impairment drivers
* Monitor credit risk evolution over time
* Build a transparent and auditable reporting pipeline

---

## Author

Giandomenico Curcio
Finance & Data Professional (Zurich)
