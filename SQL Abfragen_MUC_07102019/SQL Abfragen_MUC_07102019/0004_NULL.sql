--NULL Werte

--
select 1+0
select 'A' + 0 
select '', 0, NULL

--jeder mathema. Verlgiech oder Operation mit NULL führt zu NULL

select 10 + NULL

select shippeddate from orders where shippeddate >= 0 or shippeddate is null

select * from orders where ShippedDate is NULL
