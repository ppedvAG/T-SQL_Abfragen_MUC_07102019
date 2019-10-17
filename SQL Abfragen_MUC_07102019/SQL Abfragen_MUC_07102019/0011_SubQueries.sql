--Unterabfragen


/*
select einWert, ... from tabellenartiges
where sp > einwert


*/

select 100
--im Select eine SUbselect darf nur einen Wert zurückgeben

select orderid, (select 'A') from orders

select orderid, freight - (select AVG(freight) from Orders) from orders


--im From muss die Unterabfrage beannt werden
select * from (select * from orders where Freight < 10) t inner join [order details] od on od.orderid = t.OrderID


select * from orders where Freight < (select COUNT(*) from Customers where Country = 'UK')



--Wir brauchen eine Liste der Customerids und freight
--einmal den Kunden mit geringsten Frachtkosten und einmal den mit den höchsten Frachtkosten


--1: 2 Abfragen mit union  Problem mit top ..der order by

select top 1 customerid, freight from orders order by Freight asc
UNION
select top 1 customerid, freight from orders order by Freight desc

--2: mit temporären Tabellen

select top 1 customerid, freight into #t1 from orders order by Freight asc

select top 1 customerid, freight into #t2 from orders order by Freight desc


select * from #t1
union all
select * from #t2


--3 Unterabfragen..aber evtl problem.. wenn max oder min im where mehreere Ergebniszeilen liefern
--Var1:
select customerid, freight from orders where Freight = (select MIN(freight) from Orders)
UNION ALL
select customerid, freight from orders where Freight = (select MAX(freight) from Orders)

--Var2:
select * from	(select top 1 customerid, freight from orders order by Freight asc) t1
union
select * from   (select top 1 customerid, freight from orders order by Freight desc)  t2




--where

select * from orders where ShipCountry IN (select country from Customers)




drop table #t1

select top 1 customerid, freight into #t1 from orders order by Freight asc

insert into #t1
select top 1 customerid, freight from orders order by Freight desc



select * from #t1





