-- Jemisse Macuacua;
-- Jessica Pondja

INSERT INTO Pais (Nome, Sigla) VALUES
('Moçambique', 'MOZ'),
('África do Sul', 'ZAF'),
('Portugal', 'PRT'),
('Brasil', 'BRA'),
('Tanzânia', 'TZA'),
('Quénia', 'KEN'),
('Angola', 'AGO'),
('Zimbabwe', 'ZWE'),
('Somália', 'SOM'),
('Nigéria', 'NGA');


INSERT INTO Provincia (Nome, ID_Pais, Sigla) VALUES
('Maputo', 1, 'MPM'),
('Cabo Delgado', 1, 'CD'),
('Nampula', 1, 'NPL'),
('Maputo Cidade', 1, 'MPC'),
('Gaza', 1, 'GZA'),
('Gauteng', 2, 'GT'),
('Lisboa', 3, 'LX'),
('São Paulo', 4, 'SP'),
('Dar es Salaam', 5, 'DSM'),
('Nairobi', 6, 'NRB');


INSERT INTO Cidade (Nome, ID_Provincia, Codigo_IBGE, Latitude, Longitude) VALUES
('Maputo', 1, NULL, -25.965530, 32.583220),
('Pemba', 2, NULL, -12.960833, 40.507778),
('Nampula', 3, NULL, -15.116667, 39.266667),
('Matola', 4, NULL, -25.966667, 32.466667),
('Xai-Xai', 5, NULL, -25.051944, 33.644167),
('Johanesburgo', 6, NULL, -26.204361, 28.041639),
('Lisboa', 7, NULL, 38.722252, -9.139337),
('São Paulo', 8, NULL, -23.550520, -46.633308),
('Dar es Salaam', 9, NULL, -6.792354, 39.208328),
('Nairobi', 10, NULL, -1.286389, 36.817223);

INSERT INTO Pessoa (Nome, Sobrenome, Data_Nascimento, Genero, Nacionalidade, Altura, Foto) VALUES
('Ahmed', 'Al-Rashid', '1985-03-15', 'M', 'Somali', 175, 'ahmed_ar.jpg'),        
('Carlos', 'Mabunda', '1990-07-22', 'M', 'Moçambicana', 182, 'carlos_m.jpg'),    
('Fatima', 'Hassan', '1988-11-30', 'F', 'Somali', 165, 'fatima_h.jpg'),          
('José', 'Silva', '1982-05-10', 'M', 'Portuguesa', 178, 'jose_s.jpg'),           
('Maria', 'Santos', '1995-02-18', 'F', 'Brasileira', 168, 'maria_s.jpg'),        
('Omar', 'Kenyatta', '1987-09-25', 'M', 'Queniana', 170, 'omar_k.jpg'),          
('Ana', 'Nguyen', '1992-12-05', 'F', 'Moçambicana', 172, 'ana_n.jpg'),           
('David', 'Nkomo', '1975-04-20', 'M', 'Zimbabwe', 185, 'david_n.jpg'),           
('Elena', 'Gomes', '1989-06-15', 'F', 'Angolana', 160, 'elena_g.jpg'),           
('Paulo', 'Chissano', '1980-08-12', 'M', 'Moçambicana', 180, 'paulo_c.jpg');     

INSERT INTO TipoDocumento (Descricao, Validade_Obrigatoria) VALUES
('Bilhete de Identidade', TRUE),
('Passaporte', TRUE),
('Carta de Condução', TRUE),
('DIRE', FALSE),
('Número de Contribuinte', FALSE),
('Cartão de Eleitor', TRUE),
('Visto', TRUE),
('Certidão de Nascimento', FALSE),
('Cartão de Residente', TRUE),
('Documento de Refugiado', TRUE);

