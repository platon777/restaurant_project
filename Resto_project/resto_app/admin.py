from django.contrib import admin
from . import models
from .models import Employe
from django.apps import apps



@admin.register(models.Employe)
class EmployeAdmin(admin.ModelAdmin):
    list_display = ['nom','prenom',]

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