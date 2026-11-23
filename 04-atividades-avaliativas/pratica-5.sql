==================================================
- SISTEMAS DE INFORMAÇÃO P4                      -
- CONSULTA SQL AVANÇADO - PRÁTICA 5              -
- PROF. GUSTAVO DIAS luizdias@univas.edu.br      -
==================================================

-- ATIVIDADE PRÁTICA: CONSULTAS ORIENTADAS À ANÁLISE
-- OBJETIVO: desenvolver consultas aplicadas ao cenário de vendas, utilizando
-- CASE, COALESCE e VIEW para organizar e interpretar informações.
-- A atividade deverá ser realizada em grupos com 3 ou 4 integrantes.
-- Para cada questão prática, estruture o script SQL necessário para obter
-- a informação solicitada.
-- Ao término da aula, encaminhe o script SQL completo ao professor por e-mail.
-- A entrega deverá conter as consultas, as VIEWs solicitadas e a identificação
-- dos integrantes.
-- As questões práticas devem ser resolvidas com os recursos indicados no enunciado.
-- As questões 6 e 7 são dissertativas: responda por meio de comentários SQL,
-- explicando o funcionamento, a aplicação e os cuidados necessários.
--
-- IDENTIFICAÇÃO:
-- - ALUNO (A) 1:
-- - ALUNO (A) 2:
-- - ALUNO (A) 3:
-- - ALUNO (A) 4:

-- PREPARAÇÃO DO AMBIENTE
-- UTILIZE O MESMO MODELO DE DADOS DA PRÁTICA 4, COM AS MESMAS TABELAS E REGISTROS.

-- ==================================================
-- QUESTÃO 1 - CASE: CLASSIFICAÇÃO DO VALOR DOS PEDIDOS
-- OBJETIVO: utilizar CASE para transformar valores calculados em categorias
-- que facilitem a análise comercial.
--
-- CONTEXTO:
-- A gerência deseja identificar pedidos de diferentes faixas de valor.
-- Considere o valor do pedido como a soma de quantidade * preco_unitario
-- de seus itens.
--
-- TAREFA:
-- Escreva uma consulta que apresente:
--   - número do pedido;
--   - nome do cliente;
--   - valor total do pedido;
--   - classificação do pedido, conforme as regras:
--       * valor igual ou superior a R$ 3.000,00: 'Alto valor';
--       * valor igual ou superior a R$ 1.000,00: 'Médio valor';
--       * abaixo de R$ 1.000,00: 'Baixo valor'.
-- Utilize CASE na classificação. Garanta que cada pedido apareça uma única vez.
-- Considere a ordem das condições para evitar classificações incorretas.


-- ==================================================
-- QUESTÃO 2 - COALESCE: CLIENTES SEM PEDIDOS
-- OBJETIVO: tratar valores NULL em uma análise da carteira de clientes.
--
-- CONTEXTO:
-- A equipe comercial precisa visualizar todos os clientes cadastrados,
-- inclusive aqueles que ainda não realizaram pedidos.
--
-- TAREFA:
-- Escreva uma consulta que apresente o nome e a cidade de cada cliente,
-- a quantidade de pedidos e o valor total comprado.
-- Clientes sem pedidos devem aparecer com quantidade 0 e valor total 0.
-- Utilize LEFT JOIN para preservar todos os clientes e COALESCE para substituir
-- valores NULL nos indicadores. Evite que a junção multiplique indevidamente
-- os valores agregados.


-- ==================================================
-- QUESTÃO 3 - VIEW: VISÃO ANALÍTICA DE PEDIDOS
-- OBJETIVO: criar uma VIEW reutilizável para consultas comerciais.
--
-- CONTEXTO:
-- A gerência deseja consultar frequentemente os pedidos com seus clientes,
-- vendedores e respectivos valores, sem reescrever toda a consulta-base.
--
-- TAREFA:
-- Crie uma VIEW chamada vw_analise_pedidos contendo:
--   - número e data do pedido;
--   - nome do cliente e sua cidade;
--   - nome do vendedor e seu setor;
--   - valor total do pedido.
-- Em seguida, consulte a VIEW para listar somente pedidos com valor total
-- superior a R$ 1.000,00, ordenados do maior para o menor valor.
-- O valor total deve ser calculado a partir dos itens do pedido.


