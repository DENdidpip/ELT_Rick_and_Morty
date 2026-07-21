# Rick and Morty Data Engineering Project

## Overview

This project is a **Data Engineering ELT pipeline** created for learning and practicing modern data warehouse technologies.

The main goal of the project is to extract data from the **Rick and Morty API**, load raw data into **Snowflake**, and prepare the foundation for future data transformation and analytics.

The project follows an **ELT (Extract → Load → Transform)** architecture:

1. **Extract** data from external API sources using Python.
2. **Load** raw JSON data into Snowflake.
3. **Transform** and model data using dbt (in progress).


---

## Technologies Used

- **Python**
  - Used for API extraction and loading data into Snowflake.

- **Snowflake**
  - Cloud data warehouse used for storing raw and transformed data.

- **dbt (Data Build Tool)**
  - Used for SQL transformations, data modeling, and testing.

- **Git/GitHub**
  - Version control and project management.

---

## Data Source

The project uses the public **Rick and Morty API**.

Data entities:

- Characters
- Episodes
- Locations

API documentation:

https://rickandmortyapi.com/documentation

---

---

# Pipeline Description

## 1. Extract

Python scripts connect to the Rick and Morty API and retrieve JSON data.

The extraction process collects information about:

- Characters
- Episodes
- Locations

The original JSON structure is preserved to keep raw data available for future transformations.

---

## 2. Load

The extracted data is loaded into Snowflake.

Current approach:

- Store API responses as semi-structured JSON data.
- Use Snowflake `VARIANT` datatype.
- Keep raw data unchanged in the warehouse.

## 3. Transform (In Progress)

# Purpose

This project was created as a practical Data Engineering learning project to understand:

- API data extraction
- Data ingestion pipelines
- ELT architecture
- Cloud data warehouses
- Snowflake
- dbt transformations
- Data modeling
- Data quality testing

