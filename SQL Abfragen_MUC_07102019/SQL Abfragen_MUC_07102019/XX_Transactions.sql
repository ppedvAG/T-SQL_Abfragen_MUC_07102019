--Wie kann ich mich vor versehentlichen Fehlern sch�tzen
--Achtung: Solange TX l�uft werden evtl andere User beim ZUgriff auf Daten gesperrt.


begin tran

update o1 set freight = 10

select * from o1

rollback --r�ckg�ngig

commit --fixieren

--eine TX kann viele Anweisungen enthalten. Wird sie aber r�ckg�ngig gemacht,
--dann werden alle! �nderungen r�ckg�ngig gemacht.

