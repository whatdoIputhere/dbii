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
JOIN Tipoutilizador ON Utilizador.tipo = Tipoutilizador.id
WHERE Utilizador.isEnabled = 'True';

SELECT * FROM GetUtilizadores;

-- #endregion

-- #region TipoComponentes

DROP VIEW IF EXISTS GetTipoComponentes;

CREATE VIEW GetTipoComponentes AS SELECT
*
FROM TipoComponente
WHERE isEnabled = 'True';

SELECT * FROM GetTipoComponentes;

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
COALESCE(SUM(ComponenteArmazem.quantidade), 0) AS quantidade,
Componente.criadoPor,
Componente.isEnabled
FROM Componente
LEFT JOIN ComponenteArmazem ON Componente.id = ComponenteArmazem.componente
JOIN TipoComponente ON Componente.tipo = TipoComponente.id
WHERE Componente.isEnabled = 'True'
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
WHERE Equipamento.isEnabled = 'True'
ORDER BY Equipamento.id;

SELECT * FROM GetEquipamentos;

-- #endregion

-- #region Fornecedores

DROP VIEW IF EXISTS GetFornecedores;

CREATE VIEW GetFornecedores AS SELECT
*
FROM Fornecedor
WHERE isEnabled = 'True';

-- #endregion

-- #region Armazéns

DROP VIEW IF EXISTS GetArmazens;

CREATE VIEW GetArmazens AS SELECT
*
FROM Armazem;

SELECT * FROM GetArmazens;

-- #endregion

-- #region ComponentesArmazem

DROP VIEW IF EXISTS GetComponentesArmazem;

CREATE VIEW GetComponentesArmazem AS SELECT
componenteArmazem.componente,
componente.nome AS nomeComponente,
componenteArmazem.armazem,
armazem.nome AS nomeArmazem,
componenteArmazem.quantidade
FROM ComponenteArmazem
JOIN Componente ON ComponenteArmazem.componente = Componente.id
JOIN Armazem ON ComponenteArmazem.armazem = Armazem.id;

SELECT * FROM GetComponentesArmazem;

-- #endregion

-- #region GetFornecedorComponente

DROP VIEW IF EXISTS GetFornecedorComponente;

CREATE VIEW GetFornecedorComponente AS SELECT
fornecedorComponente.fornecedor,
fornecedor.nome AS nomeFornecedor,
fornecedorComponente.componente,
componente.nome AS nomeComponente
FROM FornecedorComponente
JOIN Fornecedor ON FornecedorComponente.fornecedor = Fornecedor.id
JOIN Componente ON FornecedorComponente.componente = Componente.id
WHERE componente.isEnabled = 'True';

SELECT * FROM GetFornecedorComponente;

-- #endregion