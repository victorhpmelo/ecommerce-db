-- ============================
-- CONSULTAS PERSONALIZADAS
-- ============================

-- Produtos mais vendidos
SELECT p.nome, SUM(i.quantidade) AS total_vendido
FROM ItensPedido i
JOIN Produtos p ON i.produto_id = p.id
GROUP BY p.nome
ORDER BY total_vendido DESC
LIMIT 10;

-- Clientes que mais compraram no último mês
SELECT u.nome, COUNT(p.id) AS total_pedidos, SUM(i.quantidade * i.preco_unitario) AS total_gasto
FROM Usuarios u
JOIN Pedidos p ON u.id = p.usuario_id
JOIN ItensPedido i ON p.id = i.pedido_id
WHERE p.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY u.id, u.nome
ORDER BY total_gasto DESC
LIMIT 10;

-- Produtos com estoque baixo (menos de 10)
SELECT nome, estoque
FROM Produtos
WHERE estoque < 10
ORDER BY estoque ASC;

-- Faturamento por período (mensal)
SELECT DATE_FORMAT(data_pagamento, '%Y-%m') AS mes, SUM(valor) AS faturamento_total
FROM Pagamentos
GROUP BY mes
ORDER BY mes DESC;

-- Média de avaliação dos produtos
SELECT p.nome, ROUND(AVG(a.nota), 2) AS media_avaliacao, COUNT(a.id) AS total_avaliacoes
FROM Avaliacoes a
JOIN Produtos p ON a.produto_id = p.id
GROUP BY p.id, p.nome
ORDER BY media_avaliacao DESC;