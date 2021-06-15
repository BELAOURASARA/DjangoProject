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


def AccueilDE(request):
    return render(request,'de/AccueilDE.html', {})


def recupererList(request) :
    return render(request,'de/recupererList.html', {})

def affecterSalleSIQ(request) :   
    if "GET" == request.method:
        return redirect('AccueilDE')  
    else:
       
        file = request.FILES["SIQ"]
        wb = openpyxl.load_workbook(file)
        # getting a particular sheet by name out of many sheets
        worksheet = wb["Sheet1"]
        excel_data = list()
        nb_total=0
        for row in worksheet.iter_rows():
            row_data = list()
            for cell in row:
                row_data.append(str(cell.value))
            excel_data.append(row_data)
            nb_total=nb_total+1
        
        request.session['excel'] = excel_data
        return render(request, "de/AccueilDE", {"file_salle":file})

def affecterSalleSIT(request) :   
    if "GET" == request.method:
        return redirect('AccueilDE')  
    else:
       
        file = request.FILES["SIT"]
        wb = openpyxl.load_workbook(file)
        # getting a particular sheet by name out of many sheets
        worksheet = wb["Sheet1"]
        excel_data = list()
        nb_total=0
        for row in worksheet.iter_rows():
            row_data = list()
            for cell in row:
                row_data.append(str(cell.value))
            excel_data.append(row_data)
            nb_total=nb_total+1
        
        request.session['excel'] = excel_data
        return render(request, "de/AccueilDE", {"file_salle":file})

def affecterSurveillant(request) :   
    if "GET" == request.method:
        return redirect('AccueilDE')  
    else:
       
        file = request.FILES["Surveillant"]
        wb = openpyxl.load_workbook(file)
        # getting a particular sheet by name out of many sheets
        worksheet = wb["Sheet1"]
        excel_data = list()
        nb_total=0
        for row in worksheet.iter_rows():
            row_data = list()
            for cell in row:
                row_data.append(str(cell.value))
            excel_data.append(row_data)
            nb_total=nb_total+1
        
        request.session['excel'] = excel_data
        return render(request, "de/AccueilDE", {"file_salle":file})



def validerSalles(request):
    validated=True
    excel_data=request.session['excel']
    nb_total=0
    for row in excel_data :
        nb_total=nb_total+1 
        """ each row is a row in the database"""
    
    return render(request,'de/affecterSalles.html', {"validated":validated,"excel_data":excel_data,"nb_total":nb_total})
 
def releverAbscence(request):
    if "GET" == request.method:
        return render(request, 'de/ReleverAbscence.html', {})
    else :   
        return render(request, 'de/ReleverAbscence.html', {})


def downloadListCan(request):
    if request.method == 'POST':  
        # Define Django project base directory
        BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        # Define text file name
        x=dict(request.POST.items())
        if 'SIQ' in request.POST :
            filename="liste_siq.xlsx"
        elif 'SIT' in request.POST  :
            filename="liste_sit.xlsx"
       
        # Define the full file path
        filepath = BASE_DIR + '/app/static/upload/' + filename
        # Open the file for reading content
        path = open(filepath, 'r' ,encoding="cp437")
        # Set the mime type
        mime_type, _ = mimetypes.guess_type(filepath)
        # Set the return value of the HttpResponse
        response = HttpResponse(path, content_type=mime_type)
        # Set the HTTP header for sending to browser
        response['Content-Disposition'] = "attachment; filename=%s" % filename
        # Return the response value
        return response 
          
    else: 
         return render(request,'de/AccueilDE.html', {})



