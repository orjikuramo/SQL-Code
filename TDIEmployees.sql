/* 1. Creating a table named “TDIEmployees” with the following columns: 
“EmployeeID” (integer), “FirstName” (VARCHAR(50)), “LastName” (VARCHAR(50)), “HireDate” (DATE), “Salary” (FLOAT).*/
CREATE TABLE [TDIEmployees] 
(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
HireDate DATE,
Salary FLOAT
)

/* 2. Write an SQL statement to add a column “Department” (VARCHAR(50)) to the “Employees” table.*/
ALTER TABLE [TDIEmployees]
ADD Department VARCHAR(50);

/* Checking Table to be sure it came out well*/
SELECT *
FROM [TDIEmployees]

/* 3. Modifying the “Salary” column from FLOAT to “DECIMAL(10, 2)” data type.*/
Alter TABLE [TDIEmployees]
ALTER COLUMN Salary DECIMAL(10, 2);

/* 4. Dropping the column DEPARTMENT*/
ALTER TABLE [TDIEmployees]
DROP COLUMN Department

/* Checking my updated table*/
SELECT *
FROM [TDIEmployees]

/* 5. Indexing LASTNAME column for easy arrangement*/
CREATE INDEX [MyIndex]
ON [TDIEmployees] (LastName);

/* 6. Inserting values into Column*/
INSERT INTO [TDIEmployees] (EmployeeID, FirstName, LastName, HireDate, Salary)
VALUES (1, 'Alice', 'Johnson', '2021-05-15', 60000);

SELECT *
FROM [TDIEmployees]

/* 7. Inputting multiple values*/
INSERT INTO [TDIEmployees] (EmployeeID, FirstName, LastName, HireDate, Salary)
VALUES (2, 'Bob', 'Smith', '2020-03-22', 55000), 
       (3, 'Charlie', 'Brown', '2019-11-30', 70000);

SELECT *
FROM [TDIEmployees]

/* 8. Updating Salary of the employee with “EmployeeID” 1 to 65000.*/
UPDATE [TDIEmployees]
SET Salary = '65000'
WHERE EmployeeID = 1

/* 9. Deleting the employee with “EmployeeID” 3 from the “Employees” table.*/
DELETE FROM [TDIEmployees]
WHERE EmployeeID = 3;

SELECT *
FROM [TDIEmployees]

/* 10. Inserting and Updating data */
INSERT INTO [TDIEmployees] (EmployeeID, FirstName, LastName, HireDate, Salary)
SELECT 4, 'David', LastName, HireDate, Salary
FROM [TDIEmployees]
WHERE EmployeeID = 2

SELECT *
FROM [TDIEmployees]
