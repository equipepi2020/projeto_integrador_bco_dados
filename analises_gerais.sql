SELECT * FROM familias;
SELECT * FROM profissionais_saude;
SELECT * FROM instituicoes_cuidado;
SELECT * FROM servicos_agendados;
SELECT * FROM pagamentos;

-- Contagem de registros por tipo de serviço

SELECT tipo_servico,
       COUNT(*) AS total_servicos
FROM servicos_agendados
GROUP BY tipo_servico;

-- Média de valor cobrado por tipo de serviço

SELECT tipo_servico,
       AVG(valor_cobrado) AS valor_medio
FROM servicos_agendados
GROUP BY tipo_servico;

-- Top 5 serviços mais caros

SELECT *
FROM servicos_agendados
ORDER BY valor_cobrado DESC
LIMIT 5;

-- Família × Serviço

SELECT f.nome AS familia,
       sa.tipo_servico,
       sa.data_servico,
       sa.valor_cobrado
FROM servicos_agendados sa
JOIN familias f ON sa.familia_id = f.id
ORDER BY sa.data_servico;

-- Prestação de serviço: Profissional × Instituição

SELECT p.nome AS profissional,
       i.nome_instituicao,
       COUNT(sa.id) AS total_servicos
FROM servicos_agendados sa
JOIN profissionais_saude p ON sa.profissional_id = p.id
JOIN instituicoes_cuidado i ON sa.instituicao_id = i.id
GROUP BY p.nome, i.nome_instituicao
ORDER BY total_servicos DESC;

-- Ranking de instituições por feedback (ou avaliação)

SELECT i.nome_instituicao,
       COUNT(sa.id) AS qtd_servicos,
       AVG(i.avaliacoes) AS avaliacao_media
FROM servicos_agendados sa
JOIN instituicoes_cuidado i ON sa.instituicao_id = i.id
GROUP BY i.id
ORDER BY avaliacao_media DESC;

-- Query para Preparar Dados

WITH cte_gastos AS (
    SELECT familia_id,
           COUNT(*) AS qtd_servicos,
           SUM(valor_cobrado) AS gasto_total,
           AVG(valor_cobrado) AS gasto_medio
    FROM servicos_agendados
    GROUP BY familia_id
)
SELECT f.nome AS familia,
       c.gasto_total,
       c.gasto_medio
FROM cte_gastos c
JOIN familias f ON f.id = c.familia_id
ORDER BY c.gasto_total DESC;










