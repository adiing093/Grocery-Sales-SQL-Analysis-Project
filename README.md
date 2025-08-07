# 🛒 Grocery Sales SQL Analysis Project

This project analyzes a synthetic dataset of grocery sales from a multi-location retail chain over a 2-year period (2023–2025). Built entirely in MySQL Workbench, it demonstrates structured SQL-driven insights, simulating real-world Business Analyst workflows.

---

## 📦 Dataset Overview

- **Records**: 1,980 transactions  
- **Fields**: transaction_id, transaction_date, store_location, product_category, product_name, quantity, unit_price, final_amount, customer_type, loyalty_points  
- **Imported**: via MySQL Workbench Table Import Wizard from CSV  

---

## 🛠️ Tools & Technologies

- **SQL**: MySQL Workbench  
- **Concepts Used**:  
  - `GROUP BY`, `ORDER BY`, `CASE`, `DISTINCT`, `DATE` functions  
  - Aggregation (`SUM`, `COUNT`, `AVG`)  
  - Business logic modeling using reward points  

---

## 🔍 Key Analyses

- 📅 **Time-based trends**: Monthly and yearly revenue patterns  
- 🏬 **Store-wise performance**: Highest and lowest earning locations  
- 🛍️ **Product category sales**: Most sold and top-earning categories  
- 🎁 **Loyalty program impact**: Effect of reward points on revenue and AOV  
- 🧍 **Customer segmentation**: Average spend by customer type  

---

## 📊 Example Queries

```sql
-- Revenue per store
SELECT store_location, SUM(final_amount) AS revenue
FROM grocery_data.grocery_chain_data
GROUP BY store_location
ORDER BY revenue DESC;

-- Monthly revenue trend
SELECT MONTH(transaction_date) AS month, SUM(final_amount) AS monthly_revenue
FROM grocery_data.grocery_chain_data
GROUP BY MONTH(transaction_date)
ORDER BY month;

-- Loyalty points impact
SELECT 
  CASE WHEN loyalty_points > 0 THEN 'Used Points' ELSE 'No Points' END AS status,
  COUNT(*) AS num_orders,
  AVG(final_amount) AS avg_order_value
FROM grocery_data.grocery_chain_data
GROUP BY status;
