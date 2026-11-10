==================================================
- SISTEMAS DE INFORMAÇÃO P4                      -
- CONSULTA SQL AVANÇADO - PRÁTICA 4              -
- PROF. GUSTAVO DIAS luizdias@univas.edu.br      -
==================================================

-- ATIVIDADE PRÁTICA PARA APLICAR OS CONHECIMENTOS SOBRE CTEs (COMMON TABLE
-- EXPRESSIONS), UTILIZANDO A CLÁUSULA WITH, EM CONSULTAS COM JUNÇÕES E AGREGAÇÕES.
-- A ATIVIDADE DEVERÁ SER REALIZADA EM GRUPOS COM 3 OU 4 INTEGRANTES.
-- A TURMA DEVERÁ DESENVOLVER AS QUESTÕES DURANTE A AULA DO DIA 09/11/2026.
-- PARA CADA QUESTÃO, ESTRUTURE O SCRIPT SQL NECESSÁRIO PARA OBTER A INFORMAÇÃO.
-- AO TÉRMINO DA AULA, ENCAMINHE O SCRIPT SQL COMPLETO PARA O PROFESSOR POR E-MAIL.
-- PRAZO PARA ENTREGA: ATÉ O FINAL DA AULA DO DIA 09/11/2026.
-- A ENTREGA DEVERÁ CONTER AS CONSULTAS SQL E A IDENTIFICAÇÃO DOS INTEGRANTES.
-- TODAS AS DEZ QUESTÕES DEVEM SER RESOLVIDAS UTILIZANDO PELO MENOS UMA CTE,
-- DECLARADA OBRIGATORIAMENTE POR MEIO DA CLÁUSULA WITH.
-- UTILIZE AS CTEs PARA ORGANIZAR ETAPAS DA CONSULTA E, EM SEGUIDA, O SELECT
-- PRINCIPAL PARA APRESENTAR O RESULTADO SOLICITADO.
-- AS CONSULTAS TAMBÉM PODERÃO EXIGIR INNER JOIN, LEFT JOIN, RIGHT JOIN,
-- GROUP BY E FUNÇÕES DE AGREGAÇÃO, CONFORME O ENUNCIADO.
-- NÃO É NECESSÁRIO UTILIZAR SUBQUERIES, COMANDOS CONDICIONAIS,
-- WINDOW FUNCTIONS OU RECURSOS QUE NÃO FAÇAM PARTE DO ESCOPO ESTUDADO.
-- ATENÇÃO: UMA CONSULTA SEM A UTILIZAÇÃO DA CLÁUSULA WITH NÃO ATENDE
-- AO OBJETIVO DESTA ATIVIDADE.

-- IDENTIFICAÇÃO:
-- - ALUNO (A) 1:
-- - ALUNO (A) 2:
-- - ALUNO (A) 3:
-- - ALUNO (A) 4:


-- PREPARAÇÃO DO AMBIENTE
-- CRIE O SCHEMA ATV4 E EXECUTE OS COMANDOS ABAIXO NESSE SCHEMA.
-- O CENÁRIO REPRESENTA O SISTEMA DE VENDAS DE UMA EMPRESA.
--
-- REGRAS DE NEGÓCIO DO MODELO:
-- 1. Um cliente pode realizar vários pedidos, mas cada pedido pertence a um único cliente.
-- 2. Cada pedido é registrado por um único vendedor; um vendedor pode registrar vários pedidos.
-- 3. Um pedido pode conter vários produtos, e um produto pode aparecer em vários pedidos.
-- 4. A relação entre pedidos e produtos é representada pela tabela item_pedido.
-- 5. Cada item_pedido registra a quantidade e o preço unitário do produto naquele pedido.
-- 6. Cada produto pertence a uma única categoria; uma categoria pode reunir vários produtos.
-- 7. Clientes, vendedores e categorias podem estar cadastrados mesmo que ainda não tenham
--    realizado pedidos ou possuam produtos/pedidos associados.
-- 8. O valor de cada item é calculado pela multiplicação da quantidade pelo preço unitário.
--    O valor de um pedido corresponde à soma dos valores de seus itens.
--
-- OBS.: AS CHAVES PRIMÁRIAS E ESTRANGEIRAS REPRESENTAM OS RELACIONAMENTOS
-- ENTRE AS TABELAS E DEVEM SER CONSIDERADAS NA CONSTRUÇÃO DAS CONSULTAS.
--
-- LEMBRETE SOBRE CTE:
-- UMA CTE É DEFINIDA NO INÍCIO DA CONSULTA COM A CLÁUSULA WITH E PODE SER
-- UTILIZADA PELO SELECT PRINCIPAL COMO UMA FONTE DE DADOS TEMPORÁRIA.
-- EXEMPLO DE ESTRUTURA (APENAS ILUSTRATIVO):
--
-- WITH nome_cte AS (
--     SELECT ...
--     FROM ...
-- )
-- SELECT ...
-- FROM nome_cte;
--
-- CADA QUESTÃO DEVE CONTER SUA PRÓPRIA CLÁUSULA WITH.


