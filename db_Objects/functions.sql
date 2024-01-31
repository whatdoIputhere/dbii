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
    SELECT * INTO user FROM Utilizador WHERE email = p_email;
    
    IF user IS NULL THEN
        RETURN '';
    ELSE
        RETURN user;
    END IF;
END;
$$;



DROP TYPE IF EXISTS ComponenteInfo;

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

--SELECT * FROM InserirComponenteReturn('Componente 1', 'Componente 1', 1, 10, 23, '', 1);