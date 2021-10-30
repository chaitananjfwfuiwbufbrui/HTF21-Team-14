from django.contrib import admin

# Register your models here.
from .models import *


@admin.register(Sports)
class studentadmin(admin.ModelAdmin):
    list_display = ['name']

    
@admin.register(Equipment)
class studentadmin(admin.ModelAdmin):
    list_display = ['name','sport_associatewith']
    
@admin.register(Request_equip)
class studentadmin(admin.ModelAdmin):
    list_display = ['student','Equipment','time_slot']



