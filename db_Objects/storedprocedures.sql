-- #region INSERT
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

CALL InserirUtilizador('Cliente 2', 'user2@gmail.com','$2b$12$LttOyjXCxF5k0hwLAU3qMuw6vhY0quJC2NglLI0CBX5ltafGTWyQa');

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
    p_utilizador int,
    p_estado int,
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO EncomendaEquipamento (utilizador, estado, criadoPor)
    VALUES (p_utilizador, p_estado, p_criadoPor);
END;
$$; 

CALL InserirEncomendaEquipamento(1, 1, 1);

SELECT * FROM EncomendaEquipamento;
-- #endregion

-- #region EntregaEncomendaComponente
SELECT * FROM EntregaEncomendaComponente;

DROP PROCEDURE IF EXISTS InserirEntregaEncomendaComponente;

CREATE PROCEDURE InserirEntregaEncomendaComponente(
    p_encomenda int,
    p_componente int,
    p_estado int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO EntregaEncomendaComponente (encomenda, componente, estado)
    VALUES (p_encomenda, p_componente, p_estado);
END;
$$; 

CALL InserirEntregaEncomendaComponente(1, 1, 1);

SELECT * FROM EntregaEncomendaComponente;
-- #endregion

-- #region EntregaEncomendaEquipamento
SELECT * FROM EntregaEncomendaEquipamento;

DROP PROCEDURE IF EXISTS InserirEntregaEncomendaEquipamento;

CREATE PROCEDURE InserirEntregaEncomendaEquipamento(
    p_encomenda int,
    p_equipamento int,
    p_estado int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO EntregaEncomendaEquipamento (encomenda, equipamento, estado)
    VALUES (p_encomenda, p_equipamento, p_estado);
END;
$$; 

CALL InserirEntregaEncomendaEquipamento(1, 1, 1);

SELECT * FROM EntregaEncomendaEquipamento;
-- #endregion

-- #region MaoObra
SELECT * FROM MaoObra;

DROP PROCEDURE IF EXISTS InserirMaoObra;

CREATE PROCEDURE InserirMaoObra(
    p_tipo varchar(255),
    p_descricao varchar(255),
    p_preco float
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    INSERT INTO MaoObra (tipo, descricao, preco)
    VALUES (p_tipo, p_descricao, p_preco);
END;
$$; 

CALL InserirMaoObra('Outro', 'Outro tipo de mão de obra', 30);

SELECT * FROM MaoObra;
-- #endregion

-- #endregion

-- #region UPDATE

-- #region TipoUtilizador
SELECT * FROM TipoUtilizador;	

DROP PROCEDURE IF EXISTS AtualizarTipoUtilizador;

CREATE PROCEDURE AtualizarTipoUtilizador(
    p_id int,
    p_nome varchar(255)
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE TipoUtilizador
    SET nome = p_nome
    WHERE id = p_id;
END;
$$;

CALL AtualizarTipoUtilizador(3, 'Tipo 3 atualizado');

SELECT * FROM TipoUtilizador;
-- #endregion

-- #region Utilizador
SELECT * FROM Utilizador;

DROP PROCEDURE IF EXISTS AtualizarUtilizador;

CREATE PROCEDURE AtualizarUtilizador(
    p_id int,
    p_nome varchar(255),
    p_email varchar(255),
    p_palavraPasse varchar(255),
    p_tipo int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE Utilizador
    SET nome = p_nome,
        email = p_email,
        palavraPasse = p_palavraPasse,
        tipo = p_tipo
    WHERE id = p_id;
END;
$$;

CALL AtualizarUtilizador(3, 'Cliente 2 atualizado', 'cliente2@gmail.com', '$2b$12$LttOyjXCxF5k0hwLAU3qMuw6vhY0quJC2NglLI0CBX5ltafGTWyQa', 2);

SELECT * FROM Utilizador;

-- #endregion

-- #region Armazem
SELECT * FROM Armazem;

DROP PROCEDURE IF EXISTS AtualizarArmazem;

CREATE PROCEDURE AtualizarArmazem(
    p_id int,
    p_nome varchar(255),
    p_descricao varchar(255),
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE Armazem
    SET nome = p_nome,
        descricao = p_descricao,
        criadoPor = p_criadoPor
    WHERE id = p_id;
END;
$$;

CALL AtualizarArmazem(3, 'Armazém 3 atualizado', 'Descrição armazém 3 atualizado', 1);

SELECT * FROM Armazem;

-- #endregion

-- #region Componente

SELECT * FROM Componente;

DROP PROCEDURE IF EXISTS AtualizarComponente;

CREATE PROCEDURE AtualizarComponente(
    p_id int,
    p_nome varchar(255),
    p_descricao varchar(255),
    p_tipo varchar(255),
    p_preco float,
    p_iva int,
    p_imagem bytea
)
LANGUAGE PLPGSQL
AS $$
DECLARE tipo_id INT;
BEGIN
    IF LENGTH(p_nome) <= 5 THEN
        RAISE EXCEPTION 'Nome must have more than 5 characters';
    END IF;

    IF p_preco <= 0 OR p_iva <= 0 THEN
        RAISE EXCEPTION 'Preco and IVA must be values above 0';
    END IF;

    UPDATE Componente
    SET nome = p_nome,
        descricao = p_descricao,
        tipo = CAST(p_tipo AS INTEGER),
        preco = p_preco,
        iva = p_iva,
        imagem = p_imagem
    WHERE id = p_id;
END;
$$;

CALL AtualizarComponente(15, 'Samsung 860 Evo 2TB M.2 atualizado', 'Disco Rígido SSD Samsung 860 Evo 2TB M.2 SATA atualizado', 299.90, 23, '');

SELECT * FROM Componente;

-- #endregion

-- #region ComponenteArmazem

SELECT * FROM ComponenteArmazem;

DROP PROCEDURE IF EXISTS AtualizarComponenteArmazem;

CREATE PROCEDURE AtualizarComponenteArmazem(
    p_componente int,
    p_armazem int,
    p_quantidade int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE ComponenteArmazem
    SET quantidade = p_quantidade
    WHERE componente = p_componente AND armazem = p_armazem;
END;
$$;

CALL AtualizarComponenteArmazem(13, 1, 2);

SELECT * FROM ComponenteArmazem;

-- #endregion

-- #region TipoEquipamento

SELECT * FROM TipoEquipamento;

DROP PROCEDURE IF EXISTS AtualizarTipoEquipamento;

CREATE PROCEDURE AtualizarTipoEquipamento(
    p_id int,
    p_nome varchar(255),
    p_criadoPor int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE TipoEquipamento
    SET nome = p_nome,
        criadoPor = p_criadoPor
    WHERE id = p_id;
END;
$$;

CALL AtualizarTipoEquipamento(11, 'Tipo X atualizado', 1);

SELECT * FROM TipoEquipamento;

-- #endregion

-- #region Equipamento

SELECT * FROM Equipamento;

DROP PROCEDURE IF EXISTS AtualizarEquipamento;

CREATE PROCEDURE AtualizarEquipamento(
    p_id int,
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
    UPDATE Equipamento
    SET nome = p_nome,
        descricao = p_descricao,
        tipo = p_tipo,
        preco = p_preco,
        iva = p_iva,
        imagem = p_imagem,
        criadoPor = p_criadoPor
    WHERE id = p_id;
END;
$$;

CALL AtualizarEquipamento(6, 'PC Gaming #2 atualizado', 'Processador: i7-9700k, Placa Gráfica: RTX 2080 Ti, Memória RAM: 16GB, Disco Rígido: 500GB, Fonte de Alimentação: 750W, Caixa: NZXT H500 Preta, Ventoinha: Corsair LL120 atualizado', 2, 2249.99, 23, '', 1);

SELECT * FROM Equipamento;

-- #endregion

-- #region Fatura

SELECT * FROM Fatura;

DROP PROCEDURE IF EXISTS AtualizarFatura;

CREATE PROCEDURE AtualizarFatura(
    p_id int,
    p_numero int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE Fatura
    SET numero = p_numero
    WHERE id = p_id;
END;
$$;

CALL AtualizarFatura(1, 31240);

SELECT * FROM Fatura;

-- #endregion

-- #region DetalhesFatura

SELECT * FROM DetalhesFatura;

DROP PROCEDURE IF EXISTS AtualizarDetalhesFatura;

CREATE PROCEDURE AtualizarDetalhesFatura(
    p_fatura int,
    p_componente int,
    p_quantidade int,
    p_preco float,
    p_iva int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE DetalhesFatura
    SET quantidade = p_quantidade,
        preco = p_preco,
        iva = p_iva
    WHERE fatura = p_fatura AND componente = p_componente;
END;
$$;

CALL AtualizarDetalhesFatura(1, 1, 2, 99.90, 23);

SELECT * FROM DetalhesFatura;

-- #endregion

-- #region ProducaoEquipamento

SELECT * FROM ProducaoEquipamento;

DROP PROCEDURE IF EXISTS AtualizarProducaoEquipamento;

CREATE PROCEDURE AtualizarProducaoEquipamento(
    p_equipamento int,
    p_componente int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE ProducaoEquipamento
    SET componente = p_componente
    WHERE equipamento = p_equipamento;
END;
$$;

CALL AtualizarProducaoEquipamento(2,2);

SELECT * FROM ProducaoEquipamento;

-- #endregion

-- #region Fornecedor

SELECT * FROM Fornecedor;

DROP PROCEDURE IF EXISTS AtualizarFornecedor;

CREATE PROCEDURE AtualizarFornecedor(
    p_id int,
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
    UPDATE Fornecedor
    SET nome = p_nome,
        morada = p_morada,
        telefone = p_telefone,
        email = p_email,
        nif = p_nif,
        criadoPor = p_criadoPor
    WHERE id = p_id;
END;
$$;

CALL AtualizarFornecedor(3, 'Fornecedor 3 atualizado', 'Rua do Fornecedor 3 atualizado', '912345678', 'fornecedor3@gmail.com', '123456789', 1);

SELECT * FROM Fornecedor;

-- #endregion

-- #region EstadoEncomenda

SELECT * FROM EstadoEncomenda;

DROP PROCEDURE IF EXISTS AtualizarEstadoEncomenda;

CREATE PROCEDURE AtualizarEstadoEncomenda(
    p_id int,
    p_nome varchar(255)
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EstadoEncomenda
    SET nome = p_nome
    WHERE id = p_id;
END;
$$;

CALL AtualizarEstadoEncomenda(5, 'Estado 5 atualizado');

SELECT * FROM EstadoEncomenda;

-- #endregion

-- #region EstadoEntrega

SELECT * FROM EstadoEntrega;

DROP PROCEDURE IF EXISTS AtualizarEstadoEntrega;

CREATE PROCEDURE AtualizarEstadoEntrega(
    p_id int,
    p_nome varchar(255)
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EstadoEntrega
    SET nome = p_nome
    WHERE id = p_id;
END;
$$;

CALL AtualizarEstadoEntrega(4, 'Estado 4 atualizado');

SELECT * FROM EstadoEntrega;

-- #endregion

-- #region EncomendaComponente

SELECT * FROM EncomendaComponente;

DROP PROCEDURE IF EXISTS AtualizarEncomendaComponente;

CREATE PROCEDURE AtualizarEncomendaComponente(
    p_id int,
    p_estado int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EncomendaComponente
        set estado = p_estado
    WHERE id = p_id;
END;
$$;

CALL AtualizarEncomendaComponente(1, 2);

SELECT * FROM EncomendaComponente;

-- #endregion

-- #region EncomendaEquipamento

SELECT * FROM EncomendaEquipamento;

DROP PROCEDURE IF EXISTS AtualizarEncomendaEquipamento;

CREATE PROCEDURE AtualizarEncomendaEquipamento(
    p_id int,
    p_estado int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EncomendaEquipamento
        set estado = p_estado
    WHERE id = p_id;
END;
$$;

CALL AtualizarEncomendaEquipamento(1, 2);

SELECT * FROM EncomendaEquipamento;

-- #endregion

-- #region EntregaEncomendaComponente

SELECT * FROM EntregaEncomendaComponente;

DROP PROCEDURE IF EXISTS AtualizarEntregaEncomendaComponente;

CREATE PROCEDURE AtualizarEntregaEncomendaComponente(
    p_encomenda int,
    p_componente int,
    p_estado int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EntregaEncomendaComponente
        set estado = p_estado
    WHERE encomenda = p_encomenda AND componente = p_componente;
END;
$$;

CALL AtualizarEntregaEncomendaComponente(1, 1, 2);

SELECT * FROM EntregaEncomendaComponente;

-- #endregion

-- #region EntregaEncomendaEquipamento

SELECT * FROM EntregaEncomendaEquipamento;

DROP PROCEDURE IF EXISTS AtualizarEntregaEncomendaEquipamento;

CREATE PROCEDURE AtualizarEntregaEncomendaEquipamento(
    p_encomenda int,
    p_equipamento int,
    p_estado int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EntregaEncomendaEquipamento
        set estado = p_estado
    WHERE encomenda = p_encomenda AND equipamento = p_equipamento;
END;
$$;

CALL AtualizarEntregaEncomendaEquipamento(1, 1, 2);

SELECT * FROM EntregaEncomendaEquipamento;

-- #endregion

-- #region MaoObra

SELECT * FROM MaoObra;

DROP PROCEDURE IF EXISTS AtualizarMaoObra;

CREATE PROCEDURE AtualizarMaoObra(
    p_id int,
    p_tipo varchar(255),
    p_descricao varchar(255),
    p_preco float
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE MaoObra
    SET tipo = p_tipo,
        descricao = p_descricao,
        preco = p_preco
    WHERE id = p_id;
END;
$$;

CALL AtualizarMaoObra(7, 'Outro atualizado', 'Outro tipo de mão de obra atualizado', 40);

SELECT * FROM MaoObra;

-- #endregion

-- #endregion

-- #region DELETE

-- #region TipoUtilizador

SELECT * FROM TipoUtilizador;

DROP PROCEDURE IF EXISTS RemoverTipoUtilizador;

CREATE PROCEDURE RemoverTipoUtilizador(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE TipoUtilizador
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverTipoUtilizador(3);

SELECT * FROM TipoUtilizador;

-- #endregion

-- #region Utilizador

SELECT * FROM Utilizador;

DROP PROCEDURE IF EXISTS RemoverUtilizador;

CREATE PROCEDURE RemoverUtilizador(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE Utilizador
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverUtilizador(3);

SELECT * FROM Utilizador;

-- #endregion

-- #region Armazem

SELECT * FROM Armazem;

DROP PROCEDURE IF EXISTS RemoverArmazem;

CREATE PROCEDURE RemoverArmazem(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE Armazem
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverArmazem(3);

SELECT * FROM Armazem;

-- #endregion

-- #region Componente

SELECT * FROM Componente;

DROP PROCEDURE IF EXISTS RemoverComponente;

CREATE PROCEDURE RemoverComponente(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE Componente
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverComponente(15);

SELECT * FROM Componente;

-- #endregion

-- #region ComponenteArmazem

SELECT * FROM ComponenteArmazem;

DROP PROCEDURE IF EXISTS RemoverComponenteArmazem;

CREATE PROCEDURE RemoverComponenteArmazem(
    p_componente int,
    p_armazem int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE ComponenteArmazem
    SET isEnabled = false
    WHERE componente = p_componente AND armazem = p_armazem;
END;
$$;

CALL RemoverComponenteArmazem(13, 1);

SELECT * FROM ComponenteArmazem;

-- #endregion

-- #region TipoEquipamento

SELECT * FROM TipoEquipamento;

DROP PROCEDURE IF EXISTS RemoverTipoEquipamento;

CREATE PROCEDURE RemoverTipoEquipamento(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE TipoEquipamento
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverTipoEquipamento(11);

SELECT * FROM TipoEquipamento;

-- #endregion

-- #region Equipamento

SELECT * FROM Equipamento;

DROP PROCEDURE IF EXISTS RemoverEquipamento;

CREATE PROCEDURE RemoverEquipamento(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE Equipamento
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverEquipamento(6);

SELECT * FROM Equipamento;

-- #endregion

-- #region Fatura

SELECT * FROM Fatura;

DROP PROCEDURE IF EXISTS RemoverFatura;

CREATE PROCEDURE RemoverFatura(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE Fatura
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverFatura(1);

SELECT * FROM Fatura;

-- #endregion

-- #region DetalhesFatura

SELECT * FROM DetalhesFatura;

DROP PROCEDURE IF EXISTS RemoverDetalhesFatura;

CREATE PROCEDURE RemoverDetalhesFatura(
    p_fatura int,
    p_componente int
)
LANGUAGE PLPGSQL
AS $$

BEGIN
    UPDATE DetalhesFatura
    SET isEnabled = false
    WHERE fatura = p_fatura AND componente = p_componente;
END;
$$;

CALL RemoverDetalhesFatura(1, 1);

SELECT * FROM DetalhesFatura;

-- #endregion

-- #region ProducaoEquipamento

SELECT * FROM ProducaoEquipamento;

DROP PROCEDURE IF EXISTS RemoverProducaoEquipamento;

CREATE PROCEDURE RemoverProducaoEquipamento(
    p_equipamento int,
    p_componente int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE ProducaoEquipamento
    SET isEnabled = false
    WHERE equipamento = p_equipamento AND componente = p_componente;
END;
$$;

CALL RemoverProducaoEquipamento(2, 2);

SELECT * FROM ProducaoEquipamento;

-- #endregion

-- #region Fornecedor

SELECT * FROM Fornecedor;

DROP PROCEDURE IF EXISTS RemoverFornecedor;

CREATE PROCEDURE RemoverFornecedor(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE Fornecedor
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverFornecedor(3);

SELECT * FROM Fornecedor;

-- #endregion

-- #region EstadoEncomenda

SELECT * FROM EstadoEncomenda;

DROP PROCEDURE IF EXISTS RemoverEstadoEncomenda;

CREATE PROCEDURE RemoverEstadoEncomenda(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EstadoEncomenda
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverEstadoEncomenda(5);

SELECT * FROM EstadoEncomenda;

-- #endregion

-- #region EstadoEntrega

SELECT * FROM EstadoEntrega;

DROP PROCEDURE IF EXISTS RemoverEstadoEntrega;

CREATE PROCEDURE RemoverEstadoEntrega(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EstadoEntrega
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverEstadoEntrega(4);

SELECT * FROM EstadoEntrega;

-- #endregion

-- #region EncomendaComponente

SELECT * FROM EncomendaComponente;

DROP PROCEDURE IF EXISTS RemoverEncomendaComponente;

CREATE PROCEDURE RemoverEncomendaComponente(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EncomendaComponente
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverEncomendaComponente(1);

SELECT * FROM EncomendaComponente;

-- #endregion

-- #region EncomendaEquipamento

SELECT * FROM EncomendaEquipamento;

DROP PROCEDURE IF EXISTS RemoverEncomendaEquipamento;

CREATE PROCEDURE RemoverEncomendaEquipamento(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EncomendaEquipamento
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverEncomendaEquipamento(1);

SELECT * FROM EncomendaEquipamento;

-- #endregion

-- #region EntregaEncomendaComponente

SELECT * FROM EntregaEncomendaComponente;

DROP PROCEDURE IF EXISTS RemoverEntregaEncomendaComponente;

CREATE PROCEDURE RemoverEntregaEncomendaComponente(
    p_encomenda int,
    p_componente int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EntregaEncomendaComponente
    SET isEnabled = false
    WHERE encomenda = p_encomenda AND componente = p_componente;
END;
$$;

CALL RemoverEntregaEncomendaComponente(1, 1);

SELECT * FROM EntregaEncomendaComponente;

-- #endregion

-- #region EntregaEncomendaEquipamento

SELECT * FROM EntregaEncomendaEquipamento;

DROP PROCEDURE IF EXISTS RemoverEntregaEncomendaEquipamento;

CREATE PROCEDURE RemoverEntregaEncomendaEquipamento(
    p_encomenda int,
    p_equipamento int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE EntregaEncomendaEquipamento
    SET isEnabled = false
    WHERE encomenda = p_encomenda AND equipamento = p_equipamento;
END;
$$;

CALL RemoverEntregaEncomendaEquipamento(1, 1);

SELECT * FROM EntregaEncomendaEquipamento;

-- #endregion

-- #region MaoObra

SELECT * FROM MaoObra;

DROP PROCEDURE IF EXISTS RemoverMaoObra;

CREATE PROCEDURE RemoverMaoObra(
    p_id int
)
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE MaoObra
    SET isEnabled = false
    WHERE id = p_id;
END;
$$;

CALL RemoverMaoObra(7);

SELECT * FROM MaoObra;

-- #endregion

-- #endregion

-- #region OTHERS


-- #endregion