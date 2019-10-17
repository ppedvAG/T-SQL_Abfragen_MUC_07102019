--Datumsfunktionen

--DB angeben
use Northwind

--aktuelles Datum und Zeit

select GETDATE() --auf ms

--zu einem Datum etwas dazurechnen
select DATEADD(dd,14,'7.10.2019')

--welches Datum haben wir in 500 Stunden?
select DATEADD(hh, 500, '7.10.2019')


--welches Datum hatte wir vor 100 Monaten?
--minus ist erlaubt ;-)
select DATEADD(mm,-100, '7.10.2019')



--Intervalle
/* 
ss Sekunden
hh Stunden 
min
mm
yy
dd
qq  Quartal
*/


select DATEDIFF(dd,'1.1.2019', '10.1.2019') -- +

select DATEDIFF(dd,'10.1.2019', '1.1.2019') -- -

select DATEDIFF(yy, '7.21.1969', getdate()) --Mondfahrt


--Teil eines Datums
select DATEPART(yy, Getdate())
select DATEPART(qq, Getdate())
select DATEPART(ww, Getdate())

select YEAR(getdate()), MONTH(getdate()), DAY(GETDATE())


--Bezeichnung für einen Teil des Datums ausgeben
select datename(DD, GETDATE()) --7 ???  

select DATENAME(dw,getdate()) --day of week -- Montag


select EOMONTH(getDATE()) --der letzte des Monats


---Zeichenkette--

select 'A'

select 'A' + 'B'

select 'A' +10--Fehler

select 'A' + '10'

--  'abcdefgh'

select LEFT('abcdefgh',2) --von links die ersten 2 Zeichen

select RIGHT('abcdefgh',2) --von rechts die ersten 2 Zeichen

select SUBSTRING('abcdefgh',2,3) --bcd  ..von einer best. Position für einen best. Länge

select SUBSTRING('abcdefgh',1,3)  --ist doch ein LEFT ;-)

select STUFF('abcdefgh',2,3,'X') --einen bestimmten Teil inder ZK ersetzen
select STUFF('abcdefgh',2,3,'XXXXXXXX') --einen bestimmten Teil inder ZK ersetzen

select REVERSE('ein Neger mit Gazelle zagt im Regen nie') --ZK wird umgdreht


-- 089-123456789
-- 089-23884-234423423XXX


select '089-123456789'

'089-123456789'

select LEFT('089-123456789',7) +'XXX'
select STUFF('089-123456789',7,3,'xxx')

select DATALENGTH('089-123456789')
select LEN('089-123456789')

'abcd    '  --char(50)..immer 50 Zeichen lang
--len misst ohne leerzeichen
--datalenght misst die tats. Länge


select LEN('abcd   ') --4 
select DATALENGTH('abcd   ') --7


select LEFT('089-123456789',datalength('089-123456789')-3) + 'XXX'

select STUFF('089-123456789',datalength('089-123456789')-2,3, 'XXX')

select reverse(stuff(REVERSE('089-123456789'),1,3,'XXX'))

select UPPER('abc'), LOWER('ABC')

select RTRIM('abcd   ') --Leerzeichen am Ende werden eleminiert



















































































