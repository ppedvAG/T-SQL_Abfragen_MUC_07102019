--UNION

--fasst zwei oder mehrere Ergebnissse zu einem zusammen
--Regeln dazu: Anzahl der Spalten müssen in allen Abfragen gleich viele sein und die Daten
--müssen kompatibel sein



select '100'
UNION
select 'B'


--die Spaltennamen werden aus der ersten Abfrage generiert
select '100' as SP1
UNION
select 'B' as Sp2


select 'A'
UNION 
select 'C'


--macht distinct,
select 'A'
UNION 
select 'A'

--wenn ich aber das nicht will!
select 'A'
UNION ALL
select 'A'


select customerid, companyname, country, city 
into KundenEU
from Customers where Country in ('UK', 'Germany', 'Italy', 'Austria')



select customerid, companyname, country, city 
into Kunden
from Customers 



select * from KundenEU
UNION
select * from Kunden

---neuer Kunde in Kunden
insert into kunden (CustomerID, CompanyName, Country, City)
values
					('ppedv', 'ppedv AG', 'Germany', 'München')

--neuer Kunde in KundeEU
insert into kundenEU (CustomerID, CompanyName, Country, City)
values
					('pped1', 'ppedv AG', 'Germany', 'München')


--Kunden ändern in Kunden
update Kunden set City = 'München' where CustomerID = 'ALFKI'
--Kunden ändern in KundenEU
update KundenEU set City = 'Augsburg' where CustomerID = 'ALFKI'


--welcher Kunden sind in Kunden und!  (gemeinsame Datensätze)

select * from kunden
intersect
select * from kundenEU


--der intersect untersucht die Ergebnismengen 

select country, city from kunden
intersect
select country,city from kundenEU



--UND DIE UNTERSCHIEDE


select * from kunden
EXCEPT
select * from kundenEU



select * from kundenEU --Referenzmenge
EXCEPT
select * from kunden


---Bestellungen: ABC Analyse
-- unter 100 : A
--über	500 C
--dazwischen sind es B 
select * from orders

--Ausgabe: BestNr, freight, A|B|C

--3 Abfragen, und diese mit UNION kombinieren


select orderid, freight, 'A' from Orders where Freight < 100
UNION ALL
select orderid, freight, 'B' from Orders where Freight between 100 and 500
UNION ALL
select orderid, freight, 'C' from Orders where freight > 500


--Idee.. was wäre , wenn wir 2 Ergebnisse zusammenfügen wollen (UNION)
-- SP1  SP2  SP3, NULL
UNION
-- SPA  SPB  SPC   SPD




