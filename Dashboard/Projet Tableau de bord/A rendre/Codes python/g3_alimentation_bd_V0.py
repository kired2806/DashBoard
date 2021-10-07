# lien avec sqldevloper
import cx_Oracle
from sqlalchemy import create_engine


# ACTEUR
def insert_acteur(
    id_acteur: int, nom: str, demographie: str, nationalite: str, adresseBD: str = ""
) -> (int, str):
    """Documentation
      fonction d'insertion d'un nouveau acteur dans la base de données via une procedure 
      Parameters:
            id_acteur,nom, demographie, nationalite : attributs de la table acteur
            adresseBD : adresse de la base de données créée 

      Out:
            retour: ( 0 si la procedure s'est excutée sans erreurs , 1 sinon)
            retourVal: le message de sortie ( 'ok' si l'insertion s'est passée correctement 'message d'erreurs SQl' sinon )
    """
    engine = create_engine(adresseBD, max_identifier_length=128)
    connection = engine.raw_connection()
    try:
        cursor = (
            connection.cursor()
        )  # Initialisation de la connexion avec les serveurs de la fac
        retour = cursor.var(
            cx_Oracle.NUMBER
        )  # Initialisation d'une variable SQL de type NUMBER
        retourVal = cursor.var(
            cx_Oracle.STRING
        )  # Initialisation d'une variable SQL de type STRING/VARCHAR
        cursor.callproc(
            "insert_acteur",
            [id_acteur, nom, demographie, nationalite, retour, retourVal],
        )
        cursor.close()
        connection.commit()
    finally:
        connection.close()
    return retour.values[0], retourVal.values[0]


# ARTICLE
def insert_article(
    id_article: int, date_article: str, titre: str, theme: str, adresseBD: str = ""
) -> (int, str):
    """Documentation
        fonction d'insertion d'un nouveau article dans la base de données via une procedure 
      Parameters:
            id_article, date_article, titre, theme: attributs de la table article 
            adresseBD : adresse de la base de données créée  

      Out:
            retour: ( 0 si la procedure s'est excutée sans erreurs )
            retourVal: le message de sortie ( 'ok' si l'insertion s'est passée correctement 'message d'erreurs SQl' sinon )
    """
    engine = create_engine(adresseBD, max_identifier_length=128)
    connection = engine.raw_connection()
    try:
        cursor = connection.cursor()
        retour = cursor.var(cx_Oracle.NUMBER)
        retourVal = cursor.var(cx_Oracle.STRING)
        cursor.callproc(
            "insert_article",
            [id_article, date_article, titre, theme, retour, retourVal],
        )
        cursor.close()
        connection.commit()
    finally:
        connection.close()
    return retour.values[0], retourVal.values[0]


# AUTEUR
def insert_auteur(
    id_auteur: int, nom: str, affiliation: str, pays: str, adresseBD: str = ""
) -> (int, str):
    """Documentation
      fonction d'insertion d'un nouveau auteur dans la base de données via une procedure 
      Parameters:
            id_auteur, nom, affiliation, pays: attributs de la table auteur
            adresseBD : adresse de la base de données créée 

      Out:
            retour: ( 0 si la procedure s'est excutée sans erreurs)
            retourVal: le message de sortie ( 'ok' si l'insertion s'est passée correctement 'message d'erreurs SQl' sinon )    
    """
    engine = create_engine(adresseBD, max_identifier_length=128)
    connection = engine.raw_connection()
    try:
        cursor = connection.cursor()
        retour = cursor.var(cx_Oracle.NUMBER)
        retourVal = cursor.var(cx_Oracle.STRING)
        cursor.callproc(
            "insert_auteur", [id_auteur, nom, affiliation, pays, retour, retourVal]
        )
        cursor.close()
        connection.commit()
    finally:
        connection.close()
    return retour.values[0], retourVal.values[0]


# ARNAQUE
def insert_arnaque(
    id_arnaque: int,
    type_arnaque: str,
    date_arnaque: str,
    plateforme_utilisee: str,
    nb_victimes: int,
    nb_arnaqueurs: int,
    id_article: int,
    adresseBD: str = "",
) -> (int, str):
    """Documentation
      fonction d'insertion d'une nouvelle arnaque dans la base de données via une procedure 
      Parameters:
            id_arnaque, type_arnaque, date_arnaque, plateforme_utilisee, nb_victimes, nb_arnaqueurs, id_article: attributs de la table arnaque
            adresseBD : adresse de la base de données créée 

      Out:
            retour: ( 0 si la procedure s'est excutée sans erreurs )
            retourVal: le message de sortie ( 'ok' si l'insertion s'est passée correctement 'message d'erreurs SQl' sinon )
    """
    engine = create_engine(adresseBD, max_identifier_length=128)
    connection = engine.raw_connection()
    try:
        cursor = connection.cursor()
        retour = cursor.var(cx_Oracle.NUMBER)
        retourVal = cursor.var(cx_Oracle.STRING)
        cursor.callproc(
            "insert_arnaque",
            [
                id_arnaque,
                type_arnaque,
                date_arnaque,
                plateforme_utilisee,
                nb_victimes,
                nb_arnaqueurs,
                id_article,
                retour,
                retourVal,
            ],
        )
        cursor.close()
        connection.commit()
    finally:
        connection.close()
    return retour.values[0], retourVal.values[0]


