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

/*
It appears that the largest proportion of individuals with depression falls into the 21-80 age range, with the 41-60 and 61-80 age groups being the most prominent,
each accounting for roughly 31% of the total.This distribution suggests that adulthood, particularly the middle stages, is where depression is most commonly identified.
*/

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

/*
The highest number of individuals diagnosed with depression are married. This could suggest that marital stress or other related factors might contribute to depression in this group.
Widowed individuals and single individuals also show significant numbers. The loss of a spouse or the lack of a partner might be contributing factors to depression in these groups.
The number of divorced individuals diagnosed with depression is the lowest among the groups listed. This might indicate that while divorce is a stressful life event,
it may not be as strongly associated with depression as other marital statuses.
*/


SELECT
    number_of_children,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    number_of_children
ORDER BY 
    count DESC

/*
Childlessness and Depression: There seems to be a higher incidence of depression among individuals without children. This could be due to various factors, including social isolation or lack of familial support.
Parental Support: Having children appears to have a complex relationship with depression. While parenting can be challenging, the presence of children might also provide emotional benefits that help mitigate depression.
Family Size and Support Systems: Larger families might offer stronger support systems, potentially leading to lower rates of depression among individuals with more children.
*/



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

/*
Higher Depression Among the Employed: A larger number of employed individuals suffer from depression, which may indicate workplace-related stress or lack of adequate mental health support in work environments.
Impact of Unemployment on Mental Health: A substantial number of unemployed individuals also face depression, highlighting the mental health challenges related to financial instability and social isolation.
*/

SELECT
    education_level,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    education_level
ORDER BY
    count DESC

/*
Higher Depression Among Bachelor's Degree Holders: Individuals with a Bachelor's degree show the highest number of depression cases, which could reflect stress from job expectations, career transitions, or balancing professional and personal life.
Depression is Significant Across Education Levels: While there are higher numbers in Bachelor's and High School education levels, depression affects individuals at every stage of education, from high school to PhD holders.
*/

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

/*job and marriage factors for strees and depression*/

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


/*  
Education as a Buffer: Higher education seems to act as a buffer against unemployment, even in the presence of clinical depression. Those with Bachelor's Degrees or higher show a stronger ability to stay employed, although not without challenges.
 Vulnerability of Lower Education Groups: Individuals with only a High School or Associate Degree show higher unemployment numbers, indicating that depression may disproportionately affect their ability to stay employed.
Master's and PhDs: Advanced degree holders (Master's and PhD) tend to maintain better employment status, although even in these groups, depression leads to a notable number of unemployed individuals.

These insights suggest that education level influences employment outcomes for individuals diagnosed with clinical depression, but even higher education does not fully protect against the employment challenges posed by depression.