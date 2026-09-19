CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount NUMERIC(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary NUMERIC(10, 2)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, RegistrationDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Alex', 'Brown', ' alex.brown@email.com ', '2023-01-10'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2020-05-20'),
(5, 'Michael', 'Wilson', 'michael.wilson@email.com', '2022-08-12'),
(6, 'Sarah', 'Taylor', 'sarah.taylor@email.com', '2021-04-18'),
(7, 'David', 'Miller', 'david.miller@email.com', '2023-03-01');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-07-10', 600.00),
(104, 3, '2023-07-15', 1200.00),
(105, 4, '2023-07-20', 450.25),
(106, 5, '2023-07-25', 850.00);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'Robert', 'King', 'IT', '2019-06-11', 75000.00),
(4, 'Lisa', 'Green', 'Sales', '2022-02-01', 48000.00),
(5, 'James', 'White', 'Finance', '2018-09-15', 82000.00),
(6, 'Karen', 'Black', 'IT', '2021-10-05', 68000.00);

-- Q1. Retrieve all orders and customer details where orders exist. 
SELECT o.OrderID, c.CustomerID, c.FirstName, c.LastName, o.OrderDate, o.TotalAmount
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- Q2. Retrieve all customers and their corressponding orders (if any). 
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c LEFT JOIN Orders O ON c.CustomerID = o.CustomerID;

-- Q3. Retrieve all orders and their corressponding customers (if any).  
SELECT o.OrderID, o.OrderDate, o.TotalAmount, c.CustomerID, c.FirstName 
FROM Orders o RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID;  

-- Q4. Retrieve all customers and all orders, regardless of matching. 
SELECT c.CustomerID, c.FirstName, o.OrderID, o.OrderDate,o.TotalAmount
FROM Customers c FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Q5. Customers with orders worth more than average
SELECT DISTINCT c.CustomerID, c.FirstName FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID 
WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);

-- Q6. Employees with salaries above average
SELECT EmployeeID, FirstName, LastName, Salary 
FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Q7. Extract year and month from OrderDate
SELECT OrderID, OrderDate, 
EXTRACT(YEAR FROM OrderDate) AS order_year, 
EXTRACT(MONTH FROM OrderDate) AS order_month FROM Orders;

-- Q8. Calculate difference in days between order date and current date
SELECT OrderID, OrderDate, CURRENT_DATE - OrderDate AS DaysDifference
FROM Orders;

-- Q9. Format OrderDate to 'DD-MMM-YYYY'
SELECT OrderID, TO_CHAR(OrderDate, 'DD-MMM-YYYY') AS formatdate FROM Orders;

-- Q10. Concatenate FirstName and LastName
SELECT CustomerID,CONCAT(FirstName, ' ', LastName) AS full_name FROM Customers;

-- Q11. Replace part of a string 'John' with 'Jonathan'
SELECT CustomerID, REPLACE(FirstName, 'John', 'Jonathan') AS updatedfirstname
FROM Customers;

-- Q12. Convert FirstName to uppercase and LastName to lowercase
SELECT CustomerID, UPPER(FirstName) AS upperfirstname, LOWER(LastName) AS lowerlastname
FROM Customers;

-- Q13. Trim extra spaces from Email
SELECT CustomerID, TRIM(Email) AS clean_email FROM Customers;

-- Q14. Calculate running total of TotalAmount
SELECT OrderID, OrderDate, TotalAmount, 
       SUM(TotalAmount) OVER (ORDER BY OrderDate, OrderID) AS total
FROM Orders;

-- Q15. Rank orders based on totalamount
SELECT OrderID, TotalAmount, 
       RANK() OVER (ORDER BY TotalAmount DESC) AS order_rank
FROM Orders;

-- Q16. Discount based on TotalAmount
SELECT OrderID, TotalAmount,
       CASE 
           WHEN TotalAmount > 1000 THEN '10% off'
           WHEN TotalAmount > 500 THEN '5% off'
           ELSE 'No Discount'
       END AS Discount
FROM Orders;

-- Q17. Categorize employees' salaries as high, medium, low
SELECT EmployeeID, FirstName, LastName, Salary,
       CASE 
           WHEN Salary >= 70000 THEN 'High'
           WHEN Salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryCategory
FROM Employees;
