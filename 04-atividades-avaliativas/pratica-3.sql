==================================================
- SISTEMAS DE INFORMAÇÃO P4                      -
- CONSULTA SQL AVANÇADO - PRÁTICA 3              -
- PROF. LUIZ GUSTAVO DIAS luizdias@univas.edu.br -
==================================================

-- ATIVIDADE PRÁTICA PARA APLICAR O CONHECIMENTO SOBRE SUBQUERIES
-- A ATIVIDADE É PARTE INTEGRANTE DO TRABALHO 1
-- PONTUAÇÃO DISTRIBUÍDA: 6 PTS
-- DEVERÁ SER REALIZADA EM GRUPOS COM 3 OU 4 INTEGRANTES 
-- PARA CADA QUESTÃO ABAIXO, ESTRUTURAR O SCRIPT SQL PARA ENCONTRAR A INFORMAÇÃO DESEJADA
-- AO TÉRMINO DA ATIVIDADE, ENCAMINHE O SCRIPT PARA O PROFESSOR POR E-MAIL
-- PRAZO PARA CONCLUSÃO 21/09 ÀS 22H
-- SERÁ CONSIDERADO 50% DA NOTA PARA A ATIVIDADE ENTREGUE APÓS ESSA DATA
-- SERÁ CONSIDERADA NOTA IGUAL A ZERO AS QUESTÕES RESOLVIDAS COM APOIO DE IA OU OUTROS MECANISMOS QUE REFLITAM A NÃO REPRODUÇÃO POR PARTE DO (A) ALUNO (A)

-- IDENTIFICAÇÃO:
-- - ALUNO (A) 1:
-- - ALUNO (A) 2:
-- - ALUNO (A) 3:
-- - ALUNO (A) 4:

-- PREPARAÇÃO DO AMBIENTE
-- CRIE O SCHEMA ATV3
-- CRIE A TABELA ABAIXO E INSIRA OS REGISTROS À SEGUIR

-- OBS.: SERÁ UTILIZADO O MESMO AMBIENTE PROPOSTO NA PRÁTICA ANTERIOR

create table produto(
  id int,
  nome varchar(50)
)

insert into produto 
values (1, 'produto 1'),
       (2, 'produto 2'),
       (3, 'produto 3'),
       (4, 'produto 4'),
       (5, 'produto 5'),
       (6, 'produto 6'),
       (7, 'produto 7'),
       (8, 'produto 8'),
       (9, 'produto 9'),
       (10, 'produto 10'),
       (11, 'produto 11'),
       (12, 'produto 12'),
       (13, 'produto 13'),
       (14, 'produto 14'),
       (15, 'produto 15'),
       (16, 'produto 16'),
       (17, 'produto 17'),
       (18, 'produto 18'),
       (19, 'produto 19'),
       (20, 'produto 20')

create table fornecedor(
  id int, 
  nome varchar(50), 
  id_municipio int 
)

insert into fornecedor 
values (1, 'Fornecedor 1', 1),
       (2, 'Fornecedor 2', 2),
       (3, 'Fornecedor 3', 3),
       (4, 'Fornecedor 4', 4),
       (5, 'Fornecedor 5', 4)

create table municipio(
  id int,
  nome varchar(50),
  uf char(2)
)

insert into municipio 
values (1, 'São Paulo', 'SP'),
       (2, 'Porto Alegre', 'RS'),
       (3, 'Belo Horizonte', 'MG'),
       (4, 'Rio de Janeiro', 'RJ')

create table compra(
  nf int,
  id_produto int,
  id_fornecedor int,
  qtde int,
  vlr_compra numeric(12,2)
)

insert into compra 
values (1001, 12, 5, 1000, 1950),
       (1002, 14, 6, 1200, 1234),
       (1003, 1, 2, 1300, 1234),
       (1004, 3, 1, 1040, 345),
       (1005, 5, 6, 1200, 5345),
       (1006, 8, 2, 1340, 5234),
       (1007, 2, 3, 1450, 4123),
       (1008, 20, 3, 3400, 12356),
       (1009, 12, 5, 13400, 19234),
       (10010, 1, 2, 10340, 11230),
       (10011, 4, 5, 1340, 12320),
       (10012, 17, 2, 3400, 54332),
       (10013, 19, 4, 5300, 4534),
       (10014, 18, 1, 56700, 43534),
       (10015, 6, 2, 1056, 43543),
       (10016, 8, 3, 156, 345),
       (10017, 9, 4, 1450, 43555),
       (10018, 14, 3, 4500, 4345),
       (10019, 14, 3, 1500, 2345),
       (10020, 1, 2, 1060, 6534)
       
       
-- QUESTÃO 1
-- Utilizando subquery como nova coluna, apresente o nome dos produtos e o valor total comprado para cada um deles.

-- QUESTÃO 2
-- Utilizando subquery como nova coluna, apresente o nome dos fornecedores e a quantidade total de itens comprados de cada um deles.

-- QUESTÃO 3
-- Utilizando subquery como filtro, apresente os produtos que já foram comprados.

-- QUESTÃO 4
-- Utilizando subquery como filtro, apresente os fornecedores que já venderem para a empresa.
       
-- QUESTÃO 5
-- Utilizando subquery como filtro, apresente os produtos que ainda não foram comprados.

-- QUESTÃO 6
-- Utilizando subquery como nova coluna, apresente o nome dos produtos e a quantidade total de itens comprados para cada produto.

-- QUESTÃO 7
-- Utilizando subquery como nova coluna, apresente o nome dos fornecedores e o valor total das compras realizadas de cada fornecedor.

-- QUESTÃO 8
-- Utilizando subquery como filtro, apresente os municípios que possuem fornecedores cadastrados.

-- QUESTÃO 9
-- Utilizando subquery como filtro, apresente os produtos que foram comprados em quantidade total superior a 5.000 unidades.

-- QUESTÃO 10
-- Utilizando subquery como filtro, apresente os fornecedores que realizaram compras com valor total superior a R$ 20.000,00.      
