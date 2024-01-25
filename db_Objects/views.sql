-- #region Utilizadores
DROP VIEW IF EXISTS GetUtilizadores;

CREATE VIEW GetUtilizadores AS SELECT 
Utilizador.id, 
Utilizador.nome, 
Utilizador.email, 
Utilizador.palavraPasse, 
Tipoutilizador.nome AS tipo, 
Utilizador.isEnabled
FROM Utilizador
JOIN Tipoutilizador ON Utilizador.tipo = Tipoutilizador.id;

SELECT * FROM GetUtilizadores;

-- #endregion

-- #region Componentes

DROP VIEW IF EXISTS GetComponentes;

CREATE VIEW GetComponentes AS SELECT
Componente.id, 
Componente.nome, 
Componente.descricao,
TipoComponente.nome AS tipo,
Componente.preco, 
Componente.iva,
Componente.imagem,
SUM(ComponenteArmazem.quantidade) AS quantidade
FROM Componente
JOIN ComponenteArmazem ON Componente.id = ComponenteArmazem.componente
JOIN TipoComponente ON Componente.tipo = TipoComponente.id
GROUP BY Componente.id, TipoComponente.nome
ORDER BY Componente.id;

SELECT * FROM GetComponentes;

-- #endregion

-- #region Equipamentos

DROP VIEW IF EXISTS GetEquipamentos;

CREATE VIEW GetEquipamentos AS SELECT
Equipamento.id,
Equipamento.nome,
Equipamento.descricao, 
TipoEquipamento.nome AS tipo, 
Equipamento.preco, 
Equipamento.iva, 
Equipamento.imagem AS criadoPor
FROM Equipamento 
JOIN TipoEquipamento ON Equipamento.tipo = TipoEquipamento.id
ORDER BY Equipamento.id;

SELECT * FROM GetEquipamentos;

-- #endregion