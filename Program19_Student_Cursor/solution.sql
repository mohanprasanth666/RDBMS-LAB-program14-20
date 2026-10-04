USE CollegeDB;

DROP PROCEDURE IF EXISTS DisplayStudents;

DELIMITER $$

CREATE PROCEDURE DisplayStudents()
BEGIN
DECLARE
    CURSOR student_cursor IS
        SELECT StudentID, StudentName, DepartmentID
        FROM Student;

    v_studentid Student.StudentID%TYPE;
    v_studentname Student.StudentName%TYPE;
    v_departmentid Student.DepartmentID%TYPE;

BEGIN
    OPEN student_cursor;

    LOOP
        FETCH student_cursor
        INTO v_studentid, v_studentname, v_departmentid;

        EXIT WHEN student_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Student ID: ' || v_studentid ||
            ', Student Name: ' || v_studentname ||
            ', Department ID: ' || v_departmentid
        );
    END LOOP;

    CLOSE student_cursor;
END;
/
END $$

DELIMITER ;

CALL DisplayStudents();
