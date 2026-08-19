SELECT      
    job_id,
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg > 100000 THEN 'High Salary'
        WHEN salary_year_avg <= 100000 AND salary_year_avg > 50000 THEN 'Medium Salary'
        WHEN salary_year_avg <= 50000 THEN 'Low Salary'
    END AS salary_category
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC;


SELECT *

FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) AS january_jobs;

WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)
SELECT *
FROM january_jobs


SELECT 
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (


SELECT
    company_id
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = true
)


WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs  -- Added an alias here!
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    company_dim.name,
    company_job_count.total_jobs -- Now you can easily pull the count into your final results
FROM -- Changed from SELECT to FROM
    company_dim
LEFT JOIN 
    company_job_count ON company_job_count.company_id = company_dim.company_id

ORDER BY
     total_jobs DESC;

/* Practice Problem 1: */
SELECT 
    sd.skills,
    skill_counts.total_mentions
FROM (
    SELECT 
        skill_id, 
        COUNT(job_id) AS total_mentions
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id
    ORDER BY 
        total_mentions DESC
    LIMIT 5
) AS skill_counts
INNER JOIN 
    skills_dim AS sd ON skill_counts.skill_id = sd.skill_id
ORDER BY 
    skill_counts.total_mentions DESC;
/* END */

/* Practice Problem 2: */

SELECT 
    c.name AS company_name,
    company_job_counts.total_postings,
    CASE
        WHEN company_job_counts.total_postings < 10 THEN 'Small'
        WHEN company_job_counts.total_postings BETWEEN 10 AND 50 THEN 'Medium'
        WHEN company_job_counts.total_postings > 50 THEN 'Large'
    END AS size_category
FROM (
    SELECT 
        company_id, 
        COUNT(job_id) AS total_postings
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
) AS company_job_counts
LEFT JOIN 
    company_dim AS c ON company_job_counts.company_id = c.company_id
ORDER BY
    company_job_counts.total_postings DESC;
/* END */

WITH remote_job_skills AS (

SELECT 
    skill_id,
    COUNT(*) AS skill_count
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
WHERE 
    job_postings.job_work_from_home = TRUE AND
    job_postings.job_title_short = 'Data Analyst'
GROUP BY
skill_id
)

SELECT 
    skills.skill_id,
    skills as skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY

    skill_count DESC
LIMIT 5;