CREATE SCHEMA ATV4;

-- Caso seu SGBD utilize o comando abaixo para selecionar o schema, execute-o:
SET search_path TO ATV4;


-- TABELA CLIENTE
CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(60),
    cidade VARCHAR(50),
    uf CHAR(2)
);

INSERT INTO cliente (id, nome, cidade, uf) VALUES
(1, 'Ana Souza', 'Pouso Alegre', 'MG'),
(2, 'Bruno Lima', 'Poços de Caldas', 'MG'),
(3, 'Carla Mendes', 'São Paulo', 'SP'),
(4, 'Diego Alves', 'Campinas', 'SP'),
(5, 'Elisa Costa', 'Belo Horizonte', 'MG'),
(6, 'Felipe Rocha', 'Curitiba', 'PR');


-- TABELA VENDEDOR
CREATE TABLE vendedor (
    id INT PRIMARY KEY,
    nome VARCHAR(60),
    setor VARCHAR(40)
);

INSERT INTO vendedor (id, nome, setor) VALUES
(1, 'Marcos Silva', 'Interno'),
(2, 'Paula Reis', 'Externo'),
(3, 'Renato Costa', 'Interno'),
(4, 'Sonia Martins', 'Corporativo');


-- TABELA CATEGORIA
CREATE TABLE categoria (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);

INSERT INTO categoria (id, nome) VALUES
(1, 'Informática'),
(2, 'Escritório'),
(3, 'Acessórios'),
(4, 'Mobiliário');


-- TABELA PRODUTO
CREATE TABLE produto (
    id INT PRIMARY KEY,
    nome VARCHAR(60),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

INSERT INTO produto (id, nome, id_categoria) VALUES
(1, 'Notebook', 1),
(2, 'Monitor', 1),
(3, 'Teclado', 3),
(4, 'Mouse', 3),
(5, 'Cadeira', 4),
(6, 'Papel A4', 2),
(7, 'Caneta', 2),
(8, 'Webcam', 1);


-- TABELA PEDIDO
CREATE TABLE pedido (
    id INT PRIMARY KEY,
    data_pedido DATE,
    id_cliente INT,
    id_vendedor INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id)
);

INSERT INTO pedido (id, data_pedido, id_cliente, id_vendedor) VALUES
(1001, '2026-10-01', 1, 1),
(1002, '2026-10-02', 2, 2),
(1003, '2026-10-03', 1, 1),
(1004, '2026-10-04', 3, 3),
(1005, '2026-10-05', 4, 2),
(1006, '2026-10-06', 5, 1),
(1007, '2026-10-07', 2, 3),
(1008, '2026-10-08', 3, 2);


