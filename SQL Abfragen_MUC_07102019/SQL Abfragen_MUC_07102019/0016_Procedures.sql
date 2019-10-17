--Prozeduren, gespeicherte Prozeduren stored procedures

/*
wie Windows Batchdateien

Proz werden ausgeführt

proz können eine oder viele veschied. Anweisungen enthalten

proz können Parameter haben


*/

exec procname 'Peter'

create procedure procname
as
select 100

exec procname

alter proc procname
AS
SELECT *  FROM orders

exec procname

alter proc procname @par1 money
as
select * from orders where Freight < @par1

exec procname 5

--Prozedure: Liste mit Firmenname und Famname des Ang
			--einer bstimmten Stadt

exec gpSocnetStadt 'Berlin'

create proc gpSocnetStadt @stadt varchar(50)
as
select companyname , city, 'K' from customers where city = @stadt
UNION
select lastname , city,'A'	  from Employees where city = @stadt


exec gpSocnetStadt 'London'


--Vorsicht;-)

create proc gptest
as
select 10;
GO --ohne GO.. 32 mal aufruf von 10

exec gptest 


drop proc gptest



--o1, od1, k1
select * into k1 from customers

begin tran



rollback

--Ziel:  Kunden löschen
--zuerst alle Pos aus order details, dann aus orders 
delete from Customers where CustomerID = 'FISSA'


exec gpDelkunde 'ALFKI'

--zuerst die Positionen in od1  des ALKFI löschen
--dann die Best in o1
--dann den Alfki in k1

--dann Proc bauen mit parameter

select * from od1 
	where orderid in (select orderid from o1 where CustomerID = 'ALFKI')

select * from o1 where CustomerID = 'ALFKI'

select * from k1 where CustomerID = 'ALFKI'


--jetzt den delete basteln
delete
--select * 
from od1 
	where orderid in (select orderid from o1 where CustomerID = 'ALFKI')

delete
--select * 
from o1 where CustomerID = 'ALFKI'

delete
--select * 
from k1 where CustomerID = 'ALFKI'



--dann die Proc


create proc gpKundeDel @Kunde char(5)
as
select * from od1 
	where orderid in (select orderid from o1 where CustomerID = @Kunde)
select * from o1 where CustomerID = @Kunde
select * from k1 where CustomerID = @Kunde

delete from od1 
	where orderid in (select orderid from o1 where CustomerID = @Kunde)

delete from o1 where CustomerID = @Kunde

delete from k1 where CustomerID = @Kunde

select * from od1 
	where orderid in (select orderid from o1 where CustomerID = @Kunde)
select * from o1 where CustomerID = @Kunde
select * from k1 where CustomerID = @Kunde

begin tran
exec gpKundeDel 'ALFKI'
rollback




set statistics time on



create proc gpname @par1 int
as
... @par1



create proc gpname @land varchar(50), @Fracht money
as
...



--Proc mit Defaultwert
create proc gptest1 @par1 int, @par2 int
as
select @par1*@par2



exec gptest1 10, 20
exec gptest1 20

exec gptest1 @par1=10 , @par2=30
exec gptest1 @par2=60, @par1=NULL

alter proc gptest1 @par1 int=0, @par2 int --mit defaultwert
as
select @par1*@par2;
GO

exec gptest1 @par2=5
exec gptest1 100,40

--Ausgabe der BesteNr und den Bruttofrachtkosten 
--wenn man nix angibt dann dt MwST sonst die ang Mwst

select orderid, freight*1.21 from orders


alter proc gpBestllinklMwSt @MwSt decimal(3,2)=1.19
as
select orderid, freight, freight * @MwSt as Brutto, 'wurde mit: ' + CONVERT(varchar(50), @mwst) + ' gerechnet' from orders;
GO

exec gpBestllinklMwSt 1.21


select * from employees




--Ausgabe
--Lastname Jahrebisrente

--zuerst Wie lat ist jemand

create proc gpJahrebisRenterechner @Rentenalter int
as
select lastname, birthdate, @Rentenalter - DATEDIFF(yy,birthdate, getdate()) from employees

exec gpJahrebisRenterechner 67


--Prozeduren mit Ausgabewert

--proz par1(100) ---  42!
--select * from where sp = 42


create proc gptest2 @par1 int,@par2 int, @par3 int output --ist immer noch auch input
as
select @par3=@par1+@par2
select @par3

declare @ergebnis as int  --------------------------->
exec gptest2 @par1=10,@par2=20, @par3=@ergebnis output

select @ergebnis


--Wie hoch sind die durschn. Frachtkosten eines best Landes
--14

select * from orders whre freight < 14


create proc gpSchnittFrachtLand @land varchar(50), @schnitt as money output
as
select @schnitt=AVG(freight) from orders where ShipCountry = @land;
GO

declare @ergebnis as money
exec gpSchnittFrachtLand 'UK' , @schnitt = @ergebnis output

select @ergebnis,* from orders where Freight < @ergebnis

















--A SELECT  
--B VIEW  
--C PROC
--D F()

--C B|A                       D
















