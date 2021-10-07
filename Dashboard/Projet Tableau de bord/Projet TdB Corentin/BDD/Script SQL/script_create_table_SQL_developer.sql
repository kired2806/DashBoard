DROP TABLE TOUCHER;
DROP TABLE CONTENIR;
DROP TABLE CONCERNER;
DROP TABLE ECRIRE;
DROP TABLE COMPETITION;
DROP TABLE SPORT;
DROP TABLE KEYWORD;
DROP TABLE AUTEUR;
DROP TABLE ARTICLE;

/*Article*/
CREATE TABLE ARTICLE(
    idArticle NUMBER(10,0) NOT NULL,
    titre varchar(1000) NOT NULL,
	datePubli varchar(50) NULL,
	siteArticle varchar(50) NOT NULL,
	lien varchar(100) NOT NULL,
	typeArticle varchar(50) NULL,
    CONSTRAINT pk_article PRIMARY KEY(idArticle));
    
/*Auteur*/
CREATE TABLE AUTEUR(
	idAuteur NUMBER(10,0) NOT NULL,
	descAuteur VARCHAR(1000) NOT NULL,
    CONSTRAINT pk_auteur PRIMARY KEY(idAuteur));
 
/*Keyword*/    
CREATE TABLE KEYWORD(
	idMot NUMBER(10,0) NOT NULL,
    Mot VARCHAR(500) NOT NULL,
	Categ VARCHAR(10) NULL,
    CONSTRAINT pk_keyword PRIMARY KEY(idMot));

/*Sport*/    
CREATE TABLE SPORT(
	idSport NUMBER(10,0) NOT NULL,
	nomSport VARCHAR(50) NOT NULL,
    typeSport VARCHAR(50) NULL,
    CONSTRAINT pk_sport PRIMARY KEY(idSport));
    
/*Competition*/
CREATE TABLE COMPETITION(
    idCompet NUMBER(10,0) NOT NULL,
    libCompet VARCHAR(50) NOT NULL,
    CONSTRAINT pk_compet PRIMARY KEY(idCompet)); 
    
/*Ecrire*/
CREATE TABLE ECRIRE(
    idArticle NUMBER(10,0) NOT NULL,
    idAuteur NUMBER(10,0) NOT NULL,
    CONSTRAINT pk_ecrire PRIMARY KEY(idArticle,idAuteur));
    
ALTER TABLE ECRIRE
    ADD CONSTRAINT fk_article
    FOREIGN KEY (idArticle)
    REFERENCES ARTICLE(idArticle);
    
ALTER TABLE ECRIRE
    ADD CONSTRAINT fk_auteur
    FOREIGN KEY (idAuteur)
    REFERENCES AUTEUR(idAuteur);
    
/*Contenir*/
CREATE TABLE CONTENIR(
    idArticle NUMBER(10,0) NOT NULL,
    idMot NUMBER(10,0) NOT NULL,
    CONSTRAINT pk_cont PRIMARY KEY(idArticle,idMot));
    
ALTER TABLE CONTENIR
    ADD CONSTRAINT fk_aricle_contenir
    FOREIGN KEY (idArticle)
    REFERENCES ARTICLE(idArticle);
    
ALTER TABLE CONTENIR
    ADD CONSTRAINT fk_keyword_contenir
    FOREIGN KEY (idMot)
    REFERENCES KEYWORD(idMot);
    
/*Concerner*/
CREATE TABLE CONCERNER(
    idArticle NUMBER(10,0) NOT NULL,
    idCompet NUMBER(10,0) NOT NULL,
    CONSTRAINT pk_concerner PRIMARY KEY (idArticle,idCompet));
    
ALTER TABLE CONCERNER
    ADD CONSTRAINT fk_article_concerner
    FOREIGN KEY (idArticle)
    REFERENCES ARTICLE(idArticle);

ALTER TABLE CONCERNER
    ADD CONSTRAINT fk_compet_concerner
    FOREIGN KEY (idCompet)
    REFERENCES COMPETITION(idCompet);

/*Toucher*/
CREATE TABLE TOUCHER(
    idArticle NUMBER(10,0) NOT NULL,
    idSport NUMBER(10,0) NOT NULL,
    CONSTRAINT pk_toucher PRIMARY KEY (idArticle,idSport));

ALTER TABLE TOUCHER
    ADD CONSTRAINT fk_article_toucher
    FOREIGN KEY (idArticle)
    REFERENCES ARTICLE(idArticle);

ALTER TABLE TOUCHER
    ADD CONSTRAINT fk_sport_toucher
    FOREIGN KEY (idSport)
    REFERENCES SPORT(idSport);
    
commit;