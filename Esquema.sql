
CREATE DATABASE IF NOT EXISTS SistemaCriminal;
USE SistemaCriminal;

CREATE TABLE Pessoa (
    ID_Pessoa INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100),
    Data_Nascimento DATE NOT NULL,
    Genero CHAR(1),
    Nacionalidade VARCHAR(100) NOT NULL,
    Altura INT COMMENT 'Altura em centímetros',
    Foto VARCHAR(255) COMMENT 'Caminho para arquivo de foto',
    Data_Cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_genero CHECK (Genero IN ('M', 'F', 'O'))
) ENGINE=InnoDB;


CREATE TABLE TipoBiometria (
    ID_TipoBiometria INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(50) NOT NULL UNIQUE,
    Tecnologia VARCHAR(50)
) ENGINE=InnoDB;


CREATE TABLE Biometria (
    ID_Biometria INT PRIMARY KEY AUTO_INCREMENT,
    ID_TipoBiometria INT NOT NULL,
    ID_Pessoa INT NOT NULL,
    Data_Coleta DATETIME NOT NULL,
    Dados LONGBLOB NOT NULL,
    Qualidade INT COMMENT 'Qualidade da amostra (1-100)',
    FOREIGN KEY (ID_TipoBiometria) REFERENCES TipoBiometria(ID_TipoBiometria),
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa) ON DELETE CASCADE,
    CONSTRAINT uk_biometria_pessoa UNIQUE (ID_TipoBiometria, ID_Pessoa)
) ENGINE=InnoDB;


CREATE TABLE TipoDocumento (
    ID_TipoDocumento INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(50) NOT NULL UNIQUE,
    Validade_Obrigatoria BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;


CREATE TABLE DocumentoIdentidade (
    ID_Documento INT PRIMARY KEY AUTO_INCREMENT,
    ID_TipoDocumento INT NOT NULL,
    Numero_Documento VARCHAR(100) NOT NULL,
    ID_Pessoa INT NOT NULL,
    Data_Emissao DATE,
    Data_Validade DATE,
    Orgao_Emissor VARCHAR(100),
    FOREIGN KEY (ID_TipoDocumento) REFERENCES TipoDocumento(ID_TipoDocumento),
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa) ON DELETE CASCADE,
    CONSTRAINT uk_documento UNIQUE (ID_TipoDocumento, Numero_Documento)
) ENGINE=InnoDB;


CREATE TABLE TipoCrime (
    ID_TipoCrime INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(255) NOT NULL UNIQUE,
    Codigo_Penal VARCHAR(50),
    Gravidade ENUM('Leve', 'Médio', 'Grave', 'Muito Grave') NOT NULL,
    Tempo_Prescrecao INT COMMENT 'Anos para prescrição'
) ENGINE=InnoDB;


CREATE TABLE RegistroCriminal (
    ID_Registro INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pessoa INT NOT NULL,
    ID_TipoCrime INT NOT NULL,
    Data_Registro DATE NOT NULL,
    Data_Ocorrencia DATE,
    Situacao ENUM('Investigação', 'Processado', 'Condenado', 'Absolvido') DEFAULT 'Investigação',
    Sentenca VARCHAR(255),
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa) ON DELETE CASCADE,
    FOREIGN KEY (ID_TipoCrime) REFERENCES TipoCrime(ID_TipoCrime)
) ENGINE=InnoDB;


CREATE TABLE Pais (
    ID_Pais INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    Sigla CHAR(3) NOT NULL UNIQUE
) ENGINE=InnoDB;


CREATE TABLE Provincia (
    ID_Provincia INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    ID_Pais INT NOT NULL,
    Sigla VARCHAR(10),
    FOREIGN KEY (ID_Pais) REFERENCES Pais(ID_Pais),
    CONSTRAINT uk_provincia UNIQUE (Nome, ID_Pais)
) ENGINE=InnoDB;


CREATE TABLE Cidade (
    ID_Cidade INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    ID_Provincia INT NOT NULL,
    Codigo_IBGE VARCHAR(20),
    Latitude DECIMAL(10, 8),
    Longitude DECIMAL(11, 8),
    FOREIGN KEY (ID_Provincia) REFERENCES Provincia(ID_Provincia),
    CONSTRAINT uk_cidade UNIQUE (Nome, ID_Provincia)
) ENGINE=InnoDB;

CREATE TABLE Localizacao (
    ID_Localizacao INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pessoa INT NOT NULL,
    ID_Cidade INT,
    Data_hora DATETIME NOT NULL,
    Latitude DECIMAL(10, 8) NOT NULL,
    Longitude DECIMAL(11, 8) NOT NULL,
    Precisao DECIMAL(5, 2) COMMENT 'Precisão em metros',
    Fonte VARCHAR(50) COMMENT 'GPS, Celular, CCTV, etc.',
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa) ON DELETE CASCADE,
    FOREIGN KEY (ID_Cidade) REFERENCES Cidade(ID_Cidade)
) ENGINE=InnoDB;

CREATE TABLE Avistada (
    ID_Localizacao INT NOT NULL,
    ID_Pessoa_Avistada INT NOT NULL,
    ID_Pessoa_Testemunha INT,
    Confirmacao BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (ID_Localizacao, ID_Pessoa_Avistada),
    FOREIGN KEY (ID_Localizacao) REFERENCES Localizacao(ID_Localizacao) ON DELETE CASCADE,
    FOREIGN KEY (ID_Pessoa_Avistada) REFERENCES Pessoa(ID_Pessoa) ON DELETE CASCADE,
    FOREIGN KEY (ID_Pessoa_Testemunha) REFERENCES Pessoa(ID_Pessoa)
) ENGINE=InnoDB;

CREATE INDEX idx_pessoa_nome ON Pessoa(Nome, Sobrenome);
CREATE INDEX idx_documento_numero ON DocumentoIdentidade(Numero_Documento);
CREATE INDEX idx_registro_data ON RegistroCriminal(Data_Registro);
CREATE INDEX idx_localizacao_data ON Localizacao(Data_hora);
