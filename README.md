# Rick and Morty Data Engineering Project

## Overview

This project is a **Data Engineering ELT pipeline** created for learning and practicing modern data warehouse technologies.

The main goal of the project is to extract data from the **Rick and Morty API**, load raw JSON data into **Snowflake**, transform semi-structured data into analytical tables using **dbt**, and prepare data for analytics.

The project follows an **ELT (Extract → Load → Transform)** architecture:

1. **Extract** data from external API sources using Python.
2. **Load** raw JSON data into Snowflake.
3. **Transform** and model data using dbt.
4. **Test and document** data models.


---

# Technologies Used

## Python

Used for:

- API communication
- JSON extraction
- Loading data into Snowflake
- Automating ingestion process

Libraries:

- requests
- snowflake-connector-python
- python-dotenv


## Snowflake

Cloud data warehouse used for:

- Raw data storage
- Semi-structured JSON processing
- Analytical data storage

Features used:

- VARIANT datatype
- JSON parsing
- SQL transformations
- Database and schema organization


## dbt (Data Build Tool)

Used for:

- SQL transformations
- Data modeling
- Creating staging and mart layers
- Data testing
- Documentation generation
- Reusable macros


## Git/GitHub

Used for:

- Version control
- Project management
- Tracking changes

---

# Data Source

The project uses the public **Rick and Morty API**.

API documentation:

https://rickandmortyapi.com/documentation


Data entities:

- Characters
- Episodes
- Locations


---

# Pipeline Description

## 1. Extract

Python scripts connect to the Rick and Morty API and retrieve JSON responses.

The extraction process collects:

- Character data
- Episode data
- Location data


Example raw response:

```json
{
  "id": 1,
  "name": "Rick Sanchez",
  "species": "Human",
  "episode": [
    "https://rickandmortyapi.com/api/episode/1"
  ]
}
```
## 2. Load

Extracted JSON data is loaded into the Snowflake **RAW layer**.

Current approach:

- Store API responses as semi-structured JSON
- Use Snowflake `VARIANT` datatype
- Preserve original source data
- Separate entities into different RAW tables


Example RAW structure:

```
RAW
│
├── CHARACTER
│     └── CHAR
│
├── EPISODE
│     └── EP
│
└── LOCATION
      └── LOC
```

---

# 3. Transform

Transformations are performed using **dbt**.

## Staging Layer

The staging layer converts raw JSON data into structured relational tables.

### Before

Raw Snowflake table:

| raw_data |
|----------|
| VARIANT JSON |

### After

Structured table:

| character_id | name | species | status |
|---|---|---|---|
| 1 | Rick Sanchez | Human | Alive |


Operations performed:

- JSON extraction
- Data type casting
- Array flattening
- Data cleaning


Snowflake functions used:

- JSON notation (`:`)
- `LATERAL FLATTEN`
- `CAST`

Example:

```sql
raw_data:name::string
```

---

# Data Quality

dbt tests are used to ensure data reliability.

Implemented checks:

- NOT NULL validation
- Unique key validation
- Custom SQL tests


Example:

```sql
where character_id is null
```

Duplicate check:

```sql
group by character_id
having count(*) > 1
```

---

# dbt Macros

Reusable SQL logic is implemented using dbt macros.

Example:

Extracting IDs from API URLs:

```sql
split_part(url, '/', 6)
```

Converted into reusable macro:

```sql
extract_id()
```

Benefits:

- Less duplicated SQL
- Easier maintenance
- Cleaner transformations

---

# Project Structure

```
rick_and_morty/

├── models/
│
│   ├── staging/
│   │   ├── stg_character.sql
│   │   ├── stg_episode.sql
│   │   ├── stg_location.sql
│   │   └── stg_character_episode.sql
│   │
│   └── marts/
│       ├── dim_character.sql
│       ├── dim_episode.sql
│       ├── dim_location.sql
│       └── fact_character_episode.sql
│
├── macros/
│   └── extract_id.sql
│
├── tests/
│
├── scripts/
│   └── extract_load.py
│
├── dbt_project.yml
└── README.md
```

---
