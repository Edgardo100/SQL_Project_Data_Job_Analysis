/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Scientist positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Scientists and 
    helps job seekers understand which skills may lead to higher-paying opportunities.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary

FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL

GROUP BY
    skills

ORDER BY

    average_salary DESC

LIMIT 20;

/*
Leadership & Data Ops: The absolute highest-paying skills (like Asana, Airtable, and Slack, all averaging over $165k) show that top-tier data roles prioritize cross-functional project management and team leadership over just writing code.

Data Engineering Crossover: Massive salaries are attached to the ability to not just build models, but to deploy and manage the surrounding infrastructure, highlighted by the demand for tools like Airflow (pipelines) and DynamoDB (cloud databases).

Niche & Highly Specialized Tech: Extremely specific ecosystems command premium pay, ranging from game development and highly concurrent backends (Unity, Elixir, Lua) to specialized AI and statistical frameworks (Hugging Face, Watson, RShiny).


  {
    "skills": "asana",
    "average_salary": "215477"
  },
  {
    "skills": "airtable",
    "average_salary": "201143"
  },
  {
    "skills": "redhat",
    "average_salary": "189500"
  },
  {
    "skills": "watson",
    "average_salary": "187417"
  },
  {
    "skills": "elixir",
    "average_salary": "170824"
  },
  {
    "skills": "lua",
    "average_salary": "170500"
  },
  {
    "skills": "slack",
    "average_salary": "168219"
  },
  {
    "skills": "solidity",
    "average_salary": "166980"
  },
  {
    "skills": "ruby on rails",
    "average_salary": "166500"
  },
  {
    "skills": "rshiny",
    "average_salary": "166436"
  },
  {
    "skills": "notion",
    "average_salary": "165636"
  },
  {
    "skills": "objective-c",
    "average_salary": "164500"
  },
  {
    "skills": "neo4j",
    "average_salary": "163971"
  },
  {
    "skills": "dplyr",
    "average_salary": "163111"
  },
  {
    "skills": "hugging face",
    "average_salary": "160868"
  },
  {
    "skills": "dynamodb",
    "average_salary": "160581"
  },
  {
    "skills": "haskell",
    "average_salary": "157500"
  },
  {
    "skills": "unity",
    "average_salary": "156881"
  },
  {
    "skills": "airflow",
    "average_salary": "155878"
  },
  {
    "skills": "codecommit",
    "average_salary": "154684"
  }
]
*/