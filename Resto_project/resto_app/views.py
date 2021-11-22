from django.shortcuts import render
from django.http import HttpResponse

from .forms import CommandeForm
from .models import CategoriesBoissons, Commande, Employe, Plat, Table, Vin


# Create your views here.

def index(request):
    return render(request,'employe.html')
    #return HttpResponse("Hello World")
    
    
def employe(request):
    employes = Employe.objects.all()
    context  = {'employes':employes}
    return render(request, 'employe.html',context)


def commande(request):
   
    commandes = Commande.objects.all()
    plats = Plat.objects.all()
    boissons = CategoriesBoissons.objects.all()
    tables = Table.objects.all()
    vins= Vin.objects.all()
    context  = {'commandes': commandes, 'boissons': boissons, 'vins': vins, 'tables': tables}
    
 
    
    return render(request, 'commande.html',context)


