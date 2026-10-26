/*
 * Consulta SQL Avançado
 * Prof. Gustavo Dias
 * 2026-10-26
 * CTE
 */

-- CTE
-- - PREPARAÇÃO DO AMBIENTE DE DADOS

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(60)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,

    CONSTRAINT fk_pedidos_clientes
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (id_cliente, nome, cidade) 
VALUES	(1, 'Ana Silva', 'Pouso Alegre'),
		(2, 'Bruno Souza', 'Itajuba'),
		(3, 'Carla Mendes', 'Pocos de Caldas'),
		(4, 'Daniel Oliveira', 'Santa Rita do Sapucai'),
		(5, 'Eduarda Costa', 'Pouso Alegre'),
		(6, 'Felipe Santos', 'Itajuba'),
		(7, 'Gabriela Lima', 'Pocos de Caldas'),
		(8, 'Henrique Alves', 'Varginha'),
		(9, 'Isabela Rocha', 'Pouso Alegre'),
		(10, 'Joao Martins', 'Varginha');

INSERT INTO pedidos (id_pedido, id_cliente, valor, status) 
VALUES 	(101, 1, 800.00, 'APROVADO'),
		(102, 1, 500.00, 'APROVADO'),
		(103, 1, 200.00, 'CANCELADO'),
		(104, 2, 1500.00, 'APROVADO'),
		(105, 2, 300.00, 'APROVADO'),	
		(106, 3, 2500.00, 'APROVADO'),
		(107, 3, 400.00, 'CANCELADO'),
		(108, 4, 700.00, 'APROVADO'),
		(109, 4, 600.00, 'APROVADO'),
		(110, 5, 3500.00, 'APROVADO'),
		(111, 5, 500.00, 'APROVADO'),
		(112, 6, 900.00, 'APROVADO'),	
		(113, 6, 100.00, 'CANCELADO'),
		(114, 7, 1200.00, 'APROVADO'),
		(115, 7, 1800.00, 'APROVADO'),
		(116, 8, 400.00, 'APROVADO'),
		(117, 8, 250.00, 'APROVADO'),
		(118, 9, 600.00, 'APROVADO'),
		(119, 9, 200.00, 'APROVADO'),
		(120, 10, 5000.00, 'APROVADO'),
		(121, 10, 1000.00, 'CANCELADO');

-- - CONSULTA 1: CLIENTES COM PEDIDOS APROVADOS CUJA SOMA DO VALOR É MAIOR DO QUE 1000

SELECT
    c.id_cliente,
    c.nome
FROM clientes c
WHERE c.id_cliente IN (
    SELECT p.id_cliente
    FROM pedidos p
    WHERE p.status = 'APROVADO'
    GROUP BY p.id_cliente
    HAVING SUM(p.valor) > 1000
);

-- - CONSULTA 2: (CTE) CLIENTES COM PEDIDOS APROVADOS CUJA SOMA DO VALOR É MAIOR DO QUE 1000

WITH total_por_cliente AS (
    SELECT
        id_cliente,
        SUM(valor) AS total_compras
    FROM pedidos
    WHERE status = 'APROVADO'
    GROUP BY id_cliente
)
SELECT
    c.id_cliente, 
    c.nome 
FROM clientes c
INNER JOIN total_por_cliente t
    ON t.id_cliente = c.id_cliente
WHERE t.total_compras > 1000

-- - CONSULTA 3: CLIENTES COM PEDIDOS APROVADOS, VALOR TOTAL E MÉDIO DAS COMPRAS

WITH total_por_cliente AS (
    SELECT
        id_cliente,
        SUM(valor) AS total_compras
    FROM pedidos
    WHERE status = 'APROVADO'
    GROUP BY id_cliente
),
media_compras AS (
    SELECT
        AVG(total_compras) AS media
    FROM total_por_cliente
)
SELECT
    c.nome,
    t.total_compras,
    m.media
FROM total_por_cliente t
INNER JOIN clientes c
    ON c.id_cliente = t.id_cliente
CROSS JOIN media_compras m -- NOVO TIPO DE JOIN
WHERE t.total_compras > m.media
ORDER BY t.total_compras DESC;

