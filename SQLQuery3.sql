Create Database E_Commerce 
Use E_Commerce
-- ===========================
-- 1. CUSTOMERS TABLE
-- ===========================
CREATE TABLE Customers (
    CustomerID      INT PRIMARY KEY,
    Name            VARCHAR(100) NOT NULL,
    Gender          VARCHAR(10),
    City            VARCHAR(100),
    JoinDate        DATE
);

INSERT INTO Customers (CustomerID, Name, Gender, City, JoinDate) VALUES
(1, 'Alice Johnson', 'Female', 'New York', '2023-01-10'),
(2, 'Michael Smith', 'Male', 'Chicago', '2022-11-05'),
(3, 'Sophia Davis', 'Female', 'Los Angeles', '2023-02-12'),
(4, 'Daniel Brown', 'Male', 'Houston', '2021-09-20'),
(5, 'Emma Wilson', 'Female', 'Seattle', '2023-03-01'),
(6, 'James Miller', 'Male', 'Miami', '2022-07-18'),
(7, 'Olivia Taylor', 'Female', 'Boston', '2023-01-25'),
(8, 'William Anderson', 'Male', 'Dallas', '2022-12-12'),
(9, 'Ava Thomas', 'Female', 'Phoenix', '2021-08-15'),
(10, 'Benjamin Moore', 'Male', 'Austin', '2023-02-28'),
(11, 'Mia Martin', 'Female', 'Denver', '2022-11-30'),
(12, 'Lucas Jackson', 'Male', 'San Diego', '2023-03-10'),
(13, 'Charlotte White', 'Female', 'San Jose', '2022-10-22'),
(14, 'Henry Harris', 'Male', 'Atlanta', '2023-01-08'),
(15, 'Amelia Clark', 'Female', 'Columbus', '2023-02-16'),
(16, 'Jacob Lewis', 'Male', 'Detroit', '2021-06-14'),
(17, 'Evelyn Lee', 'Female', 'Nashville', '2023-03-05'),
(18, 'Michael Walker', 'Male', 'Portland', '2022-09-07'),
(19, 'Harper Hall', 'Female', 'Charlotte', '2021-05-21'),
(20, 'Alexander Young', 'Male', 'San Francisco', '2023-03-14');

Select * from Customers
-- ===========================
-- 2. PRODUCTS TABLE
-- ===========================
CREATE TABLE Products (
    ProductID       INT PRIMARY KEY,
    ProductName     VARCHAR(150) NOT NULL,
    Category        VARCHAR(100),
    UnitPrice       DECIMAL(10,2) NOT NULL
);

select * From Products

INSERT INTO Products (ProductID, ProductName, Category, UnitPrice) VALUES
(1, 'Laptop Pro 15', 'Electronics', 1299.99),
(2, 'Wireless Mouse', 'Electronics', 25.99),
(3, 'Mechanical Keyboard', 'Electronics', 89.50),
(4, '4K Monitor', 'Electronics', 399.00),
(5, 'USB-C Cable', 'Accessories', 9.99),
(6, 'Bluetooth Speaker', 'Audio', 59.99),
(7, 'Noise Cancelling Headphones', 'Audio', 149.99),
(8, 'Smart Watch X', 'Wearables', 199.99),
(9, 'Fitness Band', 'Wearables', 49.99),
(10, 'Gaming Chair', 'Furniture', 179.99),
(11, 'Desk Lamp', 'Home', 24.99),
(12, 'Office Desk', 'Furniture', 249.99),
(13, 'Portable Hard Drive', 'Storage', 79.99),
(14, 'SSD 1TB', 'Storage', 109.99),
(15, 'Smartphone S20', 'Electronics', 899.99),
(16, 'Tablet Plus', 'Electronics', 499.99),
(17, 'Drone Mini', 'Gadgets', 299.99),
(18, 'Camera Lens 50mm', 'Photography', 199.99),
(19, 'Tripod Stand', 'Photography', 39.99),
(20, 'Action Camera', 'Photography', 149.99);

