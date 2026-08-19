/* UNION does not bring duplicates */
SELECT 
    job_title_short,
    company_id,
    job_location
FROM january_jobs

UNION

SELECT 
    job_title_short,
    company_id,
    job_location
FROM february_jobs

UNION

SELECT 
    job_title_short,
    company_id,
    job_location
FROM march_jobs

/* Use now UNION ALL which includes duplicates */

SELECT 
    job_title_short,
    company_id,
    job_location
FROM january_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM february_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM march_jobs

/* Practice Problem 1: */

WITH q1_job_postings AS (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
)

SELECT 
    q1.job_id,
    q1.job_title_short,
    q1.salary_year_avg,
    sd.skills,
    sd.type AS skill_type
FROM 
    q1_job_postings AS q1
LEFT JOIN 
    skills_job_dim AS sj ON q1.job_id = sj.job_id
LEFT JOIN 
    skills_dim AS sd ON sj.skill_id = sd.skill_id
WHERE 
    q1.salary_year_avg > 70000;

/* Practice Problem 2: */

SELECT 
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_Posted_date::date,
    quarter1_job_postings.salary_year_avg
FROM (

SELECT *
FROM january_jobs

UNION ALL
SELECT *
FROM february_jobs

UNION ALL
SELECT *
FROM march_jobs
) AS quarter1_job_postings

WHERE 
    quarter1_job_postings.salary_year_avg > 70000 AND
    quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY 
    quarter1_job_postings.salary_year_avg DESC;
