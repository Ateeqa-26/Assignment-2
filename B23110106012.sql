
CREATE DATABASE CarShowRoom;
\c CarShowRoom;
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Cars (
    CarID SERIAL PRIMARY KEY,
    Model VARCHAR(50),
    Brand VARCHAR(50),
    Year INT,
    Price NUMERIC(10, 2),
    Color VARCHAR(30),
    InventoryCount INT
);

CREATE TABLE Salespersons (
    SalespersonID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    HireDate DATE
);

CREATE TABLE Sales (
    SaleID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    CarID INT REFERENCES Cars(CarID),
    SaleDate DATE,
    SalePrice NUMERIC(10, 2),
    SalespersonID INT REFERENCES Salespersons(SalespersonID)
);

CREATE TABLE ServiceRecords (
    RecordID SERIAL PRIMARY KEY,
    CarID INT REFERENCES Cars(CarID),
    ServiceDate DATE,
    ServiceType VARCHAR(50),
    Cost NUMERIC(10, 2),
    TechnicianID INT
);



INSERT INTO Customers (CustomerName, City, State, JoinDate) VALUES
('John Smith', 'New York', 'New York', '2022-01-15'),
('Emma Johnson', 'Los Angeles', 'California', '2022-02-10'),
('Liam Brown', 'Chicago', 'Illinois', '2022-03-05'),
('Olivia Davis', 'Houston', 'Texas', '2022-04-12'),
('Noah Wilson', 'Phoenix', 'Arizona', '2022-05-19'),
('Sophia Martinez', 'Philadelphia', 'Pennsylvania', '2022-06-22'),
('James Anderson', 'San Antonio', 'Texas', '2022-07-15'),
('Isabella Thompson', 'San Diego', 'California', '2022-08-08'),
('Lucas White', 'Dallas', 'Texas', '2022-09-25'),
('Mia Harris', 'San Jose', 'California', '2022-10-30');


INSERT INTO Cars (Model, Brand, Year, Price, Color, InventoryCount) VALUES
('Civic', 'Honda', 2022, 35000, 'White', 5),
('Corolla', 'Toyota', 2021, 30000, 'Black', 4),
('Model 3', 'Tesla', 2023, 55000, 'Red', 3),
('Fortuner', 'Toyota', 2022, 60000, 'Grey', 2),
('Accord', 'Honda', 2021, 40000, 'Blue', 6),
('Elantra', 'Hyundai', 2022, 28000, 'Silver', 5),
('CX-5', 'Mazda', 2023, 32000, 'White', 3),
('Camry', 'Toyota', 2022, 35000, 'Black', 4),
('Sportage', 'Kia', 2023, 33000, 'Green', 2),
('C-Class', 'Mercedes', 2023, 70000, 'Black', 1);


INSERT INTO Salespersons (Name, Department, HireDate) VALUES
('Ethan Clark', 'Sales', '2021-01-05'),
('Ava Lewis', 'Sales', '2021-02-12'),
('William Walker', 'Luxury Cars', '2021-03-18'),
('Charlotte Hall', 'Electric Cars', '2021-04-22'),
('Benjamin Allen', 'SUV Sales', '2021-05-15'),
('Amelia Young', 'Sales', '2021-06-10'),
('Daniel Hernandez', 'Luxury Cars', '2021-07-25'),
('Harper King', 'Sales', '2021-08-30'),
('Michael Wright', 'SUV Sales', '2021-09-14'),
('Evelyn Scott', 'Electric Cars', '2021-10-01');


INSERT INTO Sales (CustomerID, CarID, SaleDate, SalePrice, SalespersonID) VALUES
(1, 1, '2022-02-01', 34000, 1),
(2, 2, '2022-03-15', 29500, 2),
(3, 3, '2022-04-10', 54000, 4),
(4, 4, '2022-05-20', 59000, 5),
(5, 5, '2022-06-25', 39500, 3),
(6, 6, '2022-07-18', 27500, 6),
(7, 7, '2022-08-10', 31500, 7),
(8, 8, '2022-09-14', 34500, 8),
(9, 9, '2022-10-05', 32500, 9),
(10, 10, '2022-11-20', 69500, 3);

INSERT INTO ServiceRecords (CarID, ServiceDate, ServiceType, Cost, TechnicianID) VALUES
(1, '2022-03-01', 'Oil Change', 150, 101),
(2, '2022-04-12', 'Tire Replacement', 400, 102),
(3, '2022-05-05', 'Battery Replacement', 600, 103),
(4, '2022-06-15', 'Brake Service', 350, 104),
(5, '2022-07-10', 'Engine Tune-up', 500, 105),
(6, '2022-08-08', 'AC Repair', 200, 106),
(7, '2022-09-18', 'Transmission Repair', 1200, 107),
(8, '2022-10-22', 'Paint Job', 800, 108),
(9, '2022-11-11', 'Windshield Replacement', 250, 109),
(10, '2022-12-05', 'Full Service', 1000, 110);


SELECT COUNT(*) AS TotalCustomers FROM Customers;
SELECT AVG(SalePrice) AS AverageSalePrice FROM Sales;
SELECT MAX(SalePrice) AS MostExpensiveSale FROM Sales;
SELECT SUM(InventoryCount) AS TotalInventory FROM Cars;
SELECT MIN(SaleDate) AS EarliestSale, MAX(SaleDate) AS MostRecentSale FROM Sales;


SELECT Brand, COUNT(*) AS ModelCount FROM Cars GROUP BY Brand;
SELECT sp.Name, SUM(s.SalePrice) AS TotalSales
FROM Sales s JOIN Salespersons sp ON s.SalespersonID = sp.SalespersonID
GROUP BY sp.Name;
SELECT c.Model, AVG(s.SalePrice) AS AverageSalePrice
FROM Sales s JOIN Cars c ON s.CarID = c.CarID
GROUP BY c.Model;
SELECT ServiceType, AVG(Cost) AS AverageCost FROM ServiceRecords GROUP BY ServiceType;
SELECT Brand, Color, COUNT(*) AS CarCount FROM Cars GROUP BY Brand, Color;


SELECT Brand, COUNT(*) AS ModelCount FROM Cars GROUP BY Brand HAVING COUNT(*) > 5;
SELECT c.Model, COUNT(*) AS SalesCount FROM Sales s
JOIN Cars c ON s.CarID = c.CarID
GROUP BY c.Model HAVING COUNT(*) > 10;
SELECT sp.Name, AVG(s.SalePrice) AS AverageSale
FROM Sales s JOIN Salespersons sp ON s.SalespersonID = sp.SalespersonID
GROUP BY sp.Name HAVING AVG(SalePrice) > 50000;
SELECT DATE_TRUNC('month', SaleDate) AS SaleMonth, COUNT(*) AS SalesCount
FROM Sales GROUP BY DATE_TRUNC('month', SaleDate)
HAVING COUNT(*) > 20;
SELECT ServiceType, AVG(Cost) AS AverageCost FROM ServiceRecords
GROUP BY ServiceType HAVING AVG(Cost) > 500;
