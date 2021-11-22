from django.forms import ModelForm
from .models import Commande

class CommandeForm(ModelForm):
    class Meta:
        model = Commande
        fields = ['type_commande', 'id_serveur','id_table','id_service',]
        