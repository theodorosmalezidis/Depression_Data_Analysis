--Simple Demographic Factors of Individuals Diagnosed with Depression

--Age Distribution.

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


--Family Structure Impact on Depression

SELECT
    marital_status,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    marital_status
ORDER BY
    count DESC




SELECT
    number_of_children,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    number_of_children
ORDER BY 
    count DESC


--How Employment and Education Levels are associated with depression

SELECT
    employment_status,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    employment_status
ORDER BY
    count DESC


SELECT
    education_level,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    education_level
ORDER BY
    count DESC



--CORRELATIONS

-- Intersection of Marital and Employment Status

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



--Employment and Education Levels

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

