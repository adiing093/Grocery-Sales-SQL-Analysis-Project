select * from grocery_data.grocery_chain_data; 

-- 1. view first 10 queries
select * from grocery_data.grocery_chain_data
limit 10 ;

-- 2. Total number of transactions
SELECT COUNT(*) FROM grocery_data.grocery_chain_data;

-- 3. See all unique store name
SELECT DISTINCT store_name FROM grocery_data.grocery_chain_data;

-- 4. Total revenue generated
SELECT SUM(total_amount) AS total_revenue FROM grocery_data.grocery_chain_data;

-- 5. List all product categories
SELECT DISTINCT product_name FROM grocery_data.grocery_chain_data;

-- 6. Total quantity sold per product category
SELECT product_name, sum(quantity) as total_quantity
FROM grocery_data.grocery_chain_data
GROUP BY product_name;

-- 7. Revenue per store location
SELECT store_name, SUM(final_amount) AS total_revenue
FROM grocery_data.grocery_chain_data
GROUP BY store_name
ORDER BY total_revenue DESC;

-- 8. Average unit price per product category
SELECT product_name, avg(unit_price) AS avg_price
FROM grocery_data.grocery_chain_data
GROUP BY product_name;

-- 9. Monthly revenue trend
SELECT MONTH(transaction_date), SUM(final_amount) AS monthly_revenue
FROM grocery_data.grocery_chain_data
GROUP BY MONTH(transaction_date)
ORDER BY month(transaction_date);

-- 10. Year-wise total sales
SELECT YEAR(transaction_date), SUM(final_amount) AS annual_revenue
FROM grocery_data.grocery_chain_data
GROUP BY YEAR(transaction_date)
ORDER BY YEAR(transaction_date);





SELECT 
  CASE 
    WHEN loyalty_points > 0 THEN 'Used Loyalty Points'
    ELSE 'No Loyalty Points'
  END AS loyalty_status,
  COUNT(*) AS num_orders,
  SUM(final_amount) AS total_revenue,
  AVG(final_amount) AS avg_order_value
FROM grocery_data.grocery_chain_data
GROUP BY loyalty_status;