# MOTCLEF
def insert_motclef(id_article: int, mot_clef: str, adresseBD: str = "") -> (int, str):
    """Documentation
      fonction d'insertion d'un nouveau mot clef dans la base de données via une procedure 
      Parameters:
            id_article, mot_clef: attributs de la table motclef
            adresseBD : adresse de la base de données créée 

      Out:
            retour: ( 0 si la procedure s'est excutée sans erreurs)
            retourVal: le message de sortie ( 'ok' si l'insertion s'est passée correctement 'message d'erreurs SQl' sinon )
    """
    engine = create_engine(adresseBD, max_identifier_length=128)
    connection = engine.raw_connection()
    try:
        cursor = connection.cursor()
        retour = cursor.var(cx_Oracle.NUMBER)
        retourVal = cursor.var(cx_Oracle.STRING)
        cursor.callproc("insert_motclef", [id_article, mot_clef, retour, retourVal])
        cursor.close()
        connection.commit()
    finally:
        connection.close()
    return retour.values[0], retourVal.values[0]


# SUBIR
def insert_subir(id_arnaque: int, id_acteur: int, adresseBD: str = "") -> (int, str):
    """Documentation
    fonction d'insertion d'un tuple dans la table subir via une procedure 
      Parameters:
            id_arnaque, id_acteur: attributs de la table subir
            adresseBD : adresse de la base de données créée 

      Out:
            retour: ( 0 si la procedure s'est excutée sans erreurs )
            retourVal: le message de sortie ( 'ok' si l'insertion s'est passée correctement 'message d'erreurs SQl' sinon )
    """
    engine = create_engine(adresseBD, max_identifier_length=128)
    connection = engine.raw_connection()
    try:
        cursor = connection.cursor()
        retour = cursor.var(cx_Oracle.NUMBER)
        retourVal = cursor.var(cx_Oracle.STRING)
        cursor.callproc("insert_subir", [id_arnaque, id_acteur, retour, retourVal])
        cursor.close()
        connection.commit()
    finally:
        connection.close()
    return retour.values[0], retourVal.values[0]


# ECRIRE
def insert_ecrire(id_article: int, id_auteur: int, adresseBD: str = "") -> (int, str):
    """Documentation
    fonction d'insertion d'un tuple dans la table ecrire via une procedure 
      Parameters:
            id_article, id_auteur: attributs de la table ecrire
            adresseBD : adresse de la base de données créée  

      Out:
            retour: ( 0 si la procedure s'est excuté sans erreur )
            retourVal: le message de sortie ( 'ok' si l'insertion s'est passée correctement 'message d'erreurs SQl' sinon )
    """
    engine = create_engine(adresseBD, max_identifier_length=128)
    connection = engine.raw_connection()
    try:
        cursor = connection.cursor()
        retour = cursor.var(cx_Oracle.NUMBER)
        retourVal = cursor.var(cx_Oracle.STRING)
        cursor.callproc("insert_ecrire", [id_article, id_auteur, retour, retourVal])
        cursor.close()
        connection.commit()
    finally:
        connection.close()
    return retour.values[0], retourVal.values[0]


# CREER
def insert_creer(id_arnaque: int, id_acteur: int, adresseBD="") -> (int, str):
    """Documentation
    fonction d'insertion d'un tuple dans la table creer via une procedure 
      Parameters:
            id_arnaque, id_acteur: attributs de la table creer
            adresseBD : adresse de la base de données créée 

      Out:
            retour: ( 0 si la procedure s'est excutée sans erreurs )
            retourVal: le message de sortie ( 'ok' si l'insertion s'est passée correctement 'message d'erreurs SQl' sinon )
    """
    engine = create_engine(adresseBD, max_identifier_length=128)
    connection = engine.raw_connection()
    try:
        cursor = connection.cursor()
        retour = cursor.var(cx_Oracle.NUMBER)
        retourVal = cursor.var(cx_Oracle.STRING)
        cursor.callproc("insert_creer", [id_arnaque, id_acteur, retour, retourVal])
        cursor.close()
        connection.commit()
    finally:
        connection.close()
    return retour.values[0], retourVal.values[0]


# CONTRER
def insert_contrer(id_arnaque: int, id_acteur: int, adresseBD="") -> (int, str):
    """Documentation
      fonction d'insertion d'un tuple dans la table contrer via une procedure 
      Parameters:
            id_arnaque, id_acteur: attributs de la table contrer
            adresseBD : adresse de la base de données créée  

      Out:
            retour: ( 0 si la procedure s'est excutée sans erreurs)
            retourVal: le message de sortie ( 'ok' si l'insertion s'est passée correctement 'message d'erreurs SQl' sinon )
    """
    engine = create_engine(adresseBD, max_identifier_length=128)
    connection = engine.raw_connection()
    try:
        cursor = connection.cursor()
        retour = cursor.var(cx_Oracle.NUMBER)
        retourVal = cursor.var(cx_Oracle.STRING)
        cursor.callproc("insert_contrer", [id_arnaque, id_acteur, retour, retourVal])
        cursor.close()
        connection.commit()
    finally:
        connection.close()
    return retour.values[0], retourVal.values[0]


# Test
if __name__ == "__main__":
    adresseBD = (
        "oracle://" + username + ":" + password + "@telline.univ-tlse3.fr:1521/etupre"
    )
    insert_acteur(13, "Toto", "jesaispas", "française", adresseBD)
    insert_article(1, "02/03/1953", "Les arnaques c'est la vie", "Arnaques", adresseBD)
    insert_auteur(1, "Tata", "jesaispasnonplus", "Australie", adresseBD)
    insert_arnaque(
        4, "Le type", "25/06/2017", "La plateforme", 34524, 34534, 345, adresseBD
    )
    insert_motclef(34, "Lesupermotclef", adresseBD)
    insert_subir(76, 675, adresseBD)
    insert_ecrire(234, 2145, adresseBD)
    insert_creer(54, 543, adresseBD)
    insert_contrer(765, 43, adresseBD)
