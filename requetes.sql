/* ------------------------------------------------------------
   REQUÊTE 1
   But : Afficher la liste des noms des focaccias par ordre alphabétique croissant.
   ------------------------------------------------------------ */
SELECT nom
FROM focaccia
ORDER BY nom ASC;

-- Résultat attendu :
-- Liste triée alphabétiquement (ex : Aglio, Carbonara, Raclaccia, ...)

-- Résultat obtenu :
-- (à copier depuis MySQL)

-- Commentaire :
-- Vérifier que toutes les focaccias ont bien un nom non NULL.


/* ------------------------------------------------------------
   REQUÊTE 2
   But : Afficher le nombre total d'ingrédients.
   ------------------------------------------------------------ */
SELECT COUNT(*) AS nb_ingredients
FROM ingredient;

-- Résultat attendu :
-- Nombre total d’ingrédients présents dans ingredient.xlsx

-- Résultat obtenu :
-- (à copier)

-- Commentaire :
-- Si le nombre ne correspond pas, vérifier les doublons ou lignes vides du fichier Excel.


/* ------------------------------------------------------------
   REQUÊTE 3
   But : Afficher le prix moyen des focaccias.
   ------------------------------------------------------------ */
SELECT AVG(prix) AS prix_moyen
FROM focaccia;

-- Résultat attendu :
-- Moyenne arithmétique calculée depuis focaccia.xlsx

-- Résultat obtenu :
-- (à copier)

-- Commentaire :
-- Si anomalie : vérifier que tous les prix sont numériques.


/* ------------------------------------------------------------
   REQUÊTE 4
   But : Afficher la liste des boissons avec leur marque, triée par nom de boisson.
   ------------------------------------------------------------ */
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;

-- Résultat attendu :
-- Liste des boissons + marque (ex : Coca – Coca-Cola)

-- Résultat obtenu :
-- (à copier)

-- Commentaire :
-- Vérifier que les id_marque sont bien importés.


/* ------------------------------------------------------------
   REQUÊTE 5
   But : Afficher la liste des ingrédients pour la focaccia 'Raclaccia'.
   ------------------------------------------------------------ */
SELECT i.nom
FROM focaccia f
JOIN comprend c ON c.id_focaccia = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = c.id_ingredient
WHERE f.nom = 'Raclaccia';

-- Résultat attendu :
-- Liste des ingrédients composant la Raclaccia.

-- Résultat obtenu :
-- (à copier)

-- Commentaire :
-- Si vide -> vérifier la table "comprend".


/* ------------------------------------------------------------
   REQUÊTE 6
   But : Afficher le nom et le nombre d'ingrédients pour chaque focaccia.
   ------------------------------------------------------------ */
SELECT f.nom, COUNT(c.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom;

-- Résultat attendu :
-- Tableau des focaccias + nombre d’ingrédients associés.

-- Résultat obtenu :
-- (à copier)

-- Commentaire :
-- Les focaccias avec 0 ingrédient doivent apparaître grâce au LEFT JOIN.


/* ------------------------------------------------------------
   REQUÊTE 7
   But : Afficher le nom de la focaccia qui a le plus d'ingrédients.
   ------------------------------------------------------------ */
SELECT f.nom, COUNT(c.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY nb_ingredients DESC
LIMIT 1;

-- Résultat attendu :
-- La focaccia la plus chargée en ingrédients.

-- Résultat obtenu :
-- (à copier)

-- Commentaire :
-- En cas d’égalité, seule la première apparaît (LIMIT 1).


/* ------------------------------------------------------------
   REQUÊTE 8
   But : Afficher la liste des focaccias qui contiennent de l'ail.
   ------------------------------------------------------------ */
SELECT DISTINCT f.nom
FROM focaccia f
JOIN comprend c ON c.id_focaccia = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = c.id_ingredient
WHERE i.nom = 'Ail';

-- Résultat attendu :
-- Les focaccias qui utilisent l’ingrédient “Ail”.

-- Résultat obtenu :
-- (à copier)

-- Commentaire :
-- Vérifier que dans ingredient.xlsx, “Ail” est orthographié identiquement.


/* ------------------------------------------------------------
   REQUÊTE 9
   But : Afficher la liste des ingrédients inutilisés (aucune focaccia).
   ------------------------------------------------------------ */
SELECT i.nom
FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_focaccia IS NULL;

-- Résultat attendu :
-- Ingrédients présents dans ingredient.xlsx mais jamais utilisés.

-- Résultat obtenu :
-- (à copier)

-- Commentaire :
-- S’il y en a beaucoup → problème d’import dans comprend.


/* ------------------------------------------------------------
   REQUÊTE 10
   But : Afficher la liste des focaccia qui n'ont pas de champignons.
   ------------------------------------------------------------ */
SELECT f.nom
FROM focaccia f
WHERE NOT EXISTS (
    SELECT 1
    FROM comprend c
    JOIN ingredient i ON i.id_ingredient = c.id_ingredient
    WHERE c.id_focaccia = f.id_focaccia
      AND i.nom = 'Champignons'
);

-- Résultat attendu :
-- Toutes les focaccias ne contenant pas « Champignons ».

-- Résultat obtenu :
-- (à copier)

-- Commentaire :
-- Vérifier l’orthographe de “Champignons” dans ingredient.xlsx.


