from django import http
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth.models import User
from .models import Type
from .models import Specialite
from .models import Copie
from .models import Candidat
from .models import Epreuve
from .models import Correcteur
from .models import Resultat_module
from .models import table_inter_correction
from django.http import HttpResponse  
from app.functions.functions import handle_uploaded_file  
from .forms import StudentForm   
import openpyxl
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from .models import InputForm
from .models import Resultat
from django.contrib.auth import authenticate,login
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from django.template import RequestContext
#from .test1 import Copie
from django.db.models import Q

from django.http import HttpResponse  
from app.functions.functions import handle_uploaded_file  
from .forms import StudentForm   
import openpyxl
import random
def random_number(request):
    r=random.randint(122222,1256666)
    return HttpResponse("%s"%r)
    
def generer_code(request):
    if request.method == 'POST':
        r1=int(request.POST.get('valeur1'))
        r2=int(request.POST.get('valeur2'))
        exist=False
        v1=0
        v2=0
        v3=0
        candidats=Candidat.objects.filter(exclu=False)

        for candidat in candidats:
            
                matricule=candidat
                
                n=Copie.objects.all()
                spec=candidat.specialite
                s=Specialite.objects.get(titre=spec.titre)
                if not n:
            
                    ep1=s.ep1
                    e=Epreuve.objects.get(titre=ep1)
                    v1=random.randint(r1,r2)
                    n1=Copie(matricule=candidat,code=v1,idepreuve=e)
                    n1.save()
 
                    ep2=s.ep2
                    e=Epreuve.objects.get(titre=ep2)
                    v2=random.randint(r1,r2)
                    while (v2 == v1):
                        v2=random.randint(r1,r2)
                    n1=Copie(matricule=candidat,code=v2,idepreuve=e)
                    n1.save()
                
                    ep3=s.ep3
                    e=Epreuve.objects.get(titre=ep3)
                    v3=random.randint(r1,r2)
                    while (v3 == v1) or (v3 == v1):
                        v3=random.randint(r1,r2)
                    n1=Copie(matricule=candidat,code=v3,idepreuve=e)
                    n1.save()
                else:
                       
                    ep1=s.ep1
                    e=Epreuve.objects.get(titre=ep1)
                    v1=random.randint(r1,r2)
                    for co in n:
                        while (v1 == co.code):
                            v1=random.randint(r1,r2)
                    n1=Copie(matricule=candidat,code=v1,idepreuve=e)
                    n1.save()
             
                    ep2=s.ep2
                    e=Epreuve.objects.get(titre=ep2)
                    v2=random.randint(r1,r2)
                    for co in n:
                        while (v2 == co.code) or (v2 == v1):
                            v2=random.randint(r1,r2)
                    n1=Copie(matricule=candidat,code=v2,idepreuve=e)
                    n1.save()
                 
                    
                    ep3=s.ep3
                    e=Epreuve.objects.get(titre=ep3)
                    v3=random.randint(r1,r2)
                    for co in n:
                        while (v3 == co.code) or (v3 == v1) or (v3 == v2):
                            v3=random.randint(r1,r2)
                    n1=Copie(matricule=candidat,code=v3,idepreuve=e)
                    n1.save()
        return redirect('generer_code')           
                    
    else :
        copies=Copie.objects.all()
        cand=Candidat.objects.filter(exclu=False)
        correspondance = list()
        if not(copies):
            copies=None
        else :    
           
            for ca in cand :
                cops=Copie.objects.filter(matricule=ca)
                row_data = list()
                row_data.append(str(ca.matricule))
                for co in cops :
                    code=getattr(co,"code")
                    eprv=getattr(co,"idepreuve")
                    epreuve=eprv.titre
                    row_data.append(str(epreuve))
                    row_data.append(str(code))
                
                correspondance.append(row_data)
        
        return render(request,'dpgr/generation_code.html',{"copies":copies,"cand":cand,"corres":correspondance })    
            
            
           

def index(request) :
    return redirect('login')
def R_DPGR(request) :
    return render(request,'dpgr/resultat_DPGR.html',{})
def coder(request) :
    return render(request,'generation_code.html', {})

def logout(request) :
    return redirect('login')


#def note_validee():
def ajouter_note(request):


    #print (request.POST.get('note')) 
    note=int(request.POST.get('note'))
    #return HttpResponse("%s"%note)
    code=int(request.POST.get('code'))
    #return HttpResponse("%s"%code)
    
    
    
    cop=Copie.objects.get(code=code)
    cop.note=note
    #idd=cop.id
    #co=Copie(code=258963,note=note,isvalidated=True,idcorrecteur=18,idepreuve=3,matricule=123654)
    cop.save()
    idc=cop.id
    id_corr=request.user.id
    corr=Correcteur.objects.get(id=id_corr)
    table=table_inter_correction.objects.all()
    if not  table:
        re1=table_inter_correction(phase='phase1',note=note,id_copie_id=cop.id,id_correcteur_id=corr.id)
        re1.save()  
    else:   
        try:
            s=table_inter_correction.objects.get(id_copie_id=cop.id)
            re2=table_inter_correction(phase='phase2',note=note,id_copie_id=cop.id,id_correcteur_id=corr.id)
            re2.save()       
        except table_inter_correction.DoesNotExist :
            re1=table_inter_correction(phase='phase1',note=note,id_copie_id=cop.id,id_correcteur_id=corr.id)
            re1.save()       
        
    return redirect('/correction')
  
      

