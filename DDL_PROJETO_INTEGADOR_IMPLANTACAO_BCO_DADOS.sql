--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      P_DU0110_BGEO_SIGSP_GEOPORTAL
--
-- Date Created : Thursday, November 28, 2024 00:02:35
-- Target DBMS : PostgreSQL 10.x-12.x
--

-- 
-- TABLE: familia 
--

CREATE TABLE familia(
    cd_identificador_familia    integer         NOT NULL,
    nm_familia                  varchar(254),
    nm_contato                  varchar(254),
    tx_endereco                 text,
    cd_identificador_perfil     integer         NOT NULL,
    CONSTRAINT PKfamilia PRIMARY KEY (cd_identificador_familia)
)
;



-- 
-- TABLE: instituicao_cuidado 
--

CREATE TABLE instituicao_cuidado(
    cd_identificador_instituicao_cuidado    integer           NOT NULL,
    nm_instituicao                          varchar(254),
    texto_endereco                          varchar(254),
    tp_servico                              varchar(20),
    nm_avaliacao                            numeric(10, 2),
    CONSTRAINT PKinstituicao_cuidado PRIMARY KEY (cd_identificador_instituicao_cuidado)
)
;



-- 
-- TABLE: instituicao_servico 
--

CREATE TABLE instituicao_servico(
    cd_identificador_instituicao_cuidado    integer    NOT NULL,
    cd_identificador_tipo_servico           integer    NOT NULL,
    CONSTRAINT PK927 PRIMARY KEY (cd_identificador_instituicao_cuidado, cd_identificador_tipo_servico)
)
;



-- 
-- TABLE: metodo_pagamento 
--

CREATE TABLE metodo_pagamento(
    cd_identificador_metodo    integer         NOT NULL,
    tp_pagamento               varchar(100),
    CONSTRAINT PKmetodo_pagamento PRIMARY KEY (cd_identificador_metodo)
)
;



-- 
-- TABLE: pagamento 
--

CREATE TABLE pagamento(
    cd_identificador_pagamento    integer           NOT NULL,
    qt_valor                      numeric(20, 2),
    dt_pagamento                  date,
    st_pagamento                  varchar(30),
    cd_identificador_metodo       integer           NOT NULL,
    CONSTRAINT PKpagamento PRIMARY KEY (cd_identificador_pagamento)
)
;



-- 
-- TABLE: perfil_usuario 
--

CREATE TABLE perfil_usuario(
    cd_identificador_perfil    integer         NOT NULL,
    tp_perfil_usuario          varchar(150),
    CONSTRAINT PKperfil_usuario PRIMARY KEY (cd_identificador_perfil)
)
;



-- 
-- TABLE: profissional_saude 
--

CREATE TABLE profissional_saude(
    cd_identificador_profissional    integer         NOT NULL,
    nm_profissional                  varchar(254),
    tx_certificacao                  varchar(100),
    tx_disponibilidade               varchar(150),
    tx_avaliacao                     varchar(100),
    CONSTRAINT PKprofissional_saude PRIMARY KEY (cd_identificador_profissional)
)
;



-- 
-- TABLE: profissional_saude_especialidade 
--

CREATE TABLE profissional_saude_especialidade(
    cd_identificador_profissional     integer    NOT NULL,
    cd_identificador_especialidade    integer    NOT NULL,
    CONSTRAINT PK926 PRIMARY KEY (cd_identificador_profissional, cd_identificador_especialidade)
)
;



-- 
-- TABLE: servico_agendado 
--

CREATE TABLE servico_agendado(
    cd_identificador_servico                integer           NOT NULL,
    dt_servico                              date,
    st_situacao                             varchar(100),
    tx_feedback                             text,
    qt_valor_cobrado                        numeric(12, 2),
    cd_identificador_familia                integer           NOT NULL,
    cd_identificador_instituicao_cuidado    integer           NOT NULL,
    cd_identificador_pagamento              integer           NOT NULL,
    cd_identificador_profissional           integer           NOT NULL,
    CONSTRAINT PK919 PRIMARY KEY (cd_identificador_servico)
)
;



-- 
-- TABLE: tipo_especialidade 
--

CREATE TABLE tipo_especialidade(
    cd_identificador_especialidade    integer         NOT NULL,
    nm_tipo_especialidade             varchar(150),
    CONSTRAINT PKtipo_especialidade PRIMARY KEY (cd_identificador_especialidade)
)
;



