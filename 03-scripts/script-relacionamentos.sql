/*
 * Consulta SQL Avançado
 * Prof. Gustavo Dias
 * 2026-08-31
 * Relacionamentos
 */


create table produto(
  cod int primary key,
  nome varchar(50),
  qtde int,
  cod_categoria int,
  vlr_unitario numeric(12,2)
);

create table categoria(
  cod int primary key,
  nome varchar(20)
);

insert into categoria 
  values (1, 'Mercearia'),
         (2, 'Bebidas'),
         (4, 'Açougue');

alter table produto 
  add constraint fk_categoria
  foreign key(cod_categoria)
  references categoria(cod)
  on delete cascade 
  on update cascade 
  
alter table produto drop constraint fk_categoria   
  
insert into produto 
  values (1, 'Arroz tipo 1 5kg', 150,1,22.50),
         (2, 'Feijão carioca 2kg', 120,1,6.50),
         (3, 'Sabão em pó Omo 1kg', 110,3,19.50),
         (4, 'Pepsi Black 2l', 340,2,5.99);


-- iNNER JOIN

select * from produto 

select * from categoria 

select p.nome as produto, 
  c.nome as categoria 
from produto as p 
-- considera registros que existem em ambas as tabelas
inner join categoria as c
-- chave do relacionamento (pk e fk, normalmente)
  on p.cod_categoria = c.cod
  
-- LEFT JOIN

select p.nome as produto, 
  c.nome as categoria 
from produto as p 
-- considera registros que existem em ambas as tabelas 
-- e na tabela a esquerda do relacionamento
left join categoria as c
-- chave do relacionamento (pk e fk, normalmente)
  on p.cod_categoria = c.cod
  
-- RIGHT JOIN

select p.nome as produto, 
  c.nome as categoria 
from produto as p 
-- considera registros que existem em ambas as tabelas 
-- e na tabela a direita do relacionamento
right join categoria as c
-- chave do relacionamento (pk e fk, normalmente)
  on p.cod_categoria = c.cod  
  
-- Juntando agregação, agrupamento e relacionamento  
  
select c.nome as categoria, 
  count(p.cod)
from produto p 
inner join categoria c  
  on p.cod_categoria = c.cod 
group by 1
order by 1
  
  

