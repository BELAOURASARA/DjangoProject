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
from django.conf.urls import include
app_name = "app"
urlpatterns = [
    path('',views.home_page,name="home_page"),
    path('admin/', admin.site.urls),
    path('signup/', views.signup, name='signup'),
    path('login/', views.user_login, name='login'),
    path('accounts/', include('django.contrib.auth.urls')),
    path('index/', views.index),

    #coté DE 

    path('recupererList/', views.recupererList),
    
    path('affecterSalle/', views.affecterSalle,name='affecterSalles'),
    path('validerSalles/', views.validerSalles, name='validerSalles'),
    
    path('affecterSurveillant/', views.affecterSurveillant),
 
    path('releverPresence/', views.releverPresence, name='releverPresence'),

    path('importFile/', views.importFile, name='importFile'),
    path('uploadFile/', views.uploadFile, name='uploadFile'),
    path('downloadFile/', views.downloadFile, name='downloadFile'),
    #coté DPGR
    #coté Correcteur 

]
"""path('validerSalles/<str:excel_file>', views.validerSalles, name='validerSalles'),"""






