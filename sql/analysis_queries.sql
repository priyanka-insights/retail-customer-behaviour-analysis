USE retail_analysis;

-- ================================================
-- RETAIL CUSTOMER BEHAVIOUR ANALYSIS
-- SQL Analysis — 12 Business Queries
-- Tool: MySQL | Dataset: 3,900 customers
-- ================================================


-- ================================================
-- GROUP A — FOUNDATION QUERIES
-- ================================================

-- Business Question 1: Which product category drives highest revenue?
SELECT 
    category,
    SUM(purchase_amount) AS total_revenue,
    COUNT(*) AS total_orders,
    ROUND(AVG(purchase_amount), 2) AS avg_order_value
FROM customers
GROUP BY category
ORDER BY total_revenue DESC;
-- Result: Clothing $104,264 | Accessories $74,200 | Footwear $36,093 | Outerwear $18,524


-- Business Question 2: Do discounts increase average order value?
SELECT 
    discount_applied,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase,
    COUNT(*) AS total_orders
FROM customers
GROUP BY discount_applied;
-- Result: Yes=$59.28 | No=$60.13 — Discounts do NOT increase AOV


-- Business Question 3: Revenue and spend by gender
SELECT 
    gender,
    SUM(purchase_amount) AS total_revenue,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_spend
FROM customers
GROUP BY gender
ORDER BY total_revenue DESC;
-- Result: Male $157,890 | Female $75,191 — per customer spend nearly equal


-- Business Question 4: Do subscribers spend more than non-subscribers?
SELECT 
    subscription_status,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_spend
FROM customers
GROUP BY subscription_status;
-- Result: Yes=$59.49 | No=$59.87 — virtually no difference


-- ================================================
-- GROUP B — INTERMEDIATE QUERIES
-- ================================================

-- Business Question 5: Customer Segmentation by Purchase History
SELECT 
    CASE 
        WHEN previous_purchases <= 1 THEN 'New'
        WHEN previous_purchases BETWEEN 2 AND 4 THEN 'Returning'
        ELSE 'Loyal'
    END AS customer_segment,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_spend,
    SUM(purchase_amount) AS total_revenue
FROM customers
GROUP BY customer_segment
ORDER BY total_customers DESC;
-- Result: Loyal=3563 | Returning=254 | New=83


-- Business Question 6: Top 3 products per category by order count
SELECT 
    category,
    item_purchased,
    order_count,
    category_rank
FROM (
    SELECT 
        category,
        item_purchased,
        COUNT(*) AS order_count,
        RANK() OVER (PARTITION BY category ORDER BY COUNT(*) DESC) AS category_rank
    FROM customers
    GROUP BY category, item_purchased
) ranked
WHERE category_rank <= 3
ORDER BY category, category_rank;
-- Result: Shows top 3 items per category using RANK window function


-- Business Question 7: Revenue by Age Group
SELECT 
    CASE 
        WHEN age <= 25 THEN '18-25'
        WHEN age <= 35 THEN '26-35'
        WHEN age <= 50 THEN '36-50'
        ELSE '51+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_spend
FROM customers
GROUP BY 
    CASE 
        WHEN age <= 25 THEN '18-25'
        WHEN age <= 35 THEN '26-35'
        WHEN age <= 50 THEN '36-50'
        ELSE '51+'
    END
ORDER BY total_revenue DESC;
-- Result: 51+=$88,480 | 36-50=$65,629 | 26-35=$44,342 | 18-25=$34,630


-- Business Question 8: Promo Code vs Discount — 4 Group Comparison
-- This is a unique query — only possible with this dataset
SELECT 
    CASE
        WHEN discount_applied = 'Yes' AND promo_code_used = 'Yes' THEN 'Both Applied'
        WHEN discount_applied = 'No' AND promo_code_used = 'Yes' THEN 'Promo Only'
        WHEN discount_applied = 'Yes' AND promo_code_used = 'No' THEN 'Discount Only'
        ELSE 'Neither'
    END AS promo_group,
    COUNT(*) AS total_orders,
    ROUND(AVG(purchase_amount), 2) AS avg_spend,
    SUM(purchase_amount) AS total_revenue
FROM customers
GROUP BY promo_group
ORDER BY avg_spend DESC;
-- Result: Compares all 4 promotional combinations
-- Finding: Neither group shows significantly higher AOV


-- ================================================
-- GROUP C — ADVANCED QUERIES
-- ================================================

-- Business Question 9: Cumulative Revenue Ranking (Pareto Analysis)
SELECT 
    customer_id,
    purchase_amount,
    SUM(purchase_amount) OVER (ORDER BY purchase_amount DESC) AS cumulative_revenue,
    ROUND(
        SUM(purchase_amount) OVER (ORDER BY purchase_amount DESC) / 
        SUM(purchase_amount) OVER () * 100, 2
    ) AS cumulative_percentage
FROM customers
ORDER BY purchase_amount DESC
LIMIT 20;
-- Result: Shows what % of revenue top customers drive
-- Finding: Revenue is evenly spread — no single customer group dominates


-- Business Question 10: Season-wise Revenue with Percentage Share
SELECT 
    season,
    COUNT(*) AS total_orders,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_order_value,
    ROUND(
        SUM(purchase_amount) * 100.0 / SUM(SUM(purchase_amount)) OVER (), 2
    ) AS revenue_percentage
FROM customers
GROUP BY season
ORDER BY total_revenue DESC;
-- Result: Fall=25.7% | Spring=25.2% | Winter=25.2% | Summer=23.9%
-- Finding: Revenue nearly uniform across seasons — demand is not seasonal


-- Business Question 11: Purchase Frequency vs Average Spend
SELECT 
    frequency_of_purchases,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_spend,
    SUM(purchase_amount) AS total_revenue
FROM customers
GROUP BY frequency_of_purchases
ORDER BY avg_spend DESC;
-- Result: Weekly vs Monthly vs Annual buyers spend comparison
-- Finding: Purchase frequency does not significantly affect spend per order


-- Business Question 12: Loyal Customer Subscription Analysis
SELECT 
    subscription_status,
    COUNT(*) AS loyal_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_spend,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM customers
WHERE 
    CASE 
        WHEN previous_purchases <= 1 THEN 'New'
        WHEN previous_purchases BETWEEN 2 AND 4 THEN 'Returning'
        ELSE 'Loyal'
    END = 'Loyal'
GROUP BY subscription_status;
-- Result: Of 3,563 loyal customers — how many subscribed vs not
-- Finding: Non-subscribed loyal customers = biggest subscription growth opportunity