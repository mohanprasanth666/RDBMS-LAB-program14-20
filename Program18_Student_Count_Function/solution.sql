USE CollegeDB;

DROP FUNCTION IF EXISTS CountStudentsByDepartment;

DELIMITER $$

CREATE FUNCTION CountStudentsByDepartment(
    p_department_id INT
)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN

    DECLARE student_count INT;
CREATE OR REPLACE FUNCTION count_students(
    p_department IN VARCHAR2
)
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM Student
    WHERE Department = p_department;

    RETURN v_count;
END;
/
    DECLARE
    v_result NUMBER;
BEGIN
    v_result := count_students('Computer Science');
    DBMS_OUTPUT.PUT_LINE('Number of students: ' || v_result);
END;
/

END $$

DELIMITER ;

-- Test
SELECT CountStudentsByDepartment(1) AS StudentCount;
