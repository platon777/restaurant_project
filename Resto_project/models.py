# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class BoissonsCommande(models.Model):
    id_categories_boissons = models.OneToOneField('CategoriesBoissons', models.DO_NOTHING, db_column='id_categories_boissons', primary_key=True)
    id_commande = models.ForeignKey('Commande', models.DO_NOTHING, db_column='id_commande')
    quantite = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'boissons_commande'
        unique_together = (('id_categories_boissons', 'id_commande'),)


class Bouteilles(models.Model):
    id_bouteille = models.AutoField(primary_key=True)
    num_bouteille = models.IntegerField(unique=True)
    date_achat = models.DateTimeField()
    prix_achat = models.FloatField()
    id_vin = models.ForeignKey('Vin', models.DO_NOTHING, db_column='id_vin')
    id_viticulteur = models.ForeignKey('Viticulteur', models.DO_NOTHING, db_column='id_viticulteur')

    class Meta:
        managed = False
        db_table = 'bouteilles'
        unique_together = (('id_bouteille', 'id_vin', 'id_viticulteur'),)


class CategoriesBoissons(models.Model):
    id_categories_boissons = models.AutoField(primary_key=True)
    designation = models.CharField(max_length=45)
    prix_de_vente = models.FloatField()

    class Meta:
        managed = False
        db_table = 'categories_boissons'


class Commande(models.Model):
    id_commande = models.AutoField(primary_key=True)
    id_service = models.ForeignKey('Service', models.DO_NOTHING, db_column='id_service')
    id_table = models.ForeignKey('Table', models.DO_NOTHING, db_column='id_table')
    id_serveur = models.ForeignKey('Serveur', models.DO_NOTHING, db_column='id_serveur')
    type_commande = models.IntegerField()
    date_id_date = models.ForeignKey('Date', models.DO_NOTHING, db_column='date_id_date')
    date_commande = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'commande'
        unique_together = (('id_commande', 'id_service', 'id_table', 'id_serveur', 'date_id_date'),)


class Cuisinier(models.Model):
    id_cuisinier = models.AutoField(primary_key=True)
    id_employe = models.ForeignKey('Employe', models.DO_NOTHING, db_column='id_employe')

    class Meta:
        managed = False
        db_table = 'cuisinier'
        unique_together = (('id_cuisinier', 'id_employe'),)


class Date(models.Model):
    id_date = models.AutoField(primary_key=True)
    date_commande = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'date'


class Diplome(models.Model):
    id_diplome = models.AutoField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'diplome'


class DiplomePossedePar(models.Model):
    id_diplome = models.OneToOneField(Diplome, models.DO_NOTHING, db_column='id_diplome', primary_key=True)
    id_employe = models.ForeignKey('Employe', models.DO_NOTHING, db_column='id_employe')
    date_obtention = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'diplome_possede_par'
        unique_together = (('id_diplome', 'id_employe'),)


class Employe(models.Model):
    id_employe = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=45)
    prenom = models.CharField(max_length=45)
    adresse = models.CharField(max_length=45)
    code_postal = models.CharField(max_length=20)
    ville = models.CharField(max_length=45)
    telephone = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'employe'


class Menu(models.Model):
    id_menu = models.AutoField(primary_key=True)
    num_menu = models.IntegerField(blank=True, null=True)
    libelle = models.CharField(max_length=45)
    prix_de_vente_menu = models.FloatField()

    class Meta:
        managed = False
        db_table = 'menu'


class MenuCommande(models.Model):
    field_id_commande = models.OneToOneField(Commande, models.DO_NOTHING, db_column=' id_commande', primary_key=True)  # Field renamed to remove unsuitable characters. Field renamed because it started with '_'.
    menu_id_menu = models.ForeignKey(Menu, models.DO_NOTHING, db_column='menu_id_menu')
    quantite = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'menu_commande'
        unique_together = (('field_id_commande', 'menu_id_menu'),)


class Plat(models.Model):
    id_plat = models.AutoField(primary_key=True)
    num_plat = models.IntegerField(blank=True, null=True)
    libelle_plat = models.CharField(max_length=45)
    prix_de_vente_plat = models.FloatField()
    type_plat_id_type_plat = models.ForeignKey('TypePlat', models.DO_NOTHING, db_column='type_plat_id_type_plat')

    class Meta:
        managed = False
        db_table = 'plat'
        unique_together = (('id_plat', 'type_plat_id_type_plat'),)


class PlatCommande(models.Model):
    id_commande = models.OneToOneField(Commande, models.DO_NOTHING, db_column='id_commande', primary_key=True)
    id_plat = models.ForeignKey(Plat, models.DO_NOTHING, db_column='id_plat')
    quantite = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'plat_commande'
        unique_together = (('id_commande', 'id_plat'),)


class PlatMenu(models.Model):
    id_plat = models.OneToOneField(Plat, models.DO_NOTHING, db_column='id_plat', primary_key=True)
    id_menu = models.ForeignKey(Menu, models.DO_NOTHING, db_column='id_menu')

    class Meta:
        managed = False
        db_table = 'plat_menu'
        unique_together = (('id_plat', 'id_menu'),)


class Serveur(models.Model):
    id_serveur = models.AutoField(primary_key=True)
    id_employe = models.ForeignKey(Employe, models.DO_NOTHING, db_column='id_employe')

    class Meta:
        managed = False
        db_table = 'serveur'
        unique_together = (('id_serveur', 'id_employe'),)


class Service(models.Model):
    id_service = models.AutoField(primary_key=True)
    type_service = models.CharField(max_length=45)
    designation_service = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'service'


class Table(models.Model):
    id_table = models.AutoField(primary_key=True)
    num_table = models.IntegerField(blank=True, null=True)
    capacite = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'table'


class TypePlat(models.Model):
    id_type_plat = models.AutoField(primary_key=True)
    designation_type_plat = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'type_plat'


class Vin(models.Model):
    id_vin = models.AutoField(primary_key=True)
    num_vin = models.IntegerField(blank=True, null=True)
    millesime = models.IntegerField()
    prix_de_vente = models.FloatField()

    class Meta:
        managed = False
        db_table = 'vin'


class VinsCommande(models.Model):
    id_vin = models.OneToOneField(Vin, models.DO_NOTHING, db_column='id_vin', primary_key=True)
    id_commande = models.ForeignKey(Commande, models.DO_NOTHING, db_column='id_commande')
    quantite = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'vins_commande'
        unique_together = (('id_vin', 'id_commande'),)


class Viticulteur(models.Model):
    id_viticulteur = models.AutoField(primary_key=True)
    nom_viticulteur = models.CharField(max_length=45)
    prenom_viticulteur = models.CharField(unique=True, max_length=45)
    adresse_viticulteur = models.CharField(max_length=45)
    code_postal = models.CharField(max_length=45)
    ville = models.CharField(max_length=45)
    telephone = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'viticulteur'
