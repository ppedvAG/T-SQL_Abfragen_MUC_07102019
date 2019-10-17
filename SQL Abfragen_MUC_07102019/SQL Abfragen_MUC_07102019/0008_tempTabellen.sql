--temporäre Tabellen


/*
sind reale tabellen, die aber irgendwann wieder verschwinden
die Daten in den temp Tabellen sind Kopien!
werden nicht automatisch aktualisiert

lokale temp Tabelle:	#tab1
auf lok. temp Tabellen kann nur der Ersteller in der der Session, in der die temp Tab erstellt wurde
zugreifen

select * into #tab1 from employees
select * from #tab1

Wann ist die weg?
wenn die Sitzung geschlossen wird oder die Tabelle gelöscht wird
drop table #tab1


select spalten into tab / #tab from tabellen


globale temp Tabelle:	##tab1
auf glob. temp tabellen können auch andere zugreifen

select * into #ang from employees
select * into ##ang from employees




*/




select companyname, SUM(unitprice* quantity) as Umsatz
into #KundeUmsatzUk
	from 
			customers c inner join orders o				on o.customerid = c.customerid
						inner join [Order Details] od	on od.OrderID	= o.orderid
where c.Country = 'UK'-- and Umsatz > 5000
group by CompanyName having  SUM(unitprice* quantity) > 5000 --im having nur Filter auf AGG !!
order by Umsatz desc


select * from #kundeumsatzuk

drop table #kundeumsatzuk