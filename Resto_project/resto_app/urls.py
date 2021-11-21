from django.urls import path
from . import views


urlpatterns = [
    path('index', views.index, name = 'index'),
    path('employe', views.employe, name = 'employe'),
    path('commande', views.commande, name = 'commande'),
]
