INSERT INTO users (username, email, password) VALUES ('itchnisan', 'itchi@example.fr', 'ecto03');

-- Récupération de l'ID de l'utilisateur
SET @user_id = LAST_INSERT_ID();

-- Insertion d'une carte Pikachu EX
INSERT INTO items (name_item, value, id_user) VALUES ('Pikachu EX', 42, @user_id);
SET @item_id = LAST_INSERT_ID();
INSERT INTO cards (id_item, edition, rarity) VALUES (@item_id, 'Français', '**');

-- Insertion d'un objet scellé "ETB de Mascarade"
INSERT INTO items (name_item, value, id_user) VALUES ('ETB de Mascarade', 60, @user_id);
SET @item_id = LAST_INSERT_ID();

INSERT INTO sealed (id_item) VALUES (@item_id);
