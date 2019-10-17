--IF
--wenn..dann


IF 1=1 select 'A'
IF 1=0 select 'A'

IF 1=1 
	SELECT 'A' 
ELSE 
	SELECT 'B'


IF 1=1
	select 'A'
ELSE
	select 'B'
	select 'C' --gehört nicht zum IF



IF Bed	
	BEGIN
		CODE
	END
ELSE
	BEGIN
		CODE
	END

IF 1=0
	BEGIN
		SELECT 'A' 
		select 'D'
	END
ELSE 
	BEGIN
		SELECT 'B'
		select 'E'
	END

IF 1=1 or 2=2

IF (select COUNT(*) from Customers) > 90

IF (select COUNT(*) from Orders) > 10 and (select SUM(freight) from Orders) < 1000


select AVG(freight) from o1
--78
--wenn die Frachtkosten unter 80, dann müssen die Frachtkosten um 10 % erhöht werden
--falls sie darüber liegen senken um 5%


IF (select AVG(freight) from o1) < 80
	BEGIN
		update o1 set Freight = freight *1.1
		
	END
ELSE
	BEGIN
		update o1 set Freight = freight / 1.05
	END

	select AVG(freight) from o1


	