"""========================================================================================"""
def afficher_note(request):
    id=request.user.id
    tab=list()
    note=table_inter_correction.objects.filter(id_correcteur=id)
    for n in note:
        tab.append(note.note)
        idcopie=note.id_copie
        code=copie.objects.get(id=id_copie)
        tab.append(code)


        






    

    

"""========================affichage des resultats=========================================="""   
def affichage_resultat_spec(request):
    #calculer_resul_module(request)
    #calculer_Resultat_final(request)
    
    if request.method == 'POST':
        validate=0
        candidats=Candidat.objects.filter(exclu=False) 
        
        selected_value=request.POST['drop1']
        if (selected_value =="SIQ"):
            
            excel_data = list()
            for candidat in candidats:
                if (candidat.specialite.titre == "SIQ"):
                    #return HttpResponse("%s"%'kkkk')
                    row_data = list()
                    spec=candidat.specialite
                    ep1=spec.ep1
                    Resul=Resultat_module.objects.get(matricule=candidat,ep=ep1)
                    res=Resul.moy_note
                    row_data.append(Resul.matricule.matricule)
                    row_data.append(Resul.matricule.nom)
                    row_data.append(Resul.matricule.prenom)
                    row_data.append(res)
                    ep2=spec.ep2
                    Resul1=Resultat_module.objects.get(matricule=candidat,ep=ep2)
                    res1=Resul1.moy_note
                    row_data.append(res1)
                    ep3=spec.ep3
                    Resul2=Resultat_module.objects.get(matricule=candidat,ep=ep3)
                    res2=Resul2.moy_note
                    row_data.append(res2)
                    rf=Resultat.objects.get(matricule=candidat)
                    moy=rf.resul
                    row_data.append(moy)
                  
                    #return HttpResponse("%s"% row_data[0])
                    excel_data.append(row_data)
            validate=1
        else:  
            excel_data = list()
            for candidat in candidats:
                if (candidat.specialite.titre == "SIT"):
                    #return HttpResponse("%s"%'kkkk')
                    row_data = list()
                    spec=candidat.specialite
                    ep1=spec.ep1
                    Resul=Resultat_module.objects.get(matricule=candidat,ep=ep1)
                    res=Resul.moy_note
                    row_data.append(Resul.matricule.matricule)
                    row_data.append(Resul.matricule.nom)
                    row_data.append(Resul.matricule.prenom)
                    row_data.append(res)
                    ep2=spec.ep2
                    Resul1=Resultat_module.objects.get(matricule=candidat,ep=ep2)
                    res1=Resul1.moy_note
                    row_data.append(res1)
                    ep3=spec.ep3
                    Resul2=Resultat_module.objects.get(matricule=candidat,ep=ep3)
                    res2=Resul2.moy_note
                    row_data.append(res2)
                    rf=Resultat.objects.get(matricule=candidat)
                    moy=rf.resul
                    row_data.append(moy)

                
                        
                    #return HttpResponse("%s"% row_data[0])
                    excel_data.append(row_data)
                
            validate=1  
    return render(request, "dpgr/resultat_DPGR.html", {"excel_data":excel_data,"validate":validate})
       


"""===================================== calcul des resultats ================================="""          

#fonction permet de calculer  la moyennes de chaque etudiant  pour tous les etudiants

def calculer_Resultat_final(request):
    calculer_resul_module(request)
    candidats=Candidat.objects.filter(exclu=False) 
    #copies=Copies.objects.all() 
    #candidat=Candidat.objects.get(matricule=170025)
    for Candidat in candidats:
        #matricule=copie.matricule
        #for candidat in candidats:
        #candidat=Candidat.objects.get(matricule=matricule)
        spec=candidat.specialite
        ep1=spec.ep1
        s=Specialite.objects.get(titre=spec.titre) 
        idep1=Epreuve.objects.get(titre=ep1)
        coeff1=idep1.coeff
        moyep1=Resultat_module.objects.get(matricule=candidat,ep=ep1)
        #return HttpResponse("%s"%moyep1)
        moy1 = moyep1.moy_note
        #return HttpResponse("%s"%moyep1.moy_note)
        moy1=(moy1)  * (coeff1)
        ep2=s.ep2
        idep2=Epreuve.objects.get(titre=ep2)
        coeff2=idep2.coeff
        moyep1=Resultat_module.objects.get(matricule=candidat,ep=ep2)
        moy2=moyep1.moy_note
        moy2=(moy2) * (coeff2)
        ep3=s.ep3
        idep3=Epreuve.objects.get(titre=ep3)
        coeff3=idep3.coeff
        moyep3=Resultat_module.objects.get(matricule=candidat,ep=ep3)
        moy3=moyep3.moy_note
        moy3=(moy3) * (coeff3)
        coefff=((coeff1) + (coeff2) + (coeff3))
        moys=(moy1) + (moy2) +(moy3)
        moyf=(moys)/(coefff)
        rf=Resultat(matricule=candidat,resul=moyf)
        rf.save()
    return render(request,'resultat_DPGR.html',{})


