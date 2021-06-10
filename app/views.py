from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from .models import InputForm
from django.contrib.auth import authenticate,login
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from django.template import RequestContext

def home_page(request):
    return render(request,'app/home.html',{})


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
            user = authenticate(username=username,password=raw_password)
            login(request,user)
           
            return redirect('home_page')
    else:
        form = InputForm()
    return render(request, 'app/signup.html', {'form': form})
def user_login(request):
    context = RequestContext(request)
    if request.method == 'POST':
          email = request.POST['email']
          password = request.POST['password']
          user = authenticate(email=email, password=password)
          if user is not None:
              
                  login(request,user)
                  # Redirect to index page.
                  return redirect('home_page')
              
                  
          else:
              # Return an 'invalid login' error message.
              print ( "invalid login details " + email + " " + password)
              #return render(request,'app/login.html', {}, context)
     
# Create your views here.
