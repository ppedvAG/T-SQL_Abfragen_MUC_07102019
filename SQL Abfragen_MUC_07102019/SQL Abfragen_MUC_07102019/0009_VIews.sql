--Sichten bzw Views

/*
germekte Abfrage

eine Sicht verhält sich 1:1 wie eine Tabelle
--also auch: select , join, ins, up, del(aber nur unter abtrichen)

eine Sicht hat nie selbest Datensätze

Sichten haben immer nur ein SELECT Statement, nie ins up oder delete 




*/

create view KundeUK
as
select * from Customers where Country = 'UK';
GO


--Sicht ändern
alter view KundeUK
as
select Country, city from Customers where Country = 'UK';
GO


select * from kundeUK;
GO

drop view KundeUK;
GO




--alles wichtige aus den Tabellen customers, orders, order details, productsa, employees

--Customerid, companyname, country, city
--orderid, freight, orderdate
--unitprice, quantity
--productid, productname
--lastname, firstname, emploeeid

--> Sicht vKundeUmsatzDetails


alter view vKundeUmsatzDetails
as
select 
	c.CustomerID, c.CompanyName,c.Country, c.City,
	o.OrderID, o.Freight, o.OrderDate,
	od.UnitPrice, od.Quantity,od.UnitPrice*od.Quantity as PosSumme,
	p.ProductID, p.ProductName,
	e.LastName, e.firstname

from Customers c inner join orders o			on c.CustomerID = o.CustomerID 
				 inner join Employees e			on e.EmployeeID = o.EmployeeID
				 inner join [Order Details] od	on od.OrderID   = o.OrderID
				 inner join Products p			on p.ProductID  = od.ProductID;
GO
				 
select distinct Companyname, productname from vKundeUmsatzDetails where country = 'UK';
GO


