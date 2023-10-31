use Northwind;

select count(*) as numemployeees from Employees;
select * from [Order Details]

select ProductID,Quantity from [Order Details] where  ProductID=3;

select sum (quantity) as totalunits from [Order Details] where ProductID=3;

select avg (unitprice) as averageprice from Products;

select * from Employees

select city,count(employeeid)as numemployees from Employees
group by city;

 
select city,count(employeeid)as numemployees from Employees
group by city having count (EmployeeID)>1;

 
select distinct city from Employees order by city;

select count (distinct city) as numcities from Employees


select ProductID,sum(quantity) as totalunits from [Order Details] group by ProductID having sum (quantity)<200;

select ProductID,avg(unitprice) as averageprice from products group by ProductID having avg (unitprice)>70 order by averageprice;

select * from Orders

select CustomerId,count (orderid) as numorders from orders group by customerid having count (orderid)>15
order by numorders desc;

select ProductID,unitprice from products where unitprice>70 order by unitprice;



select freight,ROUND(freight,1) as approxfreight from orders;

select unitprice,CAST(unitprice as char(10)) from Products;

select unitprice,'$'+CAST(unitprice as char(10)) from products;

select upper (firstname),upper(lastname) from Employees;

select SUBSTRING(address,1,10) from Customers;

select lastname,birthdate,hiredate,datediff(year,birthdate,hiredate) as hireage from Employees order by hireage;



select firstname,lastname,datename(month,birthdate)as birthmonth,datepart(month,birthdate)

from Employees

order by datepart(month,birthdate);

--find the name of the companmy that placed order 10290

select companyname
from Customers
where CustomerID=(select CustomerID from orders where OrderID=10290);

--find  the companies that placed order in 1997

select * from Orders
select * from Customers
select companyname
from Customers
where CustomerID in (select CustomerID from orders where OrderDate between '1-jan-1997' and '31-dec-1997');


select * from Suppliers 
where CompanyName='grandma kelly''s homestead';



select * from Suppliers
select * from Categories
select * from Orders
select * from Products

select ProductName
from Products
where CategoryID=(select CategoryID from Categories where categoryname='seafood');
 

select companyname
from Suppliers
where SupplierID in (select SupplierID from Products where CategoryID=8);


select Employees.EmployeeID,Employees.FirstName,Employees.LastName,orders.OrderID,orders.OrderDate
from Employees join orders on (employees.employeeID=orders.employeeID) order by  orders.orderdate;
select * from Orders
select * from Employees

select e.EmployeeID,e.FirstName,e.LastName,o.OrderID,o.OrderDate
from Employees e join orders o on(e.EmployeeID=o.EmployeeID)
order by o.OrderDate;

select * from Employees
select * from Orders
select * from Customers

select e.FirstName,e.LastName,o.OrderID,c.CompanyName
from Orders o
join Employees e on (e.EmployeeID=o.EmployeeID)
join Customers c on(c.CustomerID=o.CustomerID)
where o.shippedDate>o.requireddate and o.orderdate>'1-jan-1998' order by c.companyname;


--create a report that shows the number of employees and customers from each city that has employees in it 

select count (distinct e.EmployeeID) as numemployees,count (distinct c.customerID) as numcompanies,e.city,c.city
from employees e join customers c on(e.city=c.city)
group by e.city,c.city
order by numemployees desc;


--create a repot that shows them numner of employees and customer fromeach city that has emolye on it

select count(distinct e.employeeid)as numemployees,
count(distinct c.customerid)as numcompanies,
e.city,c.city
from Employees e left join Customers c on(e.city=c.city)
group by e.city,c.city order by numemployees desc;

select count(distinct e.employeeid)as numemployees,
count(distinct c.customerid)as numcompanies,
e.city,c.city
from Employees e right join Customers c on(e.city=c.city)
group by e.city,c.city order by numemployees desc;


select count(distinct e.employeeid)as numemployees,
count(distinct c.customerid)as numcompanies,
e.city,c.city
from Employees e full join Customers c on(e.city=c.city)
group by e.city,c.city order by numemployees desc;




select companyname,phone
from Shippers
union

select companyname,phone
from Customers
union
select companyname,phone
from suppliers
order by CompanyName


select e.firstname,e.lastname,o.orderid
from Employees e join orders o on(e.EmployeeID=o.EmployeeID)
where o.RequiredDate<o.ShippedDate
order by firstname,lastname


select p.productname,sum (od.quantity) as totalunits 
from [Order Details] od join Products p on (p.productname=od.ProductID)
group by p.productname
having sum(od.quantity)<200

select * from Orders
select * from Customers

select c.companyname,count (o.orderID) as numorders
from Customers c join orders o on (c.CustomerID=o.CustomerID)
where OrderDate>'31-dec-1996'
group by c.CompanyName having  count (o.OrderID)>15
order by numorders desc;


select c.Companyname,o.orderID,od.unitprice*od.quantity*(1-od.Discount) as totalprice 
from [Order Details] od
join orders o on (o.OrderID=od.OrderID)
join customers c on (c.CustomerID=o.CustomerID)
where od.UnitPrice*od.Quantity*(1-od.Discount)>10000
order by totalprice desc;

--Transaction 

go 
begin transaction
update dbo.Categories
set CategoryName='fishfood_harish'
where CategoryName='seafood';
--rollback transaction
commit transaction
select*from dbo.Categories

begin  transaction
update dbo.Categories
set CategoryName='seafood'
where CategoryName='fishfood';
rollback transaction
select*from dbo.Categories


select*from Employees


select e1.employeeId,e1.firstname,e2.firstname as managername,e1.title 
from  Employees e1 inner join Employees e2 on e1.reportsto=e2.employeeId


select * from orders where Freight in (select top 3 Freight from orders order by freight desc)
                                                             

select min (birthdate)
from (select top 3 birthdate from Employees order by birthdate desc)a;




select orderid,freight from orders order by Freight desc
select min (freight) from(select top 3 freight from orders order by Freight desc)a





