from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

from django import forms


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
   
   

   