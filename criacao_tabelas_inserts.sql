-- ================================================================
-- 1) TABELAS
-- ================================================================

-- Tabela: familias
CREATE TABLE IF NOT EXISTS familias (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  contato VARCHAR(100),
  endereco VARCHAR(200),
  perfil_usuario VARCHAR(100)
);

-- Tabela: profissionais_saude
CREATE TABLE IF NOT EXISTS profissionais_saude (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  especialidade VARCHAR(100),
  certificacoes VARCHAR(200),
  disponibilidade VARCHAR(50),
  avaliacoes DECIMAL(4,2)
);

-- Tabela: instituicoes_cuidado
CREATE TABLE IF NOT EXISTS instituicoes_cuidado (
  id INT PRIMARY KEY,
  nome_instituicao VARCHAR(200),
  localizacao VARCHAR(100),
  tipos_servicos VARCHAR(200),
  avaliacoes DECIMAL(4,2)
);

-- Tabela: servicos_agendados
CREATE TABLE IF NOT EXISTS servicos_agendados (
  id INT PRIMARY KEY,
  data_servico DATE,
  tipo_servico VARCHAR(100),
  status_agendamento VARCHAR(50),
  feedback VARCHAR(255),
  valor_cobrado DECIMAL(10,2),
  familia_id INT,
  profissional_id INT,
  instituicao_id INT
  -- Caso deseje, inclua FOREIGN KEYs ligando estas colunas às tabelas relacionadas.
  -- FOREIGN KEY (familia_id) REFERENCES familias(id),
  -- FOREIGN KEY (profissional_id) REFERENCES profissionais_saude(id),
  -- FOREIGN KEY (instituicao_id) REFERENCES instituicoes_cuidado(id)
);

-- Tabela: pagamentos
CREATE TABLE IF NOT EXISTS pagamentos (
  id INT PRIMARY KEY,
  valor DECIMAL(10,2),
  metodo_pagamento VARCHAR(100),
  data DATE,
  status VARCHAR(50),
  servico_id INT
  -- FOREIGN KEY (servico_id) REFERENCES servicos_agendados(id)
);

-- ================================================================
-- 2) INSERTS
-- ================================================================

