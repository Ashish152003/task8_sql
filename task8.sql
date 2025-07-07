-- Drop if exists (optional, for re-runs)
DROP PROCEDURE IF EXISTS GetEmployeesByDept;
DROP FUNCTION IF EXISTS GetAnnualSalary;

-- Create Sample Table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO employees (first_name, last_name, department, salary) VALUES
('John', 'Doe', 'Sales', 50000),
('Jane', 'Smith', 'Marketing', 55000),
('Bob', 'Brown', 'Sales', 48000),
('Alice', 'White', 'HR', 60000);

-- Create Stored Procedure: Get employees by department
DELIMITER //
CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
    SELECT * FROM employees WHERE department = dept_name;
END //
DELIMITER ;

-- Call Stored Procedure Example:
-- CALL GetEmployeesByDept('Sales');

-- Create Function: Calculate Annual Salary
DELIMITER //
CREATE FUNCTION GetAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //
DELIMITER ;

-- Use Function Example:
-- SELECT first_name, GetAnnualSalary(salary) AS annual_salary FROM employees;
