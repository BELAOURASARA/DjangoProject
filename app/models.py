from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.contrib.postgres.fields import ArrayField
from django import forms



class Epreuve(models.Model):
    titre=models.CharField(max_length=100)  
    coeff =models.IntegerField()   
# creating a form 
class Correcteur(models.Model):
   user = models.OneToOneField(User, on_delete=models.CASCADE),    
   idepreuve=models.ForeignKey(Epreuve, on_delete=models.CASCADE)



class Candidat(models.Model):
    matricule=models.BigAutoField(primary_key=True)
    nom=models.CharField(max_length=100)
    prenom=models.CharField(max_length=100)
    dateNaiss= models.CharField(max_length=100)
    salle =  models.CharField(max_length=100)
    NumeroTable =models.CharField(max_length=100)
    exclu= models.BooleanField()
    specialite= models.CharField(max_length=100)

class Specialite(models.Model):
    titre=models.CharField(max_length=100)
    """ep1=models.ForeignKey(Epreuve, on_delete=models.CASCADE)
    ep2=models.ForeignKey(Epreuve, on_delete=models.CASCADE) 
    ep3=models.ForeignKey(Epreuve, on_delete=models.CASCADE)"""    

class ListCandidats(models.Model):
    nomFichier=models.CharField(max_length=100)
    idSpecialite=models.ForeignKey(Specialite, on_delete=models.CASCADE)

class CorrigesType(models.Model):
    nomFichier=models.CharField(max_length=100)
    idEpreuve=models.ForeignKey(Epreuve, on_delete=models.CASCADE)


class Copie(models.Model):
    matricule=models.ForeignKey(Candidat, on_delete=models.CASCADE)
    code=models.CharField(max_length=100)
    note=models.IntegerField()
    idepreuve=models.ForeignKey(Epreuve, on_delete=models.CASCADE)
    isvalidated=models.BooleanField()
    """idcorrecteur1=models.ForeignKey(Correcteur,on_delete=models.CASCADE)
    idcorrecteur2=models.ForeignKey(Correcteur,on_delete=models.CASCADE)
    idcorrecteur3=models.ForeignKey(Correcteur,on_delete=models.CASCADE)"""
    subi3eme=models.BooleanField()

    

      

class Type(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE),
    Type = models.IntegerField()
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
            t=Type(id=user.id,Type=2)
            t.save()
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


   
   


   