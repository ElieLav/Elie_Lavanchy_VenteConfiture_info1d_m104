# insert_one_row_client_a_adresse.py
# OM 2698.03.27 Permet d'insérer des valeurs dans la table "t_genres_films"

# Importer le fichier "InsertOneTable" dans lequel il y a quelques classes et méthodes en rapport avec le sujet d'insertion dans UNE SEULE table.
from DATABASE.INSERT import insert_one_table

try:
    # OM 2020.01.28 Une instance "insert_records" pour permettre l'utilisation des méthodes de la classe DbInsertOneTable
    insert_records = insert_one_table.DbInsertOneTable()

    valeur_ins_fkclient = 1
    valeur_ins_fkadresse = 1
    # Afficher les valeurs dans la console...c'est tout, vraiment tout !
    print("valeur_fkclient ",valeur_ins_fkclient, "valeur_fkadresse ",valeur_ins_fkadresse)

    # Définitions d'un dictionnaire pour passer les valeurs en paramètres de façon un "peu" sécurisée dans la BD
    valeurs_insertion_dictionnaire = {'value_fkclient': valeur_ins_fkclient, 'value_fkadresse': valeur_ins_fkadresse}

    # OM 2020.01.28 Pour éviter les injections SQL, il est possible de passer les valeurs à insérer sous forme "paramètrée" (avec le %(...)s au lieu de %s)
    # Pour les vrais geeks et geeketes consulter le site ci-dessous.
    # L'insertion de données est vraiment TROP inspirée du site suivant MERCI !!! https://realpython.com/prevent-python-sql-injection/

    # Une longue chaîne de caractères (format PEP8 selon proposition de PyCharm)
    # Je décide d'insèrer 2 on voit ainsi la correspondance des positions entre les attributs
    # de la BD et les variables Python définies juste en dessus.
    mysql_insert_string = "INSERT INTO t_client_a_adresse (id_client_a_adresse, fk_client, fk_adresse, Date) VALUES " \
                          "(NULL, %(value_fkclient)s, %(value_fkadresse)s, CURRENT_TIMESTAMP) "
    # Insertion des valeurs définie dans la variable dictionnaire "valeurs_insertion_dictionnaire"
    # dans la table "t_genres_films"
    insert_records.insert_one_record_many_values_one_table(mysql_insert_string,
                                                           valeurs_insertion_dictionnaire)

except Exception as erreur:
    # OM 2020.03.01 Message en cas d'échec du bon déroulement des commandes ci-dessus.
    print("error message: {0}".format(erreur))