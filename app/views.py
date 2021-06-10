from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponse  
from app.functions.functions import handle_uploaded_file  
from .forms import StudentForm   
import openpyxl

def index(request) :
    return render(request,'index.html', {})

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


"""---------------------------------------------------------------"""
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
        filename = request.POST.get("file_name")
        # Define the full file path
        filepath = BASE_DIR + '/myapp/static/upload/' + filename
        # Open the file for reading content
        path = open(filepath, 'r')
        # Set the mime type
        mime_type, _ = mimetypes.guess_type(filepath)
        # Set the return value of the HttpResponse
        response = HttpResponse(path, content_type=mime_type)
        # Set the HTTP header for sending to browser
        response['Content-Disposition'] = "attachment; filename=%s" % filename
        # Return the response value
        return response 
         
    else: 
        return render(request, "downloadFile.html")
    

