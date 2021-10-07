-- Création des procédures
CREATE OR REPLACE PROCEDURE INSERT_ACTEUR (pid_acteur ACTEUR.id_acteur %TYPE,
                                    pnom ACTEUR.nom %TYPE,
                                    pdemographie ACTEUR.demographie %TYPE,
                                    pnationalite ACTEUR.nationalite %TYPE,
                                    retour out NUMBER,
                                    retourVal out varchar2) AS
    BEGIN
        INSERT INTO ACTEUR values (pid_acteur, pnom, pdemographie, pnationalite);
        retour := 0;
        retourVal := 'OK';
        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index then
            retour := 1;
            retourVal := 'DEJA INSERE';
        WHEN OTHERS THEN
            retour := SQLCODE;
            retourVal := SQLERRM;
END;
/

CREATE OR REPLACE PROCEDURE INSERT_ARTICLE (pid_article ARTICLE.id_article %TYPE,
                                     pdate_article ARTICLE.date_article %TYPE,
                                     ptitre ARTICLE.titre %TYPE,
                                     ptheme ARTICLE.theme %TYPE,
                                     retour out NUMBER,
                                     retourVal out varchar2) AS
    BEGIN
        INSERT INTO ARTICLE values (pid_article, pdate_article, ptitre, ptheme);
        retour := 0;
        retourVal := 'OK';
        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index then
            retour := 1;
            retourVal := 'DEJA INSERE';
        WHEN OTHERS THEN
            retour := SQLCODE;
            retourVal := SQLERRM;
END;
/

CREATE OR REPLACE PROCEDURE INSERT_AUTEUR (pid_auteur AUTEUR.id_auteur %TYPE,
                                    pnom AUTEUR.nom %TYPE,
                                    paffiliation AUTEUR.affiliation %TYPE,
                                    ppays AUTEUR.pays %TYPE,
                                    retour out NUMBER,
                                    retourVal out varchar2) AS
    BEGIN
        INSERT INTO AUTEUR values (pid_auteur, pnom, paffiliation, ppays);
        retour := 0;
        retourVal := 'OK';
        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index then
            retour := 1;
            retourVal := 'DEJA INSERE';
        WHEN OTHERS THEN
            retour := SQLCODE;
            retourVal := SQLERRM;
END;
/

CREATE OR REPLACE PROCEDURE INSERT_ARNAQUE (pid_arnaque ARNAQUE.id_arnaque %TYPE,
                                     ptype_arnaque ARNAQUE.type_arnaque %TYPE,
                                     pdate_arnaque ARNAQUE.date_arnaque %TYPE,
                                     pplateforme_utilisee ARNAQUE.plateforme_utilisee %TYPE,
                                     pnb_victimes ARNAQUE.nb_victimes %TYPE,
                                     pnb_arnaqueurs ARNAQUE.nb_arnaqueurs %TYPE,
                                     pid_article ARNAQUE.id_article %TYPE,
                                     retour out NUMBER,
                                     retourVal out varchar2) AS
    BEGIN
        INSERT INTO ARNAQUE values (pid_arnaque, ptype_arnaque, pdate_arnaque, pplateforme_utilisee, pnb_victimes, pnb_arnaqueurs, pid_article);
        retour := 0;
        retourVal := 'OK';
        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index then
            retour := 1;
            retourVal := 'DEJA INSERE';
        WHEN OTHERS THEN
            retour := SQLCODE;
            retourVal := SQLERRM;
END;
/

CREATE OR REPLACE PROCEDURE INSERT_MOTCLEF (pid_article MOTCLEF.id_article %TYPE,
                                            pmot_clef MOTCLEF.mot_clef %TYPE,
                                            retour out NUMBER,
                                            retourVal out varchar2) AS
    BEGIN
        INSERT INTO MOTCLEF values (pid_article, pmot_clef);
        retour := 0;
        retourVal := 'OK';
        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index then
            retour := 1;
            retourVal := 'DEJA INSERE';
        WHEN OTHERS THEN
            retour := SQLCODE;
            retourVal := SQLERRM;
END;
/

CREATE OR REPLACE PROCEDURE INSERT_SUBIR (pid_arnaque SUBIR.id_arnaque %TYPE,
                                            pid_acteur SUBIR.id_acteur %TYPE,
                                            retour out NUMBER,
                                            retourVal out varchar2) AS
    BEGIN
        INSERT INTO SUBIR values (pid_arnaque, pid_acteur);
        retour := 0;
        retourVal := 'OK';
        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index then
            retour := 1;
            retourVal := 'DEJA INSERE';
        WHEN OTHERS THEN
            retour := SQLCODE;
            retourVal := SQLERRM;
END;
/

CREATE OR REPLACE PROCEDURE INSERT_ECRIRE (pid_article ECRIRE.id_article %TYPE,
                                            pid_auteur ECRIRE.id_auteur %TYPE,
                                            retour out NUMBER,
                                            retourVal out varchar2) AS
    BEGIN
        INSERT INTO ECRIRE values (pid_article, pid_auteur);
        retour := 0;
        retourVal := 'OK';
        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index then
            retour := 1;
            retourVal := 'DEJA INSERE';
        WHEN OTHERS THEN
            retour := SQLCODE;
            retourVal := SQLERRM;
END;
/

CREATE OR REPLACE PROCEDURE INSERT_CREER (pid_arnaque CREER.id_arnaque %TYPE,
                                            pid_acteur CREER.id_acteur %TYPE,
                                            retour out NUMBER,
                                            retourVal out varchar2) AS
    BEGIN
        INSERT INTO CREER values (pid_arnaque, pid_acteur);
        retour := 0;
        retourVal := 'OK';
        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index then
            retour := 1;
            retourVal := 'DEJA INSERE';
        WHEN OTHERS THEN
            retour := SQLCODE;
            retourVal := SQLERRM;
END;
/

CREATE OR REPLACE PROCEDURE INSERT_CONTRER (pid_arnaque CONTRER.id_arnaque %TYPE,
                                            pid_acteur CONTRER.id_acteur %TYPE,
                                            retour out NUMBER,
                                            retourVal out varchar2) AS
    BEGIN
        INSERT INTO CONTRER values (pid_arnaque, pid_acteur);
        retour := 0;
        retourVal := 'OK';
        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index then
            retour := 1;
            retourVal := 'DEJA INSERE';
        WHEN OTHERS THEN
            retour := SQLCODE;
            retourVal := SQLERRM;
END;
/

