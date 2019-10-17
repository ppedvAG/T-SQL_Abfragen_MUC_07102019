--INS UP DEL

/*




*/


--Daten in einen nicht existente Tabelle

select .... into tabelle ...

select customerid, country, city into KundenmitA from Customers where CompanyName like '%A%'

select * from KundenmitA

-auch das geht. Spalten m�ssen benannt werden
--allerdings musss der SQL Server den Datentyp nun sch�tzen
select 'abcde' as SPX into TabXY

select CONVERT(varchar(50), 'abcdef') into tabxx



--Datensatz manuell einf�gen
--Spalten k�nnen durcheinander angegebn werden.. Werte m�ssen aber selbe Reihenfolge haben
insert into tab1 (sp1, sp3, sp5, sp2) 
values           (W1, W3, W5, S2)

--Wenn wir aber alle Werte angeben, dann ..
insert into tabelle 
values (werte)

--aber ID Werte , die mit identity von SQL Server gepfelgt werden kann man ignorieren

insert into tabelle
select Wert , Wert , Wert

select * from kunden


--Demos
--einen DS einf�gen
insert into Kunden (customerid, country, companyname)
values
				  ('pped2', 'Austria', 'ppedv GmbH')
--mehrere
insert into Kunden (customerid, country, companyname)
values
				  ('pped3', 'Austria', 'ppedv GmbH'),
				  ('pped4', 'Swiss', 'ppedv GmbH'),
				  ('pped5', 'UK', 'ppedv GmbH')

--select * from kunden
insert into Kunden 
select 'pped6', 'ppedv Gmbh CoKG', 'USA', 'New York'

--von einer bestehenden Tabelle DS in andere Tabelle schreiben
insert into kunden
select * from kundenEU where customerid = 'pped1'



--Update

update tabelle set sp = wert
	where id = 10



update tabelle set sp = wert, sp2 = wert
	where id = 10

--Kopie der orders
select * into o1 from orders

update o1 set Freight = 10 where OrderID = 10248

select * from o1

--Aufgabe: erh�he die Frachtkosten in �sterreich um 21 %

update o1 set Freight = Freight *1.21
	where ShipCountry = 'Austria'


--komplexer ...:-)
--wir wollen die Frachtkosten um 10 % erh�hen, aber nur bei den Bestellungen in o1
--die vom Angestellten King bearbeitet wurden


--welche Datens�tze sin denn eigtl betroffen

select * from 
	o1 inner join Employees e on e.EmployeeID = o1.EmployeeID 
where LastName = 'king'

--zuerst: bringe das from in die n�chste zeile
select * 
from 
	o1 inner join Employees e on e.EmployeeID = o1.EmployeeID 
where LastName = 'king'

--dann: schreib mal den update dar�ber
update o1 set Freight = Freight *1.1
select * 
from 
	o1 inner join Employees e on e.EmployeeID = o1.EmployeeID 
where LastName = 'king'


--jetzt: kommentiere den select aus

update o1 set Freight = Freight *1.1
--select * 
from 
	o1 inner join Employees e on e.EmployeeID = o1.EmployeeID 
where LastName = 'king'

---

select * into od1 from [Order Details]

select * from od1

select * from o1


--erh�he die Menge des Produkts 11 der Bestellung von vinet vom  1996-07-04 00:00:00.000
--auf 20 Einheiten

set dateformat dmy

update od1 set Quantity = 20
--select od1.* 
from o1 inner join od1 on o1.OrderID = od1.OrderID
where 
	o1.CustomerID = 'Vinet' and OrderDate = '4.7.1996'
	and 
	od1.productid = 11


--DS l�schen

delete from tabelle 

delete from tabelle where ...

delete tabelle where

select * from o1

delete from o1 where OrderID = 10249 

--L�sche den DS mit der Orderid 10250

--alle o1 Datens�tze l�schen, die das Produkt nummer 11 drin hatten


--zuerst die Abfrage!
delete from o1
--select * 
from o1 
				inner join od1 on o1.OrderID = od1.OrderID 
		 where ProductID = 11


select * from o1

--l�sche das Land von dieser ersten Zeile (10250)


update o1 set ShipCountry = NULL where OrderID = 10250













































select * from tabxy