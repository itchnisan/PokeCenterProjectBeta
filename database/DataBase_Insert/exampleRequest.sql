#SELECT * FROM users;
#SELECT * FROM items;
#SELECT * FROM cards;
#SELECT * FROM sealed;

-- Sélection des cartes avec les informations utilisateur en utilisant USING
SELECT name_item,username,id_item,value as price ,id_card AS id_type FROM users
JOIN items USING (id_user)
JOIN cards USING (id_item)
UNION 
SELECT name_item,username,id_item,value as price,id_sealed AS id_type FROM users
JOIN items USING (id_user)
JOIN sealed USING (id_item);