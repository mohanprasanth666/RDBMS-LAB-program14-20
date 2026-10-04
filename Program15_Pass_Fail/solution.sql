USE CollegeDB;

DROP PROCEDURE IF EXISTS CheckResult;

DELIMITER $$

CREATE PROCEDURE CheckResult(IN p_marks INT)
BEGIN

DECLARE
    marks NUMBER := 65;
BEGIN
    IF marks >= 40 THEN
        DBMS_OUTPUT.PUT_LINE('Student has Passed');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Student has Failed');
    END IF;
END;
/

END $$

DELIMITER ;

-- Test the procedure
CALL CheckResult(75);
