WITH inventory_on_hand AS (
    SELECT
        product_id,
        SUM(quantity_delta) AS current_stock
    FROM inventory_movements
    GROUP BY product_id
),
recent_sales AS (
    SELECT
        oi.product_id,
        SUM(oi.quantity) AS units_sold
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.order_status IN ('PAID', 'SHIPPED')
      AND o.ordered_at >= DATE '2025-03-01'
    GROUP BY oi.product_id
)
SELECT
    p.sku,
    p.product_name,
    p.category,
    COALESCE(i.current_stock, 0) AS current_stock,
    COALESCE(s.units_sold, 0) AS recent_units_sold,
    CASE
        WHEN COALESCE(i.current_stock, 0) <= 5 THEN 'HIGH'
        WHEN COALESCE(i.current_stock, 0) <= 10 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS stockout_risk
FROM products p
LEFT JOIN inventory_on_hand i ON i.product_id = p.product_id
LEFT JOIN recent_sales s ON s.product_id = p.product_id
WHERE p.active = TRUE
ORDER BY
    CASE
        WHEN COALESCE(i.current_stock, 0) <= 5 THEN 1
        WHEN COALESCE(i.current_stock, 0) <= 10 THEN 2
        ELSE 3
    END,
    recent_units_sold DESC;
