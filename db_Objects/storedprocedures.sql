-- #region TipoUtilizador
SELECT * FROM TipoUtilizador;

DROP PROCEDURE IF EXISTS InserirTipoUtilizador;

CREATE PROCEDURE InserirTipoUtilizador(
    p_nome varchar(255)
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO TipoUtilizador (nome)
    VALUES (p_nome);
END;
$$; 

CALL InserirTipoUtilizador('tipo 3');

SELECT * FROM TipoUtilizador;
-- #endregion

-- #region Utilizador
SELECT * FROM Utilizador;

DROP PROCEDURE IF EXISTS InserirUtilizador;

CREATE PROCEDURE InserirUtilizador(
    p_nome varchar(255),
    p_email varchar(255),
    p_palavraPasse varchar(255)

)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO Utilizador (nome, email, palavraPasse)
    VALUES (p_nome, p_email, p_palavraPasse);
END;
$$; 

CALL InserirUtilizador('Cliente 2', 'user2@gmail.com','user2');

SELECT * FROM Utilizador;
-- #endregion

-- #region Armazem
SELECT * FROM Armazem;

DROP PROCEDURE IF EXISTS InserirArmazem;

CREATE PROCEDURE InserirArmazem(
    p_nome varchar(255),
    p_descricao varchar(255),
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO Armazem (nome, descricao, criadoPor)
    VALUES (p_nome, p_descricao,p_criadoPor);
END;
$$; 

CALL InserirArmazem('Armazém 3', 'Descrição armazém 3', 1);

SELECT * FROM Armazem;
-- #endregion

-- #region Componente
SELECT * FROM Componente;

DROP PROCEDURE IF EXISTS InserirComponente;

CREATE PROCEDURE InserirComponente(
    p_nome varchar(255),
    p_descricao varchar(255),
    p_preco float,
    p_iva int,
    p_imagem bytea,
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO Componente (nome, descricao, preco, iva, imagem , criadoPor)
    VALUES (p_nome, p_descricao, p_preco, p_iva, p_imagem, p_criadoPor);
END;
$$; 

CALL InserirComponente('Samsung 860 Evo 2TB M.2', 'Disco Rígido SSD Samsung 860 Evo 2TB M.2 SATA', 299.90, 23, '', 1);

SELECT * FROM Componente;
-- #endregion

-- #region ComponenteArmazem

SELECT * FROM ComponenteArmazem;

DROP PROCEDURE IF EXISTS InserirComponenteArmazem;

CREATE PROCEDURE InserirComponenteArmazem(
    p_componente int,
    p_armazem int,
    p_quantidade int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO ComponenteArmazem (componente, armazem, quantidade)
    VALUES (p_componente, p_armazem, p_quantidade);
END;
$$; 

CALL InserirComponenteArmazem(13,1,1);

SELECT * FROM ComponenteArmazem;
-- #endregion

-- #region TipoEquipamento
SELECT * FROM TipoEquipamento;

DROP PROCEDURE IF EXISTS InserirTipoEquipamento;

CREATE PROCEDURE InserirTipoEquipamento(
    p_nome varchar(255),
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO TipoEquipamento (nome, criadoPor)
    VALUES (p_nome, p_criadoPor);
END;
$$; 

CALL InserirTipoEquipamento('Tipo X', 1);

SELECT * FROM TipoEquipamento;
-- #endregion

-- #region Equipamento
SELECT * FROM Equipamento;

DROP PROCEDURE IF EXISTS InserirEquipamento;

CREATE PROCEDURE InserirEquipamento(
    p_nome varchar(255),
    p_descricao varchar(255),
    p_tipo int,
    p_preco float,
    p_iva int,
    p_imagem bytea,
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO Equipamento (nome, descricao, tipo, preco, iva, imagem, criadoPor)
    VALUES (p_nome, p_descricao, p_tipo, p_preco, p_iva, p_imagem, p_criadoPor);
END;
$$; 

CALL InserirEquipamento('PC Gaming #2', 'Processador: i7-9700k, Placa Gráfica: RTX 2080 Ti, Memória RAM: 16GB, Disco Rígido: 500GB, Fonte de Alimentação: 750W, Caixa: NZXT H500 Preta, Ventoinha: Corsair LL120', 2, 2249.99, 23, '', 1);

SELECT * FROM Equipamento;
-- #endregion

-- #region Fatura
SELECT * FROM Fatura;

DROP PROCEDURE IF EXISTS InserirFatura;

CREATE PROCEDURE InserirFatura(
    p_numero int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO Fatura (numero)
    VALUES (p_numero);
END;
$$; 

CALL InserirFatura(31239);

SELECT * FROM Fatura;
-- #endregion

-- #region DetalhesFatura
SELECT * FROM DetalhesFatura;

DROP PROCEDURE IF EXISTS InserirDetalhesFatura;

CREATE PROCEDURE InserirDetalhesFatura(
    p_fatura int,
    p_componente int,
    p_quantidade int,
    p_preco float,
    p_iva int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO DetalhesFatura (fatura, componente, quantidade, preco, iva)
    VALUES (p_fatura, p_componente, p_quantidade, p_preco, p_iva);
END;
$$; 

CALL InserirDetalhesFatura(1, 1, 1, 99.90, 23);

SELECT * FROM DetalhesFatura;
-- #endregion

-- #region ProducaoEquipamento
SELECT * FROM ProducaoEquipamento;

DROP PROCEDURE IF EXISTS InserirProducaoEquipamento;

CREATE PROCEDURE InserirProducaoEquipamento(
    p_equipamento int,
    p_componente int,
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO ProducaoEquipamento (equipamento, componente, criadoPor)
    VALUES (p_equipamento, p_componente, p_criadoPor);
END;
$$; 

CALL InserirProducaoEquipamento(2, 1, 1);

SELECT * FROM ProducaoEquipamento;
-- #endregion

-- #region Fornecedor
SELECT * FROM Fornecedor;

DROP PROCEDURE IF EXISTS InserirFornecedor;

CREATE PROCEDURE InserirFornecedor(
    p_nome varchar(255),
    p_morada varchar(255),
    p_telefone varchar(255),
    p_email varchar(255),
    p_nif varchar(255),
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO Fornecedor (nome, morada, telefone, email, nif, criadoPor)
    VALUES (p_nome, p_morada, p_telefone, p_email, p_nif, p_criadoPor);
END;
$$; 

CALL InserirFornecedor('Fornecedor 3', 'Rua do Fornecedor 3', '912345678', 'fornecedor3@gmail.com', '123456789', 1);

SELECT * FROM Fornecedor;
-- #endregion

-- #region EstadoEncomenda
SELECT * FROM EstadoEncomenda;

DROP PROCEDURE IF EXISTS InserirEstadoEncomenda;

CREATE PROCEDURE InserirEstadoEncomenda(
    p_nome varchar(255)
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO EstadoEncomenda (nome)
    VALUES (p_nome);
END;
$$; 

CALL InserirEstadoEncomenda('Estado 5');

SELECT * FROM EstadoEncomenda;
-- #endregion

-- #region EstadoEntrega
SELECT * FROM EstadoEntrega;

DROP PROCEDURE IF EXISTS InserirEstadoEntrega;

CREATE PROCEDURE InserirEstadoEntrega(
    p_nome varchar(255)
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO EstadoEntrega (nome)
    VALUES (p_nome);
END;
$$; 

CALL InserirEstadoEntrega('Estado 4');

SELECT * FROM EstadoEntrega;
-- #endregion

-- #region EncomendaComponente
SELECT * FROM EncomendaComponente;

DROP PROCEDURE IF EXISTS InserirEncomendaComponente;

CREATE PROCEDURE InserirEncomendaComponente(
    p_fornecedor int,
    p_estado int,
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO EncomendaComponente (fornecedor, estado, criadoPor)
    VALUES (p_fornecedor, p_estado, p_criadoPor);
END;
$$; 

CALL InserirEncomendaComponente(1, 1, 1);

SELECT * FROM EncomendaComponente;
-- #endregion

-- #region EncomendaEquipamento
SELECT * FROM EncomendaEquipamento;

DROP PROCEDURE IF EXISTS InserirEncomendaEquipamento;

CREATE PROCEDURE InserirEncomendaEquipamento(
    p_fornecedor int,
    p_estado int,
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO EncomendaComponente (fornecedor, estado, criadoPor)
    VALUES (p_fornecedor, p_estado, p_criadoPor);
END;
$$; 

CALL InserirEncomendaEquipamento(1, 1, 1);

SELECT * FROM EncomendaEquipamento;
-- #endregion