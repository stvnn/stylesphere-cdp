#!/bin/bash
# Runs once, on the first start of an empty data volume.
# Creates extensions, schemas and two least-privilege roles.
#   writer: owns raw, staging, core, marts. Used by the generator and dbt.
#   reader: SELECT on marts only. Used by Power BI and agents.
set -euo pipefail

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" \
  -v dbname="$POSTGRES_DB" \
  -v writer_user="$WRITER_USER" -v writer_password="$WRITER_PASSWORD" \
  -v reader_user="$READER_USER" -v reader_password="$READER_PASSWORD" <<'SQL'

CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;

CREATE ROLE :"writer_user" LOGIN PASSWORD :'writer_password';
CREATE ROLE :"reader_user" LOGIN PASSWORD :'reader_password';

REVOKE ALL ON DATABASE :"dbname" FROM PUBLIC;
GRANT CONNECT ON DATABASE :"dbname" TO :"writer_user", :"reader_user";
REVOKE CREATE ON SCHEMA public FROM PUBLIC;
REVOKE CONNECT ON DATABASE postgres FROM PUBLIC;

CREATE SCHEMA raw     AUTHORIZATION :"writer_user";
CREATE SCHEMA staging AUTHORIZATION :"writer_user";
CREATE SCHEMA core    AUTHORIZATION :"writer_user";
CREATE SCHEMA marts   AUTHORIZATION :"writer_user";

GRANT USAGE ON SCHEMA marts TO :"reader_user";
ALTER DEFAULT PRIVILEGES FOR ROLE :"writer_user" IN SCHEMA marts
  GRANT SELECT ON TABLES TO :"reader_user";

SQL
