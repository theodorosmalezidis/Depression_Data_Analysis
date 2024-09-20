-- Create depression_data table

CREATE TABLE public.depression_data
(
    name TEXT,
    age INT,
    marital_status TEXT,
    education_level TEXT,
    number_of_children INT,
    smoking_status TEXT,
    physical_activity_level TEXT,
    employment_status TEXT,
    income INT,
    alcohol_consumption TEXT,
    dietary_habits TEXT,
    sleep_patterns TEXT,
    history_of_mental_illness BOOLEAN,
    history_of_substance_abuse BOOLEAN,
    family_history_of_depression BOOLEAN,
    chronic_medical_conditions BOOLEAN
);


-- Set ownership of the tables to the postgres user
ALTER TABLE public.depression_data OWNER to postgres;