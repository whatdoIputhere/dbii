-- #region account
CREATE OR REPLACE FUNCTION RegistarUtilizador(
    p_username varchar(255),
    p_email varchar(255),
    p_password varchar(255)
)
RETURNS boolean
LANGUAGE plpgsql
AS $$
DECLARE
    user_exists boolean;
BEGIN
    SELECT EXISTS(SELECT 1 FROM Utilizador WHERE nome = p_username or email = p_email) INTO user_exists;
    
    IF user_exists THEN
        RETURN false;
    ELSE
        CALL InserirUtilizador(p_username, p_email, p_password);
        RETURN true;
    END IF;
END;
$$;

DROP FUNCTION IF EXISTS LoginUtilizador;

CREATE FUNCTION LoginUtilizador(
    p_email varchar(255)
)
RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
    user Utilizador%ROWTYPE;
BEGIN
    SELECT * INTO user FROM Utilizador WHERE email = p_email and isEnabled = true;
    
    IF user IS NULL THEN
        RETURN '';
    ELSE
        RETURN user;
    END IF;
END;
$$;

-- #endregion

-- #region componente
DROP TYPE IF EXISTS ComponenteInfo CASCADE;

CREATE TYPE ComponenteInfo AS (
    id int,
    nome varchar(255),
    descricao varchar(255),
    tipo varchar(255),
    preco float,
    iva int,
    imagem bytea,
    quantidade int,
    criadoPor int,
    isEnabled boolean
);

DROP FUNCTION IF EXISTS InserirComponenteReturn;

CREATE FUNCTION InserirComponenteReturn(
    p_nome varchar(255),
    p_descricao varchar(255),
    p_tipo int,
    p_preco float,
    p_iva int,
    p_imagem bytea,
    p_criadoPor int
)
RETURNS ComponenteInfo
LANGUAGE PLPGSQL
AS $$
DECLARE
    componenteId int;
    new_componente ComponenteInfo;
BEGIN
    INSERT INTO Componente (nome, descricao, tipo, preco, iva, imagem, criadoPor)
    VALUES (p_nome, p_descricao, p_tipo, p_preco, p_iva, p_imagem, p_criadoPor)
    RETURNING id INTO componenteId;

    SELECT * INTO new_componente FROM GetComponentes WHERE id = componenteId;

    RETURN new_componente;
END;
$$;

-- #endregion

-- #region fornecedor
DROP FUNCTION IF EXISTS InserirFornecedorReturn;

CREATE FUNCTION InserirFornecedorReturn(
    p_nome varchar(255),
    p_morada varchar(255),
    p_telefone varchar(12),
    p_email varchar(255),
    p_nif varchar(9),
    p_criadoPor int
)
RETURNS Fornecedor
LANGUAGE PLPGSQL
AS $$
DECLARE
    new_fornecedor Fornecedor%ROWTYPE;
BEGIN
    INSERT INTO Fornecedor (nome, morada, telefone, email, nif, criadoPor)
    VALUES (p_nome, p_morada, p_telefone, p_email, p_nif, p_criadoPor)
    RETURNING * INTO new_fornecedor;    

    RETURN new_fornecedor;
END;
$$;

-- #endregion

-- #region equipamento
DROP TYPE IF EXISTS EquipamentoInfo CASCADE;

CREATE TYPE EquipamentoInfo AS (
    id int,
    nome varchar(255),
    descricao varchar(255),
    tipo varchar(255),
    preco float,
    iva int,
    imagem bytea,
    quantidade int
);

DROP FUNCTION IF EXISTS InserirEquipamentoReturn;

CREATE FUNCTION InserirEquipamentoReturn(
    p_nome varchar(255),
    p_descricao varchar(255),
    p_tipo int,
    p_preco float,
    p_iva int,
    p_imagem bytea,
    p_criadoPor int
)
RETURNS EquipamentoInfo
LANGUAGE PLPGSQL
AS $$
DECLARE
    new_equipamento EquipamentoInfo;
    equipamentoId int;
BEGIN
    INSERT INTO Equipamento (nome, descricao, tipo, preco, iva, imagem, criadoPor)
    VALUES (p_nome, p_descricao, p_tipo, p_preco, p_iva, p_imagem, p_criadoPor)
    RETURNING id INTO equipamentoId;

    SELECT * INTO new_equipamento FROM GetEquipamentos WHERE id = equipamentoId;

    RETURN new_equipamento;
END;
$$;

-- #endregion