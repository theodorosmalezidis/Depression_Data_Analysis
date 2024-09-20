--Investigating the Impact of Lifestyle Habits on Depression
--Purpose: To identify how lifestyle choices contribute to mental health outcomes.


--With this query i want to explore whether individuals with healthier diets are less likely to suffer from depression compared to those with moderate or unhealthy eating habits.

SELECT
    dietary_habits,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    dietary_habits
ORDER BY
    count DESC

--This query explores the correlation between different sleep patterns and the prevalence of clinical depression among individuals. 

SELECT
    sleep_patterns,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    sleep_patterns
ORDER BY
    count DESC

-- With this query i aim to understand how different levels of physical activity are linked to clinical depression.

SELECT
    physical_activity_level,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    physical_activity_level
ORDER BY
    count DESC

--Is there a relationship between alcohol consumption levels (Low, Moderate, or High) and clinical depression?

SELECT
    alcohol_consumption,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    alcohol_consumption
ORDER BY
    count DESC    

--How smoking status interacts with clinical depression?

SELECT
    smoking_status,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    smoking_status
ORDER BY
    count DESC 

--Correlations

SELECT
    smoking_status,
    alcohol_consumption,
    dietary_habits,
    physical_activity_level,
    sleep_patterns,
    COUNT(*) AS depression_count
FROM
    depression_data
GROUP BY
    smoking_status,
    alcohol_consumption,
    dietary_habits,
    physical_activity_level,
    sleep_patterns
ORDER BY
    depression_count DESC
LIMIT 20
--find trends or patterns among the first 20 correlations.

--smoking and alcohol as factors
SELECT
    smoking_status,
    alcohol_consumption,
    COUNT(*) AS total
FROM
    depression_data
GROUP BY
    smoking_status,
    alcohol_consumption
ORDER BY
    total DESC        


/*Substance Use as Coping Mechanism: Across the board, the high prevalence of moderate and high alcohol consumption,
regardless of smoking status, suggests that many individuals with clinical depression turn to substances as a means
of managing or escaping their symptoms. Smoking and drinking, especially in combination,
are known to exacerbate depression by increasing anxiety, disrupting sleep,
and interfering with the effectiveness of medications like antidepressants.
*/