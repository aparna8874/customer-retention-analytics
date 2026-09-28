-- CUSTOMER RETENTION ANALYTICS | DuckDB
-- Replace the sample CSV path with the full dataset when running locally.

SELECT COUNT(*) AS customers,
       AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0.0 END) AS churn_rate
FROM read_csv_auto('../data/sample_customer_data.csv');

SELECT Contract,
       COUNT(*) AS customers,
       AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0.0 END) AS churn_rate
FROM read_csv_auto('../data/sample_customer_data.csv')
GROUP BY Contract
ORDER BY churn_rate DESC;

SELECT Churn,
       AVG(tenure) AS avg_tenure_months,
       AVG(MonthlyCharges) AS avg_monthly_charges
FROM read_csv_auto('../data/sample_customer_data.csv')
GROUP BY Churn;

SELECT PaymentMethod,
       COUNT(*) AS customers,
       AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0.0 END) AS churn_rate
FROM read_csv_auto('../data/sample_customer_data.csv')
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;