-- ------------------------------------------------
-- Tabela: familias
-- ------------------------------------------------
INSERT INTO familias (id, nome, contato, endereco, perfil_usuario) VALUES
(1, 'Familia Silva', 'silva1@email.com', 'Rua A, Numero 1001', 'Perfil Cuidador'),
(2, 'Familia Oliveira', 'silva2@email.com', 'Rua A, Numero 1002', 'Perfil Cuidador'),
(3, 'Familia Santos', 'silva3@email.com', 'Rua A, Numero 1003', 'Perfil Cuidador'),
(4, 'Familia Souza', 'silva4@email.com', 'Rua A, Numero 1004', 'Perfil Cuidador'),
(5, 'Familia Pereira', 'silva5@email.com', 'Rua A, Numero 1005', 'Perfil Cuidador'),
(6, 'Familia Lima', 'silva6@email.com', 'Rua A, Numero 1006', 'Perfil Cuidador'),
(7, 'Familia Almeida', 'silva7@email.com', 'Rua A, Numero 1007', 'Perfil Cuidador'),
(8, 'Familia Costa', 'silva8@email.com', 'Rua A, Numero 1008', 'Perfil Cuidador'),
(9, 'Familia Fernandes', 'silva9@email.com', 'Rua A, Numero 1009', 'Perfil Cuidador'),
(10, 'Familia Rodrigues', 'silva10@email.com', 'Rua A, Numero 10010', 'Perfil Cuidador'),
(11, 'Familia Carvalho', 'silva11@email.com', 'Rua A, Numero 10011', 'Perfil Cuidador'),
(12, 'Familia Gomes', 'silva12@email.com', 'Rua A, Numero 10012', 'Perfil Cuidador'),
(13, 'Familia Martins', 'silva13@email.com', 'Rua A, Numero 10013', 'Perfil Cuidador'),
(14, 'Familia Araujo', 'silva14@email.com', 'Rua A, Numero 10014', 'Perfil Cuidador'),
(15, 'Familia Ribeiro', 'silva15@email.com', 'Rua A, Numero 10015', 'Perfil Cuidador'),
(16, 'Familia Alves', 'silva16@email.com', 'Rua A, Numero 10016', 'Perfil Cuidador'),
(17, 'Familia Cardoso', 'silva17@email.com', 'Rua A, Numero 10017', 'Perfil Cuidador'),
(18, 'Familia Teixeira', 'silva18@email.com', 'Rua A, Numero 10018', 'Perfil Cuidador'),
(19, 'Familia Moreira', 'silva19@email.com', 'Rua A, Numero 10019', 'Perfil Cuidador'),
(20, 'Familia Melo', 'silva20@email.com', 'Rua A, Numero 10020', 'Perfil Cuidador'),
(21, 'Familia Barros', 'silva21@email.com', 'Rua A, Numero 10021', 'Perfil Cuidador'),
(22, 'Familia Freitas', 'silva22@email.com', 'Rua A, Numero 10022', 'Perfil Cuidador'),
(23, 'Familia Pinto', 'silva23@email.com', 'Rua A, Numero 10023', 'Perfil Cuidador'),
(24, 'Familia Castro', 'silva24@email.com', 'Rua A, Numero 10024', 'Perfil Cuidador'),
(25, 'Familia Rocha', 'silva25@email.com', 'Rua A, Numero 10025', 'Perfil Cuidador'),
(26, 'Familia Dias', 'silva26@email.com', 'Rua A, Numero 10026', 'Perfil Cuidador'),
(27, 'Familia Nunes', 'silva27@email.com', 'Rua A, Numero 10027', 'Perfil Cuidador'),
(28, 'Familia Mendes', 'silva28@email.com', 'Rua A, Numero 10028', 'Perfil Cuidador'),
(29, 'Familia Reis', 'silva29@email.com', 'Rua A, Numero 10029', 'Perfil Cuidador'),
(30, 'Familia Campos', 'silva30@email.com', 'Rua A, Numero 10030', 'Perfil Cuidador'),
(31, 'Familia Antunes', 'silva31@email.com', 'Rua A, Numero 10031', 'Perfil Cuidador'),
(32, 'Familia Batista', 'silva32@email.com', 'Rua A, Numero 10032', 'Perfil Cuidador'),
(33, 'Familia Farias', 'silva33@email.com', 'Rua A, Numero 10033', 'Perfil Cuidador'),
(34, 'Familia Correia', 'silva34@email.com', 'Rua A, Numero 10034', 'Perfil Cuidador'),
(35, 'Familia Matos', 'silva35@email.com', 'Rua A, Numero 10035', 'Perfil Cuidador'),
(36, 'Familia Monteiro', 'silva36@email.com', 'Rua A, Numero 10036', 'Perfil Cuidador'),
(37, 'Familia Cunha', 'silva37@email.com', 'Rua A, Numero 10037', 'Perfil Cuidador'),
(38, 'Familia Macedo', 'silva38@email.com', 'Rua A, Numero 10038', 'Perfil Cuidador'),
(39, 'Familia Barreto', 'silva39@email.com', 'Rua A, Numero 10039', 'Perfil Cuidador'),
(40, 'Familia Moraes', 'silva40@email.com', 'Rua A, Numero 10040', 'Perfil Cuidador'),
(41, 'Familia Duarte', 'silva41@email.com', 'Rua A, Numero 10041', 'Perfil Cuidador'),
(42, 'Familia Tavares', 'silva42@email.com', 'Rua A, Numero 10042', 'Perfil Cuidador'),
(43, 'Familia Santiago', 'silva43@email.com', 'Rua A, Numero 10043', 'Perfil Cuidador'),
(44, 'Familia Coelho', 'silva44@email.com', 'Rua A, Numero 10044', 'Perfil Cuidador'),
(45, 'Familia Neves', 'silva45@email.com', 'Rua A, Numero 10045', 'Perfil Cuidador'),
(46, 'Familia Pires', 'silva46@email.com', 'Rua A, Numero 10046', 'Perfil Cuidador'),
(47, 'Familia Peixoto', 'silva47@email.com', 'Rua A, Numero 10047', 'Perfil Cuidador'),
(48, 'Familia Brito', 'silva48@email.com', 'Rua A, Numero 10048', 'Perfil Cuidador'),
(49, 'Familia Magalhaes', 'silva49@email.com', 'Rua A, Numero 10049', 'Perfil Cuidador'),
(50, 'Familia Vieira', 'silva50@email.com', 'Rua A, Numero 10050', 'Perfil Cuidador');