-- TABELA ITEM_PEDIDO
CREATE TABLE item_pedido (
    id INT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario NUMERIC(10,2),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

INSERT INTO item_pedido (id, id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1001, 1, 1, 3500.00),
(2, 1001, 3, 2, 120.00),
(3, 1002, 2, 1, 950.00),
(4, 1002, 4, 2, 80.00),
(5, 1003, 1, 1, 3450.00),
(6, 1003, 5, 1, 780.00),
(7, 1004, 6, 10, 32.00),
(8, 1004, 7, 20, 3.50),
(9, 1005, 2, 2, 920.00),
(10, 1005, 3, 1, 125.00),
(11, 1006, 5, 2, 760.00),
(12, 1006, 6, 5, 30.00),
(13, 1007, 4, 3, 75.00),
(14, 1007, 7, 50, 3.00),
(15, 1008, 1, 1, 3490.00),
(16, 1008, 8, 1, 210.00);


-- QUESTÃO 1 - CTE E INNER JOIN
-- OBJETIVO: APRESENTAR OS PEDIDOS E OS RESPECTIVOS CLIENTES UTILIZANDO UMA CTE.
--
-- CONTEXTO:
-- A empresa deseja consultar os pedidos registrados e identificar o cliente
-- responsável por cada um deles. Cada pedido pertence a um único cliente.
--
-- ORIENTAÇÃO:
-- Crie o item 1: identifique quais tabelas armazenam os dados do pedido e do cliente.
--   - Qual campo da tabela pedido identifica o cliente relacionado?
--   - Qual campo da tabela cliente corresponde a essa informação?
-- Crie o item 2: defina o conteúdo que será organizado na CTE.
--   - A CTE deve reunir dados de quais tabelas?
--   - Qual tipo de JOIN retorna somente registros que possuem correspondência
--     nas duas tabelas?
--   - Qual condição deve ser utilizada no ON?
-- Crie o item 3: escreva a consulta utilizando WITH.
--   - Qual nome será atribuído à CTE?
--   - Como o SELECT principal poderá consultar os dados definidos na CTE?
--   - Como apresentar o número do pedido, a data do pedido e o nome do cliente?


-- QUESTÃO 2 - CTE, INNER JOIN E AGREGAÇÃO
-- OBJETIVO: IDENTIFICAR A QUANTIDADE DE PEDIDOS REGISTRADOS POR VENDEDOR.
--
-- CONTEXTO:
-- A gerência comercial deseja acompanhar o volume de pedidos registrado por
-- cada vendedor. Considere os pedidos efetivamente cadastrados.
--
-- ORIENTAÇÃO:
-- Crie o item 1: identifique o relacionamento entre vendedor e pedido.
--   - Qual campo identifica o vendedor responsável pelo pedido?
--   - Qual tipo de JOIN permite considerar somente vendedores com pedidos?
-- Crie o item 2: defina os dados que serão reunidos na CTE.
--   - Quais colunas são necessárias para identificar o vendedor e seus pedidos?
--   - Em qual etapa da consulta a junção entre as tabelas será realizada?
-- Crie o item 3: utilize a CTE para calcular a quantidade de pedidos por vendedor.
--   - Qual função de agregação permite contar os pedidos?
--   - Qual coluna deve ser contada para representar cada pedido?
--   - Por quais colunas o resultado deve ser agrupado?
--   - Como o SELECT principal deve apresentar o nome do vendedor e a quantidade?


-- QUESTÃO 3 - CTE, LEFT JOIN E AGREGAÇÃO
-- OBJETIVO: APRESENTAR TODOS OS CLIENTES E A QUANTIDADE DE PEDIDOS DE CADA UM.
--
-- CONTEXTO:
-- A empresa deseja analisar sua carteira de clientes, inclusive aqueles que
-- ainda não realizaram compras. Clientes sem pedidos também devem aparecer,
-- com quantidade igual a zero.
--
-- ORIENTAÇÃO:
-- Crie o item 1: identifique a tabela que deverá preservar todos os clientes.
--   - Qual tabela deve ficar à esquerda da junção?
--   - O que aconteceria se fosse utilizado INNER JOIN?
-- Crie o item 2: estabeleça o relacionamento entre clientes e pedidos na CTE.
--   - Qual tipo de JOIN mantém os registros da tabela à esquerda sem correspondência?
--   - Qual condição deve ser utilizada no ON?
-- Crie o item 3: defina a agregação na CTE e a apresentação no SELECT principal.
--   - Qual função permite contar os pedidos?
--   - Por que é importante contar o identificador do pedido, e não uma coluna
--     da tabela cliente, para representar a quantidade de pedidos?
--   - Quais colunas devem ser agrupadas?
--   - Como o resultado da CTE será consultado pelo SELECT principal?


-- QUESTÃO 4 - CTE, RIGHT JOIN E AGREGAÇÃO
-- OBJETIVO: APRESENTAR TODAS AS CATEGORIAS E A QUANTIDADE DE PRODUTOS CADASTRADOS.
--
-- CONTEXTO:
-- O setor de produtos deseja conferir o catálogo de categorias. Algumas categorias
-- podem estar cadastradas mesmo sem possuir produtos associados. Todas as categorias
-- devem aparecer no resultado, inclusive aquelas sem produtos.
--
-- ORIENTAÇÃO:
-- Crie o item 1: identifique o relacionamento entre categoria e produto.
--   - Qual campo da tabela produto referencia a categoria?
--   - Qual campo da tabela categoria recebe esse relacionamento?
-- Crie o item 2: construa a CTE utilizando RIGHT JOIN e preservando todas as categorias.
--   - Para preservar as categorias com RIGHT JOIN, qual tabela deve aparecer
--     à direita da instrução JOIN?
--   - Qual condição deve relacionar produto e categoria?
--   - Como a posição das tabelas influencia o resultado do RIGHT JOIN?
-- Crie o item 3: calcule a quantidade de produtos por categoria.
--   - Qual função de agregação deve ser utilizada?
--   - Qual coluna deve ser contada para que categorias sem produtos apresentem zero?
--   - Quais informações devem ser agrupadas?
--   - Como o SELECT principal consultará os dados da CTE?


-- QUESTÃO 5 - CTE, LEFT JOIN, GROUP BY E AGREGAÇÃO
-- OBJETIVO: APRESENTAR A QUANTIDADE DE UNIDADES VENDIDAS DE CADA PRODUTO.
--
-- CONTEXTO:
-- A área de estoque deseja conhecer o volume total vendido de cada produto.
-- O relatório deve apresentar também os produtos que ainda não foram vendidos,
-- pois eles continuam fazendo parte do catálogo da empresa.
-- O total de unidades vendidas corresponde à soma das quantidades registradas
-- nos itens dos pedidos.
--
-- ORIENTAÇÃO:
-- Crie o item 1: identifique as tabelas necessárias para obter o nome do produto
-- e as quantidades vendidas.
--   - Qual tabela registra os produtos?
--   - Qual tabela registra a quantidade de cada produto em cada pedido?
-- Crie o item 2: estabeleça o relacionamento na CTE.
--   - Qual campo permite relacionar as duas tabelas?
--   - Qual tipo de JOIN preserva os produtos mesmo quando não há venda?
-- Crie o item 3: calcule o total de unidades vendidas por produto na CTE.
--   - Qual função de agregação permite somar as quantidades?
--   - Por que o resultado deve ser agrupado pelo identificador e pelo nome do produto?
--   - O que representa a ausência de itens para um produto sem vendas?
-- Crie o item 4: utilize o SELECT principal para apresentar o resultado da CTE.
--   - Quais colunas devem ser exibidas?
--   - Como garantir que todos os produtos apareçam no relatório?


-- QUESTÕES EXTRA
-- NÃO SERÃO CONSIDERADAS PARA EFEITO DE PONTUAÇÃO

-- QUESTÃO 6
-- Utilizando obrigatoriamente uma CTE declarada com WITH, apresente o nome de cada
-- cliente, a quantidade de pedidos realizados e o valor total de suas compras.
-- Considere o valor de cada item como quantidade multiplicada pelo preço unitário.
-- Inclua no resultado todos os clientes cadastrados.
-- Desenvolva a consulta com base no aprendizado das questões anteriores.


-- QUESTÃO 7
-- Utilizando obrigatoriamente uma CTE declarada com WITH, apresente o nome de cada
-- vendedor e o valor total vendido por ele, considerando a soma dos valores dos
-- itens dos pedidos registrados pelo vendedor.
-- Desenvolva a consulta com base no aprendizado das questões anteriores.


-- QUESTÃO 8
-- Utilizando obrigatoriamente uma CTE declarada com WITH, apresente o nome de cada
-- categoria, o nome dos produtos associados e a quantidade total de unidades
-- vendidas de cada produto. Inclua também as categorias e os produtos que ainda
-- não possuem vendas registradas.
-- Desenvolva a consulta com base no aprendizado das questões anteriores.


-- QUESTÃO 9
-- Utilizando obrigatoriamente uma CTE declarada com WITH, apresente o número de
-- cada pedido, o nome do cliente, o nome do vendedor e o valor total do pedido.
-- O resultado deve apresentar uma linha para cada pedido.
-- Desenvolva a consulta com base no aprendizado das questões anteriores.


-- QUESTÃO 10
-- Utilizando obrigatoriamente uma CTE declarada com WITH, apresente o nome de cada
-- vendedor, a quantidade de pedidos registrados e o valor total vendido. Inclua
-- todos os vendedores cadastrados, inclusive aqueles que ainda não registraram pedidos.
-- Desenvolva a consulta com base no aprendizado das questões anteriores.
