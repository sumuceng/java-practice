-- ============================================
-- MySQL 练习：建表、基础查询、索引实验
-- 数据库：shop
-- ============================================

-- ---------- 建库建表 ----------
CREATE DATABASE IF NOT EXISTS shop DEFAULT CHARACTER SET utf8mb4;
USE shop;

CREATE TABLE IF NOT EXISTS orders (
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_no   VARCHAR(32)  NOT NULL,
    user_id    BIGINT       NOT NULL,
    amount     DECIMAL(10,2) NOT NULL,
    status     TINYINT      NOT NULL DEFAULT 0,   -- 0待付 1已付 2已发货
    created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ---------- 测试数据 ----------
INSERT INTO orders (order_no, user_id, amount, status, created_at) VALUES
('NO001', 1,  99.90, 1, '2026-11-01 10:00:00'),
('NO002', 1, 199.00, 2, '2026-11-02 11:30:00'),
('NO003', 2,  59.50, 0, '2026-11-03 09:15:00'),
('NO004', 2, 399.00, 1, '2026-11-03 14:20:00'),
('NO005', 3,  88.80, 1, '2026-11-04 16:45:00'),
('NO006', 3, 150.00, 1, '2026-11-04 18:00:00');

-- ---------- 基础查询 ----------

-- 1. 只查两列
SELECT order_no, amount FROM orders;

-- 2. 条件筛选
SELECT * FROM orders WHERE status = 1;

-- 3. 条件 + 排序（金额大于 100，从大到小）
SELECT * FROM orders WHERE amount > 100 ORDER BY amount DESC;

-- 4. 分组统计（每个用户的订单数和总金额）
SELECT user_id, COUNT(*), SUM(amount)
FROM orders
GROUP BY user_id;

-- 5. 分组后取第一名（消费最多的用户）
SELECT user_id, SUM(amount) AS total
FROM orders
GROUP BY user_id
ORDER BY total DESC
LIMIT 1;

-- ---------- 索引实验 ----------

-- 建索引前：type = ALL, rows = 99827
EXPLAIN SELECT * FROM orders WHERE user_id = 50;

CREATE INDEX idx_user_id ON orders(user_id);

-- 建索引后：type = ref, rows = 1000, Extra 为空（需要回表）
EXPLAIN SELECT * FROM orders WHERE user_id = 50;

-- 覆盖索引：只查索引里有的列，Extra = Using index（不回表）
EXPLAIN SELECT user_id FROM orders WHERE user_id = 50;

-- 索引失效 1：索引列上做运算 → type 变回 ALL
EXPLAIN SELECT * FROM orders WHERE user_id + 1 = 51;

-- 索引失效 2：字符串列和数字比较 → type 变回 ALL
CREATE INDEX idx_order_no ON orders(order_no);
EXPLAIN SELECT * FROM orders WHERE order_no = 'NO123';   -- 走索引
EXPLAIN SELECT * FROM orders WHERE order_no = 123;        -- 失效
