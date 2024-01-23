CREATE OR REPLACE VIEW GetUtilizadores AS SELECT 
Utilizador.id, 
Utilizador.nome, 
Utilizador.email, 
Utilizador.palavraPasse, 
Tipoutilizador.nome AS tipo, 
Utilizador.isEnabled
FROM Utilizador
JOIN Tipoutilizador ON Utilizador.tipo = Tipoutilizador.id;

SELECT * FROM GetUtilizadores;

CREATE OR REPLACE VIEW ComponentesWithQuantidade AS
SELECT c.nome, c.descricao, c.preco, c.iva, SUM(ac.quantidade) AS quantidade
FROM Componente c
JOIN ComponenteArmazem ac ON c.id = ac.componente
GROUP BY c.nome, c.descricao, c.preco, c.iva;

SELECT * FROM ComponentesWithQuantidade;