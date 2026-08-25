/*
    PostgreSQL Health Check
    Check: Database sizes
*/

SELECT
    datname AS database_name,
    pg_size_pretty(pg_database_size(datname)) AS size,
    pg_database_size(datname) AS size_bytes
FROM pg_database
WHERE datallowconn
ORDER BY pg_database_size(datname) DESC;
