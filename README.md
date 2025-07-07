SQL Stored Procedures and Functions


## 📌 Overview

| Feature             | Description                                              |
| ------------------- | -------------------------------------------------------- |
| 💻 Tool Used        | MySQL Workbench                                          |
| 💃️ Table Used       | `employees`                                              |
| 🧹 Stored Procedure | `GetEmployeesByDept(IN dept_name VARCHAR(50))`           |
| 📊 Function Used    | `GetAnnualSalary(monthly_salary DECIMAL(10,2))`          |
| 🌟 Focus            | Reusability of SQL blocks using procedures and functions |
---

## 📂 Table Structure – `employees`

| Column Name | Data Type     | Description            |
| ----------- | ------------- | ---------------------- |
| id          | INT (PK)      | Auto-incremented ID    |
| first\_name | VARCHAR(50)   | First name of employee |
| last\_name  | VARCHAR(50)   | Last name of employee  |
| department  | VARCHAR(50)   | Department of employee |
| salary      | DECIMAL(10,2) | Monthly salary in ₹    |

### 🔄 Sample Data

```sql
INSERT INTO employees (first_name, last_name, department, salary) VALUES
('John', 'Doe', 'Sales', 50000),
('Jane', 'Smith', 'Marketing', 55000),
('Bob', 'Brown', 'Sales', 48000),
('Alice', 'White', 'HR', 60000);
```

---

## 🔁 Stored Procedure – `GetEmployeesByDept`

| Name                 | Type             | Description                                 |
| -------------------- | ---------------- | ------------------------------------------- |
| `GetEmployeesByDept` | Stored Procedure | Returns employees belonging to a department |

### 💡 Procedure Definition

```sql
DELIMITER //
CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
    SELECT * FROM employees WHERE department = dept_name;
END //
DELIMITER ;
```

### ✅ How to Use

```sql
CALL GetEmployeesByDept('Sales');
```

### 📾 Sample Output

| id | first\_name | last\_name | department | salary |
| -- | ----------- | ---------- | ---------- | ------ |
| 1  | John        | Doe        | Sales      | 50000  |
| 3  | Bob         | Brown      | Sales      | 48000  |

---

## 🧶 Function – `GetAnnualSalary`

| Name              | Type     | Description                               |
| ----------------- | -------- | ----------------------------------------- |
| `GetAnnualSalary` | Function | Returns annual salary from monthly salary |

### 💡 Function Definition

```sql
DELIMITER //
CREATE FUNCTION GetAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //
DELIMITER ;
```

---

## 🔍 Working of the Function

| Step | Action                                                             |
| ---- | ------------------------------------------------------------------ |
| 1️⃣  | Takes an input parameter: `monthly_salary` (e.g., ₹50,000)         |
| 2️⃣  | Multiplies it by `12` to calculate the annual salary               |
| 3️⃣  | Returns the computed value (e.g., `50000 * 12 = 600000`)           |
| ✅    | Can be used inside `SELECT` queries like any built-in SQL function |

### ✅ How to Use

```sql
-- For a single salary
SELECT GetAnnualSalary(50000);

-- Embedded inside a query
SELECT first_name, salary, GetAnnualSalary(salary) AS annual_salary
FROM employees;
```

### 📾 Sample Output

| first\_name | salary  | annual\_salary |
| ----------- | ------- | -------------- |
| John        | 50000.0 | 600000.00      |
| Jane        | 55000.0 | 660000.00      |
| Bob         | 48000.0 | 576000.00      |
| Alice       | 60000.0 | 720000.00      |

---

## ▶️ How to Run

1. Open **MySQL Workbench**
2. Run the code from `task8.sql`
3. Use the `CALL` and `SELECT` statements to test outputs