INSERT INTO DocumentoIdentidade (ID_TipoDocumento, Numero_Documento, ID_Pessoa, Data_Emissao, Data_Validade, Orgao_Emissor) VALUES
(1, 'BI1234567890', 1, '2020-01-15', '2030-01-15', 'MINT'),         
(2, 'PP12345678', 1, '2021-03-20', '2031-03-20', 'MINT'),           
(2, 'PP87654321', 2, '2019-05-10', '2029-05-10', 'MINT'),          
(3, 'CD11223344', 2, '2020-01-15', '2030-01-15', 'MINT'),          
(2, 'PP11223344', 4, '2022-02-18', '2032-02-18', 'SEF'),            
(1, 'BI5566778899', 4, '2020-11-30', '2030-11-30', 'SEF'),         
(2, 'PP33445566', 5, '2021-09-15', '2031-09-15', 'PF'),             
(1, 'BI7788990011', 5, '2022-04-10', '2032-04-10', 'MINT'),         
(2, 'PP99887766', 7, '2019-08-20', '2029-08-20', 'MINT'),           
(2, 'PP2233445566', 10, '2020-12-05', '2030-12-05', 'MINT');        


INSERT INTO TipoBiometria (Descricao, Tecnologia) VALUES
('Impressão Digital', 'AFIS'),
('Reconhecimento Facial', 'Neural Networks'),
('Reconhecimento de Iris', 'IrisScan'),
('Reconhecimento de Voz', 'VoiceID'),
('Geometria da Mão', 'HandGeometry'),
('Padrão Venoso', 'VeinPattern'),
('DNA', 'Sequenciamento'),
('Assinatura', 'DynamicAnalysis'),
('Marcha', 'GaitAnalysis'),
('Termografia Facial', 'InfraredScan');

INSERT INTO Biometria (ID_TipoBiometria, ID_Pessoa, Data_Coleta, Dados, Qualidade) VALUES
(1, 1, '2024-01-10 09:30:00', 'digital_ahmed_1.bin', 85),           
(4, 2, '2024-02-15 10:00:00', 'voz_carlos_1.bin', 92),              
(1, 2, '2024-02-15 10:05:00', 'digital_carlos_1.bin', 88),          
(1, 3, '2024-03-20 11:15:00', 'digital_fatima_1.bin', 90),          
(4, 5, '2024-04-05 14:30:00', 'voz_maria_1.bin', 94),              
(2, 5, '2024-04-05 14:35:00', 'facial_maria_1.bin', 89),            
(1, 6, '2024-05-12 16:45:00', 'digital_omar_1.bin', 87),            
(4, 8, '2024-06-18 10:20:00', 'voz_david_1.bin', 91),               
(4, 9, '2024-07-10 15:20:00', 'voz_elena_1.bin', 88),               
(1, 9, '2024-07-10 15:25:00', 'digital_elena_1.bin', 93);           

INSERT INTO TipoCrime (Descricao, Codigo_Penal, Gravidade, Tempo_Prescrecao) VALUES
('Terrorismo', 'Art. 300', 'Muito Grave', 20),
('Tráfico de Drogas', 'Art. 278', 'Grave', 15),
('Financiamento ao Terrorismo', 'Art. 301', 'Muito Grave', 20),
('Roubo Qualificado', 'Art. 210', 'Grave', 10),
('Homicídio', 'Art. 138', 'Muito Grave', 20),
('Fraude', 'Art. 400', 'Médio', 7),
('Corrupção', 'Art. 320', 'Grave', 12),
('Sequestro', 'Art. 158', 'Muito Grave', 20),
('Furto', 'Art. 205', 'Leve', 5),
('Lavagem de Dinheiro', 'Art. 368', 'Grave', 15);

