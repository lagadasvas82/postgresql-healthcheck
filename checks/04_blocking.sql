/*
    PostgreSQL Health Check
    Check: Blocking sessions
*/

SELECT
    blocked.pid AS blocked_pid,
    blocked.usename AS blocked_user,
    blocking.pid AS blocking_pid,
    blocking.usename AS blocking_user,
    now() - blocked.query_start AS blocked_duration,
    left(blocked.query, 300) AS blocked_query,
    left(blocking.query, 300) AS blocking_query
FROM pg_stat_activity blocked
JOIN pg_stat_activity blocking
    ON blocking.pid = ANY(pg_blocking_pids(blocked.pid))
WHERE blocked.pid <> blocking.pid
ORDER BY blocked_duration DESC;
