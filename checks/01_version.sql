/*
    PostgreSQL Health Check
    Check: PostgreSQL version
*/

SELECT
    current_setting('server_version') AS postgres_version,
    current_database() AS database_name,
    current_user AS connected_user,
    now() AS checked_at;
