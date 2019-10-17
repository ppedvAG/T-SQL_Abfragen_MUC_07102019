--WHILE

--Schleifchen

WHILE (1=1)
	BEGIN
		select 10
	END


declare @i as int = 1

while @i< 10
	begin
		select @i
		set @i=@i+1  ---set @i+=1
	end


--continue
--break: unterbricht die Schliefe sofort

declare @i as int = 1

while @i< 10
	begin
		select @i
		If @i = 4 continue
		IF @i = 5 break
		set @i=@i+1  ---set @i+=1
	end


while Bedingung1 and Bedingung2...



--select avg(freight) from o1 --

--wir erhöhen die Frachtkosten um 10% bis wir 100 errreicht haben, aber nicht überschreiten

begin tran

while (select AVG(freight) from o1) <= 100
	begin
		update o1 set Freight=Freight * 1.1
		IF (select AVG(freight) from o1)  >100 
			begin
				update o1 set Freight=Freight / 1.1
				break
			end
	end

select AVG(freight) from o1
rollback

--wir wollen die Frachtkosten solange erhöhen bis 100 max im Schnitt erreicht wurden
--aber auch : eine einz. Frachtposition darf nicht übe 1400

--beide Bedingungen müssen erfüllt sein
select AVG(freight) from o1 --max 130
select max(freight) from o1 --max 1400


begin tran
while (select AVG(freight)*1.1 from o1) <= 130
	 AND      		
	 (select MAX(freight)*1.1 from o1) <= 1400	
	begin
		update o1 set Freight=Freight * 1.1
	
	end

select max(freight) from o1
select AVG(freight) from o1
rollback




