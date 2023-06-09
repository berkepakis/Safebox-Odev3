SELECT * FROM sales ORDER BY customer, date

SELECT customer, SUM(amount) AS total_spent FROM sales GROUP BY customer

SELECT * FROM (SELECT customer, amount, RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS rank FROM sales) WHERE rank <= 3

SELECT customer, amount, FIRST_VALUE(amount) OVER (PARTITION BY customer ORDER BY date) AS first_purchase, LAST_VALUE(amount) OVER (PARTITION BY customer ORDER BY date RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_purchase FROM sales

SELECT AVG(amount) AS avg_monthly_spend FROM sales WHERE DATE_TRUNC('month', date) = '2019-12-01'

SELECT date, SUM(CASE WHEN amount > 100 THEN amount ELSE 0 END) AS big_spend_days FROM sales GROUP BY date

SELECT channel, COUNT(*) AS transactions, APPROXIMATE PERCENTILE(amount, 0.5) WITHIN GROUP(ORDER BY amount) AS median_amount FROM sales GROUP BY channel

SELECT * FROM (SELECT date, amount, RANK() OVER (PARTITION BY date ORDER BY amount DESC) AS rank FROM sales) WHERE rank = 1