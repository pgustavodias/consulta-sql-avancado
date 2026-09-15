/*
 * Consulta SQL Avançado
 * Prof. Gustavo Dias
 * 2026-09-14
 * Subqueries
 */

-- SUBQUERY

drop table if exists empresa;

create table if not exists empresa(id int, nome varchar(50));

insert into empresa values(1, 'Empresa 1');

-- - Como campo de uma consulta
select 
  c.nf, 
  c.id_produto, 
  (select nome from empresa) as empresa 
from compra c  
order by 1

-- - Como filtro de uma consulta

alter table compra add column id_empresa int;

update compra set id_empresa = 1 where id_produto < 3;
update compra set id_empresa = 2 where id_produto >= 3;

insert into empresa values(2, 'Empresa 2');


select c.id_produto 
from compra c
where c.id_empresa in (select id from empresa)


-- - Predicado de correlação

select c.id_produto,
  c.id_empresa,
  (select e.nome 
   from empresa e
   where e.id = c.id_empresa) as empresa 
from compra c


