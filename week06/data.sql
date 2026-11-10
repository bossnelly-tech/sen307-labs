use sen307_25_14857;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');
INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using
MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software
systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,


'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model
evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));
SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 2),
('VUA/ST/103', 'Dr ben ochai', 'b.ochai@vua.edu.ng', 3),
('VUA/ST/104', 'Dr nelson okeh', 'n.okeh@vua.edu.ng', 4),
('VUA/ST/105', 'Dr daniel ola', 'd.ola@vua.edu.ng', 5),
('VUA/ST/106', 'Dr frank khalid', 'f.khalid@vua.edu.ng', 1),
('VUA/ST/107', 'Dr steve mustapha', 's.mustapha@vua.edu.ng', 2),
('VUA/ST/108', 'Dr chidera okoli', 'c.okoli@vua.edu.ng', 3),
('VUA/ST/109', 'Dr sarah okpara', 's.okpara@vua.edu.ng', 4),
('VUA/ST/110', 'Dr dotun Bolaji', 'd.bolaji@vua.edu.ng', 5);


INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('20231234', 'Ada Obi', 'F', '2005-03-14', 1),
('20231235', 'John Musa', 'M', '2004-11-02', 2),
('20231236', 'Rose Mary', 'F', '2004-07-02', 3),
('20231237', 'Jane ola', 'F', '2004-11-03', 4),
('20231238', 'david ochai', 'M', '2004-12-03', 5),
('20231239', 'Justice ola', 'M', '2004-11-11', 1),
('20231240', 'bola david', 'M', '2006-11-09', 2),
('20231241', 'daniel okpara', 'M', '2005-10-03', 3),
('20231242', 'Emmanuella okeh', 'F', '2006-03-03', 4),
('20231243', 'Jade okorie', 'F', '2004-07-03', 5),
('20231244', 'mitchelle xabi', 'M', '2007-11-02', 1),
('20231245', 'Xabi allonso', 'M', '2003-03-01', 2),
('20231246', 'Kyllian mbappe', 'M', '2007-10-03', 3),
('20231247', 'jack okoli', 'M', '2004-09-04', 4),
('20231248', 'alex ola', 'M', '2004-09-01', 5),
('20231249', 'nuel davies', 'M', '2006-11-03', 1),
('20231250', 'chisom oma', 'F', '2006-07-08', 2),
('20231251', 'chimdi okpara', 'F', '2006-08-01', 3),
('20231252', 'prisca david', 'F', '2007-11-14', 4),
('20231253', 'ella onuoha', 'F', '2007-11-17', 5);


SELECT * FROM Lecturer;
SELECT * FROM Course;
SELECT * FROM Department;

INSERT INTO Enrolment (student_id, course_id) VALUES
(1, 1), (1, 2), (2, 3), (2,4), (3,5),(3,6), (3,7),(4,8),(4,9), (5,10),
(6,1),(6,2), (7,3), (7,4), (8,5),(8,6), (8,7),(9,8),(9,9), (10,10),
(11,1),(11,2), (12,3), (12,4), (13,5),(13,6), (13,7),(14,8),(14,9), (15,10),
(16,1),(16,2), (17,3), (17,4), (18,5),(18,6), (19,7),(19,8),(19,9), (20,10);

SELECT * FROM Enrolment;

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('20231264', 'Ada John', 'F', '2005-01-14', 1),
('20231265', 'John Mary', 'F', '2004-12-02', 2);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1), (1, 6), (2, 1), (3,2), (4,7), (5,3), (6,8),(8,4), (9,9), (10,5);

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';
UPDATE Student SET dept_id = 2 WHERE matric_no = '20231234';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';


INSERT INTO Department (dept_name) VALUES ('Library and Information Science');
INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information
Science'));

SET SQL_SAFE_UPDATES = 1;

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

-- Step 1: reassign the dependent student to another department
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department

WHERE dept_name = 'Software Engineering')

WHERE matric_no = '20239999';
-- Step 2: now the delete succeeds
DELETE FROM Department WHERE dept_name = 'Library and Information Science';
SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;