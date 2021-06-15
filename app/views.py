from django import http
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth.models import User
from .models import Type
from .models import Specialite
from .models import Candidat
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
#from .test1 import Copie

from django.http import HttpResponse  
from app.functions.functions import handle_uploaded_file  
from .forms import StudentForm   
import openpyxl

def index(request) :
    return render(request,'index.html', {})


def logout(request) :
    return redirect('login')


#def note_validee():
def ajouter_note(request):
    if request.method == 'POST': 
        #print (request.POST.get('note')) 
        note=request.POST.get('note')
        co=Copie(code=258963,note=note,isvalidated=True,idcorrecteur=18,idepreuve=3,matricule=123654)
        co.save()
        return co
        return render(request,'index.html',{})
    else:
        return render(request,'index.html',{})
        
def create_specialite(request):
        title=('SIT')
        ep1=('ANAD')
        ep2=('ARCHI')
        ep3=('ARCHI')
        sp=Specialite(titre=title,ep1=ep1,ep2=ep2,ep3=ep3)       
        sp.save()
        return render(request,'index.html',{})

def create_candidat(request):
        matricule=(2222)
        nom=('kadri')
        prenom=('djihen')
        datenaiss=('12-10-1997')
        salle=('S10')
        numetable=('B10')
        exclu=False
        spec=('SIT')
        
        se=Specialite.objects.get(titre=spec)
        seid=se.id
        can=Candidat(matricule=matricule,nom=nom,prenom=prenom,dateNaiss=datenaiss,salle=salle,NumeroTable=numetable,exclu=exclu,specialite=se)       
        can.save()
        """return HttpResponse("%s"%seid)"""
        return render(request,'index.html',{})
        

def correction(request):
    return render(request,'correcteur/correction.html')
def redirection(request):
    idd=request.user.id
    u = User.objects.get(id=idd)
    u1=Type.objects.get(id=idd)
    if u1.Type==0:   
     return render(request,'index.html',{})
    else:
        if u1.Type==1:
          return render(request,'index.html',{})#index
        else:
           return render(request,'correcteur/dashboard_correcteur.html',{})   

def home_page(request):
    return render(request,'app/home.html',{})

def  login_page(request):
    return render(request,'registration/login.html',{})

def loginn(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')

        user = authenticate(username=email, password=password)
        if user is not None:
            print("You are Logged in") 
        else:
            print("Please Enter Valid Email or Password")
    return render(request, 'app/home.html')  

def connexion(request):
   
    if request.method == "POST":
        email= request.POST.get("email")
      
        password = request.POST.get("password")
    
        user = authenticate(email=email , password=password)  # Nous vérifions si les données sont correctes
        if user is not None:  # Si l'objet renvoyé n'est pas None
          login(request, user)  # nous connectons l'utilisateur
          return redirect ('home_page')
        else:
         return redirect('signup') 
    else: # sinon une erreur sera affichée
        return redirect('signup')

def signup(request):
    if request.method == 'POST':
        form = InputForm(request.POST)
        if form.is_valid():
            form.save()
            first_name = form.cleaned_data.get('first_name')
            last_name = form.cleaned_data.get('last_name')
            email = form.cleaned_data.get('email')
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
           
            user = authenticate(email=email,password=raw_password)
            if user is not None:  # Si l'objet renvoyé n'est pas None
                login(request, user)  # nous connectons l'utilisateur
                return redirect ('home_page')
            else:
                return redirect('signup') 
           
            return redirect('index')
    else:
        form = InputForm()
    return render(request, 'app/signup.html', {'form': form})

def user_login(request):
    if request.method == 'POST':
          email = request.POST.get['email']
          password = request.POST.get['password']
          user = authenticate(email=email, password=password)
          if user is not None:
              
                  login(request,user)
                  # Redirect to index page.
                  return redirect('index.html')
              
                  
          else:
              # Return an 'invalid login' error message.
              print ( "invalid login details " + email + " " + password)
              #return render(request,'app/login.html', {}, context)
     
    else:
     return render(request, 'registration/login.html')

           
"""============================================================================="""

def importFile(request): 
    
    if "GET" == request.method:
        return render(request, 'importFile.html', {})
    else:
        excel_file = request.FILES["excel_file"]

        # you may put validations here to check extension or file size

        wb = openpyxl.load_workbook(excel_file)

        # getting a particular sheet by name out of many sheets
        worksheet = wb["Sheet1"]
        print(worksheet)

        excel_data = list()
        # iterating over the rows and
        # getting value from each cell in row
        for row in worksheet.iter_rows():
            row_data = list()
            for cell in row:
                row_data.append(str(cell.value))
            excel_data.append(row_data)
        
        return render(request, "importFile.html", {"excel_data":excel_data})

 # Import mimetypes module
import mimetypes
# import os module
import os
# Import HttpResponse module
from django.http.response import HttpResponse


def uploadFile(request):
  
    if request.method == 'POST':  
        if request.FILES.get('file_name',False) :
            handle_uploaded_file(request.FILES['file_name'])  
            return HttpResponse("File uploaded successfuly")        
        else:  
            return HttpResponse("Error : please enter a valid file !")      
    else:  
        return render(request,"uploadFile.html")


def downloadFile(request):
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
         return render(request,'de/recupererList.html', {})





