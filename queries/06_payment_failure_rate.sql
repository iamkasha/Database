SELECT
    payment_method,
    COUNT(*) AS total_attempts,
    COUNT(*) FILTER (WHERE payment_status = 'FAILED') AS failed_attempts,
    ROUND(
        COUNT(*) FILTER (WHERE payment_status = 'FAILED')::numeric / NULLIF(COUNT(*), 0),
        4
    ) AS failure_rate
FROM payments
GROUP BY payment_method
ORDER BY failure_rate DESC, total_attempts DESC;
