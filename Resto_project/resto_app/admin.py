from django.contrib import admin
from . import models
from .models import Employe, Commande
from django.apps import apps



@admin.register(models.Employe)
class EmployeAdmin(admin.ModelAdmin):
    list_display = ['nom','prenom',]
    list_per_page = 10
    
@admin.register(models.Commande)
class CommandeAdmin(admin.ModelAdmin):
    list_display = ['id_commande', 'id_service','id_serveur','type_commande','date_commande']
    list_per_page = 10

models = apps.get_models()


for model in models:
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass

"""@admin.register(models.Employe)
class EmployeAdmin(admin.ModelAdmin):
    list_display = ['nom','prenom']
"""