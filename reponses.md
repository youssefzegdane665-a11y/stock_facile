Q1.6
- a) CHECK constraint failed: prix >= 0
- b) FOREIGN KEY constraint failed (la catégorie 99 n'existe pas)
- c) FOREIGN KEY constraint failed (la catégorie 1 contient des produits)
Q1.7 schema.sql contient uniquement les instructions CREATE TABLE des deux
tables, sans aucune donnée.

Q1.8Un fichier SQLite ne supporte pas bien deux programmes qui écrivent en même
temps. Si DB Browser garde la base ouverte, l'application peut avoir l'erreur
« database is locked » ou travailler sur des données pas à jour.


## Partie 02

Q2.1
- sqflite : permet d'exécuter des requêtes SQLite depuis Dart.
- path : construit le chemin du fichier de la base (fonction join).
- sqflite_common_ffi : fait fonctionner SQLite sur Windows et Linux.

Q2.3
- `id` est `int?` car il vaut null tant que la catégorie n'a pas été enregistrée :
  c'est la base (AUTOINCREMENT) qui le génère.
- `toMap()` n'ajoute `id` que s'il n'est pas null, pour laisser SQLite choisir
  l'id lors d'un insert.