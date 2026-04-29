WITH paid_order_revenue AS (
    SELECT
        DATE_TRUNC('month', o.ordered_at)::date AS revenue_month,
        SUM(oi.quantity * oi.unit_price) AS gross_revenue
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    JOIN payments p ON p.order_id = o.order_id
    WHERE o.order_status IN ('PAID', 'SHIPPED')
      AND p.payment_status = 'PAID'
    GROUP BY DATE_TRUNC('month', o.ordered_at)
)
SELECT
    revenue_month,
    gross_revenue,
    LAG(gross_revenue) OVER (ORDER BY revenue_month) AS previous_month_revenue,
    gross_revenue - COALESCE(LAG(gross_revenue) OVER (ORDER BY revenue_month), 0) AS month_over_month_change
FROM paid_order_revenue
ORDER BY revenue_month;
