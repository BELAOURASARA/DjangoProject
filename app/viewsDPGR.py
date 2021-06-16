from django import http
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth.models import User
from .models import Type
from django.http import HttpResponse  
from app.functions.functions import handle_uploaded_file  
from .forms import StudentForm   
import openpyxl
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from .models import InputForm
from django.contrib.auth import authenticate,login
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from django.template import RequestContext
 # Import mimetypes module
import mimetypes
# import os module
import os
# Import HttpResponse module
from django.http.response import HttpResponse
from django.http import HttpResponse  
from app.functions.functions import handle_uploaded_file  
from .forms import StudentForm   
import openpyxl
from .models import *

def AccueilDPGR(request):
    return render(request,'dpgr/AccueilDPGR.html', {})

def ImporterCanSIQ(request):
    if request.method =="POST" :
        excel_file = request.FILES["SIQ"]
        
        #entrer le nom du fichier dans la base
        siq=Specialite.objects.get(titre="SIQ")
        listeCan=ListCandidats(nomFichier=excel_file,idSpecialite=siq)
        listeCan.save()
        #upload file
        handle_uploaded_file(excel_file)  
        #extract information from file
        wb = openpyxl.load_workbook(excel_file)
        worksheet = wb["Feuil1"]
        excel_data = list()
        
        for row in worksheet.iter_rows():
            row_data = list()
            for cell in row:
                row_data.append(str(cell.value))
            excel_data.append(row_data)
        for i in range(len(excel_data)):
            can=Candidat(matricule=int(excel_data[i][0]),nom=excel_data[i][1],prenom=excel_data[i][2],dateNaiss=excel_data[i][3],salle=None,NumeroTable=None,exclu=False,specialite=siq)       
            can.save()
        
        return redirect('AccueilDPGR')   
    else :
        return redirect('AccueilDPGR')    
        
def ImporterCanSIT(request):
    if request.method =="POST" :
        excel_file = request.FILES["SIT"]
        #entrer le nom du fichier dans la base
        sit=Specialite.objects.get(titre="SIT")
        listeCan=ListCandidats(nomFichier=excel_file,idSpecialite=sit)
        listeCan.save()
        #upload file
        handle_uploaded_file(excel_file)  
        #extract information from file
        wb = openpyxl.load_workbook(excel_file)
        worksheet = wb["Feuil1"]
        excel_data = list()
        
        for row in worksheet.iter_rows():
            row_data = list()
            for cell in row:
                row_data.append(str(cell.value))
            excel_data.append(row_data)
        for i in range(len(excel_data)):
            can=Candidat(matricule=int(excel_data[i][0]),nom=excel_data[i][1],prenom=excel_data[i][2],dateNaiss=excel_data[i][3],salle=None,NumeroTable=None,exclu=False,specialite=sit)       
            can.save()
        
        return redirect('AccueilDPGR')   
    else :
        return redirect('AccueilDPGR')    
           
