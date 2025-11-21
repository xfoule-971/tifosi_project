USE tifosi;

-- TABLE ingredient
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- TABLE marque
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- TABLE boisson
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    id_marque INT NOT NULL,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- TABLE focaccia
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL
);

-- TABLE menu
CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL
);

-- TABLE comprend (relation focaccia - ingredient)
CREATE TABLE comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY(id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

-- TABLE appartient (relation boisson - marque)
CREATE TABLE appartient (
    id_boisson INT NOT NULL,
    id_marque INT NOT NULL,
    PRIMARY KEY(id_boisson, id_marque),
    FOREIGN KEY(id_boisson) REFERENCES boisson(id_boisson),
    FOREIGN KEY(id_marque) REFERENCES marque(id_marque)
);

-- TABLE est_constitue (relation menu - focaccia)
CREATE TABLE est_constitue (
    id_menu INT NOT NULL,
    id_focaccia INT NOT NULL,
    PRIMARY KEY(id_menu, id_focaccia),
    FOREIGN KEY(id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY(id_focaccia) REFERENCES focaccia(id_focaccia)
);

-- TABLE contient (relation menu - boisson)
CREATE TABLE contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY(id_menu, id_boisson),
    FOREIGN KEY(id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY(id_boisson) REFERENCES boisson(id_boisson)
);

-- TABLE client
CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT NOT NULL
);

-- TABLE achete (relation client - menu)
CREATE TABLE achete (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,
    PRIMARY KEY(id_client, id_menu, date_achat),
    FOREIGN KEY(id_client) REFERENCES client(id_client),
    FOREIGN KEY(id_menu) REFERENCES menu(id_menu)
);