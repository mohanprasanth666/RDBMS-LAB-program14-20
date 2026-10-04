USE CollegeDB;

CREATE TABLE IF NOT EXISTS Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

INSERT IGNORE INTO Department
VALUES
(1, 'Computer Science'),
(2, 'Commerce');

DROP PROCEDURE IF EXISTS InsertStudent;

DELIMITER $$

CREATE PROCEDURE InsertStudent(
    IN p_student_id INT,
    IN p_student_name VARCHAR(50),
    IN p_department_id INT
)
BEGIN
CREATE OR REPLACE PROCEDURE InsertStudent (
    p_StudentID   IN NUMBER,
    p_StudentName IN VARCHAR2,
    p_CourseID    IN NUMBER
)
IS
BEGIN
    INSERT INTO Student (StudentID, StudentName, CourseID)
    VALUES (p_StudentID, p_StudentName, p_CourseID);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Student record inserted successfully');
END;
/
    BEGIN
    InsertStudent(101, 'Mohan', 201);
END;
/

END $$

DELIMITER ;

-- Test
CALL InsertStudent(105, 'Kavin', 1);

SELECT * FROM Student;
