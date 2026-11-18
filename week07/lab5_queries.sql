-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: _OKEH CHIDERA NELSON_ Matric: VUG/SEN/25/14857
-- ============================================
USE sen307_25_14857;
-- Task 1: Students in one department, sorted A-Z
SELECT s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d
ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;
-- Explanation:
-- This query retrieves the names of all students in the
-- Software Engineering department. I used INNER JOIN to
-- connect the Student and Department tables through dept_id.
-- I used WHERE to filter the Software Engineering department
-- and ORDER BY to arrange the students alphabetically.

-- Task 2: Courses with their lecturers (INNER JOIN)
SELECT c.course_title, l.full_name
FROM Course c
INNER JOIN CourseAllocation ca
ON c.course_id = ca.course_id
INNER JOIN Lecturer l
ON ca.lecturer_id = l.lecturer_id;
-- Explanation:
-- This query displays each course alongside the name of
-- the lecturer teaching it. I used INNER JOIN to connect
-- the Course, CourseAllocation and Lecturer tables.
-- The joins use course_id and lecturer_id to match the
-- related records. Courses with two lecturers will appear twice.

-- Task 3: Students and their courses (LEFT JOIN)
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e
ON s.student_id = e.student_id
LEFT JOIN Course c
ON e.course_id = c.course_id
ORDER BY s.full_name;

-- Explanation:
-- This query displays all students and the courses they
-- are enrolled in. I used LEFT JOIN to ensure that every
-- student appears, even if they have not enrolled in any
-- course. Students without enrolments will show NULL
-- under course_title. ORDER BY arranges the students
-- alphabetically by their names.

-- Task 3 (Additional): Students without courses

SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e
ON s.student_id = e.student_id
LEFT JOIN Course c
ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;

-- Explanation:
-- This query displays only students who have not enrolled
-- in any course. I used LEFT JOIN to include all students
-- and WHERE c.course_title IS NULL to filter out students
-- who have courses.

-- Task 4: Filtering with AND / OR / IN / BETWEEN
SELECT s.full_name, s.gender, d.dept_name, s.date_of_birth
FROM Student s
INNER JOIN Department d
ON s.dept_id = d.dept_id
WHERE s.gender = 'F'
AND d.dept_name IN ('Software Engineering', 'Artificial Intelligence')
AND s.date_of_birth BETWEEN '2004-01-01' AND '2005-12-31';

-- Explanation: ...
-- This query retrieves female students in the Software
-- Engineering or Artificial Intelligence departments
-- who were born between 2004 and 2005.
-- I used INNER JOIN to connect the Student and Department
-- tables, IN to select the two departments, AND to combine
-- the conditions, and BETWEEN to filter the dates of birth.

-- Task 5: Paginating enrolments with LIMIT and OFFSET

SELECT *
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 0;

-- Explanation: ...
-- Explanation:
-- This query displays the first 10 enrolment records.
-- I used ORDER BY to arrange the records by enrolment_id.
-- LIMIT 10 restricts the result to 10 records, while
-- OFFSET 0 means the query starts from the first record.
 
 -- 2nd part
SELECT *
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 10;

-- Explanation:
-- This query displays the next 10 enrolment records.
-- LIMIT 10 restricts the result to 10 records, while
-- OFFSET 10 skips the first 10 records and starts
-- displaying from record 11.

-- Optional Challenge: Rewrite Task 3 using RIGHT JOIN

SELECT s.full_name, c.course_title
FROM Enrolment e
RIGHT JOIN Student s
ON e.student_id = s.student_id
LEFT JOIN Course c
ON e.course_id = c.course_id
ORDER BY s.full_name;

-- Explanation:
-- This query displays all students and the courses they
-- are enrolled in, including students without enrolments.
-- I used RIGHT JOIN to ensure that every student is included
-- in the result, even when there is no matching enrolment.
-- I then used LEFT JOIN to retrieve the course details.
-- ORDER BY arranges the students alphabetically.

