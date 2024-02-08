INSERT INTO TipoUtilizador (nome)
VALUES ('Administrador'),
       ('Cliente');

INSERT INTO Utilizador (nome, email, palavraPasse, tipo)
VALUES ('Administrador', 'admin@gmail.com', '$2b$12$bEA0U1vkool/YOrdtZ4ZpeVUQuIoOJ98I5qKF1pV7Oq/NW./LL5HW', 1),
       ('Cliente 1', 'user@gmail.com', '$2b$12$pDGguGvWL8Bzs.lkNGijh.BTw8TrNv0pv0TtTacI3f3qVuGWT5FCK', 2);

INSERT INTO Armazem (nome, descricao, criadoPor)
VALUES ('Armazém 1', 'Descrição armazém 1', 1),
       ('Armazém 2', 'Descrição armazém 2', 1);

INSERT INTO TipoComponente (nome, criadoPor)
VALUES ('Processador', 1),
       ('Placa Gráfica', 1),
       ('Motherboard', 1),
       ('Memória RAM', 1),
       ('Disco', 1),
       ('Fonte de Alimentação', 1),
       ('Caixa', 1),
       ('Ventoinha', 1),
       ('Monitor', 1);

INSERT INTO Componente (nome, descricao, tipo, preco, iva, imagem, criadoPor)
VALUES  ('Intel i7-9700k', 'Processador Intel Core i7-9700K 3.6GHz c/ Turbo 4.9GHz 12MB Skt1151', 1, 399.90, 23, '', 1),
        ('AMD Ryzen 7 2700X', 'Processador AMD Ryzen 7 2700X 3.7GHz c/ Turbo 4.3GHz 20MB SktAM4', 1, 299.90, 23, '', 1),
        ('AMD Ryzen 5 2600', 'Processador AMD Ryzen 5 2600 3.4GHz c/ Turbo 3.9GHz 19MB SktAM4', 1, 149.90, 23, '', 1),
        ('AMD RX 580 8GB', 'Placa Gráfica MSI Radeon RX 580 Armor 8G OC 8GB GDDR5', 2, 199.90, 23, '', 1),
        ('Placa Gráfica RTX 2080', 'Placa Gráfica MSI GeForce RTX 2080 Gaming X Trio 8GB GDDR6', 2, 899.90, 23, '', 1),
        ('Placa Gráfica RTX 2070', 'Placa Gráfica MSI GeForce RTX 2070 Gaming Z 8GB GDDR6', 2, 599.90, 23, '', 1),
        ('Placa Gráfica RTX 2060', 'Placa Gráfica MSI GeForce RTX 2060 Gaming Z 6GB GDDR6', 2, 399.90, 23, '', 1),
        ('Placa Gráfica GTX 1660 Ti', 'Placa Gráfica MSI GeForce GTX 1660 Ti Gaming X 6GB GDDR6', 2, 299.90, 23, '', 1),
        ('Placa Gráfica GTX 1660', 'Placa Gráfica MSI GeForce GTX 1660 Gaming X 6GB GDDR5', 2, 199.90, 23, '', 1),
        ('Placa Gráfica GTX 1650', 'Placa Gráfica MSI GeForce GTX 1650 Gaming X 4GB GDDR5', 2, 149.90, 23, '', 1),
        ('Placa Gráfica RX 570', 'Placa Gráfica MSI Radeon RX 570 Armor 8G OC 8GB GDDR5', 2, 149.90, 23, '', 1),
        ('Placa Gráfica RX 560', 'Placa Gráfica MSI Radeon RX 560 Aero ITX 4G OC 4GB GDDR5', 2, 99.90, 23, '', 1),
        ('Motherboard MSI B450', 'Motherboard MSI B450 Tomahawk', 3, 99.90, 23, '', 1),
        ('Motherboard MSI B450M', 'Motherboard MSI B450M Mortar', 3, 79.90, 23, '', 1),
        ('Motherboard MSI B450I', 'Motherboard MSI B450I Gaming Plus AC', 3, 89.90, 23, '', 1),
        ('Memória RAM Corsair Vengeance LPX 8GB', 'Memória RAM Corsair Vengeance LPX 8GB DDR4 3000MHz C16 Pretas', 4, 49.90, 23, '', 1),
        ('Memória RAM Corsair Vengeance LPX 16GB', 'Memória RAM Corsair Vengeance LPX 16GB (2x8GB) DDR4 3000MHz C16 Pretas', 4, 89.90, 23, '', 1),
        ('Memória RAM Corsair Vengeance LPX 32GB', 'Memória RAM Corsair Vengeance LPX 32GB (2x16GB) DDR4 3000MHz C16 Pretas', 4, 169.90, 23, '', 1),
        ('Disco Rígido SSD Samsung 860 Evo 250GB', 'Disco Rígido SSD Samsung 860 Evo 250GB 2.5" SATA III', 5, 59.90, 23, '', 1),
        ('Disco Rígido SSD Samsung 860 Evo 500GB', 'Disco Rígido SSD Samsung 860 Evo 500GB 2.5" SATA III', 5, 89.90, 23, '', 1),
        ('Disco Rígido SSD Samsung 860 Evo 1TB', 'Disco Rígido SSD Samsung 860 Evo 1TB 2.5" SATA III', 5, 149.90, 23, '', 1),
        ('Disco Rígido SSD Samsung 970 Evo 250GB', 'Disco Rígido SSD Samsung 970 Evo 250GB M.2 NVMe', 5, 89.90, 23, '', 1),
        ('Placa Gráfica RTX 2080 Ti', 'Placa Gráfica MSI GeForce RTX 2080 Ti Gaming X Trio 11GB GDDR6', 2, 1499.90, 23, '', 1),
        ('MSI Z390 GAMING', 'Motherboard MSI MPG Z390 GAMING EDGE AC', 3, 199.90, 23, '', 1),
        ('Corsair Vengeance 16GB', 'Memória RAM Corsair Vengeance RGB PRO 16GB (2x8GB) DDR4 3200MHz C16 Pretas', 4, 129.90, 23, '', 1),
        ('Samsung 970 Evo Plus', 'Disco Rígido SSD Samsung 970 Evo Plus 500GB M.2 NVMe', 5, 129.90, 23, '', 1),
        ('Corsair RM750x 750W', 'Fonte de Alimentação Corsair RM750x 750W 80 Plus Gold Modular', 6, 129.90, 23, '', 1),
        ('NZXT H500 Preta', 'Caixa NZXT H500 Preta', 7, 79.90, 23, '', 1),
        ('Corsair LL120', 'Ventoinha Corsair LL120 RGB LED 120mm PWM', 8, 29.90, 23, '', 1),
        ('Monitor 24" LED - LG 24MK400H-B', 'Monitor 24" LED - LG 24MK400H-B', 9, 99.90, 23, '', 1),
        ('Samsung 860 Evo 500GB M.2', 'Disco Rígido SSD Samsung 860 Evo 500GB M.2 SATA', 5, 89.90, 23, '', 1),
        ('Samsung 860 Evo 1TB M.2', 'Disco Rígido SSD Samsung 860 Evo 1TB M.2 SATA', 5, 149.90, 23, '', 1);

