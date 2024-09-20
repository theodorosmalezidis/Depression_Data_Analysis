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
![age distribution](./images/age_distribution.png)
*Pie chart of age distribution for individuals diagnosed with clinical depression. This visualization was created with ChatGPT after importing my SQL query results*

It appears that the largest proportion of individuals with depression falls into the 21-80 age range, with the 41-60 and 61-80 age groups being the most prominent,
each accounting for roughly 31% of the total.This distribution suggests that adulthood, particularly the middle stages, is where depression is most commonly identified.

**Family Structure Impact on Depression.**

```sql
SELECT
    marital_status,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    marital_status
ORDER BY
    count DESC
```
The results
| Marital Status |  Count   |
|----------      |----------|
| Married        | 240444   |
| Single         | 72110    |
| Windowed       | 68485    |
| Divorced       | 32729    |

The highest number of individuals diagnosed with depression are married. This could suggest that marital stress or other related factors might contribute to depression in this group.
Widowed individuals and single individuals also show significant numbers. The loss of a spouse or the lack of a partner might be contributing factors to depression in these groups.
The number of divorced individuals diagnosed with depression is the lowest among the groups listed. This might indicate that while divorce is a stressful life event,
it may not be as strongly associated with depression as other marital statuses.

```sql
SELECT
    number_of_children,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    number_of_children
ORDER BY 
    count DESC
```
The results
| Number of children |  Count   |
|--------------------|----------|
| 0                  | 155232   |
| 1                  | 83961    |
| 2                  | 83925    |
| 3                  | 76974    |
| 4                  | 13676    |

Childlessness and Depression: There seems to be a higher incidence of depression among individuals without children. This could be due to various factors, including social isolation or lack of familial support.
Parental Support: Having children appears to have a complex relationship with depression. While parenting can be challenging, the presence of children might also provide emotional benefits that help mitigate depression.
Family Size and Support Systems: Larger families might offer stronger support systems, potentially leading to lower rates of depression among individuals with more children.

**How Employment and Education Levels are associated with depression.**

```sql
SELECT
    employment_status,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    employment_status
ORDER BY
    count DESC
```
The results
| Employment Status |  Count   |
|-------------------|----------|
| Employed          | 265659   |
| Unemployed        | 148109   |


Higher Depression Among the Employed: A larger number of employed individuals suffer from depression, which may indicate workplace-related stress or lack of adequate mental health support in work environments.
Impact of Unemployment on Mental Health: A substantial number of unemployed individuals also face depression, highlighting the mental health challenges related to financial instability and social isolation.

```sql
SELECT
    education_level,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    education_level
ORDER BY
    count DESC
```
The results
|    Education Level    |  Count   |
|-----------------------|----------|
| Bachelor's Degree     | 124329   |
| High School           | 118927   |
| Associate Degree      | 79999    |
| Master's Degree       | 73768    |
| PhD                   | 16745    |

Higher Depression Among Bachelor's Degree Holders: Individuals with a Bachelor's degree show the highest number of depression cases, which could reflect stress from job expectations, career transitions, or balancing professional and personal life.
Depression is Significant Across Education Levels: While there are higher numbers in Bachelor's and High School education levels, depression affects individuals at every stage of education, from high school to PhD holders.

**Intersection of Employment and Education Level.**

```sql
SELECT
    education_level,
    employment_status,
    COUNT(*) AS count
FROM
    depression_data
GROUP BY
    education_level, employment_status
ORDER BY
    count DESC;
```
The results
![employment education intersection ](./images/employment_education_plot.png)
*Visual chart of employment status and education level of individuals diagnosed with clinical depression. This visualization was created with ChatGPT after importing my SQL query results*


The data suggests that both higher education and employment do not necessarily protect against depression. In fact, individuals with higher education levels still show high counts of depression diagnoses, indicating that other factors might be at play. Additionally high school graduates are often in a transitional phase, either entering the workforce or pursuing higher education. This period can be stressful and uncertain, contributing to mental health challenges.


```sql
SELECT
    employment_status,
    marital_status,
    COUNT(*) AS total
FROM
    depression_data
GROUP BY
    employment_status,
    marital_status
ORDER BY
    total DESC
```
The results
![employment and marital status intersection ](./images/employment_marital_status_bar_chart.png)
*Visual chart of employment status and education level of individuals diagnosed with clinical depression. This visualization was created with ChatGPT after importing my SQL query results*

Employment and marital status are key variables that may impact the prevalence or severity of depression. Married and employed individuals seem to dominate the dataset, but unemployment and certain life events (like widowhood or divorce) might exacerbate depression, especially when combined with the lack of employment.








## 2. Life Style Habits






## 3. Medical History and Current Medical Conditions

