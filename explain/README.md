# Query Plan Review Notes

Use `EXPLAIN` and `EXPLAIN ANALYZE` to inspect how PostgreSQL executes each query.

Example:

```sql
EXPLAIN ANALYZE
SELECT
    payment_method,
    COUNT(*) AS total_attempts
FROM payments
GROUP BY payment_method;
```

## What To Look For

- Sequential scans on large tables
- Nested loops over high-cardinality joins
- Missing indexes on foreign keys used in joins
- Sort operations that could be reduced with better indexes
- Actual row counts that differ heavily from planner estimates

## Portfolio Notes

For a small sample dataset, PostgreSQL may still choose sequential scans because the table is tiny. That is normal. The recommended indexes are included to show the intended access patterns for larger production-like tables.
