USE CollegeDB;

DROP PROCEDURE IF EXISTS CalculateSum;

DELIMITER $$

CREATE PROCEDURE CalculateSum()
    
    DECLARE
    num1 NUMBER := 10;
    num2 NUMBER := 20;
    sum_result NUMBER;
BEGIN
    sum_result := num1 + num2;

    DBMS_OUTPUT.PUT_LINE('Sum = ' || sum_result);
END;
/

END $$

DELIMITER ;


CALL CalculateSum();
