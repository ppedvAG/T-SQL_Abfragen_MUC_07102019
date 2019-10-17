--
/*
SELECT 
		DISTINCT filtert doppelte Ergebniszeilen
		TOP n [percent] with ties (...guggste order by)
		F() as ALIAS
		'TXT', Zahl,
		* --alle Spalten der Tabellen aus dem FROM
		Spalten
		Mathe
		AGG: SUM(SPX), MIN(), MAX(), COUNT(*), AVG()
		(select ..) --darf aber nur einen Wert zurückgeben
FROM
		tab1 t1 inner|right|left join tab2 t2 on t1.sp1=t2.sp2
				inner|right|left join tab3 t3 on t3.sp1=t2.sp4
				inner|right|left join (select...) T --muss Namen haben, damit Joins gemacht werden können..
				inner|right|left join VIEW1 on....
WHERE
		sp < < >= <= in between like  not in not between not like = != <>
			in:			where sp in (w1, w2, w3, w4..)
			between:    where sp between w1 and w2   .. sp>= and sp <=

		bei like wildcards: 
			%: beliebig viele Zeichen
			_: genau ein unbekanntes Zeichen
			[]: ein Zeichen genau, aber kann aber Werte darin definieren  zB [%]  [A-D]  [4-6|d-f]
			Sonderfälle : '' für Suche nach '
					like '_c%[3-7|a-c][FKM]_y'
		vergleich mit SUBQueries (select ..) --darf nur eine Spalte rauskommen, bei IN auch mehrere Zeilen
GROUP BY 
	:alle Spalten des SELECT , nur die AGG nicht.. und kein Alias
	HAVING AGG()
	[with CUBE|ROLLUP]
[UNION|INTERSECT|EXCEPT]..SELECT....
ORDER BY 
	SP1 asc, sp2 desc, n
*/


--Um wieviel Euro weicht der höchste Rechnungsbetrag von Davolio vom durchschn. Rechnugsbetrag aller ab
--top .. join AGG group by where 


--Welche Tabellen: Employees (lastname, employeeid), Orders (employeeid, orderid),Order details (orderid,Unitprice,Quantity)

--zuerst : alle RngsBeträge aller Bestellungen mit Orderid und Employeeid

--Liste aller bestellungen mit Employeeid , Orderid und Rngsbetrag


--durchschnt. RngBetrag
select
		avg(od.unitprice* od.quantity) as RngSumme
from orders o inner join [Order Details] od on od.OrderID=o.OrderID
			  inner join Employees e on e.EmployeeID=o.EmployeeID


select top 1 o.orderid, e.LastName, --.employeeid, 
	   sum(od.unitprice* od.quantity)  -
			(select
					avg(od.unitprice* od.quantity) as RngSumme
						from orders o inner join [Order Details] od on od.OrderID=o.OrderID
					inner join Employees e on e.EmployeeID=o.EmployeeID) as RngSumme
from orders o inner join [Order Details] od on od.OrderID=o.OrderID
			  inner join Employees e on e.EmployeeID=o.EmployeeID
where e.lastname = 'davolio'
group by  o.orderid, e.LastName
order by RngSumme desc



select orderid,LastName,  sum(possumme) from vKundeUmsatzDetails
 where lastname = 'davolio'
 group by orderid,LastName

 ...

 .--evtl über mehrere temp Tabellen...


 --mit Var

 declare @schnittRngSumme money

select @schnittRngSumme= avg(od.unitprice* od.quantity) 
from orders o inner join [Order Details] od on od.OrderID=o.OrderID
			  inner join Employees e on e.EmployeeID=o.EmployeeID


select top 1 o.orderid, e.LastName, --.employeeid, 
	   sum(od.unitprice* od.quantity)  -
			@schnittRngSumme as RngSumme
from orders o inner join [Order Details] od on od.OrderID=o.OrderID
			  inner join Employees e on e.EmployeeID=o.EmployeeID
where e.lastname = 'davolio'
group by  o.orderid, e.LastName
order by RngSumme desc












