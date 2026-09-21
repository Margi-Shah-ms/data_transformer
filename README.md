Click here for the link: https://drive.google.com/file/d/1qv4U12157G9rBpdaY6h2R2J18Qo006x6/view?usp=sharing

# Data Transformer: PostgreSQL Analytics Project

## Project Overview
Data Transformer is a comprehensive SQL analytics project designed to demonstrate corporate data analysis operations using PostgreSQL. The project simulates an enterprise environment covering three main business pillars:
1. Customer Information Management
2. Sales Transaction Processing
3. Employee Performance Tracking

It serves as a practical implementation of fundamental and advanced SQL concepts, including SQL joins, subqueries, string/date manipulation functions, window functions, and conditional logic using CASE expressions.

---

## Database Schema & Structure

The database consists of three relational tables:

### 1. Customers
Stores customer demographic and registration details.
* CustomerID (INT, Primary Key)
* FirstName (VARCHAR(50))
* LastName (VARCHAR(50))
* Email (VARCHAR(100))
* RegistrationDate (DATE)

### 2. Orders
Tracks sales transactions linked to specific customers.
* OrderID (INT, Primary Key)
* CustomerID (INT, Foreign Key referencing Customers.CustomerID)
* OrderDate (DATE)
* TotalAmount (NUMERIC(10, 2))

### 3. Employees
Contains organizational structure, staff details, and compensation data.
* EmployeeID (INT, Primary Key)
* FirstName (VARCHAR(50))
* LastName (VARCHAR(50))
* Department (VARCHAR(50))
* HireDate (DATE)
* Salary (NUMERIC(10, 2))

---
# Tables:
### 1. Customers
<img width="718" height="221" alt="image" src="https://github.com/user-attachments/assets/1433b7fd-db60-41ea-a93b-559e42c0b3df" />

### 2. Orders:
<img width="425" height="197" alt="image" src="https://github.com/user-attachments/assets/58151376-c3e5-495b-b663-c88889e1e031" />

### 3. Employees:
<img width="766" height="190" alt="image" src="https://github.com/user-attachments/assets/ec98adf8-06d8-46e1-ad38-754573611c92" />

### Discount based on total amount: 
<img width="333" height="190" alt="image" src="https://github.com/user-attachments/assets/4f9ede26-422f-4b37-8f53-eab85865300c" />

###  Categorize employees' salaries as high, medium, low
<img width="654" height="191" alt="image" src="https://github.com/user-attachments/assets/f40cc772-62a0-4083-9d54-a55e3861f3ab" />


## Topics & Solutions Covered

| Topic | Key SQL Concept | One-Line Explanation |
|---|---|---|
| Inner Join | `INNER JOIN` | Combines matching rows from two tables based on a common column. |
| Left Join | `LEFT JOIN` | Returns all rows from the left table and matched rows from the right table. |
| Right Join | `RIGHT JOIN` | Returns all rows from the right table and matched rows from the left table. |
| Full Outer Join | `FULL OUTER JOIN` | Returns all rows from both tables regardless of whether they match. |
| Filter Subquery | `WHERE ... IN (SELECT)` | Filters rows using results returned from an inner `SELECT` query. |
| Aggregation Subquery | `WHERE val > (SELECT AVG())` | Filters records dynamically against an aggregated overall average value. |
| Date Extraction | `EXTRACT(part FROM date)` | Pulls out specific components like year or month from a date value. |
| Date Difference | `date1 - date2` | Calculates elapsed days between two date values using direct subtraction. |
| Date Formatting | `TO_CHAR(date, format)` | Converts date objects into custom formatted text strings for display. |
| String Concatenation | `CONCAT(str1, str2)` | Joins two or more text values into a single continuous string. |
| String Replacement | `REPLACE(str, old, new)` | Swaps occurrences of a specific substring with new replacement text. |
| Case Conversion | `UPPER()` / `LOWER()` | Converts text characters to all uppercase or all lowercase formats. |
| String Trimming | `TRIM(string)` | Removes extra leading and trailing whitespaces from text inputs. |
| Running Total | `SUM() OVER(ORDER BY)` | Calculates a continuous cumulative sum across ordered rows in a dataset. |
| Data Ranking | `RANK() OVER(ORDER BY)` | Assigns dynamic rank values to records based on order of magnitude. |
| Conditional Formatting | `CASE WHEN ... THEN` | Applies conditional logic to return specific values based on defined rules. |
| Data Categorization | `CASE WHEN ... ELSE` | Groups numerical data into custom qualitative categories like high/medium/low. |

---
# 🎯 Project Objective

The objective of this project is to practice and demonstrate practical SQL skills for:

- Retrieving and transforming data from relational tables
- Combining data using different types of JOINs
- Using subqueries for data comparison and analysis
- Working with date and time functions
- Cleaning and transforming text using string functions
- Performing calculations using aggregate functions
- Applying conditional logic using the CASE expression
- Using window functions for ranking and running calculations

# 💻 Tools & Technologies
- PostgreSQL
- pgAdmin 4
- SQL
