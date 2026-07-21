USE ROLE ACCOUNTADMIN;

CREATE WAREHOUSE IF NOT EXISTS rick_and_morty
    WAREHOUSE_SIZE = 'XSMALL';

CREATE DATABASE IF NOT EXISTS core;

CREATE SCHEMA IF NOT EXISTS core.location;
CREATE SCHEMA IF NOT EXISTS core.character;
CREATE SCHEMA IF NOT EXISTS core.episode;

-- LOCATION
CREATE TABLE IF NOT EXISTS core.location.loc (
    id INTEGER,
    name VARCHAR,
    type VARCHAR,
    dimension VARCHAR,
    residents ARRAY,
    created TIMESTAMP_NTZ
);

-- EPISODE
CREATE TABLE IF NOT EXISTS core.episode.ep (
    id INTEGER,
    name VARCHAR,
    air_date VARCHAR,
    episode VARCHAR,
    characters ARRAY,
    created TIMESTAMP_NTZ
);

-- CHARACTER
CREATE TABLE IF NOT EXISTS core.character.char (
    id INTEGER,
    name VARCHAR,
    status VARCHAR,
    species VARCHAR,
    type VARCHAR,
    gender VARCHAR,
    origin VARCHAR,
    location VARCHAR,
    image VARCHAR,
    created TIMESTAMP_NTZ
);
create database if not exists raw;
CREATE SCHEMA IF NOT EXISTS raw.location;
CREATE SCHEMA IF NOT EXISTS raw.character;
CREATE SCHEMA IF NOT EXISTS raw.episode;

create table if not exists raw.location.loc(
    load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    raw_data VARIANT
);

create table if not exists raw.character.char(
    load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    raw_data VARIANT
);

create table if not exists raw.episode.ep(
    load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    raw_data VARIANT
);