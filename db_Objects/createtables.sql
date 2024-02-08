DROP TABLE IF EXISTS EquipamentoArmazem CASCADE;
DROP TABLE IF EXISTS Equipamento CASCADE;
DROP TABLE IF EXISTS MaoObra CASCADE;
DROP TABLE IF EXISTS FornecedorComponente CASCADE;
DROP TABLE IF EXISTS EntregaEncomendaEquipamento CASCADE;
DROP TABLE IF EXISTS EntregaEncomendaComponente CASCADE;
DROP TABLE IF EXISTS EncomendaEquipamento CASCADE;
DROP TABLE IF EXISTS EncomendaComponente CASCADE;
DROP TABLE IF EXISTS EstadoEntrega CASCADE;
DROP TABLE IF EXISTS EstadoEncomenda CASCADE;
DROP TABLE IF EXISTS Fornecedor CASCADE;
DROP TABLE IF EXISTS ProducaoEquipamento CASCADE;
DROP TABLE IF EXISTS DetalhesFatura CASCADE;
DROP TABLE IF EXISTS Fatura CASCADE;
DROP TABLE IF EXISTS TipoEquipamento CASCADE;
DROP TABLE IF EXISTS ComponenteArmazem CASCADE;
DROP TABLE IF EXISTS TipoComponente CASCADE;
DROP TABLE IF EXISTS Componente CASCADE;
DROP TABLE IF EXISTS Armazem CASCADE;
DROP TABLE IF EXISTS Utilizador CASCADE;
DROP TABLE IF EXISTS TipoUtilizador CASCADE;

CREATE TABLE TipoUtilizador(
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    isEnabled boolean DEFAULT true
);

CREATE TABLE Utilizador(
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    palavraPasse varchar(255) NOT NULL,
    tipo int NOT NULL REFERENCES TipoUtilizador(id) DEFAULT 2,
    criadoEm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);

CREATE TABLE Armazem(
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    descricao varchar(255) NOT NULL,
    criadoPor int NOT NULL REFERENCES Utilizador(id),
    criadoEm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);

CREATE TABLE TipoComponente(
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    criadoPor int NOT NULL REFERENCES Utilizador(id),
    criadoEm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);

CREATE TABLE Componente(
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    descricao varchar(255) NOT NULL,
    tipo int NOT NULL REFERENCES TipoComponente(id),
    preco float NOT NULL,
    iva int NOT NULL,
    imagem bytea NOT NULL,
    criadoPor int NOT NULL REFERENCES Utilizador(id),
    criadoEm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);

CREATE TABLE ComponenteArmazem(
    componente int REFERENCES Componente(id),
    armazem int REFERENCES Armazem(id),
    quantidade int NOT NULL,
    CONSTRAINT pk_ComponenteArmazem PRIMARY KEY (componente, armazem),
    isEnabled boolean DEFAULT true
);

CREATE TABLE TipoEquipamento(
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    criadoPor int NOT NULL REFERENCES Utilizador(id),
    criadoEm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);


CREATE TABLE Fatura(
    id serial PRIMARY KEY,
    numero int NOT NULL,
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);

CREATE TABLE MaoObra(
    id serial PRIMARY KEY,
    tipo varchar(255) NOT NULL,
    descricao varchar(255) NOT NULL,
    preco float NOT NULL,
    isEnabled boolean DEFAULT true
);

CREATE TABLE Equipamento (
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    descricao varchar(255) NOT NULL,
    tipo int NOT NULL REFERENCES TipoEquipamento(id),
    preco float NOT NULL,
    iva int NOT NULL,
    criadoEm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    criadoPor int NOT NULL REFERENCES Utilizador(id),
    maoObra int NOT NULL REFERENCES MaoObra(id),
    imagem bytea NOT NULL,
    isEnabled boolean DEFAULT true
);

CREATE TABLE EquipamentoArmazem(
    equipamento int REFERENCES Equipamento(id),
    armazem int REFERENCES Armazem(id),
    quantidade int NOT NULL,
    CONSTRAINT pk_EquipamentoArmazem PRIMARY KEY (equipamento, armazem),
    isEnabled boolean DEFAULT true
);

CREATE TABLE DetalhesFatura(
    fatura int REFERENCES Fatura(id),
    equipamento int REFERENCES equipamento(id),
    quantidade int NOT NULL,
    preco float NOT NULL,
    iva int NOT NULL,
    CONSTRAINT pk_DetalhesFatura PRIMARY KEY (fatura, equipamento),
    isEnabled boolean DEFAULT true
);


CREATE TABLE ProducaoEquipamento(
    id serial PRIMARY KEY,
    equipamento int REFERENCES Equipamento(id),
    componente int REFERENCES Componente(id),
    criadoPor int NOT NULL REFERENCES Utilizador(id),
    criadoEm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);

CREATE TABLE Fornecedor(
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    morada varchar(255) NOT NULL,
    telefone varchar(12) NOT NULL,
    email varchar(255) NOT NULL,
    nif varchar(9) NOT NULL,
    criadoPor int NOT NULL REFERENCES Utilizador(id),
    criadoEm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);

CREATE TABLE FornecedorComponente(
    fornecedor int REFERENCES Fornecedor(id),
    componente int REFERENCES Componente(id),
    CONSTRAINT pk_FornecedorComponente PRIMARY KEY (fornecedor, componente),
    isEnabled boolean DEFAULT true
);

CREATE TABLE EstadoEncomenda(
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    isEnabled boolean DEFAULT true
);

CREATE TABLE EstadoEntrega(
    id serial PRIMARY KEY,
    nome varchar(255) NOT NULL,
    isEnabled boolean DEFAULT true
);

CREATE TABLE EncomendaComponente(
    id serial PRIMARY KEY,
    fornecedor int REFERENCES Fornecedor(id),
    isEnabled boolean DEFAULT true,
    estado int REFERENCES EstadoEncomenda(id),
    criadoPor int NOT NULL REFERENCES Utilizador(id),
    criadoEm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE EncomendaEquipamento(
    id serial PRIMARY KEY,
    utilizador int REFERENCES Utilizador(id),
    estado int references EstadoEncomenda(id),
    criadoPor int NOT NULL REFERENCES Utilizador(id),
    criadoEm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dataEncomenda TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);

CREATE TABLE EntregaEncomendaComponente(
    id serial PRIMARY KEY,
    encomenda int REFERENCES EncomendaComponente(id),
    componente int REFERENCES Componente(id),
    estado int REFERENCES EstadoEntrega(id),
    dataEntrega TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);

CREATE TABLE EntregaEncomendaEquipamento(
    id serial PRIMARY KEY,
    encomenda int REFERENCES EncomendaEquipamento(id),
    equipamento int REFERENCES Equipamento(id),
    estado int REFERENCES EstadoEntrega(id),
    dataEntrega TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isEnabled boolean DEFAULT true
);
