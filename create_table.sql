DROP DATABASE IF EXISTS store;

CREATE DATABASE store;
USE store;

DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS OrderDetails;

CREATE TABLE Categories (
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name varchar (100) NOT NULL
);

CREATE TABLE Products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name varchar (100) NOT NULL,
    category_id INT,
    price DOUBLE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name varchar (100) NOT NULL,
    email varchar(50)
);

CREATE TABLE Orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
	order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Categories (category_name)
VALUES  ('Appetizer'),
		('Wine'),
		('Pasta'),
		('Bouillion'),
		('Icecream'),
		('Juice'),
		('Chicken');

INSERT INTO Products (product_name, category_id, price)
VALUES ('Sausage Rolls', 1, 33.6),
		('Beringer Founders Estate', 4, 87.2),
		('Cappellini', 2, 59),
		('Green Scrubbie Pad H.duty', 6, 52.6),
		('Fried Fish', 1, 19.1),
		('Dibs', 5, 92.4),
		('Apple 284ml', 6, 54.1),
		('Rum - White, Gg White', 2, 63.1),
		('Ecolab - Hobart Upr Prewash Arm', 2, 66.7),
		('Trout - Rainbow, Fresh', 4, 62.8);
        
INSERT INTO Customers (customer_name, email)
VALUES ('Jsandye Iannitti', 'jiannitti0@reuters.com'),
		('Freemon Brandli', 'fbrandli1@sohu.com'),
		('Henrie Cremen', 'hcremen2@macromedia.com'),
		('Wyndham Janks', 'wjanks3@biblegateway.com'),
		('Phedra Lovett', 'plovett4@scientificamerican.com'),
		('Lindsy Newiss', 'lnewiss5@pcworld.com'),
		('Floyd Getcliffe', 'fgetcliffe6@drupal.org'),
		('Putnem Guerro', 'pguerro7@ifeng.com'),
		('Ingeborg Sallarie', 'isallarie8@angelfire.com'),
		('Mordy Cram', 'mcram9@youtube.com');  
        
INSERT INTO Orders (customer_id, order_date)
VALUES  (5, '2023-05-07'),
		(7, '2023-05-22'),
		(1, '2023-09-12'),
		(4, '2023-03-06'),
		(3, '2023-10-25'),
		(3, '2023-02-15'),
		(1, '2023-03-03'),
		(2, '2023-01-06'),
		(8, '2023-02-23'),
		(9, '2023-10-09');

INSERT INTO OrderDetails (order_id, product_id, quantity)
VALUES (3, 4, 91),
		(2, 5, 82),
		(1, 2, 16),
		(1, 4, 1),
		(1, 5, 60),
		(4, 6, 23),
		(2, 7, 89),
		(3, 1, 12),
		(7, 1, 93),
		(8, 2, 88);

SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;



