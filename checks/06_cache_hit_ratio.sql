/*
    PostgreSQL Health Check
    Check: Database cache hit ratio
*/

SELECT
    datname AS database_name,
    blks_read,
    blks_hit,
    round(
        100.0 * blks_hit /
        NULLIF(blks_hit + blks_read, 0),
        2
    ) AS cache_hit_ratio_percent
FROM pg_stat_database
WHERE datname IS NOT NULL
ORDER BY cache_hit_ratio_percent ASC;