INSERT INTO RegistroCriminal (ID_Pessoa, ID_TipoCrime, Data_Registro, Data_Ocorrencia, Situacao, Sentenca) VALUES
(1, 1, '2024-01-15', '2023-12-20', 'Condenado', '15 anos de prisão'),        
(2, 2, '2024-02-20', '2024-01-15', 'Processado', NULL),                      
(3, 1, '2024-03-10', '2024-02-28', 'Investigação', NULL),                    
(4, 2, '2024-04-05', '2024-03-22', 'Condenado', '8 anos de prisão'),        
(6, 1, '2024-05-18', '2024-04-30', 'Processado', NULL),                    
(7, 2, '2024-06-22', '2024-05-10', 'Condenado', '10 anos de prisão'),        
(8, 1, '2024-07-30', '2024-06-15', 'Investigação', NULL),                    
(10, 2, '2024-08-12', '2024-07-01', 'Processado', NULL),                   
(1, 3, '2024-09-05', '2024-08-20', 'Investigação', NULL),                   
(6, 10, '2024-10-18', '2024-09-10', 'Condenado', '5 anos de prisão');       

INSERT INTO Localizacao (ID_Pessoa, ID_Cidade, Data_hora, Latitude, Longitude, Precisao, Fonte) VALUES
(1, 1, '2024-11-01 14:30:00', -25.96553, 32.58322, 10.5, 'GPS'),           
(1, 1, '2024-10-15 09:15:00', -25.97000, 32.58500, 15.2, 'CCTV'),         
(3, 1, '2024-11-10 16:45:00', -25.96553, 32.58322, 8.7, 'Celular'),        
(6, 1, '2024-12-15 11:20:00', -25.96553, 32.58322, 12.3, 'GPS'),           
(8, 1, '2024-11-20 13:10:00', -25.96000, 32.58000, 9.8, 'CCTV'),           
(2, 1, '2024-10-25 10:05:00', -25.965530, 32.583220, 20.1, 'Celular'),     
(4, 1, '2024-09-01 17:30:00', -25.965530, 32.583220, 7.5, 'GPS'),          
(7, 1, '2024-12-05 08:45:00', -25.966667, 32.466667, 14.6, 'CCTV'),        
(10, 1, '2024-11-25 12:15:00', -25.965000, 32.583000, 11.2, 'Celular'),    
(5, 1, '2024-12-10 19:20:00', -25.96553, 32.58322, 6.9, 'GPS');            

INSERT INTO Avistada (ID_Localizacao, ID_Pessoa_Avistada, ID_Pessoa_Testemunha, Confirmacao) VALUES
(1, 1, 2, TRUE),      
(2, 1, NULL, FALSE),    
(3, 3, 4, TRUE),        
(4, 6, NULL, TRUE),     
(5, 8, 7, TRUE),       
(6, 2, 5, FALSE),       
(7, 4, NULL, TRUE),     
(8, 7, 9, TRUE),        
(9, 10, 8, FALSE),     
(10, 5, NULL, TRUE);    


INSERT INTO DocumentoIdentidade (ID_TipoDocumento, Numero_Documento, ID_Pessoa, Data_Emissao, Data_Validade, Orgao_Emissor) VALUES
(1, 'BI3344556677', 9, '2021-05-20', '2031-05-20', 'MINT'),         
(3, 'CD7788990011', 9, '2022-03-15', '2032-03-15', 'MINT');         

SELECT 'Pais' AS Tabela, COUNT(*) AS Total FROM Pais
UNION ALL SELECT 'Provincia', COUNT(*) FROM Provincia
UNION ALL SELECT 'Cidade', COUNT(*) FROM Cidade
UNION ALL SELECT 'Pessoa', COUNT(*) FROM Pessoa
UNION ALL SELECT 'TipoDocumento', COUNT(*) FROM TipoDocumento
UNION ALL SELECT 'DocumentoIdentidade', COUNT(*) FROM DocumentoIdentidade
UNION ALL SELECT 'TipoBiometria', COUNT(*) FROM TipoBiometria
UNION ALL SELECT 'Biometria', COUNT(*) FROM Biometria
UNION ALL SELECT 'TipoCrime', COUNT(*) FROM TipoCrime
UNION ALL SELECT 'RegistroCriminal', COUNT(*) FROM RegistroCriminal
UNION ALL SELECT 'Localizacao', COUNT(*) FROM Localizacao
UNION ALL SELECT 'Avistada', COUNT(*) FROM Avistada;