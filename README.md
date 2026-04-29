# SQL Query Practice

Portfolio-ready SQL practice repo focused on PostgreSQL, relational modeling, analytics queries, and query-performance fundamentals.

This repository is intentionally small and practical. It uses a realistic e-commerce dataset to demonstrate schema design, joins, aggregation, window functions, CTEs, indexing, and business-oriented reporting queries.

## What This Shows

- Normalized relational schema design
- PostgreSQL DDL and seed data
- Analytical SQL using CTEs and window functions
- Revenue, customer, inventory, and product-performance reporting
- Indexing strategy for common access patterns
- CI that validates SQL against a real PostgreSQL service
- LeetCode-style SQL practice kept separately from portfolio queries

## Repository Structure

```text
schema/
  001_create_schema.sql     Database tables, constraints, and relationships
  002_seed_data.sql         Sample e-commerce data

queries/
  01_monthly_revenue.sql
  02_customer_lifetime_value.sql
  03_inventory_risk_report.sql
  04_repeat_purchase_rate.sql
  05_top_products_by_category.sql
  06_payment_failure_rate.sql

indexes/
  001_recommended_indexes.sql

explain/
  README.md                 Notes on how to review query plans

SELECT_Queries/
  LeetCode-style SQL practice
```

## Quick Start

Start PostgreSQL:

```bash
docker compose up -d
```

Load schema and seed data:

```bash
docker exec -i sql-practice-postgres psql -U postgres -d sql_practice < schema/001_create_schema.sql
docker exec -i sql-practice-postgres psql -U postgres -d sql_practice < schema/002_seed_data.sql
```

Run a query:

```bash
docker exec -i sql-practice-postgres psql -U postgres -d sql_practice < queries/01_monthly_revenue.sql
```

Apply recommended indexes:

```bash
docker exec -i sql-practice-postgres psql -U postgres -d sql_practice < indexes/001_recommended_indexes.sql
```

## Business Questions Answered

| Query | Question |
| --- | --- |
| `01_monthly_revenue.sql` | How much paid revenue did the business generate each month? |
| `02_customer_lifetime_value.sql` | Which customers have the highest lifetime value? |
| `03_inventory_risk_report.sql` | Which products are at risk of stocking out? |
| `04_repeat_purchase_rate.sql` | What percentage of customers place repeat orders? |
| `05_top_products_by_category.sql` | Which products perform best within each category? |
| `06_payment_failure_rate.sql` | What is the payment failure rate by method? |

## Example Query Topics

- `JOIN`
- `GROUP BY`
- `HAVING`
- `CASE`
- `COALESCE`
- CTEs
- Window functions
- Date truncation
- Ranking
- Conditional aggregation

## CI

GitHub Actions starts PostgreSQL, loads the schema, seeds data, applies indexes, and executes every query file. This keeps the repo honest: SQL examples must run successfully, not just look correct.

## Notes

The `SELECT_Queries` folder contains older LeetCode-style solutions. The main portfolio signal is the PostgreSQL e-commerce dataset and query suite.
