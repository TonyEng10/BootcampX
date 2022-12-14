const { Pool } = require('pg');

const pool = new Pool({
  user: 't853583',
  password: '5432',
  host: 'localhost',
  database: 't853583',
  port: 5432,
});

pool.connect();
const cohortName = process.argv[2] || 'JUL02'
const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teacher;
`;
const values = [cohortName];

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
});