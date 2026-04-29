CREATE INDEX IF NOT EXISTS idx_orders_customer_id_ordered_at
    ON orders (customer_id, ordered_at DESC);

CREATE INDEX IF NOT EXISTS idx_orders_status_ordered_at
    ON orders (order_status, ordered_at DESC);

CREATE INDEX IF NOT EXISTS idx_order_items_order_id
    ON order_items (order_id);

CREATE INDEX IF NOT EXISTS idx_order_items_product_id
    ON order_items (product_id);

CREATE INDEX IF NOT EXISTS idx_payments_order_id_status
    ON payments (order_id, payment_status);

CREATE INDEX IF NOT EXISTS idx_inventory_movements_product_id
    ON inventory_movements (product_id);

CREATE INDEX IF NOT EXISTS idx_products_category
    ON products (category);
