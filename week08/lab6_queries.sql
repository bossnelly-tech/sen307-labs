USE sen307_25_14857;

-- Task 1 + 2 (worked example): students per course,
-- keeping only courses with more than 5 students
SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 5;

-- Task 1
SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e
ON c.course_id = e.course_id
GROUP BY c.course_id
ORDER BY total_students DESC;

-- TASK 2
SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e
ON c.course_id = e.course_id
GROUP BY c.course_id
HAVING total_students > 5;

-- Task 3

SELECT ROUND(AVG(course_count), 2) AS avg_courses_per_student
FROM (
    SELECT s.student_id, COUNT(e.course_id) AS course_count
    FROM Student s
    LEFT JOIN Enrolment e
	ON s.student_id = e.student_id
    GROUP BY s.student_id
) 
AS per_student;

-- Task 4
SELECT * FROM Student
WHERE student_id NOT IN (
    SELECT student_id
    FROM Enrolment
);

-- Task 5
SELECT d.dept_name, s.full_name,
    (SELECT COUNT(*) FROM Enrolment e WHERE e.student_id = s.student_id) AS courses
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE (SELECT COUNT(*) FROM Enrolment e WHERE e.student_id = s.student_id)
    = (
        SELECT MAX(dept_counts.cnt)
        FROM (
            SELECT COUNT(e2.course_id) AS cnt
            FROM Student s2
            LEFT JOIN Enrolment e2 ON s2.student_id = e2.student_id
            WHERE s2.dept_id = s.dept_id
            GROUP BY s2.student_id
        ) AS dept_counts
    )
ORDER BY d.dept_name;