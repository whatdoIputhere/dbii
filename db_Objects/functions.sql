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

CREATE OR REPLACE FUNCTION LoginUtilizador(
    p_email varchar(255)
)
RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
    user_password varchar(255);
BEGIN
    SELECT palavraPasse INTO user_password FROM Utilizador WHERE email = p_email;
    
    IF user_password IS NULL THEN
        RETURN 'Email does not exist';
    ELSE
        return user_password;
    END IF;
END;
$$;
