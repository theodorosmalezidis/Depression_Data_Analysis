--investigating how medical history and chronic medical condition factors affect individuals diagnosed with clinical depression.

--History of mental illness

SELECT
    history_of_mental_illness,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    history_of_mental_illness
ORDER BY
    count DESC  

--Chronic Medical Conditions

SELECT
    chronic_medical_conditions,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    chronic_medical_conditions
ORDER BY
    count DESC  

--Family History of Depression

SELECT
    family_history_of_depression,
    COUNT(*) as count
FROM
    depression_data
GROUP BY
    family_history_of_depression
ORDER BY
    count DESC  

--Correlation between history of menatl illness and family history of depression.

SELECT
    history_of_mental_illness,
    family_history_of_depression,
    COUNT(*) AS total_count
FROM
    depression_data
GROUP BY
    history_of_mental_illness,
    family_history_of_depression
ORDER BY
    total_count DESC

/*
 Majority without history: The largest group consists of individuals with neither a personal history of mental illness nor a family history of depression, accounting for over 210,000 individuals.
Mental illness more common: Individuals with a personal history of mental illness but no family history of depression form the second-largest group (around 91,000), indicating that mental illness may occur independently of family history for many.
Family depression correlation: The group with both a personal history of mental illness and a family history of depression (34,244) suggests that while family history may increase risk, not all individuals with mental illness have a family history.
This analysis can be used to further investigate possible genetic or environmental influences. ​
*/

--This query analyzes the association between history of mental illness and substance abuse among individuals diagnosed with clinical depression.

SELECT
    history_of_mental_illness,
    history_of_substance_abuse,
    COUNT(*) AS total_count
FROM
    depression_data
GROUP BY
    history_of_mental_illness,
    history_of_substance_abuse
ORDER BY
    total_count DESC

/*
1)Prevalence of Mental Illness and Substance Abuse:

A)No Mental Illness, No Substance Abuse (198,402 individuals):
The largest group of individuals does not have a history of mental illness or substance abuse.
B)No Mental Illness, But Substance Abuse (89,541 individuals):
A significant number of individuals (89,541) have a history of substance abuse but no history of mental illness.
This suggests that substance abuse might be a contributing factor to depression, even in the absence of other mental health disorders.

2)Mental Illness as a Risk Factor:

A)Mental Illness, No Substance Abuse (86,478 individuals):
A notable group has a history of mental illness but no substance abuse. This indicates that mental health issues,
even without substance abuse, are a significant risk factor for depression.
B)Both Mental Illness and Substance Abuse (39,347 individuals):
The smallest group comprises individuals with both a history of mental illness and substance abuse.
*/

--Correlation between life style factors and medical history and condition.

--Chronic medical conditions

SELECT 
    Smoking_Status,
    Alcohol_Consumption,
    Physical_Activity_Level,
    Dietary_Habits,
    Sleep_Patterns,
    COUNT(CASE WHEN Chronic_Medical_Conditions = 'Yes' THEN 1 END) AS Chronic_Conditions_Count
FROM 
    depression_data
GROUP BY 
    Smoking_Status, 
    Alcohol_Consumption, 
    Physical_Activity_Level, 
    Dietary_Habits,
    Sleep_Patterns

ORDER BY
  COUNT(CASE WHEN Chronic_Medical_Conditions = 'Yes' THEN 1 END) DESC
limit 20

--History of mental illness

SELECT 
    Smoking_Status,
    Alcohol_Consumption,
    Physical_Activity_Level,
    Dietary_Habits,
    Sleep_Patterns,
    COUNT(CASE WHEN history_of_mental_illness = 'Yes' THEN 1 END) AS history_of_mental_illness_Count
FROM 
    depression_data
GROUP BY 
    Smoking_Status, 
    Alcohol_Consumption, 
    Physical_Activity_Level, 
    Dietary_Habits,
    Sleep_Patterns
ORDER BY
  COUNT(CASE WHEN history_of_mental_illness = 'Yes' THEN 1 END) DESC
limit 20

--Family history of depression

SELECT 
    Smoking_Status,
    Alcohol_Consumption,
    Physical_Activity_Level,
    Dietary_Habits,
    Sleep_Patterns,
    COUNT(CASE WHEN family_history_of_depression = 'Yes' THEN 1 END) AS family_history_of_depression_Count
FROM 
    depression_data
GROUP BY 
    Smoking_Status, 
    Alcohol_Consumption, 
    Physical_Activity_Level, 
    Dietary_Habits,
    Sleep_Patterns
ORDER BY
  COUNT(CASE WHEN family_history_of_depression = 'Yes' THEN 1 END) DESC
limit 20