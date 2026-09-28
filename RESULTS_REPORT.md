# Customer Retention Analytics — Results Report

## Executive Summary

This project analyzes customer churn using a telecommunications customer dataset and a logistic-regression model.

### Key results

- **7,032 customers** remained after converting `TotalCharges` to numeric and removing rows with missing values.
- The observed churn rate was **26.6%**.
- Churn varied substantially by contract:
  - Month-to-month: **42.7%**
  - One year: **11.3%**
  - Two year: **2.8%**
- Customers who churned had substantially shorter average tenure (**18.0 months**) than customers who stayed (**37.7 months**).
- Average monthly charges were higher among customers who churned (**$74.44**) than among customers who stayed (**$61.31**).
- The logistic-regression model achieved a **ROC-AUC of approximately 0.831** on the held-out test set.

## Business Interpretation

The strongest descriptive pattern is contract structure. Month-to-month customers had a much higher observed churn rate than customers on one- or two-year contracts. Tenure also differed substantially between churned and retained customers.

The model results suggest that contract type, internet service, payment method, tenure, and customer/account characteristics contain useful information for identifying elevated churn probability.

These results support a business hypothesis that retention analysis should pay particular attention to newer customers and customers without longer-term contracts. This is an analytical implication, not evidence that changing a customer's contract would itself cause lower churn.

## Model Evaluation

The model uses:

- Logistic regression
- Standardized numeric variables
- One-hot encoded categorical variables
- 80/20 stratified train/test split
- ROC-AUC as the primary discrimination metric

AUC summarizes how well the model separates higher-risk from lower-risk customers across probability thresholds. A production system would additionally require threshold selection based on the cost of retention outreach and the cost of missed churn.

## Limitations

1. The dataset is historical and may not represent a current customer population.
2. Group differences and model coefficients show associations, not causation.
3. The model was built as a portfolio demonstration rather than a production retention system.
4. Additional validation, calibration, monitoring, and cost-sensitive thresholding would be required before operational use.

## Files

- `Python/01_Customer_Retention_Analytics.ipynb` — cleaned analysis and model
- `SQL/customer_retention_analysis.sql` — SQL analysis
- `Visualizations/` — key charts
- `data/sample_customer_data.csv` — lightweight sample for GitHub
