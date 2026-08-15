-- Heart Disease Analytics
-- PostgreSQL / SQL Analysis
-- Dataset: Cleveland Heart Disease Dataset
-- Records: 303

-- 1. Total number of patients
SELECT COUNT(*) AS total_patients
FROM heart_disease_powerbi;


-- 2. Total heart disease cases
SELECT COUNT(*) AS heart_disease_cases
FROM heart_disease_powerbi
WHERE heart_disease_status = 'Heart Disease';


-- 3. Overall heart disease rate
SELECT
    COUNT(*) AS total_patients,
    COUNT(*) FILTER (
        WHERE heart_disease_status = 'Heart Disease'
    ) AS heart_disease_cases,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE heart_disease_status = 'Heart Disease'
        ) / COUNT(*),
        2
    ) AS heart_disease_rate
FROM heart_disease_powerbi;


-- 4. Heart disease distribution
SELECT
    heart_disease_status,
    COUNT(*) AS patient_count,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM heart_disease_powerbi
GROUP BY heart_disease_status
ORDER BY patient_count DESC;


-- 5. Heart disease cases by chest pain type
SELECT
    chest_pain_type,
    COUNT(*) FILTER (
        WHERE heart_disease_status = 'Heart Disease'
    ) AS heart_disease_cases
FROM heart_disease_powerbi
GROUP BY chest_pain_type
ORDER BY heart_disease_cases DESC;


-- 6. Heart disease rate by chest pain type
SELECT
    chest_pain_type,
    COUNT(*) AS total_patients,
    COUNT(*) FILTER (
        WHERE heart_disease_status = 'Heart Disease'
    ) AS heart_disease_cases,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE heart_disease_status = 'Heart Disease'
        ) / COUNT(*),
        2
    ) AS heart_disease_rate
FROM heart_disease_powerbi
GROUP BY chest_pain_type
ORDER BY heart_disease_rate DESC;


-- 7. Heart disease rate by exercise-induced angina
SELECT
    exercise_angina,
    COUNT(*) AS total_patients,
    COUNT(*) FILTER (
        WHERE heart_disease_status = 'Heart Disease'
    ) AS heart_disease_cases,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE heart_disease_status = 'Heart Disease'
        ) / COUNT(*),
        2
    ) AS heart_disease_rate
FROM heart_disease_powerbi
GROUP BY exercise_angina
ORDER BY heart_disease_rate DESC;


-- 8. Average age by heart disease status
SELECT
    heart_disease_status,
    ROUND(AVG(age), 2) AS average_age
FROM heart_disease_powerbi
GROUP BY heart_disease_status
ORDER BY average_age DESC;


-- 9. Average resting blood pressure by heart disease status
SELECT
    heart_disease_status,
    ROUND(AVG(resting_blood_pressure), 2) AS average_resting_blood_pressure
FROM heart_disease_powerbi
GROUP BY heart_disease_status;


-- 10. Average cholesterol by heart disease status
SELECT
    heart_disease_status,
    ROUND(AVG(cholesterol), 2) AS average_cholesterol
FROM heart_disease_powerbi
GROUP BY heart_disease_status;


-- 11. Average maximum heart rate by heart disease status
SELECT
    heart_disease_status,
    ROUND(AVG(max_heart_rate), 2) AS average_max_heart_rate
FROM heart_disease_powerbi
GROUP BY heart_disease_status;


-- 12. Average ST depression by heart disease status
SELECT
    heart_disease_status,
    ROUND(AVG(st_depression), 2) AS average_st_depression
FROM heart_disease_powerbi
GROUP BY heart_disease_status;


-- 13. Descriptive statistics for selected clinical variables
SELECT
    ROUND(AVG(age), 2) AS avg_age,
    ROUND(AVG(resting_blood_pressure), 2) AS avg_blood_pressure,
    ROUND(AVG(cholesterol), 2) AS avg_cholesterol,
    ROUND(AVG(max_heart_rate), 2) AS avg_max_heart_rate,
    ROUND(AVG(st_depression), 2) AS avg_st_depression
FROM heart_disease_powerbi;


-- 14. Correlation between age and heart disease status
SELECT
    ROUND(
        CORR(
            age,
            CASE
                WHEN heart_disease_status = 'Heart Disease' THEN 1
                ELSE 0
            END
        )::numeric,
        3
    ) AS age_correlation
FROM heart_disease_powerbi;


-- 15. Correlation between blood pressure and heart disease status
SELECT
    ROUND(
        CORR(
            resting_blood_pressure,
            CASE
                WHEN heart_disease_status = 'Heart Disease' THEN 1
                ELSE 0
            END
        )::numeric,
        3
    ) AS blood_pressure_correlation
FROM heart_disease_powerbi;


-- 16. Correlation between cholesterol and heart disease status
SELECT
    ROUND(
        CORR(
            cholesterol,
            CASE
                WHEN heart_disease_status = 'Heart Disease' THEN 1
                ELSE 0
            END
        )::numeric,
        3
    ) AS cholesterol_correlation
FROM heart_disease_powerbi;


-- 17. Correlation between maximum heart rate and heart disease status
SELECT
    ROUND(
        CORR(
            max_heart_rate,
            CASE
                WHEN heart_disease_status = 'Heart Disease' THEN 1
                ELSE 0
            END
        )::numeric,
        3
    ) AS max_heart_rate_correlation
FROM heart_disease_powerbi;


-- 18. Correlation between ST depression and heart disease status
SELECT
    ROUND(
        CORR(
            st_depression,
            CASE
                WHEN heart_disease_status = 'Heart Disease' THEN 1
                ELSE 0
            END
        )::numeric,
        3
    ) AS st_depression_correlation
FROM heart_disease_powerbi;