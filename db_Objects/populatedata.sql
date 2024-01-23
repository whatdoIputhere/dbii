INSERT INTO TipoUtilizador (nome)
VALUES ('Administrador'),
       ('Cliente');



INSERT INTO Utilizador (nome, email, palavraPasse, tipo)
VALUES ('Administrador', 'admin@gmail.com', '$2b$12$bEA0U1vkool/YOrdtZ4ZpeVUQuIoOJ98I5qKF1pV7Oq/NW./LL5HW', 1),
       ('Cliente 1', 'user@gmail.com', '$2b$12$pDGguGvWL8Bzs.lkNGijh.BTw8TrNv0pv0TtTacI3f3qVuGWT5FCK', 2);

INSERT INTO Armazem (nome, descricao,criadoPor)
VALUES ('Armazém 1', 'Descrição armazém 1', 1),
       ('Armazém 2', 'Descrição armazém 2', 1);

INSERT INTO Componente (nome, descricao, preco, iva,imagem,criadoPor)
VALUES ('Intel i7-9700k', 'Processador Intel Core i7-9700K 3.6GHz c/ Turbo 4.9GHz 12MB Skt1151', 399.90, 23,'',1),
       ('Placa Gráfica RTX 2080 Ti', 'Placa Gráfica MSI GeForce RTX 2080 Ti Gaming X Trio 11GB GDDR6', 1499.90, 23, '', 1),
       ('MSI Z390 GAMING', 'Motherboard MSI MPG Z390 GAMING EDGE AC', 199.90, 23, '', 1),
       ('Corsair Vengeance 16GB', 'Memória RAM Corsair Vengeance RGB PRO 16GB (2x8GB) DDR4 3200MHz C16 Pretas', 129.90, 23, '', 1),
       ('Samsung 970 Evo Plus', 'Disco Rígido SSD Samsung 970 Evo Plus 500GB M.2 NVMe', 129.90, 23, '', 1),
       ('Corsair RM750x 750W', 'Fonte de Alimentação Corsair RM750x 750W 80 Plus Gold Modular', 129.90, 23, '', 1),
       ('NZXT H500 Preta', 'Caixa NZXT H500 Preta', 79.90, 23, '', 1),
       ('Corsair LL120', 'Ventoinha Corsair LL120 RGB LED 120mm PWM', 29.90, 23, '', 1),
       ('Monitor 24" LED - LG 24MK400H-B', 'Monitor 24" LED - LG 24MK400H-B', 99.90, 23, '', 1),
       ('Teclado Mecânico - Corsair K70 RGB MK.2', 'Teclado Mecânico - Corsair K70 RGB MK.2', 159.90, 23, '', 1),
       ('Rato Gaming - Corsair M65 RGB Elite', 'Rato Gaming - Corsair M65 RGB Elite', 69.90, 23, '', 1),
       ('Webcam - Logitech C920 HD Pro', 'Webcam - Logitech C920 HD Pro', 99.90, 23, '', 1),
       ('Samsung 860 Evo 500GB M.2', 'Disco Rígido SSD Samsung 860 Evo 500GB M.2 SATA', 89.90, 23, '', 1),
       ('Samsung 860 Evo 1TB M.2', 'Disco Rígido SSD Samsung 860 Evo 1TB M.2 SATA', 149.90, 23, '', 1);

INSERT INTO ComponenteArmazem (componente, armazem, quantidade)
VALUES (1, 1, 10),
       (2, 1, 10),
       (3, 1, 10),
       (4, 2, 10),
       (5, 2, 10),
       (6, 2, 10),
       (7, 1, 10),
       (8, 1, 10),
       (9, 1, 10),
       (10, 2, 10),
       (11, 1, 10),
       (12, 1, 15),
       (12, 2, 10);

INSERT INTO TipoEquipamento (nome,criadoPor)
VALUES ('Télemovel', 1),
       ('Computador',1),
       ('Tablet',1),
       ('Portátil',1),
       ('Consola',1),
       ('Impressora',1),
       ('Monitor',1),
       ('Teclado',1),
       ('Rato',1),
       ('Webcam',1);



INSERT INTO Equipamento (nome, descricao, tipo, preco, iva, imagem, criadoPor)
VALUES ('PC Gaming #1', 'Processador: i7-9700k, Placa Gráfica: RTX 2080 Ti, Memória RAM: 16GB, Disco Rígido: 500GB, Fonte de Alimentação: 750W, Caixa: NZXT H500 Preta, Ventoinha: Corsair LL120', 2, 2249.99, 23, '', 1),
       ('Monitor LG 24"', 'Monitor 24" LED - LG 24MK400H-B', 7, 99.90, 23, '', 1),
       ('Corsair K70', 'Teclado Mecânico - Corsair K70 RGB MK.2', 8, 159.90, 23, '', 1),
       ('Corsair m65', 'Rato Gaming - Corsair M65 RGB Elite', 9, 69.90, 23, '', 1),
       ('Logitech C920', 'Webcam - Logitech C920 HD Pro', 10, 99.90, 23, '', 1);

INSERT INTO ProducaoEquipamento (equipamento, componente,criadoPor)
VALUES (1, 1,1),
       (1, 2,1),
       (1, 3,1),
       (1, 4,1),
       (1, 5,1),
       (1, 6,1),
       (1, 7,1),
       (1, 8,1);

INSERT INTO Fornecedor (nome, morada, telefone, email, nif,criadoPor)
VALUES ('Fornecedor 1', 'Rua do Fornecedor 1', '912345678', 'fornecedor1@gmail.com', '123456789',1),
       ('Fornecedor 2', 'Rua do Fornecedor 2', '912345678', 'fornecedor2@gmail.com', '123456789',1);

INSERT INTO EstadoEncomenda (nome)
VALUES ('Em processamento'),
       ('Em transporte'),
       ('Parcialmente Entregue'),
       ('Entregue');

INSERT INTO EstadoEntrega (nome)
VALUES ('Em processamento'),
       ('Em transporte'),
       ('Entregue');

INSERT INTO MaoObra (tipo, descricao, preco)
VALUES  ('Montagem (curta duração)', 'Montagem com duração inferior a 30 minutos' ,20),
        ('Montagem (média duração)', 'Montagem com duração entre 30 minutos a 2 horas',30),
        ('Montagem (longa duração)', 'Montagem com duração superior a 2 horas',50),
        ('Reparação (curta duração)', 'Reparação com duração inferior a 30 minutos',10),
        ('Reparação (média duração)', 'Reparação com duração entre 30 minutos e 2 horas',30),
        ('Reparação (longa duração)', 'Reparação com duração superior a 2 horas',50);

/*
SELECT * FROM Tipoutilizador;
SELECT * FROM Utilizador;
SELECT * FROM Armazem;
SELECT * FROM Componente;
SELECT * FROM ComponenteArmazem;
SELECT * FROM TipoEquipamento;
SELECT * FROM Equipamento;
SELECT * FROM ProducaoEquipamento;
SELECT * FROM Fornecedor;
SELECT * FROM EstadoEncomenda;
SELECT * FROM EstadoEntrega;
SELECT * FROM MaoObra;
*/
