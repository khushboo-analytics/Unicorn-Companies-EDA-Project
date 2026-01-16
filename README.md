 Unicorn Companies SQL EDA Project

## 📌 Project Overview

This project performs **Exploratory Data Analysis (EDA)** on a dataset of **global unicorn companies** (startups valued at $1B+), using **MySQL**.
The analysis focuses on identifying **growth trends, geographic concentration, industry dominance, valuation drivers, and time-to-unicorn patterns**.

📊 **All analysis was conducted using SQL queries only**.

> 📌 **Note:**
> The dataset used in this project is **synthetic** and sourced from **Kaggle**.
> https://www.kaggle.com/datasets/deepcontractor/unicorn-companies-dataset

---

## 🎯 Business Objectives

* Analyze **global unicorn growth trends over time**
* Identify **top countries, cities, and industries** producing unicorns
* Measure **valuation distribution and industry-wise averages**
* Understand **how long startups take to reach unicorn status**
* Analyze **financial stages and exit patterns**

---

## 🗂️ Dataset Summary

The dataset contains **1,000+ unicorn companies** with the following key attributes:

* Company name
* Valuation (USD billions)
* Year founded
* Year joined unicorn club
* Country & city
* Industry
* Financial stage
* Funding & investor-related metrics

---

## 🧹 Data Cleaning (SQL)

* Standardized categorical columns (industry, city, country, financial stage)
* Removed duplicate company records
* Handled NULL values in numeric fields
* Validated date and valuation formats

---

## 📊 Key Metrics (KPIs)

| Metric                     | Value / Insight                           |
| -------------------------- | ----------------------------------------- |
| Total Unicorns             | **900+ companies analyzed**             |
| Peak Unicorn Creation Year | **2021 (480 unicorns)**                   |
| Top Country                | **United States (504 unicorns)**          |
| Top City                   | **San Francisco (131 unicorns)**          |
| Most Common Industry       | **Fintech (187 unicorns)**                |
| Highest Valuation          | **ByteDance – $140B**                     |
| Average Time to Unicorn    | **~6–8 years**                            |
| Fastest Time to Unicorn    | **0–1 year**                              |
| Dominant Financial Stage   | **Unspecified / Private (926 companies)** |

---

## 📈 Analysis & Outcomes

### 📅 Unicorn Growth Over Time

* Unicorn creation accelerated significantly after **2017**
* **2021 marked the peak**, contributing nearly **50% of all unicorns**
* Noticeable slowdown observed post-2021

---

### 🌍 Country-wise Unicorn Distribution

Top countries by unicorn count:

1. **United States – 504**
2. United Kingdom – 39
3. South Korea – 11
4. Sweden – 6

➡ Indicates strong **startup ecosystems concentrated in a few regions**

---

### 🏙 City-wise Concentration

Top cities producing unicorns:

* **San Francisco – 131**
* New York – 91
* Beijing – 59
* London – 30
* Bengaluru – 26

➡ Highlights **urban startup hubs driving innovation**

---

### 🏭 Industry Insights

Top industries by unicorn count:

* **Fintech – 187**
* Internet Software & Services – 182
* E-commerce & D2C – 99
* Artificial Intelligence – 71
* Health – 65

➡ Fintech and software dominate unicorn creation globally

---

### 💰 Valuation Analysis

Top highest-valued unicorns:

* **ByteDance (China) – $140B**
* SpaceX (USA) – $100.3B
* Stripe (USA) – $95B
* Klarna (Sweden) – $45.6B

Average valuation by industry:

* Fintech – ~$10B
* Artificial Intelligence – ~$4.1B
* Data Management & Analytics – ~$3.3B

---

### ⏳ Time Taken to Become a Unicorn

* Average time: **6–8 years**
* Several companies reached unicorn status in **0–1 year**
* Examples of fastest unicorns:

  * Mensa Brands
  * ClickHouse
  * Flink
  * Ola Electric Mobility

➡ Demonstrates how **capital access and market timing** accelerate growth

---

### 💼 Financial Stage Distribution

* **926 companies** listed with no explicit financial stage
* Small proportions reached:

  * Acquired (21)
  * IPO (7)
  * Divestiture & others (limited)

➡ Most unicorns remain **privately held**

---

## 🛠️ Tools & Technologies

* **MySQL**
* **MySQL Workbench**
* **GitHub**
  

---

## 📂 Project Structure

```
📁 Unicorn-SQL-EDA
│── README.md
│── sql/
│   ├── data_cleaning.sql
│   ├── exploratory_analysis.sql
│   └── advanced_queries.sql
│── data/
│   └── unicorncompanies.csv
```

---

## 📌 Key Takeaways

* Unicorn growth surged dramatically post-2017
* The U.S. dominates global unicorn creation
* Fintech and software-based startups lead valuations
* Rapid unicorn formation is increasingly common in recent years
* A small number of companies drive extremely high valuations





