WITH customer_order_counts AS (
    SELECT
        c.customer_id,
        COUNT(DISTINCT o.order_id) AS paid_order_count
    FROM customers c
    LEFT JOIN orders o
        ON o.customer_id = c.customer_id
       AND o.order_status IN ('PAID', 'SHIPPED')
    LEFT JOIN payments p
        ON p.order_id = o.order_id
       AND p.payment_status = 'PAID'
    GROUP BY c.customer_id
)
SELECT
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE paid_order_count >= 1) AS purchasing_customers,
    COUNT(*) FILTER (WHERE paid_order_count >= 2) AS repeat_customers,
    ROUND(
        COUNT(*) FILTER (WHERE paid_order_count >= 2)::numeric
        / NULLIF(COUNT(*) FILTER (WHERE paid_order_count >= 1), 0),
        4
    ) AS repeat_purchase_rate
FROM customer_order_counts;
