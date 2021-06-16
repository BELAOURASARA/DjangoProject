"""

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin

from django.urls import path,re_path
from app import views
from app import viewsDE
from app import viewsDPGR
from app import viewsCorrecteur
from django.conf.urls import include
app_name = "app"

urlpatterns = [
    path('creer_can/', views.create_candidat, name='creer_can'),
    path('creer_sp/', views.create_specialite, name='creer_sp'),
    path('corriger/', views.ajouter_note, name='corriger'),
    path('signup/', views.signup, name='signup'),
    path('correction/',views.correction,name="correction"),
   # path('login/', views.login_page, name='login_page'),
   # path('loginacc/', views.loginn, name='loginacc'),
   # path('accounts/', include('django.contrib.auth.urls')),
    path('index/', views.index),
    path('redirection/', views.redirection, name='redirection'),

    path('login/', views.user_login, name='login'),
    path('logout/', views.logout, name='logout'),

    path('accounts/', include('django.contrib.auth.urls')),
   
   
    path('importFile/', views.importFile, name='importFile'),
    path('uploadFile/', views.uploadFile, name='uploadFile'),
    # path('downloadFile/', views.downloadFile, name='downloadFile'),
    path('downloadFile/<str:filename>', views.downloadFile, name='downloadFile'),

    #coté DE 
    path('AccueilDE/', viewsDE.AccueilDE, name='AccueilDE'),
    path('recupererList/', viewsDE.recupererList),
    path('affecterSallesSIQ/', viewsDE.affecterSalleSIQ,name='affecterSallesSIQ'),
    path('affecterSallesSIT/', viewsDE.affecterSalleSIT,name='affecterSallesSIT'),
    path('validerSalles/', viewsDE.validerSalles, name='validerSalles'),
    path('affecterSurveillant/', viewsDE.affecterSurveillant,name='affecterSurveillant'),
    path('releverAbscence/', viewsDE.releverAbscence, name='releverAbscence'),
    path('downloadListCan/', viewsDE.downloadListCan, name='downloadListCan'),

    #coté DPGR
    path('AccueilDPGR/', viewsDPGR.AccueilDPGR, name='AccueilDPGR'),
    path('ImporterCanSIQ/', viewsDPGR.ImporterCanSIQ, name='ImporterCanSIQ'),
    path('ImporterCanSIT/', viewsDPGR.ImporterCanSIT, name='ImporterCanSIT'),
    path('ImporterCorriges/', viewsDPGR.ImporterCorriges, name='ImporterCorriges'),
    
    #coté Correcteur 
    path('AccueilCorrecteur/', viewsCorrecteur.AccueilCorrecteur, name='AccueilCorrecteur'),

]
"""path('validerSalles/<str:filename>', views.validerSalles, name='validerSalles'),"""







