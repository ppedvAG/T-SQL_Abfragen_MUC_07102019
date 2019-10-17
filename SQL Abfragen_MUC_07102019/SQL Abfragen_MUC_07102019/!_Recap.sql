/*
SELECT 
		DISTINCT filtert doppelte Ergebniszeilen
		TOP n [percent] with ties (...guggste order by)
		F() as ALIAS
		'TXT', Zahl,
		* --alle Spalten der Tabellen aus dem FROM
		Spalten
		Mathe
FROM
		tab1 t1 inner|right|left join tab2 t2 on t1.sp1=t2.sp2
				inner|right|left join tab3 t3 on t3.sp1=t2.sp4


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
ORDER BY 
	SP1 asc, sp2 desc, n


*/


use Northwind;
GO

--wieviele verschiedene Länder gibt es in orders?
select distinct shipcountry, orderid from orders


--welche Firma hatte die geringsten Frachtkosten (companyname, orderid, freight)
select top 1 c.CompanyName, o.OrderID, o.Freight
from Customers c inner join orders o on c.CustomerID=o.CustomerID
order by freight


--Welche Produkte verkaufte der Angestellte "King"

Select distinct p.productname from Employees e 
							  inner join orders o				on e.EmployeeID   =  o.EmployeeID
							  inner join [Order Details] od	on od.OrderID     =  o.OrderID
							  inner join products p			on p.ProductID    =  od.ProductID
				where 
					LastName = 'King'



--man muss nicht immer mit der ID joinen
select * from Employees
--wir suchen alle Angstellten und deren Stellvertreter (gleiche Stadt)

Ang    Ort       OrtStv   Stv
Davolio Seattle  Seattle Callahan


select e1.LastName, e1.City, e2.City, e2.LastName from employees e1 inner join Employees e2 on e1.city = e2.city
where e1.LastName != e2.lastname
order by e1.city




















