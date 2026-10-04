USE CollegeDB;

CREATE TABLE IF NOT EXISTS Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    Department VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Employee_Log (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    Message VARCHAR(255),
    LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS AfterEmployeeInsert;

DELIMITER $$

CREATE TRIGGER AfterEmployeeInsert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
CREATE OR REPLACE TRIGGER employee_insert_trigger
AFTER INSERT ON Employee
BEGIN
    DBMS_OUTPUT.PUT_LINE('New employee record inserted successfully.');
END;
/

END $$

DELIMITER ;

INSERT INTO Employee
VALUES (101, 'Arun', 'Manager');

COMMIT;

INSERT INTO Employee
VALUES (1, 'Arun', 'Computer Science');

SELECT * FROM Employee;

SELECT * FROM Employee_Log;
