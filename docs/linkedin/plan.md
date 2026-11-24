# LinkedIn posting plan

One post per phase. Publish only what is built and checked.

## Post structure

1. The problem, in one sentence
2. The decision and the alternative rejected
3. One artifact: diagram, screenshot or query result
4. One measured fact from the repository (for example: number of dbt tests passing)
5. Repository link

## Rules

- Say "synthetic data" whenever a number comes from generated data.
- No claim without a command or a file that proves it.
- No buzzwords. Short sentences.

## Calendar

| Phase | Post topic | Artifact |
|---|---|---|
| 0 | Why a composable CDP, scope and stack | Architecture diagram |
| 1 | Twenty and Postgres running with Docker | Screenshot of Twenty with API key page hidden |
| 2 | Synthetic customers across web and shops | Row counts per table |
| 3 | Identity resolution with pg_trgm and levenshtein | Match audit table, dbt test results |
| 4 | Aggregates back to the CRM, Power BI report | Report screenshot, CRM field screenshot |
| 5 | Same model in Salesforce Data 360 and an agent | Side by side mapping table |