INSERT INTO ComponenteArmazem (componente, armazem, quantidade)
VALUES  (1, 1, 8),
        (2, 1, 9),
        (3, 1, 7),
        (4, 2, 8),
        (5, 2, 9),
        (6, 2, 7),
        (7, 1, 9),
        (8, 1, 8),
        (9, 1, 7),
        (10, 2, 9),
        (11, 1, 8),
        (12, 1, 13),
        (12, 2, 9),
        (13, 1, 8),
        (14, 1, 9),
        (15, 1, 7),
        (16, 2, 9),
        (17, 2, 8),
        (18, 2, 7),
        (19, 1, 9),
        (20, 1, 8);

INSERT INTO TipoEquipamento (nome, criadoPor)
VALUES  ('Computador Portátil', 1),
        ('Computador Fixo', 1),  
        ('Consola', 1);

INSERT INTO Fornecedor (nome, morada, telefone, email, nif, criadoPor)
VALUES ('Fornecedor 1', 'Rua do Fornecedor 1', '912345678', 'fornecedor1@gmail.com', '123456789', 1),
       ('Fornecedor 2', 'Rua do Fornecedor 2', '912345678', 'fornecedor2@gmail.com', '123456789', 1);

INSERT INTO FornecedorComponente(fornecedor, componente)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 3),
       (2, 5),
       (2, 6),
       (2, 7);
       
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
        ('Montagem (média duração)', 'Montagem com duração entre 30 minutos a 2 horas',35),
        ('Montagem (longa duração)', 'Montagem com duração superior a 2 horas',50),
        ('Reparação (curta duração)', 'Reparação com duração inferior a 30 minutos',30),
        ('Reparação (média duração)', 'Reparação com duração entre 30 minutos e 2 horas',50),
        ('Reparação (longa duração)', 'Reparação com duração superior a 2 horas',75);

INSERT INTO Equipamento (nome, descricao, tipo, preco, iva, criadoPor, maoobra, imagem)
VALUES ('PC Gaming #1', 'Processador: i7-9700k, Placa Gráfica: RTX 2080 Ti, Memória RAM: 16GB, Disco  SSD: 500GB, Fonte de Alimentação: 750W, Caixa: NZXT H500 Preta, Ventoinha: Corsair LL120', 2, 2249.99, 23, 1, 2, '');

INSERT INTO ProducaoEquipamento (equipamento, componente, criadoPor)
VALUES (1, 1, 1),
       (1, 2, 1),
       (1, 3, 1),
       (1, 4, 1),
       (1, 5, 1),
       (1, 6, 1),
       (1, 7, 1),
       (1, 8, 1);

INSERT INTO EquipamentoArmazem (equipamento, armazem, quantidade)
VALUES (1, 1, 3),
       (1, 2, 5);

/*
SELECT * FROM Tipoutilizador;
SELECT * FROM Utilizador;
SELECT * FROM Armazem;
SELECT * FROM Componente;
SELECT * FROM ComponenteArmazem;
SELECT * FROM TipoComponente;
SELECT * FROM TipoEquipamento;
SELECT * FROM Equipamento;
SELECT * FROM ProducaoEquipamento;
SELECT * FROM Fornecedor;
SELECT * FROM EstadoEncomenda;
SELECT * FROM EstadoEntrega;
SELECT * FROM MaoObra;
*/