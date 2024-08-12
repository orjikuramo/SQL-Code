/* I am creating a table that has the details of all our employees*/
CREATE TABLE [Employees] 
(
EmployeeID INT PRIMARY KEY
,FirstName VARCHAR(100)
,LastName VARCHAR(100)
,DepartmentID INT
,Salary DECIMAL(10, 2)
,HireDate DATE
)
/* Here, I am inserting all the values needed*/
INSERT INTO [Employees] (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate)
VALUES (001,'Orji', 'Benson', 01, 70000.00, '2023-02-07'),
	   (002, 'Joy', 'Beauty', 02, 50000.00, '2023-10-09'),
	   (003, 'Johnson', 'Dayo', 03, 40000.00, '2023-08-02') 

/*Testing my query to ensure it's working*/
SELECT * 
FROM [Employees]

/* Now, I am only wanting to check those earning 50,000 and above*/
SELECT * 
FROM [Employees]
WHERE [Salary] >= 50000

/* I am about creating another table */
CREATE TABLE [Departments]
(
DepartmentID INT PRIMARY KEY
,DepartmentName VARCHAR(100),
)

/* Now, We would insert our data into the newly created table */
INSERT INTO [Departments] (DepartmentID, DepartmentName)
VALUES (01, 'HR'),
	   (02, 'Finance'),
	   (03, 'Secretary')

/* Now, i would check to see if our data was properly captured*/
SELECT *
FROM [Departments]

/* Creating a join query between the Table (employees) and (department)*/
SELECT *
FROM [Departments] As D
JOIN [Employees] As E
ON [D].[DepartmentID] = [E].[DepartmentID]
ORDER BY [Salary] DESC

/* Update the salary of the finance team to 60000*/
UPDATE [Employees]
SET [Salary] = 60000
WHERE [DepartmentID] = 2

