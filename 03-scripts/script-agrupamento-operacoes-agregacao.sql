/*
 * Consulta SQL Avançado
 * Prof. Gustavo Dias
 * 2026-08-17
 * Agregação, Operações e Agrupamento
 */

create table vendas(
  nf int not null primary key, 
  cod_produto int,
  nome_produto varchar(50),
  qtd_vendida int,
  vlr_desconto numeric(12,2),
  vlr_total numeric(12,2)
)

insert into vendas 
  values (1,101,'camisa',2,40,260),
         (2,102,'calça',3,90,699),
         (3,103,'jaqueta',1,40,499),
         (4,104,'sapato',1,30,389)

-- Função MAX
-- Retorna o maior valor numérico em uma coluna         

select max(vlr_total) as "Maior Valor de Venda"
from vendas

select max(qtd_vendida) as "Maior Quantidade Vendida"
from vendas 

select max(vlr_desconto) as "Maior Valor de Desconto"
from vendas 

-- Função MIN
-- Retorna o menor valor numérico em uma coluna

select min(vlr_total) as "Menor valor de venda"
from vendas  

select min(qtd_vendida) as "Menor quantidade vendida"
from vendas 

select min(vlr_desconto) as "Menor valor de desconto"
from vendas 

-- Função SUM
-- Retorna o somatório dos valores de uma coluna 

select sum(vlr_total) as "Valor total das vendas"
from vendas 

select sum(qtd_vendida) as "Quantidade total vendida"
from vendas 

select sum(vlr_desconto) as "Valor total dos descontos"
from vendas 

-- Função AVG 
-- Retorna o cálculo da média dos valores de uma coluna

select avg(vlr_total) as "Valor médio da venda"
from vendas 

select avg(qtd_vendida) as "Quantidade média vendida"
from vendas 

select avg(vlr_desconto) as "Valor médio dos descontos"
from vendas 

-- Função COUNT
-- Retorna a contagem de linhas não nulas 

insert into vendas 
  values (5,null,'camisa',2,40,260)

select count(*) "Contagem de linhas"
from vendas 

select count(cod_produto) "Contagem de linhas"
from vendas

select * from vendas 
         
-- Operações
-- Cálculos matemáticos simples ou complexos
-- Usa-se () para definir prioridades

select nome_produto, 
  (vlr_total / qtd_vendida) as "Valor Unitário"
from vendas 

select (sum(vlr_total) / sum(qtd_vendida)) as "VAlor Médio"
from vendas 

+ - / *

-- Agrupamento GROUP BY
-- Agrupa valores agregados extratificando os dados

select nome_produto, 
  sum(vlr_total) as "Valor total por produto",
  sum(qtd_vendida) as "Quantidade total por produto",
  sum(vlr_desconto) as "Valor total de descontos"
from vendas 
group by 1 


         
         
         
         
         
         
         
         
         
         
         
         
         