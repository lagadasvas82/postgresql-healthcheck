/*
    PostgreSQL Health Check
    Check: Vacuum / dead tuples
*/

SELECT
    schemaname,
    relname AS table_name,
    n_live_tup,
    n_dead_tup,
    CASE
        WHEN n_live_tup = 0 THEN 0
        ELSE round(
            100.0 * n_dead_tup / n_live_tup,
            2
        )
    END AS dead_tuple_ratio_percent,
    last_vacuum,
    last_autovacuum,
    last_analyze,
    last_autoanalyze
FROM pg_stat_user_tables
WHERE n_dead_tup > 0
ORDER BY n_dead_tup DESC;
