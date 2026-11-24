# Roadmap

Assumption: about 8 hours per week, 9 weeks in total. A phase is done only when its gate passes.

| Phase | Week | Deliverable | Gate (short) | Status |
|---|---|---|---|---|
| 0 | 0 | Repository, CI, secrets hygiene | CI green, no tracked `.env` | In progress |
| 1 | 1 | Docker: Postgres warehouse and Twenty | Services healthy, API call returns 200, read-only role cannot write | Not started |
| 2 | 2 | Synthetic data with ground truth in `raw` | Same seed gives same counts, 0 orphan rows | Not started |
| 3 | 3-4 | dbt: staging, identity, core, marts | `dbt build` has 0 failures, match precision and recall measured | Not started |
| 4 | 5-6 | Reverse ETL to Twenty and Power BI report | Second run changes 0 records, field contract test passes | Not started |
| 5 | 7-8 | Salesforce Developer Edition and AI agents | Agent evaluation set scored, PII never reaches the model | Not started |
| 6 | 9 | One optional extension: Jitsu, Splink or Dagster | One measured comparison | Not started |

## Gate protocol

1. Run the gate commands.
2. Keep the outputs, without secrets.
3. Review them as Pass, Pass with reservations, or Fail, with the cause.
4. Update the status column.

## Final gate

A third person can run the project in 10 minutes from the README. A 3 minute demo video exists. One post per phase is published.
