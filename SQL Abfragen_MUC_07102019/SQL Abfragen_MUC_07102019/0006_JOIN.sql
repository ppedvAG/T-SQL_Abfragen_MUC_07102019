--DB DESIGN--

--Begriffe: Normalisierung Normalform
--


/*
BIBLIOTHEK

Autoren
VorName, nachname, AID


Bücher
Titel, Genre, ISBN, BID

Leser
Name, LID, GebDat


Ausleihe
Leihdatum, LID, BID,  ALID

--INNER JOIN.. nur überinestimmende Werte auf beidem Seiten werden ausgegeben
*/
select sp1, sp2 from tab1 inner join tab2 on tab1.spid = tab2.spid


select sp1, sp2 from tab1 t1 inner join tab2 t2 on t1.spid = t2.spid


select	  c.companyname
		, o.orderid 
from 
		  customers c inner join orders o on c.customerid = o.customerid
where 
		  c.City = 'london'
order by  c.companyname

--Liste mit BestellNr, Frachtkosten, bestelldatum, Menge, Preis und ProductId
--Ergbnis muss 2155 Zeilen haben

SELECT	  o.OrderID, o.Freight, o.OrderDate
		, od.UnitPrice, od.Quantity
		, (od.UnitPrice*od.Quantity)  PosSumme
FROM orders o inner join [Order Details] od on o.OrderID=od.OrderID



--Zu jeder Position brauchen wir die Menge, Preis und den Produktnamen

select 
		  p.ProductName
		, od.OrderID, od.UnitPrice, od.Quantity
	from   
		products p inner join [Order Details] od on od.ProductID=p.ProductID


--Liste aller bestellungen aus Shipcountry USA
--und von welchem Angestellten wurde die Bestellungen betreut

--Anzeige: Angstelltenname, BestellNr, Frachtkosten

select    o.OrderID, o.Freight
		, e.lastname
from 
		orders o inner join Employees e on e.EmployeeID=o.EmployeeID
where	
		o.ShipCountry='USA'


select * 
	from 
			tab1 t1 inner join tab2 t2 on t1.id = t4.id
					inner join tab3 t3 on t3.id = t2.id
					inner join tab4 t4 on t4.nr = t1.nr



--Join über mehrere Tabellen:
--welcher Kunde(Firma) hat über welchen Angestellten, mit welchen Frachtkosten,
--welches produkt zu welchem Preis und Menge gekauft
--aber nur die Kunden aus UK


select c.CompanyName--, c.country
	  , e.LastName
	  , o.Freight, o.OrderID
	  , od.UnitPrice, od.Quantity
	  , p.ProductName
from 
	Customers c inner join orders o				on c.CustomerID = o.customerid
			    inner join Employees e			on e.EmployeeID = o.EmployeeID
				inner join [Order Details] od	on od.OrderID   = o.OrderID
				inner join products p			on p.ProductID  = od.ProductID
where c.Country = 'UK'


--LEFT  RIGHT JOIN


select customerid from customers --91
select distinct customerid from orders --89 Kunden

--2 Leute haben nix bestellt


select c.CustomerID, o.CustomerID, o.*
from Customers c left join orders o on c.CustomerID=o.CustomerID
where o.CustomerID is null

--haben wirklich alle Bestellungen passend ein Kundenkonto in Customers
			    

select * from 
	orders o left join Customers c on c.CustomerID = o.CustomerID
	where c.CustomerID is not null

select * from 
	Customers c right join orders o on o.CustomerID = c.CustomerID
	where c.CustomerID is null









