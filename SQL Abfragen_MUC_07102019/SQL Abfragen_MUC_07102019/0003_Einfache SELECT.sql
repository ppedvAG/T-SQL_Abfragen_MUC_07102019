--Einfache SELECT

use northwind;
GO
--Batchdelimiter

select * from customers;


/*
SELECT 
		TOP n [percent] [with ties]
		* alle Spalten
		einzelne Spalten
		Mathe
		F()
		TXT, ZAHL
		ALIAS (..as Bez)
FROM
		Tabelle
order by
		Sp1 desc, sp2 asc (default), n....
*/



select companyname, country, city from customers

--im Select werden die Saplten mit Komma separiert


select  companyname, 
		country, 
		city 
from customers



--evtl bessere Darstellung.. auskommentieren , Kommafehler
select  companyname as Firma
		,country
--		,city 
from customers


select * from orders


select freight *1.19 as Brutto from orders



select * from orders


select orderdate, RequiredDate, shippeddate from orders

--Lieferdauer in Tagen
--Orderdate --> Shippeddate)


select datediff(dd,orderdate, shippeddate) as Lieferdauer from orders 

select orderid, 'XY' as demo1 from orders
select LEFT(customerid,2) from orders



--SORTIERUNG

--mit order by sp1 asc, sp2 desc

--der order by stehht immer ganz am Ende



select * from orders order by Freight desc


--Höchste Lieferdauer

select datediff(dd,orderdate, 
shippeddate) as 
Lieferdauer from 
orderx 
order by
lieferdauer desc


--TOP 10 

--die top 3 mit den höchten Frachtkosten
select top 3 * from orders order by Freight desc

--die ersten 3 % nach Frachtkostren aufsteigend
select top 3 PERCENT * from orders order by Freight asc


--"Wilde 13"
--top 13 nach Frachtkosten AUFSTEIGEND

SELECT TOP 13 with ties--auch die die denselben Wert haben, wie er an Pos 13
	OrderID, CustomerID , freight
from	 orders 
order by Freight asc



--Filtern mit : where


select * from orders
	where  ??
	order by


--where
/*
> ,< , >=, <=, <>, !=, =
like 
in
between
not like, not in, not between
*/



select * from orders
where 
	EmployeeID = 1

---Orders mit Frachtkosten  größer oder gleich als 500

select * from orders where Freight >= 500


--Lieferverzögerung (Shippeddate, Requeireddate)
--sortiert nach Lieferverzögerung absteigend
--dann nur noch die, die tats. eine Verzögerung hatten


select requireddate, ShippedDate, DATEDIFF(dd, requireddate, ShippedDate) as Verz
from Orders
where  DATEDIFF(dd, requireddate, ShippedDate)>0
	or shippeddate is null
order by Verz desc

--NULL 


select * from Customers where City > 'a'


----LIKE

--kennt als einziger Vergleichsoperator: %

-- % steht für beliebig viele Zeichen ..auch keines

select * from Customers where City like 'a%'

select * from Customers where City like '%a'

select * from Customers where City like '%a%'

--mehrere Kriterien
--Spalten müssen angeben werden
--where sp1 = 10 and sp2 > 30 or sp3  like 'b%'
--where sp1 > 10 and sp1 < 100
--nicht sp1 < 10 and > 2

select * from orders

--alle Kunden aus London und Berlin


select  City 
	  , * 
from customers
	where
		City = 'Berlin' 
		or --hier OR!
		City = 'London'  --- 7


--suche alle Kunden aus Berlin und aus London, die weniger als 10 Frachtkosten haben
select  ShipCity 
	  , * 
from orders
	where
		ShipCity = 'Berlin' 
		or --hier OR!
		(ShipCity = 'London' --37
		and
		Freight < 10)


select  ShipCity 
	  , * 
from orders
	where
		(ShipCity = 'Berlin' 
		or --hier OR!
		ShipCity = 'London') --37
		and
		Freight < 10


--IN ist kürzer

--where shipcity in ('Berlin', 'london', 'Leipzig')


select  ShipCity 
	  , * 
from orders
	where
		ShipCity in ('Berlin' ,'London') --37
		and
		Freight < 10


--sucht alle Bestellungen deren Frachtkosten zwischen 10 und 50 liegen
--??

select * from orders
where Freight > 10 and Freight < 50


select * from orders
where Freight >= 10 and Freight <= 50

--kürzer mit between
--where sp between 10 and 50 

select * from orders
where Freight between 10 and 50




	 

























































