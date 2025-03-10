/* 
  Consulta SQL única que retorna informações integradas:
  - Dados do serviço agendado (data, tipo, status, feedback, valor cobrado)
  - Família responsável pelo agendamento
  - Profissional de saúde envolvido
  - Instituição de cuidado onde o serviço será prestado
  - Informações de pagamento associadas ao serviço (caso existam)
*/

SELECT
    /* ID do serviço agendado */
    sa.id AS servico_id,

    /* Data do serviço no formato AAAA-MM-DD (ou AAAA-MM-DD HH:MM:SS) */
    sa.data_servico,

    /* Tipo do serviço (Hospedagem, Cuidados Diários, Reabilitação etc.) */
    sa.tipo_servico,

    /* Status do agendamento: Confirmado, Pendente etc. */
    sa.status_agendamento,

    /* Feedback ou comentário deixado pela família sobre o serviço */
    sa.feedback,

    /* Valor cobrado pelo serviço */
    sa.valor_cobrado,

    /* Nome da família que solicitou o serviço */
    f.nome AS familia_solicitante,

    /* Contato (email, telefone) da família */
    f.contato AS contato_familia,

    /* Endereço da família (caso relevante) */
    f.endereco AS endereco_familia,

    /* Nome do profissional de saúde que executará (ou executou) o serviço */
    p.nome AS profissional_responsavel,

    /* Especialidade do profissional (Geriatra, Fisioterapeuta etc.) */
    p.especialidade,

    /* Disponibilidade do profissional (Disponível, Ocupado etc.) */
    p.disponibilidade,

    /* Nome da instituição de cuidado onde o serviço será prestado */
    i.nome_instituicao,

    /* Localização geográfica da instituição (Cidade, Estado etc.) */
    i.localizacao,

    /* Avaliação geral da instituição (média ou nota de usuários) */
    i.avaliacoes AS avaliacao_instituicao,

    /* ------------------------------------------------------------- */
    /* Campos da tabela de pagamentos (se quiser integrar):
       Caso o serviço tenha um pagamento associado.
       Uso de LEFT JOIN para exibir mesmo serviços sem pagamento. */
    pg.id AS pagamento_id,
    pg.valor AS valor_pagamento,
    pg.metodo_pagamento,
    pg.data AS data_pagamento,
    pg.status AS status_pagamento

FROM
    /* Tabela de serviços agendados */
    servicos_agendados AS sa

    /* Associação com a tabela de famílias via chave estrangeira familia_id */
    JOIN familias AS f
        ON sa.familia_id = f.id

    /* Associação com a tabela de profissionais via chave estrangeira profissional_id */
    JOIN profissionais_saude AS p
        ON sa.profissional_id = p.id

    /* Associação com a tabela de instituições via chave estrangeira instituicao_id */
    JOIN instituicoes_cuidado AS i
        ON sa.instituicao_id = i.id

    /* Associação com pagamentos (LEFT JOIN pois pode haver serviço sem pagamento ainda) */
    LEFT JOIN pagamentos AS pg
        ON pg.servico_id = sa.id

/* Ordena os resultados pela data do serviço (ascendente) */
ORDER BY
    sa.data_servico ASC;
