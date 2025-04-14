-- ============================================
-- CRIAÇÃO DO BANCO DE DADOS PARA E-COMMERCE
-- ============================================

CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- ============================
-- TABELA: USUÁRIOS
-- ============================
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    tipo ENUM('cliente', 'admin') DEFAULT 'cliente'
);

-- ============================
-- TABELA: FORNECEDORES
-- ============================
CREATE TABLE Fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100)
);

-- ============================
-- TABELA: CATEGORIAS
-- ============================
CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- ============================
-- TABELA: PRODUTOS
-- ============================
CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT,
    fornecedor_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(id)
);

-- ============================
-- TABELA: PEDIDOS
-- ============================
CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- ============================
-- TABELA: ITENS DO PEDIDO
-- ============================
CREATE TABLE ItensPedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

-- ============================
-- TABELA: PAGAMENTOS
-- ============================
CREATE TABLE Pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    metodo ENUM('cartao', 'boleto', 'pix') NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id)
);

-- ============================
-- TABELA: AVALIAÇÕES
-- ============================
CREATE TABLE Avaliacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    usuario_id INT,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);


-- ============================
-- FUNCIONALIDADE DO SISTEMA
-- ============================
-- O sistema permite:
-- - Cadastrar usuários com diferentes permissões (cliente/admin)
-- - Gerenciar produtos com categorias, fornecedores e estoque
-- - Registrar pedidos com múltiplos itens
-- - Registrar pagamentos com métodos distintos
-- - Consultar dados analíticos para tomada de decisão
-- - Controlar e monitorar avaliações de produtos por clientes
-- - Inserir dados simulados para teste das funcionalidades
