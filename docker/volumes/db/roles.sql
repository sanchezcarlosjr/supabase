-- NOTE: change to your own passwords for production environments
\set pgpass `echo "$POSTGRES_PASSWORD"`

ALTER USER authenticator WITH PASSWORD :'pgpass';
ALTER USER pgbouncer WITH PASSWORD :'pgpass';
ALTER USER supabase_auth_admin WITH PASSWORD :'pgpass';
ALTER USER supabase_functions_admin WITH PASSWORD :'pgpass';
ALTER USER supabase_storage_admin WITH PASSWORD :'pgpass';

CREATE ROLE directus WITH PASSWORD :'pgpass';
GRANT directus TO authenticator;
GRANT anon TO directus;

CREATE schema cms;
GRANT USAGE ON SCHEMA cms TO directus;
GRANT CREATE ON SCHEMA cms TO directus;
GRANT CREATE ON SCHEMA cms TO directus;

GRANT SELECT ON ALL TABLES IN SCHEMA cms TO directus;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA cms TO directus;
ALTER DEFAULT PRIVILEGES IN SCHEMA cms
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO directus;