-- ==================================================
-- QUESTÃO 4 - CASE E COALESCE: DESEMPENHO DOS VENDEDORES
-- OBJETIVO: produzir uma classificação gerencial a partir de indicadores.
--
-- CONTEXTO:
-- A coordenação comercial pretende comparar vendedores pelo valor total
-- vendido. Vendedores sem pedidos também devem ser considerados.
--
-- TAREFA:
-- Apresente o nome do vendedor, a quantidade de pedidos, o valor total vendido
-- e uma classificação obtida com CASE:
--   * total igual ou superior a R$ 5.000,00: 'Destaque';
--   * total igual ou superior a R$ 2.000,00: 'Em desenvolvimento';
--   * abaixo de R$ 2.000,00: 'Acompanhar'.
-- Utilize LEFT JOIN para manter todos os vendedores e COALESCE para que
-- quantidade e valor sejam exibidos como zero quando não houver pedidos.
-- Ordene o resultado pelo valor total vendido, em ordem decrescente.


-- ==================================================
-- QUESTÃO 5 - VIEW, CASE E COALESCE: ANÁLISE DE PRODUTOS
-- OBJETIVO: consolidar informações do catálogo em uma VIEW analítica.
--
-- CONTEXTO:
-- O setor de estoque deseja acompanhar o valor potencial comercializado
-- por produto, considerando as unidades vendidas e o preço registrado
-- nos itens dos pedidos. Produtos sem vendas devem permanecer no relatório.
--
-- TAREFA:
-- Crie uma VIEW chamada vw_analise_produtos que apresente:
--   - nome do produto e nome da categoria;
--   - quantidade total de unidades vendidas;
--   - valor total vendido por produto;
--   - classificação do produto com CASE:
--       * valor igual ou superior a R$ 3.000,00: 'Maior faturamento';
--       * valor igual ou superior a R$ 500,00: 'Faturamento intermediário';
--       * abaixo de R$ 500,00: 'Menor faturamento'.
-- Utilize LEFT JOIN para incluir produtos sem vendas e COALESCE para substituir
-- por zero os indicadores ausentes.
-- Após criar a VIEW, consulte-a apresentando os produtos classificados como
-- 'Maior faturamento', ordenados pelo valor total vendido.


-- ==================================================
-- QUESTÃO 6 - DISSERTATIVA: PROCEDURES
-- CONTEXTO:
-- A empresa deseja padronizar a geração de um relatório de vendas por período.
--
-- RESPONDA, EM COMENTÁRIOS SQL:
-- a) O que é uma stored procedure e como ela difere de uma consulta SELECT comum?
-- b) Como uma procedure poderia receber data inicial e data final como parâmetros
--    e retornar ou disponibilizar os pedidos desse intervalo?
-- c) Cite uma vantagem e um cuidado relacionado à manutenção ou execução
--    de procedures nesse cenário.


-- ==================================================
-- QUESTÃO 7 - DISSERTATIVA: TRIGGERS
-- CONTEXTO:
-- A empresa deseja manter um registro de auditoria sempre que o preço unitário
-- de um item de pedido for alterado.
--
-- RESPONDA, EM COMENTÁRIOS SQL:
-- a) O que é um trigger e em que momento ele é executado?
-- b) Qual evento e qual tabela seriam apropriados para essa auditoria?
-- c) Quais informações do registro antigo e do novo registro deveriam ser
--    armazenadas para permitir rastrear a alteração?
-- d) Explique uma diferença prática entre trigger e procedure, considerando
--    a execução automática e a chamada explícita.
