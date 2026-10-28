-- Q1.5.1
SELECT * FROM produits;
Résultat : 6 lignes

-- Q1.5.2
SELECT * FROM produits WHERE quantite = 0;
Résultat : 1 ligne

-- Q1.5.3
SELECT * FROM produits ORDER BY prix DESC;
Résultat : 6 lignes, l’huile d’olive en premier.

-- Q1.5.4
SELECT p.nom AS produit, c.nom AS categorie
FROM produits p
INNER JOIN categories c ON c.id = p.categorie_id;
Résultat : 6 lignes avec le nom du produit et de sa catégorie.

-- Q1.5.5
SELECT c.nom AS categorie, COUNT(p.id) AS nb_produits
FROM categories c
LEFT JOIN produits p ON p.categorie_id = c.id
GROUP BY c.id, c.nom;
Résultat : Alimentation 2, Boissons 2, Hygiène 1, Papeterie 1.

-- Q1.5.6
SELECT SUM(prix * quantite) AS valeur_stock FROM produits;
Résultat : 777.5

INSERT INTO produits (nom, prix, quantite, date_ajout, categorie_id)
VALUES ('Test prix', -5, 1, '2026-10-05T08:00:00', 1);

Result: CHECK constraint failed: prix >= 0

INSERT INTO produits (nom, prix, quantite, date_ajout, categorie_id)
VALUES ('Test catégorie', 1, 1, '2026-10-05T08:00:00', 99);
Result: FOREIGN KEY constraint failed

DELETE FROM categories WHERE id = 1;
Result: FOREIGN KEY constraint failed
