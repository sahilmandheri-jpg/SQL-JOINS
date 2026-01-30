use sql_joins;
create table Customers
(CustomerID INT, CustomerName Varchar(50), City varchar(50));
Insert into Customers
(CustomerID, CustomerName, City)
Values
(1, 'John_Smith', 'New_York'),
(2, 'Mary_Johnson', 'Chicago'),
(3, 'Peter_Adams', 'Los_Angeles'),
(4, 'Nancy_Miller', 'Houston'),
(5, 'Robert_White', 'Miami');
select * from Customers;




use sql_joins;
create table Orders
(OrderID int, CustomerID int, OrderDate date,  Amount int);
insert into Orders
(OrderID, CustomerID, OrderDate,  Amount)
values
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05',300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 6, '2024-10-12', 400);
select * from Orders;



use sql_joins;
Create table Payments
(PaymentID varchar(50), CustomerID int, PaymentDate date,
 Amount int);
 insert into Payments
 (PaymentID , CustomerID , PaymentDate ,
 Amount)
 values
 ('P001', 1, '2024-10-02', 250),
 ('P002', 2, '2024-10-06', 300),
 ('P003', 3, '2024-10-11', 450),
 ('P004', 4, '2024-10-15', 200);
 select * from Payments;
 
 
 use sql_joins;
 create table Employees
 (EmployeeID int, EmployeeName varchar(50), ManagerID int);
 insert into Employees
 (EmployeeID , EmployeeName, ManagerID)
 
 values
 (1, 'Alex Green', null),
 (2, 'Brian Lee',1),
 (3, 'Carol Ray', 1),
 (4, 'David Kim', 2),
 (5, 'Eva Smith', 2);
  
 Select * from Employees;
 
 ///////////////////////////////////////////////////////
 //////////////////////////////////////////////////////
 /////////////////////////////////////////////////////
 
 
Question 1. Retrieve all customers who have placed at least one order.

select distinct c.CustomerID, c.CustomerName, c.City
from Customers AS c

INNER JOIN Orders o on c.CustomerID=o.CustomerID;

///////////////////////////////////////////////////////////////////////////////////////////////

Question 2. Retrieve all customers and their orders,
including customers who have not placed any orders.

	select distinct c.CustomerID, c.CustomerName, c.City
	from Customers as c
	left Join Orders as o ON c.Customerid=o.CustomerID;
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////
    
    Question 3. Retrieve all orders and their corresponding customers, including
    orders placed by unknown customers.
    
    select c.CustomerID, c.CustomerName, c.City
    from Customers as c
    right join Orders as o ON c.Customerid=o.CustomerID;
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    Question 4. Display all customers and orders, whether matched or not.
    
    select c.CustomerID, c.CustomerName, o.OrderID, o.Amount, c.City 
    from Customers as c
   left join Orders as o on c.CustomerID=o.CustomerID
	Union
    Select c.customerID, c.CustomerName, o.OrderID, o.Amount, c.City
    From Customers as c
    right join Orders as o on  c.CustomerID=o.CustomerID;
    
    /////////////////////////////////////////////////////////////////////////////////////////
    
    Question 5. Find customers who have not placed any orders.
    
    select distinct c.CustomerID, c.CustomerName
from Customers as c
left join Orders as o on c.CustomerID=o.CustomerID
where o.OrderID is null;

///////////////////////////////////////////////////////////////////////////////////////////

Question 6. Retrieve customers who made payments 
but did not place any orders.

select	c.CustomerID, c.CustomerName from Customers as c
join Payments as p on c.CustomerID=p.CustomerID
left join Orders as o on o.CustomerID=c.CustomerID
where o.OrderID is null;

//////////////////////////////////////////////////////////////////////////////

Question 7. Generate a list of all possible combinations
 between Customers and Orders.
 
 select c.CustomerID, c.CustomerName, o.OrderID from Customers as c
 cross join Orders as o;

/////////////////////////////////////////////////////////////////////////////////////////

Question 8. Show all customers along with order and 
payment amounts in one table.


select c.CustomerID, c.CustomerName, o.OrderID, p.PaymentID, o.Amount
from Customers as c
left join Orders as o on c.CustomerID = o.CustomerID
left join Payments as p on c.CustomerID = p.CustomerID
Union

select c.CustomerID, c.CustomerName, o.OrderID, p.PaymentID, o.Amount
from Customers as c
right join Orders as o on c.CustomerID = o.CustomerID
left join Payments as p on c.CustomerID = p.CustomerID

union

select c.CustomerID, c.CustomerName, o.OrderID, p.PaymentID, o.Amount
from Customers as c
right join Orders as o on c.CustomerID = o.CustomerID
right join Payments as p on c.CustomerID = p.CustomerID;

/////////////////////////////////////////////////////////////////////////////////////////////

Question 9. Retrieve all customers who have
 both placed orders and made payments.
 SELECT DISTINCT 
    c.CustomerID, 
    c.CustomerName
FROM Customers AS c
JOIN Payments AS p ON c.CustomerID = p.CustomerID
JOIN Orders AS o ON c.CustomerID = o.CustomerID;