--CASE

select country,
		CASE
			WHEN Country IN ('Germany' , 'Italy' , 'Spain') then 'EU'
			WHEN Country = 'USA' then 'Trumpdeppen'
			ELSE 'ka'
		END as EUorNOTEU
from customers


--ahhhhhh ABC Anlayse
--ABC mit CASE: < 100 = A
--              > 500 = C
--der rest		      = B

--mit UNION
select orderid, freight, 'A' from Orders where Freight < 100
UNION ALL
select orderid, freight, 'B' from Orders where Freight between 100 and 500
UNION ALL
select orderid, freight, 'C' from Orders where freight > 500

--mit CASE..gibts ein Treffer, dann wird keine weitere bedingung geprüft
select orderid, freight, 
		CASE 
			when freight < 100 then 'A'
			when freight > 500 then 'C'
			else 'B'
		End 
from orders