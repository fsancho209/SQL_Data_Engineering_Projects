SELECT sd.skills 
    ,COUNT(1) AS Jobs_mentions_qty
FROM job_postings_fact jpf 
INNER JOIN skills_job_dim sjd 
    ON jpf.job_id = sjd.job_id 
        AND jpf.job_country = 'Costa Rica'
        AND jpf.job_title_Short IN ('Data Engineer' , 'Senior Data Engineer')
INNER JOIN skills_dim sd 
    ON sjd.skill_id = sd.skill_id
WHERE CAST(jpf.job_posted_date AS DATE) >= '2025-01-01'
GROUP BY sd.skills 
ORDER BY COUNT(1) DESC
LIMIT 10;



SELECT DISTINCT job_country
FROM job_postings_fact
WHERE job_country LIKE 'C%'
ORDER BY job_country;

SELECT DISTINCT job_title_Short
FROM job_postings_fact
ORDER BY job_title_Short;

