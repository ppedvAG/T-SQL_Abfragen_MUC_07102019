--Variable

/*
lokale Variable
 kann nur der Ersteller darauf zugreifen
 Var lebt nur während eines Batches--> GO
--nach jedem GO ist die Variable weg
--nach der Ausführung des Codes existiiert die Var auch nicht mehr
@var

globale
--auch für andere existent
-- eigtl nur für Systeminfos
@@var
*/



declare @var1 int
set @var1 = 10
select @var1

select * from orders where Freight < @var1

declare @var2 int = 100
select @var2


declare @var3 money
select  @var3=freight from orders where OrderID = 10248
select  @var3

select @var3=freight from orders-- where OrderID = 10248 --aufapssen!
select @var3

select @var3=freight, freight from orders where OrderID = 10248 --error--entweder nur einer VAR Wert zuweisen oder ausgeben

