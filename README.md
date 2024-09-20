# Introduction

In this project, I am exploring a synthetic dataset that contains a range of personal, health, lifestyle, and socio-economic factors from individuals, all of whom have been diagnosed with clinical depression. The goal is to provide a data-driven analysis of how these factors may influence or correlate with clinical depression, providing valuable insights into the complex relationships between mental health, lifestyle choices, and socio-economic conditions.

I use frequent SQL queries with GROUP BY and COUNT to generate cross-tabulations of key factors such as lifestyle, socio-economic status, and health conditions. These tabulations are then visualized in charts or tables to analyze trends and patterns, providing a clearer understanding of how various factors relate to clinical depression.

Feel free to check out the queries for this analysis here : [project_queries](/project_queries/)


# Dataset

A dataset that contains information on individuals, diagnosed with clinical depression, with various attributes related to their personal and lifestyle factors from [kaggle](https://www.kaggle.com/datasets/anthonytherrien/depression-dataset?resource=download).


# My Tools for the Project

- **PostgreSQL :** The powerhouse database that combines reliability with cutting-edge features.
- **VS Code :** Your ultimate code editor for seamless coding and debugging adventures.
- **SQL :** The language that brings your data to life with precision and power.
- **Git :** The version control wizard that keeps your code history tidy and collaborative.
- **GitHub :** Essential for sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
- **ChatGPT :** A powerful tool for data visualization that helps me generate visual charts after providing the results of my queries.

# Analysis

## 1. Demographic Factors

With the following queries i try to find if there is an impact of demographic factors on clinical depression.

**Age Distribution**

```sql
SELECT
    age_bucket,
    COUNT(*) AS total_count,
    ROUND((COUNT(*) / SUM(COUNT(*)) OVER ()) * 100, 2) AS percentage
FROM (
    SELECT
        CASE
            WHEN age BETWEEN 0 AND 20 THEN '0-20'
            WHEN age BETWEEN 21 AND 40 THEN '21-40'
            WHEN age BETWEEN 41 AND 60 THEN '41-60'
            WHEN age BETWEEN 61 AND 80 THEN '61-80'
            ELSE 'Unknown'
        END AS age_bucket
    FROM
        depression_data
) AS age_buckets
GROUP BY
    age_bucket;
```
The results
![age distribution](./images/age distribution.png)
*Pie chart of age distribution for individuals diagnosed with clinical depression. This visualization was created with ChatGPT after importing my SQL query results*
## 2. Life Style Habits

## 3. Medical History and Current Medical Conditions

