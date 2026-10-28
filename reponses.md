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


  Question de réflexion (partie 02)
- On utilise un constructeur `factory` car il construit un objet à partir d'une
  Map (avec des conversions de types) au lieu d'affecter directement des champs.
- On écrit `(map['prix'] as num).toDouble()` car SQLite peut renvoyer un `int`
  pour une valeur comme 5 : `as double` provoquerait alors une erreur.

  ## Partie 03

Q3.2
- (1) Écrire deux fois `DatabaseHelper()` ne crée qu'un seul objet : le constructeur
  `factory` renvoie à chaque fois la même instance `_instance`. C'est le principe
  du singleton, que permet le mot-clé `factory` (il peut retourner un objet existant).
- (2) `??=` affecte la valeur à droite seulement si la variable est null.
  La base n'est donc ouverte qu'une seule fois.
- (3) `onConfigure` est appelé à chaque ouverture de la base, et SQLite oublie
  l'option des clés étrangères à chaque connexion. `onCreate` n'est appelé qu'une
  fois : les clés étrangères seraient désactivées aux lancements suivants.
- (4) `onCreate` n'est appelé qu'une seule fois dans la vie de l'application :
  quand le fichier .db n'existe pas encore.