#*******************************************************************************#
def calculer_resul_module_epr(request):
    
    if request.method == "POST":
        selected_value=request.POST['drop1']
        
        
        ids=table_inter_correction.objects.all()
        #return HttpResponse("%s"%selected_value)
        excel_data = list()
        local=list()
        for id in ids:
           
            id_copie=id.id_copie
            if (id_copie not in local):
                local.append(id_copie)
                copie=Copie.objects.get(id=id_copie.id)
                epreuv=Epreuve.objects.get(id=copie.idepreuve.id)
                titre=epreuv.titre

                tab = list()
                if (titre==selected_value):
                    note1=table_inter_correction.objects.get(id_copie_id=id_copie,phase="phase1")
                    note2=table_inter_correction.objects.get(id_copie_id=id_copie,phase="phase2")
                    moy=(((note1.note) + (note2.note))/2)
                    tab.append(copie.code)
                    tab.append(note1.note)
                    tab.append(note2.note)
                    tab.append(moy)
                    excel_data.append(tab)
    
    return render(request, "dpgr/dashboard_DPGR.html", {"excel_data":excel_data})
   

#fonction permet de calculer  la moyenne entre entre les 2 corrections pour chaque epreuve 
def calculer_resul_module(request):
    candidats=Candidat.objects.filter(exclu=False)
    
    for candidat in candidats:    
        spec=candidat.specialite
        s=Specialite.objects.get(titre=spec.titre) 
        ep1=s.ep1
        idep1=Epreuve.objects.get(titre=ep1)
        coeff1=idep1.coeff
        codecopie1=Copie.objects.get(matricule=candidat,idepreuve=idep1)
        note1=table_inter_correction.objects.get(id_copie_id=codecopie1,phase="phase1")
        note2=table_inter_correction.objects.get(id_copie_id=codecopie1,phase="phase2")
        moy=(((note1.note) + (note2.note))/2)
        
        r=Resultat_module(matricule=candidat,ep=ep1,moy_note=moy)
        r.save()
        ep2=s.ep2 
        idep2=Epreuve.objects.get(titre=ep2)
        coeff1=idep2.coeff
        codecopie2=Copie.objects.get(matricule=candidat,idepreuve=idep2)
        note1=table_inter_correction.objects.get(id_copie_id=codecopie2,phase="phase1")
        note2=table_inter_correction.objects.get(id_copie_id=codecopie2,phase="phase2")
        moy2=(((note1.note) + (note2.note))/2)
        r=Resultat_module(matricule=candidat,ep=ep2,moy_note=moy2)
        r.save()
        ep3=s.ep3
        idep3=Epreuve.objects.get(titre=ep3)
        coeff1=idep1.coeff
        codecopie3=Copie.objects.get(matricule=candidat,idepreuve=idep3)
        note1=table_inter_correction.objects.get(id_copie_id=codecopie3,phase="phase1")
        note2=table_inter_correction.objects.get(id_copie_id=codecopie3,phase="phase2")
        moy3=(((note1.note)+ (note2.note))/2)
        r=Resultat_module(matricule=candidat,ep=ep3,moy_note=moy3)
        r.save() 

"""""""""""""""""""""""""""""""""""des créations"""""""""""""""""""""""""""""""""""
def create_specialite(request):
        title=('SIQ')
        ep1=('SYS')
        ep2=('RES')
        ep3=('OPTIM')
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
        
def create_epreuve(request):    
        titree=('ASI')
        coefff=(3)
        ep=Epreuve(titre=titree,coeff=coefff)
        ep.save()
        return HttpResponse("%s"%titree)
        #return render(request,'index.html',{})

"""===========================des redirctions=================================="""       
def correction(request):
    id=request.user.id
    
    tab1=list()
    note=table_inter_correction.objects.filter(id_correcteur=id)
    for n in note:
        tab=list()
        idcopie=n.id_copie
        code=Copie.objects.get(id=idcopie.id)
        tab.append(code.code)
        tab.append(n.note)
        tab1.append(tab)
    return render(request,'correcteur/correction.html',{"tab1":tab1})

def redirection(request):
    idd=request.user.id
    u = User.objects.get(id=idd)
    u1=Type.objects.get(id=idd)
    if u1.Type==0:   
     return render(request,'dpgr/AccueilDPGR.html',{})
    else:
        if u1.Type==1:
          return render(request,'de/AccueilDE.html',{}) #index
        else:
            if u1.Type==2: 
                return render(request,'correcteur/AccueilCorrecteur.html',{})   

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


def downloadFile(request,filename):

    # Define Django project base directory
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    # Define text file name
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






