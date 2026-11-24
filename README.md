# StyleSphere CDP

A composable customer data platform (CDP) for a fictional fashion retailer.
Scope: B2C only (web store and physical shops). All data is synthetic.

## Goal

Build the core CDP notions end to end with open source tools, then mirror the same data model in a Salesforce Developer Edition org (Data 360, Agentforce).

## Stack

| Layer | Tool |
|---|---|
| CRM | Twenty (self-hosted, Docker) |
| Warehouse | PostgreSQL |
| Transformation | dbt OSS |
| Identity resolution | SQL (deterministic rules, pg_trgm, levenshtein) |
| Reverse ETL | Python scripts calling the Twenty REST API |
| BI | Power BI Desktop |
| AI agent | Claude, connected through MCP |
| CI | GitHub Actions |

## Status

| Phase | Content | Status |
|---|---|---|
| 0 | Repository, CI, secrets hygiene | In progress |
| 1 | Docker: Postgres and Twenty | Not started |
| 2 | Synthetic data into `raw` | Not started |
| 3 | dbt models, identity, marts, tests | Not started |
| 4 | Reverse ETL and Power BI | Not started |
| 5 | Salesforce org and AI agent | Not started |

## Repository layout

- `infra/` Docker Compose files
- `ingestion/` synthetic data generator
- `dbt/` dbt project
- `reverse_etl/` scripts that push aggregates to the CRM
- `bi/` Power BI project
- `agents/` AI agent code
- `docs/decisions/` architecture decision records
- `docs/linkedin/` posting plan

## Rules

- No real personal data. Synthetic data only.
- No secret in Git. Copy `.env.example` to `.env` and fill it locally.
- The CRM receives aggregates and scores only, never raw click history.

## License

MIT
