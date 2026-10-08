-- 1. Department Table

CREATE TABLE Department (
    DepartmentID NUMBER(5) PRIMARY KEY,
    DepartmentName VARCHAR2(30)
);

INSERT INTO Department VALUES (101, 'CSE');
INSERT INTO Department VALUES (102, 'IT');


-- 2. Faculty Table

CREATE TABLE Faculty (
    FacultyID NUMBER(5) PRIMARY KEY,
    FacultyName VARCHAR2(30),
    DepartmentID NUMBER(5),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Faculty VALUES (501, 'Ravi', 101);
INSERT INTO Faculty VALUES (502, 'Meena', 102);


-- 3. Course Table

CREATE TABLE Course (
    CourseID NUMBER(5) PRIMARY KEY,
    CourseName VARCHAR2(30),
    FacultyID NUMBER(5),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

INSERT INTO Course VALUES (201, 'Database Systems', 501);
INSERT INTO Course VALUES (202, 'Data Structures', 502);


-- 4. Student Table

CREATE TABLE Student (
    StudentID NUMBER(5) PRIMARY KEY,
    StudentName VARCHAR2(30),
    CourseID NUMBER(5),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Student VALUES (1001, 'Arun', 201);
INSERT INTO Student VALUES (1002, 'Divya', 202);
INSERT INTO Student VALUES (1003, 'Karthik', 201);


-- Display normalized Student details

SELECT
    Student.StudentID,
    Student.StudentName,
    Course.CourseName,
    Faculty.FacultyName,
    Department.DepartmentName
FROM Student
JOIN Course
    ON Student.CourseID = Course.CourseID
JOIN Faculty
    ON Course.FacultyID = Faculty.FacultyID
JOIN Department
    ON Faculty.DepartmentID = Department.DepartmentID;
