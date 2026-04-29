WITH product_sales AS (
    SELECT
        p.category,
        p.sku,
        p.product_name,
        SUM(oi.quantity) AS units_sold,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products p
    JOIN order_items oi ON oi.product_id = p.product_id
    JOIN orders o ON o.order_id = oi.order_id
    JOIN payments pay ON pay.order_id = o.order_id
    WHERE o.order_status IN ('PAID', 'SHIPPED')
      AND pay.payment_status = 'PAID'
    GROUP BY p.category, p.sku, p.product_name
),
ranked_products AS (
    SELECT
        *,
        DENSE_RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS category_rank
    FROM product_sales
)
SELECT
    category,
    sku,
    product_name,
    units_sold,
    revenue,
    category_rank
FROM ranked_products
WHERE category_rank <= 3
ORDER BY category, category_rank, revenue DESC;
