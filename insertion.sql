INSERT INTO focaccia (id_focaccia, nom, prix) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 8.90),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);

INSERT INTO ingredient (id_ingredient, nom) VALUES
(1, 'Mozzarella'),
(2, 'Gorgonzola'),
(3, 'Raclette'),
(4, 'Emmental'),
(5, 'Champignons'),
(6, 'Jambon'),
(7, 'Chorizo'),
(8, 'Ananas'),
(9, 'Ail'),
(10, 'Oignons'),
(11, 'Poivrons'),
(12, 'Olives'),
(13, 'Herbes');

INSERT INTO marque (id_marque, nom) VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

INSERT INTO boisson (id_boisson, nom, id_marque) VALUES
(1, 'Coca-cola cherry', 1),
(2, 'Coca-cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri-sun', 1),
(6, 'Pepsi', 4),
(7, 'Pepsi Max Zéro', 4),
(8, 'Lipton zéro citron', 4),
(9, 'Lipton Peach', 4),
(10,'Monster energy ultra gold', 3),
(11,'Monster energy ultra blue', 3),
(12,'Eau de source', 2);