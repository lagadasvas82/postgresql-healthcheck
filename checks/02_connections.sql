/*
    PostgreSQL Health Check
    Check: Connection usage
*/

SELECT
    current_setting('max_connections')::integer AS max_connections,
    count(*) AS current_connections,
    round(
        100.0 * count(*) /
        current_setting('max_connections')::integer,
        2
    ) AS connection_usage_percent
FROM pg_stat_activity;
