-- ============================
-- INSERÇÃO DE DADOS SIMULADOS
-- ============================

-- Usuários
INSERT INTO Usuarios (nome, email, senha, tipo) VALUES
('João Silva', 'joao@email.com', '123456', 'cliente'),
('Maria Santos', 'maria@email.com', '123456', 'cliente'),
('Admin', 'admin@email.com', 'admin123', 'admin');

-- Fornecedores
INSERT INTO Fornecedores (nome, contato) VALUES
('Fornecedor A', 'contatoA@email.com'),
('Fornecedor B', 'contatoB@email.com');

-- Categorias
INSERT INTO Categorias (nome) VALUES
('Eletrônicos'),
('Roupas');

-- Produtos
INSERT INTO Produtos (nome, descricao, preco, estoque, categoria_id, fornecedor_id) VALUES
('Smartphone X', 'Celular moderno com câmera avançada.', 1999.99, 50, 1, 1),
('Camisa Polo', 'Camisa de algodão confortável.', 89.90, 30, 2, 2);

-- Pedidos
INSERT INTO Pedidos (usuario_id, data_pedido) VALUES
(1, '2025-03-01'),
(2, '2025-03-05');

-- Itens dos pedidos
INSERT INTO ItensPedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 1999.99),
(2, 2, 2, 89.90);

-- Pagamentos
INSERT INTO Pagamentos (pedido_id, metodo, valor, data_pagamento) VALUES
(1, 'cartao', 1999.99, '2025-03-02'),
(2, 'pix', 179.80, '2025-03-06');

-- Avaliações
INSERT INTO Avaliacoes (produto_id, usuario_id, nota, comentario) VALUES
(1, 1, 5, 'Excelente celular!'),
(2, 2, 4, 'Camisa confortável e bonita.');
