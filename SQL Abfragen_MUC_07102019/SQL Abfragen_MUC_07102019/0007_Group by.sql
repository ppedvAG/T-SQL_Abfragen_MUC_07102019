--Group by ..having

--AGG: MIN() MAX() SUM() AVG() COUNT()..count(*)

select orderid, freight from orders

select 
		  MIN(freight) as MinFracht
		, MAX(freight) as MaxFracht
		, SUM(freight) as SummeFracht
		, AVG(freight)  as Schnittfracht
from orders


--was aber wenn wir AGG pro .. haben wollen
--zB Fractkosten Minimum pro Angstellter

select employeeid, min(freight) from orders

select sp1, sp2, AGG(spalte)
from tab
where spx > wert
group by sp1, sp2--alles aus dem Select hier rein, agg rauswerfen und Aliase antfernen

select employeeid, MIN(freight) from orders
group by employeeid


--Frage.. wieviele Kunden gibts in einem best Land / bzw Stadt

--Ausgabe Land, Stadt , Anzahl


select country, City, COUNT(*) from customers
group by  country, City
order by Country, city


select * from orders


--welcher Angstellte hat die höchsten Frachtkosten?
select top 1  employeeid, MAX(freight) as maxFracht from orders
group by employeeid
order by maxFracht desc

--Nenne die RngSumme pro BestellNr
select * from [Order Details]

select orderid, UnitPrice*quantity from [Order Details]


-- 1.  Welcher Kunde hatte wieviel Umsatz gemacht..
-- 2.  aber nur die Kunden aus UK
-- 3.  aber auch nur die, die wo mehr als 5000 Umsatz machten


--Tabellen: Customers(Companyname), unitprice, quantity (order details), orders

select companyname, SUM(unitprice* quantity) as Umsatz
	from 
			customers c inner join orders o				on o.customerid = c.customerid
						inner join [Order Details] od	on od.OrderID	= o.orderid
where c.Country = 'UK'-- and Umsatz > 5000
group by CompanyName having  SUM(unitprice* quantity) > 5000 --im having nur Filter auf AGG !!
order by Umsatz desc

--Superaggregate

select country, city, COUNT(*) from customers
group by Country, city
with rollup --hierarchisch



select country, city, COUNT(*) from customers
group by Country , city
with cube --jede Möglichkeit











