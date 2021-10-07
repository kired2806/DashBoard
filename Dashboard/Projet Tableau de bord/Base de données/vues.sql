-- Evolution du type d’arnaque dans le temps
CREATE OR REPLACE VIEW VIEW_TYPEARNAQUE_TEMPS (type_arnaque,annee_arnaque,nb_arnaque) AS
  SELECT arn.type_arnaque,TO_CHAR(art.date_article,'YYYY'), COUNT(*)
  FROM ARNAQUE arn, ARTICLE art
  WHERE arn.id_article = art.id_article
  GROUP BY (arn.type_arnaque,TO_CHAR(art.date_article,'YYYY'))
  ORDER BY TO_CHAR(art.date_article,'YYYY'),arn.type_arnaque;
    
-- Evolution du theme de l'arnaque dans le temps
CREATE OR REPLACE VIEW VIEW_THEMEARNAQUE_TEMPS (theme,annee_arnaque,nb_arnaque) AS
  SELECT art.theme,TO_CHAR(art.date_article,'YYYY'), COUNT(*)
  FROM ARTICLE art
  GROUP BY (art.theme,TO_CHAR(art.date_article,'YYYY'))
  ORDER BY art.theme, TO_CHAR(art.date_article,'YYYY');

-- Mots clefs en fonction de la détection des fraudes
CREATE OR REPLACE VIEW VIEW_MOTCLEF_DETECTION (motclef,theme,annee_arnaque,nb_motclef) AS
  SELECT mc.mot_clef, art.theme,TO_CHAR(art.date_article,'YYYY'), COUNT(*)
  FROM  MOTCLEF mc, ARTICLE art
  WHERE mc.id_article = art.id_article AND art.theme = 'detection'
  GROUP BY (mc.mot_clef,art.theme,TO_CHAR(art.date_article,'YYYY'));

-- Mots clefs en fonction de la description des arnaques
CREATE OR REPLACE VIEW VIEW_MOTCLEF_DESCRIPTION (motclef,theme,annee_arnaque,nb_motclef) AS
  SELECT mc.mot_clef, art.theme,TO_CHAR(art.date_article,'YYYY'),COUNT(*)
  FROM  MOTCLEF mc, ARTICLE art
  WHERE mc.id_article = art.id_article AND art.theme = 'description'
  GROUP BY (mc.mot_clef,art.theme,TO_CHAR(art.date_article,'YYYY'));


-- Pays proportion article TEMPS
CREATE VIEW VIEW_PAYS_ARTICLE_TEMPS (pays, annee, nb_article) AS
    SELECT aut.pays, TO_CHAR(art.date_article,'YYYY'), count(*)
        FROM 
            article art, ecrire ecr, auteur aut
        WHERE
            art.id_article = ecr.id_article
            and aut.id_auteur = ecr.id_auteur
            and aut.pays is not null
        GROUP BY (aut.pays, TO_CHAR(art.date_article,'YYYY'))
        HAVING count(*) > 10
        ORDER BY aut.pays, TO_CHAR(art.date_article,'YYYY');


-- Pays proportion article TEMPS / THEME
CREATE VIEW VIEW_PAYS_ARTICLE_theme (pays, theme, nb_article) AS
    SELECT aut.pays, art.theme, count(*)
        FROM 
            article art, ecrire ecr, auteur aut
        WHERE
            art.id_article = ecr.id_article
            and aut.id_auteur = ecr.id_auteur
            and aut.pays is not null
        GROUP BY (aut.pays, art.theme)
        HAVING count(*) > 10
        ORDER BY aut.pays, art.theme;


