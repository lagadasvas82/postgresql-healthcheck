/*
    PostgreSQL Health Check
    Check: Long-running queries
*/

SELECT
    pid,
    usename,
    datname,
    state,
    now() - query_start AS duration,
    wait_event_type,
    wait_event,
    left(query, 500) AS query
FROM pg_stat_activity
WHERE query_start IS NOT NULL
  AND state <> 'idle'
  AND now() - query_start > interval '5 minutes'
ORDER BY duration DESC;
