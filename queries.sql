
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);


INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Electrical'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Electronics');

INSERT INTO Courses (course_id, course_name, dept_id) VALUES
(101, 'DBMS', 1),
(102, 'Operating Systems', 1),
(103, 'Data Structures', 1),
(104, 'Power Systems', 2),
(105, 'Digital Circuits', 2),
(106, 'Electrical Machines', 2),
(107, 'Thermodynamics', 3),
(108, 'Fluid Mechanics', 3),
(109, 'Machine Design', 3),
(110, 'Structural Engineering', 4),
(111, 'Surveying', 4),
(112, 'Construction Materials', 4),
(113, 'Embedded Systems', 5),
(114, 'VLSI Design', 5),
(115, 'Microcontrollers', 5);


SELECT dept_name
FROM Departments
WHERE dept_id IN (
    SELECT dept_id
    FROM Courses
    GROUP BY dept_id
    HAVING COUNT(course_id) > 2
);

-- ============================
-- Part D: Grant SELECT Access to viewer_user
-- ============================
-- The following DCL statement requires admin privileges,
-- which are not available in BytXL. Include it for documentation only:

