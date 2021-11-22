from django.shortcuts import render, redirect
from django.http import HttpResponse

from .forms import CommandeForm
from .models import CategoriesBoissons, Commande, Employe, Plat, Serveur, Service, Table, Vin


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
    serveurs = Serveur.objects.all()
    services = Service.objects.all()
    context  = {'commandes': commandes, 'boissons': boissons, 'vins': vins, 'tables': tables, 'serveurs': serveurs, 'services': services}
    
    if request.method == 'POST':
        form = CommandeForm(request.POST)
        if form.is_valid():
            
            form.save()
            return redirect('employe')
        print(form.errors)
    else:
        form = CommandeForm
        
        
    
    return render(request, 'commande.html',context)


