SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.state,
    COUNT(DISTINCT o.order_id) AS paid_orders,
    SUM(oi.quantity * oi.unit_price) AS lifetime_value,
    ROUND(AVG(oi.quantity * oi.unit_price), 2) AS average_line_value,
    MAX(o.ordered_at) AS last_order_at
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN payments p ON p.order_id = o.order_id
WHERE o.order_status IN ('PAID', 'SHIPPED')
  AND p.payment_status = 'PAID'
GROUP BY c.customer_id, c.first_name, c.last_name, c.state
ORDER BY lifetime_value DESC;
