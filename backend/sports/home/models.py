from django.db import models
from django.db.models.enums import Choices
from sports import settings
# Create your models here.
class Sports(models.Model):
    name = models.CharField(max_length=25)
    image1 =  models.ImageField(upload_to="shop/images",default="")
    image2 =  models.ImageField(upload_to="shop/images",default="")
    def __str__(self):
        return f"{self.name}" 

class Equipment(models.Model):
    name = models.CharField(max_length=25)
    image =  models.ImageField(upload_to="shop/images",default="")
    sport_associatewith = models.ForeignKey(Sports,on_delete=models.SET_NULL,blank=True,null=True)
    def __str__(self):
        return f"{self.name}" 


class Request_equip(models.Model):
    Choices = [
            ('ACCEPT', 'ACCEPT'),
            ('REJECT', 'REJECT'),
            ('REQUESTED', 'REQUESTED'),
            
        ]
    student = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.SET_NULL,blank=True,null=True)
    time_slot = models.DateTimeField()
    Equipment = models.ForeignKey(Equipment,on_delete=models.SET_NULL,blank=True,null=True)
    state =  models.CharField(
        max_length=20,
        choices=Choices,
        default='REQUESTED',
    )
    quantity =  models.IntegerField(default=1)
