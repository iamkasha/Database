INSERT INTO customers (first_name, last_name, email, state, created_at) VALUES
('Alice', 'Johnson', 'alice@example.com', 'TX', '2025-01-04 09:00:00'),
('Brian', 'Smith', 'brian@example.com', 'CA', '2025-01-15 11:30:00'),
('Carla', 'Patel', 'carla@example.com', 'NY', '2025-02-01 08:15:00'),
('David', 'Nguyen', 'david@example.com', 'WA', '2025-02-20 14:20:00'),
('Elena', 'Garcia', 'elena@example.com', 'IL', '2025-03-05 10:45:00'),
('Fatima', 'Khan', 'fatima@example.com', 'TX', '2025-03-15 16:10:00');

INSERT INTO products (sku, product_name, category, unit_price, active, created_at) VALUES
('BOOK-001', 'System Design Interview Guide', 'Books', 39.99, TRUE, '2025-01-01 00:00:00'),
('BOOK-002', 'SQL Performance Handbook', 'Books', 44.99, TRUE, '2025-01-01 00:00:00'),
('ELEC-001', 'Noise Cancelling Headphones', 'Electronics', 149.99, TRUE, '2025-01-01 00:00:00'),
('ELEC-002', 'Mechanical Keyboard', 'Electronics', 89.99, TRUE, '2025-01-01 00:00:00'),
('HOME-001', 'Standing Desk Mat', 'Home Office', 59.99, TRUE, '2025-01-01 00:00:00'),
('HOME-002', 'Monitor Arm', 'Home Office', 79.99, TRUE, '2025-01-01 00:00:00');

INSERT INTO orders (customer_id, order_status, ordered_at, shipped_at) VALUES
(1, 'PAID', '2025-01-10 10:00:00', '2025-01-11 13:00:00'),
(1, 'SHIPPED', '2025-02-12 12:00:00', '2025-02-14 09:00:00'),
(2, 'PAID', '2025-02-18 15:30:00', NULL),
(3, 'CANCELLED', '2025-03-01 17:45:00', NULL),
(3, 'PAID', '2025-03-11 09:10:00', '2025-03-12 10:30:00'),
(4, 'PAID', '2025-03-19 18:25:00', NULL),
(5, 'REFUNDED', '2025-04-02 08:50:00', '2025-04-04 11:00:00'),
(6, 'PAID', '2025-04-14 13:15:00', NULL),
(6, 'PAID', '2025-04-21 20:40:00', NULL);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 39.99),
(1, 4, 1, 89.99),
(2, 2, 1, 44.99),
(2, 6, 1, 79.99),
(3, 3, 1, 149.99),
(4, 5, 1, 59.99),
(5, 1, 2, 39.99),
(5, 2, 1, 44.99),
(6, 4, 2, 89.99),
(7, 3, 1, 149.99),
(8, 5, 1, 59.99),
(8, 6, 1, 79.99),
(9, 2, 2, 44.99);

INSERT INTO payments (order_id, payment_method, payment_status, amount, paid_at) VALUES
(1, 'CARD', 'PAID', 129.98, '2025-01-10 10:02:00'),
(2, 'PAYPAL', 'PAID', 124.98, '2025-02-12 12:02:00'),
(3, 'CARD', 'PAID', 149.99, '2025-02-18 15:32:00'),
(4, 'CARD', 'FAILED', 59.99, NULL),
(5, 'GIFT_CARD', 'PAID', 124.97, '2025-03-11 09:11:00'),
(6, 'CARD', 'PAID', 179.98, '2025-03-19 18:27:00'),
(7, 'BANK_TRANSFER', 'REFUNDED', 149.99, '2025-04-02 08:52:00'),
(8, 'PAYPAL', 'PAID', 139.98, '2025-04-14 13:16:00'),
(9, 'CARD', 'PAID', 89.98, '2025-04-21 20:42:00');

INSERT INTO inventory_movements (product_id, movement_type, quantity_delta, movement_at) VALUES
(1, 'RESTOCK', 50, '2025-01-01 00:00:00'),
(2, 'RESTOCK', 35, '2025-01-01 00:00:00'),
(3, 'RESTOCK', 20, '2025-01-01 00:00:00'),
(4, 'RESTOCK', 30, '2025-01-01 00:00:00'),
(5, 'RESTOCK', 15, '2025-01-01 00:00:00'),
(6, 'RESTOCK', 12, '2025-01-01 00:00:00'),
(1, 'SALE', -3, '2025-03-11 09:12:00'),
(2, 'SALE', -4, '2025-04-21 20:43:00'),
(3, 'SALE', -2, '2025-04-02 08:53:00'),
(4, 'SALE', -3, '2025-03-19 18:28:00'),
(5, 'SALE', -2, '2025-04-14 13:17:00'),
(6, 'SALE', -2, '2025-04-14 13:17:00'),
(6, 'ADJUSTMENT', -7, '2025-04-25 09:00:00');
