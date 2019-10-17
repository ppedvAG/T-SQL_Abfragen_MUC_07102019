--benutzerdefinierte Funktionen
--Skalarwertfunktionen

/*
sind eigtl!!!! saucool

select f(sp), f(wert) from f(Wert) where sp > f(wert) or f(sp) < wert

sind aber in fast allen Fällen arschlangsam

select * from kunden where famname like 'M%'

select * from kunden where left(famname,1) ='M'

*/

create function fdemo1 (@par1 int)
returns int
as
Begin
	return (select @par1 +10)
end

select dbo.fdemo1(5)

--MwSt 1.19
--fbrutto(100) --> 119


create function fbrutto (@netto money)
returns money
as
	begin
		return (select @netto * 1.19)
	end

select dbo.fbrutto (100)

select freight, dbo.fbrutto(freight) from orders
 where dbo.fbrutto(Freight) > 500
 


 --fRngSumme(BestNr) --> RngSumme

 create function fRngSumme(@BestNr int)
 returns money
 as
 begin 
	return (select SUM(unitprice*quantity) from [order details] where orderid = @bestnr)
 end


 select dbo.fRngsumme(10248) --;-)


 select dbo.frngsumme(OrderID), * from orders
 where dbo.fRngSumme(OrderID) > 1000



 alter table orders add RngSumme as dbo.fRngSumme(orderid)


 select * from orders where rngsumme < 500


 andreasr@ppedv.de




