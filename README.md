# Retail Sales Analysis

An end-to-end retail sales analysis project using **Python, pandas, SQL, and Tableau** to explore revenue performance, customer purchasing behavior, product sales, and international markets.

[View Interactive Tableau Dashboard](https://public.tableau.com/app/profile/cesar.perez5476/viz/OnlineRetailSalesAnalysisRevenueProductsMarkets/OnlineRetailSalesDashboard)

## Project Overview

This project analyzes the UCI Online Retail dataset, containing 541,909 transaction records from a UK-based online retailer between December 2010 and December 2011.

The analysis addresses several business questions:

- How much revenue did the business generate after accounting for cancellations?
- How did monthly revenue change over time?
- Which products and international markets generated the most revenue?
- How important are repeat customers to overall sales?
- How concentrated is revenue among the highest-spending customers?

## Tools & Technologies

- **Python and pandas:** Data cleaning, transformation, and analysis
- **Matplotlib:** Exploratory data visualization
- **SQLite:** SQL queries, aggregations, joins, CTEs, and window functions
- **Tableau Public:** Interactive business intelligence dashboard
- **Jupyter Notebook:** Exploratory analysis and documentation

## Dataset

**Source:** [UCI Machine Learning Repository — Online Retail](https://archive.ics.uci.edu/dataset/352/online+retail)

The original dataset contains **541,909 records**, including sales, cancellations, and transactions without customer identifiers.

For the customer-identified analysis, transactions with missing CustomerID values were excluded, leaving **406,829 records**.

### Data Preparation

The analysis involved:

1. Inspecting missing values, data types, and transaction fields.
2. Distinguishing positive-quantity sales from negative-quantity cancellations.
3. Calculating transaction revenue using `Quantity * UnitPrice`.
4. Preparing a dataset containing identified customers.
5. Aggregating revenue by month, product, country, and customer.
6. Excluding incomplete December 2011 data from monthly trend comparisons.

Net revenue includes the effect of cancellations.

## Key Findings

### 1. Revenue Performance

- **Gross revenue:** £8.91 million
- **Cancellation value:** -£611,342
- **Net revenue:** £8.30 million
- **Sales orders:** 18,536 distinct positive-quantity invoices

Cancellations reduced revenue, demonstrating the importance of distinguishing gross sales from net sales.

### 2. Monthly Revenue Trends

November 2011 was the highest-revenue complete month, generating approximately **£1.13 million** in net revenue.

Revenue increased by **16.19%** compared with October 2011.

December 2011 was excluded from monthly trend comparisons because only the first nine days were available.

### 3. Product Performance

**REGENCY CAKESTAND 3 TIER** was the highest-revenue merchandise product, generating approximately **£132,870** in net revenue.

Products were grouped by StockCode to account for inconsistent descriptions. Non-merchandise entries such as postage and manual adjustments were excluded from merchandise rankings.

### 4. International Markets

The United Kingdom accounted for approximately **81.54%** of net revenue.

The **Netherlands** was the highest-revenue international market outside the United Kingdom.

### 5. Customer Behavior

- **65.57%** of identified purchasing customers were repeat customers.
- Repeat customers generated **93.08%** of gross identified-customer sales revenue.
- Repeat-customer average order value was approximately **£486.74**, compared with **£412.52** for one-time customers.
- The top 10 customers accounted for approximately **17.26%** of gross identified-customer sales revenue.

These findings highlight the importance of repeat purchasing and customer retention.

## Interactive Tableau Dashboard

[**View the Published Tableau Dashboard**](https://public.tableau.com/app/profile/cesar.perez5476/viz/OnlineRetailSalesAnalysisRevenueProductsMarkets/OnlineRetailSalesDashboard)

The dashboard includes:

- Net revenue and total sales order KPIs
- Monthly net revenue trends
- Top 10 products by net revenue
- Top 10 international markets by net revenue
- Interactive country filtering that updates revenue metrics, trends, and product rankings

**Dashboard scope:** The dashboard uses transactions associated with identified customers. December 2011 is excluded from the monthly trend because it is incomplete, while other dashboard metrics cover the full available period.

## Project Structure

```text
retail-sales-analysis/
├── data/                        # Local datasets and SQLite database (not tracked)
├── notebooks/
│   └── retail_analysis.ipynb
├── sql/
│   ├── 01_revenue_analysis.sql
│   ├── 02_monthly_trends.sql
│   └── 03_customer_analysis.sql
├── .gitignore
├── README.md
└── requirements.txt
```

## Running the Project Locally

### 1. Clone the repository

```bash
git clone https://github.com/C3sar10