# StyleSphere CDP: instructions for Claude

Composable customer data platform for a fictional fashion retailer. B2C only (web store and physical shops). Synthetic data only.
Goal: a portfolio project, then a mirror of the same data model in Salesforce Data 360 and Agentforce.

## Language

- Repository files: English.
- Chat with the owner: French.

## Hard rules

- Never write a secret in a file. Use `.env` locally and update `.env.example` when a variable is added.
- Never use real personal data. Generate people with Faker.
- Reverse ETL writes aggregates and scores only (loyalty score, last purchase date, customer status). Never raw event history.
- LLM agents receive pseudonymized data only.
- Customers without consent are excluded from every activation.

## Workflow

- Read `docs/ROADMAP.md` before any work. Work on one phase at a time.
- A phase is done only when its gate passes with evidence (command output or CI run link).
- Report each gate as Pass, Pass with reservations, or Fail, with the cause.
- Mark claims in `docs/` as V (verified, with source), P (probable), H (proposal), NV (not verified).
- Short commits with conventional prefixes: `feat:`, `fix:`, `docs:`, `chore:`.

## Conventions

- Warehouse schemas: `raw`, `staging`, `core`, `marts`.
- dbt model prefixes: `stg_`, `int_`, `dim_`, `fct_`. Every model has tests.
- Postgres roles: one writer role for loaders and dbt, one read-only role for Power BI and agents.
- Writing style: no em dashes, no filler, short sentences.

## Out of scope

B2B wholesale, real customer data, paid services.