-- ------------------------------------------------
-- Tabela: profissionais_saude
-- ------------------------------------------------
INSERT INTO profissionais_saude (id, nome, especialidade, certificacoes, disponibilidade, avaliacoes) VALUES
(1, 'Dr. Ana Costa', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.04),
(2, 'Dr. Bruno Lima', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.02),
(3, 'Dr. Carla Souza', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.22),
(4, 'Dr. Daniel Pereira', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.63),
(5, 'Dr. Eduardo Santos', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.77),
(6, 'Dr. Fernanda Oliveira', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.27),
(7, 'Dr. Gustavo Almeida', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.57),
(8, 'Dr. Helena Rodrigues', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.51),
(9, 'Dr. Igor Carvalho', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.06),
(10, 'Dr. Juliana Gomes', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.45),
(11, 'Dr. Karla Martins', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.38),
(12, 'Dr. Lucas Araujo', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.36),
(13, 'Dr. Mariana Ribeiro', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.19),
(14, 'Dr. Nelson Alves', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.66),
(15, 'Dr. Olivia Cardoso', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.97),
(16, 'Dr. Pedro Teixeira', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.89),
(17, 'Dr. Renata Moreira', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.18),
(18, 'Dr. Sergio Melo', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.95),
(19, 'Dr. Tatiana Barros', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.79),
(20, 'Dr. Ulysses Freitas', 'Geriatra', 'Certificacao ABC', 'Disponivel', 4.06);

