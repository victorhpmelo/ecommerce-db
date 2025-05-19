-- 1. Distribuição de indivíduos por faixa de escolaridade
SELECT Escolaridade, COUNT(*) AS Quantidade
FROM socio_economico
GROUP BY Escolaridade;

-- 2. Correlação entre escolaridade e renda mensal
SELECT Escolaridade, Renda_Mensal, COUNT(*) AS Quantidade
FROM socio_economico
GROUP BY Escolaridade, Renda_Mensal
ORDER BY Escolaridade;

-- 3. Média de idade por ocupação
SELECT Ocupacao, AVG(Idade) AS Media_Idade
FROM socio_economico
GROUP BY Ocupacao;

-- 4. Proporção de gêneros por estado civil
SELECT Estado_Civil, Genero, COUNT(*) AS Quantidade
FROM socio_economico
GROUP BY Estado_Civil, Genero;

-- 5. Cinco cidades com maior número de indivíduos com renda acima de 5 salários mínimos
SELECT Cidade, COUNT(*) AS Quantidade
FROM socio_economico
WHERE Renda_Mensal IN ('5 a 10 SM', '> 10 SM')
GROUP BY Cidade
ORDER BY Quantidade DESC
LIMIT 5;

-- 6. Estados com maior concentração de indivíduos com nível superior completo
SELECT Estado, COUNT(*) AS Quantidade
FROM socio_economico
WHERE Escolaridade = 'Superior Completo'
GROUP BY Estado
ORDER BY Quantidade DESC;

-- 7. Ocupação mais comum entre indivíduos com ensino médio completo
SELECT Ocupacao, COUNT(*) AS Quantidade
FROM socio_economico
WHERE Escolaridade = 'Médio Completo'
GROUP BY Ocupacao
ORDER BY Quantidade DESC
LIMIT 1;

-- 8. Mais indivíduos solteiros ou casados entre os desempregados
SELECT Estado_Civil, COUNT(*) AS Quantidade
FROM socio_economico
WHERE Ocupacao = 'Desempregado'
GROUP BY Estado_Civil;

-- 9. Média de idade dos indivíduos aposentados e casados por estado
SELECT Estado, AVG(Idade) AS Media_Idade
FROM socio_economico
WHERE Ocupacao = 'Aposentado' AND Estado_Civil = 'Casado'
GROUP BY Estado;

-- 10. Perfil médio do cidadão brasileiro (exemplos)
-- Escolaridade mais comum
SELECT Escolaridade, COUNT(*) AS Quantidade
FROM socio_economico
GROUP BY Escolaridade
ORDER BY Quantidade DESC
LIMIT 1;

-- Ocupação mais comum
SELECT Ocupacao, COUNT(*) AS Quantidade
FROM socio_economico
GROUP BY Ocupacao
ORDER BY Quantidade DESC
LIMIT 1;

-- Estado mais representado
SELECT Estado, COUNT(*) AS Quantidade
FROM socio_economico
GROUP BY Estado
ORDER BY Quantidade DESC
LIMIT 1;
