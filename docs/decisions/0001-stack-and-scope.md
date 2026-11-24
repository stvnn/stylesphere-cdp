# ADR 0001: Stack and scope

Date: 2026-11-24
Status: accepted

## Context

Portfolio project to show CDP skills with open source tools, then map them to Salesforce Data 360 and Agentforce.

## Decisions

- Scope: B2C only. Channels: web store and physical shops. No B2B wholesale.
- Warehouse: one PostgreSQL instance. Parquet and DuckDB are optional later.
- Transformation: dbt OSS, version pinned after a day-1 compatibility test with the Postgres adapter.
- Identity: deterministic rules first, then pg_trgm blocking and levenshtein confirmation, with an audit table.
- Reverse ETL: Python scripts to the Twenty REST API. Aggregates and scores only.
- Events: synthetic generator first, using a Segment-style event shape (identify, track, page). Jitsu is decided after phase 3.
- Runtime: local first with Docker Compose. CI uses an ephemeral Postgres container.
- Data: synthetic only. A consent table is part of the model.
- Repository: public from day one, MIT license, no secrets.

## Consequences

- Power BI Desktop requires Windows.
- Jitsu self-hosting is heavy (Kafka-compatible bus, ClickHouse, MongoDB, Postgres). Deferring it keeps phases 1 to 3 fast.
- Every phase ends with a checklist and one LinkedIn post.