-- ------------------------------------------------
-- Tabela: instituicoes_cuidado
-- ------------------------------------------------
INSERT INTO instituicoes_cuidado (id, nome_instituicao, localizacao, tipos_servicos, avaliacoes) VALUES
(1, 'Lar dos Idosos Sao Jose', 'Cidade A', 'Hospedagem Permanente', 4.13),
(2, 'Lar dos Idosos Sao Jose', 'Cidade A', 'Hospedagem Permanente', 3.26),
(3, 'Lar dos Idosos Sao Jose', 'Cidade A', 'Hospedagem Permanente', 4.50),
(4, 'Lar dos Idosos Sao Jose', 'Cidade A', 'Hospedagem Permanente', 3.88),
(5, 'Lar dos Idosos Sao Jose', 'Cidade A', 'Hospedagem Permanente', 4.05),
(6, 'Lar dos Idosos Sao Jose', 'Cidade A', 'Hospedagem Permanente', 3.28),
(7, 'Lar dos Idosos Sao Jose', 'Cidade A', 'Hospedagem Permanente', 3.23),
(8, 'Lar dos Idosos Sao Jose', 'Cidade A', 'Hospedagem Permanente', 4.27),
(9, 'Lar dos Idosos Sao Jose', 'Cidade A', 'Hospedagem Permanente', 4.10),
(10, 'Lar dos Idosos Sao Jose', 'Cidade A', 'Hospedagem Permanente', 4.87),
(11, 'Casa de Repouso Bela Vida', 'Cidade B', 'Hospedagem Temporária', 4.75),
(12, 'Casa de Repouso Bela Vida', 'Cidade B', 'Hospedagem Temporária', 4.43),
(13, 'Casa de Repouso Bela Vida', 'Cidade B', 'Hospedagem Temporária', 4.87),
(14, 'Casa de Repouso Bela Vida', 'Cidade B', 'Hospedagem Temporária', 4.97),
(15, 'Casa de Repouso Bela Vida', 'Cidade B', 'Hospedagem Temporária', 3.99),
(16, 'Casa de Repouso Bela Vida', 'Cidade B', 'Hospedagem Temporária', 3.57),
(17, 'Casa de Repouso Bela Vida', 'Cidade B', 'Hospedagem Temporária', 4.64),
(18, 'Casa de Repouso Bela Vida', 'Cidade B', 'Hospedagem Temporária', 5.00),
(19, 'Casa de Repouso Bela Vida', 'Cidade B', 'Hospedagem Temporária', 3.39),
(20, 'Casa de Repouso Bela Vida', 'Cidade B', 'Hospedagem Temporária', 4.01),
(21, 'Residencial Senior Vida Nova', 'Cidade C', 'Cuidados Diários', 4.44),
(22, 'Residencial Senior Vida Nova', 'Cidade C', 'Cuidados Diários', 3.47),
(23, 'Residencial Senior Vida Nova', 'Cidade C', 'Cuidados Diários', 4.30),
(24, 'Residencial Senior Vida Nova', 'Cidade C', 'Cuidados Diários', 3.57),
(25, 'Residencial Senior Vida Nova', 'Cidade C', 'Cuidados Diários', 4.81),
(26, 'Residencial Senior Vida Nova', 'Cidade C', 'Cuidados Diários', 4.12),
(27, 'Residencial Senior Vida Nova', 'Cidade C', 'Cuidados Diários', 4.65),
(28, 'Residencial Senior Vida Nova', 'Cidade C', 'Cuidados Diários', 3.88),
(29, 'Residencial Senior Vida Nova', 'Cidade C', 'Cuidados Diários', 3.72),
(30, 'Residencial Senior Vida Nova', 'Cidade C', 'Cuidados Diários', 4.28),
(31, 'Clínica Geriátrica Bem Estar', 'Cidade D', 'Reabilitação Física', 3.38),
(32, 'Clínica Geriátrica Bem Estar', 'Cidade D', 'Reabilitação Física', 3.39),
(33, 'Clínica Geriátrica Bem Estar', 'Cidade D', 'Reabilitação Física', 4.50),
(34, 'Clínica Geriátrica Bem Estar', 'Cidade D', 'Reabilitação Física', 4.32),
(35, 'Clínica Geriátrica Bem Estar', 'Cidade D', 'Reabilitação Física', 4.91),
(36, 'Clínica Geriátrica Bem Estar', 'Cidade D', 'Reabilitação Física', 3.53),
(37, 'Clínica Geriátrica Bem Estar', 'Cidade D', 'Reabilitação Física', 4.78),
(38, 'Clínica Geriátrica Bem Estar', 'Cidade D', 'Reabilitação Física', 3.96),
(39, 'Clínica Geriátrica Bem Estar', 'Cidade D', 'Reabilitação Física', 4.45),
(40, 'Clínica Geriátrica Bem Estar', 'Cidade D', 'Reabilitação Física', 4.60),
(41, 'Centro de Cuidado Viver Melhor', 'Cidade E', 'Cuidados Paliativos', 3.94),
(42, 'Centro de Cuidado Viver Melhor', 'Cidade E', 'Cuidados Paliativos', 3.91),
(43, 'Centro de Cuidado Viver Melhor', 'Cidade E', 'Cuidados Paliativos', 3.99),
(44, 'Centro de Cuidado Viver Melhor', 'Cidade E', 'Cuidados Paliativos', 3.86),
(45, 'Centro de Cuidado Viver Melhor', 'Cidade E', 'Cuidados Paliativos', 3.76),
(46, 'Centro de Cuidado Viver Melhor', 'Cidade E', 'Cuidados Paliativos', 4.96),
(47, 'Centro de Cuidado Viver Melhor', 'Cidade E', 'Cuidados Paliativos', 4.11),
(48, 'Centro de Cuidado Viver Melhor', 'Cidade E', 'Cuidados Paliativos', 3.60),
(49, 'Centro de Cuidado Viver Melhor', 'Cidade E', 'Cuidados Paliativos', 4.71),
(50, 'Centro de Cuidado Viver Melhor', 'Cidade E', 'Cuidados Paliativos', 4.22);

