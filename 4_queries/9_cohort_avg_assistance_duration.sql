SELECT AVG(total_duration) AS average_total_duration
FROM (SELECT cohorts.name AS cohort, SUM(completed_at-started_at) AS total_duration
FROM assistance_requests
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohort
ORDER BY total_duration) AS total_durations;