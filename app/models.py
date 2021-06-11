from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.contrib.postgres.fields import ArrayField
from django import forms
   
# creating a form 
class InputForm(forms.ModelForm):
    """
    A form that creates a user, with no privileges, from the given username and
    password.
    """
    error_messages = {
        'password_mismatch':("The two password fields didn't match."),
    }
    password1 = forms.CharField(label=("Password"),
        widget=forms.PasswordInput)
    password2 = forms.CharField(label=("Password confirmation"),
        widget=forms.PasswordInput,
        help_text=("Enter the same password as above, for verification."))  
    class Meta:
        model = User
        fields = ("first_name","last_name","email","username")


    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError(
                self.error_messages['password_mismatch'],
                code='password_mismatch',
            )
        return password2
    def save(self, commit=True):
        
        user = super(InputForm, self).save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user
    
class UserLaureat(models.Model):
        # This field is required.
        user = models.OneToOneField(User,on_delete=models.CASCADE)
        # These fields are optional
        ordre=models.IntegerField()
       
        def __unicode__(self):
                return self.user.username    
class SujetThese(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    #date_posted = models.DateTimeField(default=timezone.now)
    enseignant = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.title


class Affect(models.Model):
    sujet = models.ForeignKey(SujetThese, on_delete=models.CASCADE)
    laureat =  models.ForeignKey(User, on_delete=models.CASCADE)
   
   

   