-- ------------------------------------------------
-- Tabela: servicos_agendados
-- ------------------------------------------------
INSERT INTO servicos_agendados
(id, data_servico, tipo_servico, status_agendamento, feedback, valor_cobrado, familia_id, profissional_id, instituicao_id)
VALUES
(1, '2024-01-01', 'Hospedagem Permanente', 'Confirmado', 'Muito bom serviço!', 1492.34, 39, 7, 39),
(2, '2024-01-02', 'Hospedagem Permanente', 'Confirmado', 'Muito bom serviço!', 949.10, 25, 20, 32),
(3, '2024-01-03', 'Hospedagem Permanente', 'Confirmado', 'Muito bom serviço!', 1538.97, 19, 15, 37),
(4, '2024-01-04', 'Hospedagem Permanente', 'Confirmado', 'Muito bom serviço!', 1166.32, 31, 1, 6),
(5, '2024-01-05', 'Hospedagem Permanente', 'Confirmado', 'Muito bom serviço!', 1914.88, 9, 4, 12),
(6, '2024-01-06', 'Hospedagem Permanente', 'Confirmado', 'Muito bom serviço!', 836.32, 7, 16, 17),
(7, '2024-01-07', 'Hospedagem Permanente', 'Confirmado', 'Muito bom serviço!', 1286.84, 32, 19, 7),
(8, '2024-01-08', 'Hospedagem Permanente', 'Confirmado', 'Muito bom serviço!', 866.85, 31, 3, 35),
(9, '2024-01-09', 'Hospedagem Permanente', 'Confirmado', 'Muito bom serviço!', 724.33, 13, 10, 9),
(10, '2024-01-10', 'Hospedagem Permanente', 'Confirmado', 'Muito bom serviço!', 1323.22, 40, 19, 9),
(11, '2024-01-11', 'Hospedagem Temporária', 'Confirmado', 'Muito bom serviço!', 1442.27, 6, 6, 16),
(12, '2024-01-12', 'Hospedagem Temporária', 'Confirmado', 'Muito bom serviço!', 1633.53, 40, 2, 40),
(13, '2024-01-13', 'Hospedagem Temporária', 'Confirmado', 'Muito bom serviço!', 840.76, 28, 18, 14),
(14, '2024-01-14', 'Hospedagem Temporária', 'Confirmado', 'Muito bom serviço!', 1721.13, 39, 10, 8),
(15, '2024-01-15', 'Hospedagem Temporária', 'Confirmado', 'Muito bom serviço!', 861.88, 15, 17, 10),
(16, '2024-01-16', 'Hospedagem Temporária', 'Confirmado', 'Muito bom serviço!', 1182.22, 13, 5, 25),
(17, '2024-01-17', 'Hospedagem Temporária', 'Confirmado', 'Muito bom serviço!', 708.20, 41, 11, 19),
(18, '2024-01-18', 'Hospedagem Temporária', 'Confirmado', 'Muito bom serviço!', 1484.81, 21, 6, 45),
(19, '2024-01-19', 'Hospedagem Temporária', 'Confirmado', 'Muito bom serviço!', 1164.57, 50, 13, 25),
(20, '2024-01-20', 'Hospedagem Temporária', 'Confirmado', 'Muito bom serviço!', 817.13, 46, 1, 18),
(21, '2024-01-21', 'Cuidados Diários', 'Confirmado', 'Muito bom serviço!', 1288.74, 6, 13, 10),
(22, '2024-01-22', 'Cuidados Diários', 'Confirmado', 'Muito bom serviço!', 1392.71, 20, 14, 28),
(23, '2024-01-23', 'Cuidados Diários', 'Confirmado', 'Muito bom serviço!', 1208.46, 23, 18, 18),
(24, '2024-01-24', 'Cuidados Diários', 'Confirmado', 'Muito bom serviço!', 1375.27, 34, 6, 7),
(25, '2024-01-25', 'Cuidados Diários', 'Confirmado', 'Muito bom serviço!', 1634.37, 18, 19, 2),
(26, '2024-01-26', 'Cuidados Diários', 'Confirmado', 'Muito bom serviço!', 1117.47, 6, 10, 38),
(27, '2024-01-27', 'Cuidados Diários', 'Confirmado', 'Muito bom serviço!', 1827.97, 47, 7, 39),
(28, '2024-01-28', 'Cuidados Diários', 'Confirmado', 'Muito bom serviço!', 1231.81, 2, 5, 39),
(29, '2024-01-29', 'Cuidados Diários', 'Confirmado', 'Muito bom serviço!', 1507.36, 50, 2, 4),
(30, '2024-01-30', 'Cuidados Diários', 'Confirmado', 'Muito bom serviço!', 510.75, 1, 2, 43),
(31, '2024-01-31', 'Reabilitação Física', 'Confirmado', 'Muito bom serviço!', 1395.35, 16, 6, 42),
(32, '2024-01-32', 'Reabilitação Física', 'Confirmado', 'Muito bom serviço!', 1110.32, 43, 5, 11),
(33, '2024-01-33', 'Reabilitação Física', 'Confirmado', 'Muito bom serviço!', 1000.81, 4, 15, 7),
(34, '2024-01-34', 'Reabilitação Física', 'Confirmado', 'Muito bom serviço!', 1538.52, 47, 19, 9),
(35, '2024-01-35', 'Reabilitação Física', 'Confirmado', 'Muito bom serviço!', 609.58, 37, 6, 47),
(36, '2024-01-36', 'Reabilitação Física', 'Confirmado', 'Muito bom serviço!', 1161.48, 2, 8, 24),
(37, '2024-01-37', 'Reabilitação Física', 'Confirmado', 'Muito bom serviço!', 1093.55, 28, 20, 18),
(38, '2024-01-38', 'Reabilitação Física', 'Confirmado', 'Muito bom serviço!', 1708.47, 47, 4, 12),
(39, '2024-01-39', 'Reabilitação Física', 'Confirmado', 'Muito bom serviço!', 1824.84, 43, 5, 11),
(40, '2024-01-40', 'Reabilitação Física', 'Confirmado', 'Muito bom serviço!', 1947.38, 43, 1, 17),
(41, '2024-01-41', 'Cuidados Paliativos', 'Confirmado', 'Muito bom serviço!', 774.48, 36, 18, 27),
(42, '2024-01-42', 'Cuidados Paliativos', 'Confirmado', 'Muito bom serviço!', 786.25, 13, 18, 21),
(43, '2024-01-43', 'Cuidados Paliativos', 'Confirmado', 'Muito bom serviço!', 1225.01, 25, 5, 8),
(44, '2024-01-44', 'Cuidados Paliativos', 'Confirmado', 'Muito bom serviço!', 1847.73, 29, 11, 20),
(45, '2024-01-45', 'Cuidados Paliativos', 'Confirmado', 'Muito bom serviço!', 1708.62, 43, 14, 30),
(46, '2024-01-46', 'Cuidados Paliativos', 'Confirmado', 'Muito bom serviço!', 932.90, 47, 3, 28),
(47, '2024-01-47', 'Cuidados Paliativos', 'Confirmado', 'Muito bom serviço!', 1163.22, 20, 2, 11),
(48, '2024-01-48', 'Cuidados Paliativos', 'Confirmado', 'Muito bom serviço!', 1212.41, 43, 14, 18),
(49, '2024-01-49', 'Cuidados Paliativos', 'Confirmado', 'Muito bom serviço!', 1200.74, 34, 2, 30),
(50, '2024-01-50', 'Cuidados Paliativos', 'Confirmado', 'Muito bom serviço!', 1729.42, 34, 18, 50);