-- ===========================
-- 3. ORDERS TABLE
-- ===========================
CREATE TABLE Orders (
    OrderID         INT PRIMARY KEY,
    CustomerID      INT,
    OrderDate       DATE NOT NULL,
    PaymentMethod   VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, PaymentMethod) VALUES
(1, 1, '2023-03-20', 'Credit Card'),
(2, 3, '2023-03-21', 'PayPal'),
(3, 5, '2023-03-22', 'Debit Card'),
(4, 2, '2023-03-23', 'UPI'),
(5, 7, '2023-03-24', 'Credit Card'),
(6, 4, '2023-03-25', 'PayPal'),
(7, 9, '2023-03-26', 'Cash'),
(8, 6, '2023-03-27', 'Credit Card'),
(9, 8, '2023-03-28', 'Debit Card'),
(10, 10, '2023-03-29', 'Credit Card'),
(11, 12, '2023-03-30', 'PayPal'),
(12, 11, '2023-03-31', 'UPI'),
(13, 14, '2023-04-01', 'Credit Card'),
(14, 13, '2023-04-02', 'Cash'),
(15, 16, '2023-04-03', 'Debit Card'),
(16, 15, '2023-04-04', 'Credit Card'),
(17, 18, '2023-04-05', 'PayPal'),
(18, 17, '2023-04-06', 'UPI'),
(19, 20, '2023-04-07', 'Credit Card'),
(20, 19, '2023-04-08', 'Cash');

Select * From Orders
-- ===========================
-- 4. ORDERDETAILS TABLE
-- ===========================
CREATE TABLE OrderDetails (
    OrderDetailID   INT PRIMARY KEY,
    OrderID         INT,
    ProductID       INT,
    Quantity        INT NOT NULL,
    Discount        DECIMAL(5,2) DEFAULT 0,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Discount) VALUES
(1, 1, 1, 1, 0),
(2, 2, 4, 2, 5),
(3, 3, 2, 1, 0),
(4, 4, 7, 1, 10),
(5, 5, 5, 3, 0),
(6, 6, 8, 1, 5),
(7, 7, 10, 2, 0),
(8, 8, 12, 1, 7),
(9, 9, 6, 2, 0),
(10, 10, 3, 1, 0),
(11, 11, 14, 1, 5),
(12, 12, 9, 3, 0),
(13, 13, 15, 1, 10),
(14, 14, 11, 2, 0),
(15, 15, 18, 1, 5),
(16, 16, 13, 1, 0),
(17, 17, 16, 1, 0),
(18, 18, 20, 2, 0),
(19, 19, 17, 1, 15),
(20, 20, 19, 3, 0);

Select * From OrderDetails
--SQL Queries

--Show All Products

SELECT * FROM Products;


--Show All Customers

SELECT * from Customers

--Find Customers Who Live in New York

Select Name,CustomeriD From Customers where City In('New York')

--List Products Cheaper than 100

Select * From Products where	UnitPrice<100


--Find All Male Customers

Select * From Customers where Gender='Male'

--Sort Customers by Join Date

SELECT * FROM Customers
ORDER BY JoinDate;

-- Find Products  in From Electronic Category

SELECT * FROM Products
WHERE Category = 'Electronics';

--Sort Products By Price

Select * From Products order by UnitPrice desc

--Count Total No Of Customers 

Select Count(*) As Total_Count From Customers

--Count How many Product in Each Category

SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;

--Total Quantity of Each Product Sale

SELECT ProductID, SUM(Quantity) AS TotalSold
FROM OrderDetails
GROUP BY ProductID;

--Show all Products of a specific Customer

Select * From Customers where CustomerID=6

--Show Product Name with its Price

SELECT ProductName, UnitPrice
FROM Products;

--Join Orders with Customers

SELECT O.OrderID, C.Name, O.OrderDate
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID;

--Show Order Detail with Product Names

SELECT OD.OrderDetailID, P.ProductName, OD.Quantity
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID;

--Total Orders Placed

SELECT COUNT(*) AS TotalOrders
FROM Orders;

--Average price of all Products

SELECT AVG(UnitPrice) AS AveragePrice
FROM Products;

--Find Highest Price Of Product

Select Max(UnitPrice) As Expensive_Product From Products


