--Wie kann ich mich vor versehentlichen Fehlern schützen
--Achtung: Solange TX läuft werden evtl andere User beim ZUgriff auf Daten gesperrt.


begin tran

update o1 set freight = 10

select * from o1

rollback --rückgängig

commit --fixieren

--eine TX kann viele Anweisungen enthalten. Wird sie aber rückgängig gemacht,
--dann werden alle! Änderungen rückgängig gemacht.

