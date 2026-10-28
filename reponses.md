Q1.6
- a) CHECK constraint failed: prix >= 0
- b) FOREIGN KEY constraint failed (la catégorie 99 n'existe pas)
- c) FOREIGN KEY constraint failed (la catégorie 1 contient des produits)
Q1.7 schema.sql contient uniquement les instructions CREATE TABLE des deux
tables, sans aucune donnée.

**Q1.8** Un fichier SQLite ne supporte pas bien deux programmes qui écrivent en même
temps. Si DB Browser garde la base ouverte, l'application peut avoir l'erreur
« database is locked » ou travailler sur des données pas à jour.