--LIKE

-- kann % 

-- 01?7 35473123

-- kann auch  _ steht f�r genau ein Zeichen

select * from  Customers 

--Suche nach Firmen, die wo als vorletzten Buchstaben ein t besitzen
--Companyname..

-- _ und % l��t sich mischen

select companyname from Customers where CompanyName like '%t_'

--   NAME DER FIRM?' --> ? = _

--es muss ein y vorkommen , muss mit L beginnen und der 3. letzte muss ein o sein

select companyname from Customers
where
	CompanyName like '%y%'
	and
	CompanyName like 'L%o__'

--alle Firmen, die wo mit A, B, C oder D beginnen
--und mit P, Q, R, S oder T enden


--Idee? 
--1 alle einzelen testen...dooof
--2 < E.. schon mal besser
--

--LIKE kann: [] steht f�r genau ein Zeichen
-- like '[ABCD]%'

select * from Customers where CompanyName like '[ABCD]%' order by 2 desc



select * from Customers 
	where 
		CompanyName like '[ABCD]%[PQRST]' order by 2 desc



--Matching patterns

select * from Customers 
	where 
		CompanyName like '[A-D]%[P-T]' order by 2 desc


select [Pos-Summe] from [order details]

--suche nach allen Kunden, die im Namen ein % haben

select * from Customers where CompanyName like '%[%]%'

--[] kann auch das..: [A-D|M-R|1-6]


--wie m�sste demnach eigtl eine PIN f�r ne Bank aussehen

--where PIN not like '[0-9][0-9][0-9][0-9]'

--suche alle Firmen, die ein ' im Namen haben


select * from Customers where CompanyName like '%[' --geht nicht

select * from Customers where CompanyName like '%''%'





















