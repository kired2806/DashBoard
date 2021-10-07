-- Destruction des tables
DROP TABLE SUBIR;
DROP TABLE ECRIRE;
DROP TABLE CREER;
DROP TABLE CONTRER;
DROP TABLE MOTCLEF;
DROP TABLE ARNAQUE;
DROP TABLE ACTEUR;
DROP TABLE ARTICLE;
DROP TABLE AUTEUR;


-- Création des tables
CREATE TABLE ACTEUR(
    id_acteur number,
    nom varchar2(30),
    demographie varchar2(30),
    nationalite varchar2(30),
    CONSTRAINT pk_acteur PRIMARY KEY (id_acteur)
);
CREATE TABLE ARTICLE(
    id_article number,
    date_article date,
    titre varchar2(300),
    theme varchar2(30),
    CONSTRAINT pk_article PRIMARY KEY (id_article)
);
CREATE TABLE AUTEUR(
    id_auteur number,
    nom varchar2(100),
    affiliation varchar2(200),
    pays varchar2(60),
    CONSTRAINT pk_auteur PRIMARY KEY (id_auteur)
);
CREATE TABLE ARNAQUE(
    id_arnaque number,
    type_arnaque varchar2(30),
    date_arnaque date,
    plateforme_utilisee varchar2(30),
    nb_victimes number,
    nb_arnaqueurs number,
    id_article number,
    CONSTRAINT pk_arnaque PRIMARY KEY (id_arnaque),
    CONSTRAINT fk_arnaque FOREIGN KEY (id_article) REFERENCES ARTICLE(id_article)
);
CREATE TABLE MOTCLEF(
    id_article number,
    mot_clef varchar2(30),
    CONSTRAINT fk_motclef FOREIGN KEY (id_article) REFERENCES ARTICLE(id_article),
    CONSTRAINT pk_motclef PRIMARY KEY (id_article, mot_clef)    
);
CREATE TABLE SUBIR(
    id_arnaque number,
    id_acteur number,
    CONSTRAINT fk_subir_arnaque FOREIGN KEY (id_arnaque) REFERENCES ARNAQUE(id_arnaque),
    CONSTRAINT fk_subir_acteur FOREIGN KEY (id_acteur) REFERENCES ACTEUR(id_acteur),
    CONSTRAINT pk_subir PRIMARY KEY (id_arnaque, id_acteur)
);
CREATE TABLE ECRIRE(
    id_article number,
    id_auteur number,
    CONSTRAINT fk_ecrire_article FOREIGN KEY (id_article) REFERENCES ARTICLE(id_article),
    CONSTRAINT fk_ecrire_auteur FOREIGN KEY (id_auteur) REFERENCES AUTEUR(id_auteur),
    CONSTRAINT pk_ecrire PRIMARY KEY (id_article, id_auteur)
);
CREATE TABLE CREER(
    id_arnaque number,
    id_acteur number,
    CONSTRAINT fk_creer_arnaque FOREIGN KEY (id_arnaque) REFERENCES ARNAQUE(id_arnaque),
    CONSTRAINT fk_creer_acteur FOREIGN KEY (id_acteur) REFERENCES ACTEUR(id_acteur),
    CONSTRAINT pk_creer PRIMARY KEY (id_arnaque, id_acteur)
);
CREATE TABLE CONTRER(
    id_arnaque number,
    id_acteur number,
    CONSTRAINT fk_contrer_arnaque FOREIGN KEY (id_arnaque) REFERENCES ARNAQUE(id_arnaque),
    CONSTRAINT fk_contrer_acteur FOREIGN KEY (id_acteur) REFERENCES ACTEUR(id_acteur),
    CONSTRAINT pk_contrer PRIMARY KEY (id_arnaque, id_acteur)
);

COMMIT;
