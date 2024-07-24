create database Sale2
use Sale2
go
-- Tạo bảng các sau

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    Country VARCHAR(255)
);
go

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    CONSTRAINT FK_CustomerOrders FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
go
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(255),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
VALUES
    (1, 'Laptop', 'Electronics', 999.99, 50),
    (2, 'Smartphone', 'Electronics', 499.99, 100),
    (3, 'Desk Chair', 'Furniture', 149.99, 25),
    (4, 'Coffee Table', 'Furniture', 79.99, 30),
    (5, 'Running Shoes', 'Sportswear', 59.99, 75),
	(6, 'TV', 'Electronics', 159.99, 65);
go
select * from Products
go
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, Country)
VALUES
    (1, 'ABC Electronics', 'John Smith', '123 Main St', 'Cityville', 'USA'),
    (2, 'XYZ Furniture', 'Jane Doe', '456 Oak St', 'Townsville', 'Canada'),
    (4, 'Tech Solutions', 'Emily White', '321 Elm St', 'Tech City', 'USA'),
    (5, 'Fashion Trends', 'Chris Brown', '654 Birch St', 'Styleville', 'Australia');
go
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2022-01-01', 499.99),
    (102, 2, '2022-01-02', 799.99),
    (104, 4, '2022-01-04', 899.99),
    (105, 5, '2022-01-05', 299.99);
go
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (103,NULL, '2022-01-03', 399.99);
--Bài 2: Thực hiện truy vấn đệ quy - nh
CREATE TABLE Employees (
    EmployeeID int PRIMARY KEY,
	ManagerID INT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    BirthDate DATE,
    Department VARCHAR(255),
    Salary DECIMAL(10, 2)
);
go
INSERT INTO Employees (EmployeeID, ManagerID, FirstName, LastName, BirthDate, Department, Salary)
VALUES
    (1001,'', 'John', 'Doe', '1990-05-15', 'IT', 60000.00),
    (1002,'1', 'Jane', 'Smith', '1985-08-22', 'HR', 55000.00),
    (1003,'2', 'Mike', 'Johnson', '1992-02-10', 'Finance', 70000.00),
    (1004,'1', 'Emily', 'White', '1988-11-30', 'Marketing', 65000.00),
    (1005,'2','Chris', 'Brown', '1995-04-05', 'Sales', 75000.00);
go
-- bài làm:
SELECT SUM(Salary) AS total_salary FROM Employees;
SELECT COUNT(OrderID) AS NumberOfOrders FROM Orders;--1

SELECT SUM(TotalAmount) AS total_amount FROM Orders;--2

SELECT CustomerID, COUNT(OrderID) AS NumberOfOrders FROM Orders GROUP BY CustomerID;--3

SELECT Orders.OrderID, Customers.CustomerName FROM Orders 
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;--4

SELECT Orders.OrderID, Customers.CustomerName FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
SELECT Orders.OrderID, Customers.CustomerName FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName FROM Orders
FULL JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT OrderID, OrderDate, CustomerID, TotalAmount from Orders --5
UNION 
SELECT Null, Null, CustomerID,Null from Orders;
----- Yêu cầu bài 2
--1) Thực hiện truy vấn để lấy danh sách tất cả các quản lý và dưới quản lý của họ
WITH DirectReports (ManagerID, EmployeeID, FirstName, LastName, Level)
AS (
SELECT ManagerID, EmployeeID, FirstName, LastName, 0 AS Level
FROM Employees
WHERE ManagerID = '0'
UNION ALL
SELECT Employees.ManagerID, Employees.EmployeeID, Employees.FirstName, Employees.LastName, Level + 1
FROM Employees
INNER JOIN DirectReports ON Employees.ManagerID = DirectReports.EmployeeID - 1000
)
SELECT ManagerID, EmployeeID, FirstName, LastName, Level
FROM DirectReports
ORDER BY Level, ManagerID, EmployeeID;