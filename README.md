# 🛒 Projeto de Banco de Dados para E-commerce

Este projeto consiste na modelagem, implementação e testes de um banco de dados relacional para um sistema de e-commerce, desenvolvido como atividade da disciplina Projeto de Banco de Dados do Centro Universitário Maurício de Nassau - Recife/PE.

## 📋 Objetivo

Projetar um banco de dados relacional para uma loja virtual que permita:
- Cadastro de usuários (clientes e administradores)
- Gerenciamento de produtos, categorias e fornecedores
- Registro de pedidos com múltiplos itens
- Pagamentos com diversos métodos
- Controle de estoque e entrega
- Avaliações de produtos

## 📐 Modelo Entidade-Relacionamento (MER)

O MER foi modelado utilizando a notação **Mermaid**, adequada para renderização em Markdown (ex: GitHub):

```mermaid
erDiagram
    %% === ENTIDADES ===
    USUARIOS {
        int id
        varchar nome
        varchar email
        varchar senha
        enum tipo
    }

    AVALIACOES {
        int id
        int produto_id
        int usuario_id
        int nota
        text comentario
    }

    PEDIDOS {
        int id
        int usuario_id
        date data_pedido
    }

    PAGAMENTOS {
        int id
        int pedido_id
        enum metodo
        decimal valor
        date data_pagamento
    }

    CATEGORIAS {
        int id
        varchar nome
    }

    FORNECEDORES {
        int id
        varchar nome
        varchar contato
    }

    PRODUTOS {
        int id
        varchar nome
        text descricao
        decimal preco
        int estoque
        int categoria_id
        int fornecedor_id
    }

    ITENSPEDIDO {
        int id
        int pedido_id
        int produto_id
        int quantidade
        decimal preco_unitario
    }

    %% === RELACIONAMENTOS ORGANIZADOS ===
    USUARIOS     ||--o{ PEDIDOS       : realiza
    USUARIOS     ||--o{ AVALIACOES    : faz

    PEDIDOS      ||--o{ ITENSPEDIDO   : possui
    PEDIDOS      ||--|| PAGAMENTOS    : pago_por

    PRODUTOS     ||--o{ ITENSPEDIDO   : presente_em
    PRODUTOS     ||--o{ AVALIACOES    : avalia
    PRODUTOS     }o--|| CATEGORIAS    : pertence_a
    PRODUTOS     }o--|| FORNECEDORES  : fornecido_por


