# PostgreSQL Health Check

A lightweight, read-only PostgreSQL health check toolkit for database administrators.

The project provides SQL-based checks for common PostgreSQL production health and troubleshooting areas.

## Features

- PostgreSQL version and environment information
- Connection usage
- Long-running queries
- Blocking sessions
- Database sizes
- Cache hit ratio
- Streaming replication status
- Vacuum and dead tuple statistics

## Requirements

- PostgreSQL
- A user with sufficient permissions to access the required statistics views

Some checks may return limited information depending on the privileges of the connected user.

## Usage

Run individual checks using `psql`.

Example:
```bash
psql -d mydatabase -f checks/03_long_running_queries.sql
