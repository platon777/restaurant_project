from django.shortcuts import render
from django.http import HttpResponse
from .models import Commande, Employe


# Create your views here.

def index(request):
    return render(request,'employe.html')
    #return HttpResponse("Hello World")
    
    
def employe(request):
    employes = Employe.objects.all()
    context  = {'employes':employes}
    return render(request, 'employe.html',context)


def commande(request):
   employes = Employe.objects.all()
   context  = {'employes':employes}
   return render(request, 'employe.html',context)
   """ commandes = Commande.objects.all()
    context  = {'commandes': commandes}
    return render(request, 'commande.html',context)"""