-- 
-- TABLE: tipo_servico 
--

CREATE TABLE tipo_servico(
    cd_identificador_tipo_servico    integer         NOT NULL,
    tp_servico                       varchar(254),
    CONSTRAINT PKtipo_servico PRIMARY KEY (cd_identificador_tipo_servico)
)
;



-- 
-- VIEW: v_servico_agendado 
--

CREATE VIEW v_servico_agendado  AS
SELECT se.dt_servico, 
se.st_situacao, 
se.tx_feedback, 
se.qt_valor_cobrado, 
fa.nm_familia, 
fa.nm_contato, 
fa.tx_endereco, 
pa.qt_valor, 
pa.dt_pagamento, 
pa.st_pagamento, 
pr.nm_profissional, 
pr.tx_certificacao, 
pr.tx_disponibilidade, 
pr.tx_avaliacao, 
ins.nm_instituicao, 
ins.texto_endereco, 
ins.tp_servico, 
ins.nm_avaliacao, 
me.tp_pagamento, 
pe.tp_perfil_usuario, 
ti.nm_tipo_especialidade
FROM 
servico_agendado se, 
familia fa, pagamento pa, 
profissional_saude pr, 
instituicao_cuidado ins, 
metodo_pagamento me, 
perfil_usuario pe, 
tipo_especialidade ti, 
tipo_servico tip
WHERE 
se.cd_identificador_familia = fa.cd_identificador_familia 
AND se.cd_identificador_pagamento = pa.cd_identificador_pagamento 
AND se.cd_identificador_profissional = pr.cd_identificador_profissional 
AND se.cd_identificador_instituicao_cuidado = ins.cd_identificador_instituicao_cuidado 
AND pa.cd_identificador_metodo = me.cd_identificador_metodo 
AND fa.cd_identificador_perfil = pe.cd_identificador_perfil
;

-- 
-- TABLE: familia 
--

ALTER TABLE familia ADD CONSTRAINT Refperfil_usuario584 
    FOREIGN KEY (cd_identificador_perfil)
    REFERENCES perfil_usuario(cd_identificador_perfil)
;


-- 
-- TABLE: instituicao_servico 
--

ALTER TABLE instituicao_servico ADD CONSTRAINT Reftipo_servico595 
    FOREIGN KEY (cd_identificador_tipo_servico)
    REFERENCES tipo_servico(cd_identificador_tipo_servico)
;

ALTER TABLE instituicao_servico ADD CONSTRAINT Refinstituicao_cuidado596 
    FOREIGN KEY (cd_identificador_instituicao_cuidado)
    REFERENCES instituicao_cuidado(cd_identificador_instituicao_cuidado)
;


-- 
-- TABLE: pagamento 
--

ALTER TABLE pagamento ADD CONSTRAINT Refmetodo_pagamento589 
    FOREIGN KEY (cd_identificador_metodo)
    REFERENCES metodo_pagamento(cd_identificador_metodo)
;


-- 
-- TABLE: profissional_saude_especialidade 
--

ALTER TABLE profissional_saude_especialidade ADD CONSTRAINT Refprofissional_saude597 
    FOREIGN KEY (cd_identificador_profissional)
    REFERENCES profissional_saude(cd_identificador_profissional)
;

ALTER TABLE profissional_saude_especialidade ADD CONSTRAINT Reftipo_especialidade598 
    FOREIGN KEY (cd_identificador_especialidade)
    REFERENCES tipo_especialidade(cd_identificador_especialidade)
;


-- 
-- TABLE: servico_agendado 
--

ALTER TABLE servico_agendado ADD CONSTRAINT Reffamilia585 
    FOREIGN KEY (cd_identificador_familia)
    REFERENCES familia(cd_identificador_familia)
;

ALTER TABLE servico_agendado ADD CONSTRAINT Refinstituicao_cuidado586 
    FOREIGN KEY (cd_identificador_instituicao_cuidado)
    REFERENCES instituicao_cuidado(cd_identificador_instituicao_cuidado)
;

ALTER TABLE servico_agendado ADD CONSTRAINT Refpagamento588 
    FOREIGN KEY (cd_identificador_pagamento)
    REFERENCES pagamento(cd_identificador_pagamento)
;

ALTER TABLE servico_agendado ADD CONSTRAINT Refprofissional_saude590 
    FOREIGN KEY (cd_identificador_profissional)
    REFERENCES profissional_saude(cd_identificador_profissional)
;