-- ------------------------------------------------
-- Tabela: pagamentos
-- ------------------------------------------------
INSERT INTO pagamentos (id, valor, metodo_pagamento, data, status, servico_id) VALUES
(1, 1492.34, 'Cartao de Credito', '2024-01-01', 'Confirmado', 28),
(2, 949.10, 'Cartao de Credito', '2024-01-02', 'Confirmado', 11),
(3, 1538.97, 'Cartao de Credito', '2024-01-03', 'Confirmado', 43),
(4, 1166.32, 'Cartao de Credito', '2024-01-04', 'Confirmado', 48),
(5, 1914.88, 'Cartao de Credito', '2024-01-05', 'Confirmado', 26),
(6, 836.32, 'Cartao de Credito', '2024-01-06', 'Confirmado', 47),
(7, 1286.84, 'Cartao de Credito', '2024-01-07', 'Confirmado', 35),
(8, 866.85, 'Cartao de Credito', '2024-01-08', 'Confirmado', 3),
(9, 724.33, 'Cartao de Credito', '2024-01-09', 'Confirmado', 9),
(10, 1323.22, 'Cartao de Credito', '2024-01-10', 'Confirmado', 4),
(11, 1442.27, 'Cartao de Credito', '2024-01-11', 'Confirmado', 35),
(12, 1633.53, 'Cartao de Credito', '2024-01-12', 'Confirmado', 19),
(13, 840.76, 'Cartao de Credito', '2024-01-13', 'Confirmado', 10),
(14, 1721.13, 'Cartao de Credito', '2024-01-14', 'Confirmado', 3),
(15, 861.88, 'Cartao de Credito', '2024-01-15', 'Confirmado', 30),
(16, 1182.22, 'Cartao de Credito', '2024-01-16', 'Confirmado', 22),
(17, 708.20, 'Cartao de Credito', '2024-01-17', 'Confirmado', 39),
(18, 1484.81, 'Cartao de Credito', '2024-01-18', 'Confirmado', 35),
(19, 1164.57, 'Cartao de Credito', '2024-01-19', 'Confirmado', 46),
(20, 817.13, 'Cartao de Credito', '2024-01-20', 'Confirmado', 18),
(21, 1288.74, 'Cartao de Credito', '2024-01-21', 'Confirmado', 6),
(22, 1392.71, 'Cartao de Credito', '2024-01-22', 'Confirmado', 30),
(23, 1208.46, 'Cartao de Credito', '2024-01-23', 'Confirmado', 30),
(24, 1375.27, 'Cartao de Credito', '2024-01-24', 'Confirmado', 25),
(25, 1634.37, 'Cartao de Credito', '2024-01-25', 'Confirmado', 33),
(26, 1117.47, 'Cartao de Credito', '2024-01-26', 'Confirmado', 1),
(27, 1827.97, 'Cartao de Credito', '2024-01-27', 'Confirmado', 26),
(28, 1231.81, 'Cartao de Credito', '2024-01-28', 'Confirmado', 32),
(29, 1507.36, 'Cartao de Credito', '2024-01-29', 'Confirmado', 39),
(30, 510.75, 'Cartao de Credito', '2024-01-30', 'Confirmado', 4),
(31, 1395.35, 'Cartao de Credito', '2024-01-31', 'Confirmado', 29),
(32, 1110.32, 'Cartao de Credito', '2024-01-32', 'Confirmado', 11),
(33, 1000.81, 'Cartao de Credito', '2024-01-33', 'Confirmado', 44),
(34, 1538.52, 'Cartao de Credito', '2024-01-34', 'Confirmado', 10),
(35, 609.58, 'Cartao de Credito', '2024-01-35', 'Confirmado', 8),
(36, 1161.48, 'Cartao de Credito', '2024-01-36', 'Confirmado', 32),
(37, 1093.55, 'Cartao de Credito', '2024-01-37', 'Confirmado', 22),
(38, 1708.47, 'Cartao de Credito', '2024-01-38', 'Confirmado', 26),
(39, 1824.84, 'Cartao de Credito', '2024-01-39', 'Confirmado', 33),
(40, 1947.38, 'Cartao de Credito', '2024-01-40', 'Confirmado', 37),
(41, 774.48, 'Cartao de Credito', '2024-01-41', 'Confirmado', 34),
(42, 786.25, 'Cartao de Credito', '2024-01-42', 'Confirmado', 46),
(43, 1225.01, 'Cartao de Credito', '2024-01-43', 'Confirmado', 2),
(44, 1847.73, 'Cartao de Credito', '2024-01-44', 'Confirmado', 18),
(45, 1708.62, 'Cartao de Credito', '2024-01-45', 'Confirmado', 19),
(46, 932.90, 'Cartao de Credito', '2024-01-46', 'Confirmado', 19),
(47, 1163.22, 'Cartao de Credito', '2024-01-47', 'Confirmado', 18),
(48, 1212.41, 'Cartao de Credito', '2024-01-48', 'Confirmado', 10),
(49, 1200.74, 'Cartao de Credito', '2024-01-49', 'Confirmado', 17),
(50, 1729.42, 'Cartao de Credito', '2024-01-50', 'Confirmado', 20);

-- Fim do script