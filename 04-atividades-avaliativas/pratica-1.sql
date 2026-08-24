
==================================================
- SISTEMAS DE INFORMAÇÃO P4                      -
- CONSULTA SQL AVANÇADO - PRÁTICA 1              -
- PROF. LUIZ GUSTAVO DIAS luizdias@univas.edu.br -
==================================================

-- ATIVIDADE PRÁTICA PARA APLICAR O CONHECIMENTO SOBRE AGREGAÇÃO E AGRUPAMENTOS
-- A ATIVIDADE É PARTE INTEGRANTE DO TRABALHO 1
-- PONTUAÇÃO DISTRIBUÍDA: 6 PTS
-- DEVERÁ SER REALIZADA EM GRUPOS COM 3 OU 4 INTEGRANTES 
-- PARA CADA QUESTÃO ABAIXO, ESTRUTURAR O SCRIPT SQL PARA ENCONTRAR A INFORMAÇÃO DESEJADA
-- AO TÉRMINO DA ATIVIDADE O SCRIPT DEVERÁ SER ENCAMINHADO POR UM INTEGRANTE DO GRUPO PARA O E-MAIL DO PROFESSOR
-- PRAZO PARA CONCLUSÃO 24/08 ÀS 22H20
-- SERÁ CONSIDERADO 50% DA NOTA PARA A ATIVIDADE ENTREGUE APÓS ESSA DATA
-- SERÁ CONSIDERADO 50% DA NOTA O NÃO PREENCHIENTO DOS INTEGRANTES DO GRUPO NO CABEÇALHO DO SCRIPT
-- SERÁ CONSIDERADA NOTA IGUAL A ZERO AS QUESTÕES RESOLVIDAS COM APOIO DE IA OU OUTROS MECANISMOS QUE REFLITAM A NÃO REPRODUÇÃO POR PARTE DO (A) ALUNO (A)

-- IDENTIFICAÇÃO:
-- - ALUNO (A) 1:
-- - ALUNO (A) 2:
-- - ALUNO (A) 3: 
-- - ALUNO (A) 4: 

-- PREPARAÇÃO DO AMBIENTE
-- CRIE O SCHEMA ATV1
-- CRIE A TABELA ABAIXO E INSIRA OS REGISTROS À SEGUIR

create table estoque( 
  cod_produto int not null primary key comment 'código individual do produto',
  nome_produto varchar(50) comment 'nome do produto',
  categoria varchar(20) comment 'categoria do produto',
  qtde int comment 'quantidade do produto em estoque',
  vlr_unitario numeric(12,2) comment 'valor para cada unidade do produto'
)

-- teste o schema criado
select * from estoque 


-- insira os registros
insert into estoque values 
  (1,'sabao em po','limpeza',59,15.95),
  (2,'detergente','limpeza',102,2.25),
  (3,'desinfetante','limpeza',88,5.95),
  (4,'macarrao','mercearia',234,12.95),
  (5,'arroz','mercearia',342,25.65),
  (6,'feijao','mercearia',123,4.75),
  (7,'oleo','mercearia',345,9.95),
  (8,'farinha','mercearia',645,4.39),
  (9,'refrigerante','bebidas',675,8.99),
  (10,'agua','bebidas',567,2.69)

-- teste o schema criado com os registros inseridos
select * from estoque 


-- QUESTÃO 1
-- Qual a quantidade total de produtos no estoque?

-- QUESTÃO 2
-- Qual a quantidade total de produtos no estoque por categoria?

-- QUESTÃO 3
-- Qual a quantidade média de produtos no estoque pertencentes à categoria limpeza?

-- QUESTÃO 4
-- Qual o nome dos produtos por ordem crescente de valor unitário?

-- QUESTÃO 5
-- Qual o preço médio unitário dos produtos do estoque?

-- QUESTÃO 6
-- Considerando que cada tupla representa o registro de um produto, quantos produtos estão cadastrados neste estoque?

-- QUESTÃO 7 -- Análise do estoque mínimo.
--- Estoque mínimo = menor quantidade que um produto deve possuir no estoque, para que a empresa opere em segurança.
--- Estoque mínimo = 100. 
-- Quantos produtos estão abaixo do estoque mínimo?

-- QUESTÃO 8
-- Quantos produtos estão acima do estoque mínimo?

-- QUESTÃO 9
-- Qual a quantidade total de produtos em estoque por categoria considerando apenas os casos em que os produtos estejam
-- acima do estoque mínimo?

-- QUESTÃO 10
-- Estruture uma consulta que apresente a menor e a maior quantidade de produtos por categoria

