--CREATE

-- CREATE   ALTER    DROP 


--Datenbank

create database testdb;
GO

use testdb;
GO

create table Kunden
	(
	KdNr		int identity(1,1) primary key,--zählt um 1 nach oben beginnt bei 1 tinyint(256), smallint (32000)
	Famname		nvarchar(50) not null,
	Vorname		nvarchar(50) null,
	Gebdat		date not null, --datetime(ms)  --smalldatetime (sek) datetime2(ns)  time  datetimeoffset,
	Bild		image --image text ntext depricated besser varbinary(max)
	)

ALTER Table Kunden add religion bit null

	--TEXT"
	--varchar(n), char(n), nchar(n), nvarchar(n)
	--otto
	--char(50):  'otto  
	--'  50
	--decimal(18,0)  decimal (10,2) --Anzahl der Stellen und Anzahl der davon enh Nachkommastellen
	--money  float vele nachkommastellen
	--xml
	--geography 

select * from kunden
	--varchar(50): 'Otto'  4
	--nvarchar(50):'otto' 4*2  8
	--nchar(50): 'otto                    '  50*2
	--nvarchar(max): 2 GB

drop table kunden


use master;
GO
--DB kann nur gelöscht werden, wenn keiner mehr drauf ist
drop database testdb;
GO

select * from sysprocesses where spid > 50 and dbid = DB_ID('northwind')
kill 56

select DB_ID(), DB_ID('northwind')
