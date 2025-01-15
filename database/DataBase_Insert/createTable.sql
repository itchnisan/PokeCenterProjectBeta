-- Table users
CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table items
CREATE TABLE items (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    name_item VARCHAR(100) NOT NULL,
    description TEXT,
    value DECIMAL(10, 2),
    id_user INT NOT NULL,
    acquired_date DATE,
    FOREIGN KEY (id_user) REFERENCES users(id_user) ON DELETE CASCADE
);

-- Table cards
CREATE TABLE cards (
    id_card INT AUTO_INCREMENT PRIMARY KEY,
    edition VARCHAR(100),
    rarity VARCHAR(50),
    id_item INT NOT NULL,
    FOREIGN KEY (id_item) REFERENCES items(id_item) ON DELETE CASCADE
);

-- Table sealed
CREATE TABLE sealed (
    id_sealed INT AUTO_INCREMENT PRIMARY KEY,
    id_item INT NOT NULL,
    FOREIGN KEY (id_item) REFERENCES items(id_item) ON DELETE CASCADE
);

-- Table trade
CREATE TABLE trade (
    id_trade INT AUTO_INCREMENT PRIMARY KEY,
    id_user_from INT NOT NULL,
    id_user_to INT NOT NULL,
    id_item INT NOT NULL,
    trade_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_user_from) REFERENCES users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_user_to) REFERENCES users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_item) REFERENCES items(id_item) ON DELETE CASCADE
);

-- Table sale
CREATE TABLE sale (
    id_sale INT AUTO_INCREMENT PRIMARY KEY,
    id_item INT NOT NULL,
    id_seller INT NOT NULL,
    id_buyer INT,
    sale_price DECIMAL(10, 2) NOT NULL,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_item) REFERENCES items(id_item) ON DELETE CASCADE,
    FOREIGN KEY (id_seller) REFERENCES users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_buyer) REFERENCES users(id_user) ON DELETE SET NULL
);

-- Table data
CREATE TABLE data (
    id_data INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    financial_info JSON,
    FOREIGN KEY (id_user) REFERENCES users(id_user) ON DELETE CASCADE
);
