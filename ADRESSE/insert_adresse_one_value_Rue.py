# insert_adresse_one_value_Rue.py
# OM 2698.03.21 Démonstration de l'insertion d'une valeur dans un champ d'une table.

from DATABASE import connect_db
# Importer le fichier "InsertOneTable" dans lequel il y a quelques classes et méthodes en rapport avec le sujet d'insertion dans UNE SEULE table.
from DATABASE.INSERT import insert_one_table

try:
    # OM 2020.01.28 Une instance "insert_records" pour permettre l'utilisation des méthodes de la classe DbInsertOneTable
    insert_records = insert_one_table.DbInsertOneTable()

    valeur_debile_mais_presque_aleatoire_a_inserer = "Route du closalet "
    # Ligne pour afficher la valeur dans la console...c'est tout
    print(valeur_debile_mais_presque_aleatoire_a_inserer)

    # OM 2020.01.28 Pour éviter les injections SQL, il est possible de passer les valeurs à insérer sous forme "paramètrée" (avec le %(...)s au lieu de %s)
    # Pour les vrais geeks et geeketes consulter le site ci-dessous.
    # L'insertion de données est vraiment TROP inspirée du site suivant MERCI !!! https://realpython.com/prevent-python-sql-injection/
    # Dans la requête SQL le mot clé IGNORE est là pour TRANSFORMER une erreur SQL en une WARNING
    mysql_insert_string = "INSERT IGNORE INTO t_adresse (id_adresse, RueAdresse) VALUES (null, %(values_insert)s)"

    # Insertion de la valeur définie dans la variable "valeur_debile_mais_presque_aleatoire_a_inserer"
    # dans la table "t_genres"
    insert_records.insert_one_record_one_table(mysql_insert_string,
                                               valeur_debile_mais_presque_aleatoire_a_inserer)

except Exception as erreur:
    # OM 2020.03.01 Message en cas d'échec du bon déroulement des commandes ci-dessus.
    print("Message erreur {0}".format(erreur))