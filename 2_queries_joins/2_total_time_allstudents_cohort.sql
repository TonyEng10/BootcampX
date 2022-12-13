SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';


SELECT students.name AS student, COUNT(assignment_submissions) AS total_submissions
FROM students
JOIN assignment_submissions
ON students.id = student_id
GROUP BY students.name
HAVING COUNT(assignment_submissions)<100;