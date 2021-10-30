from django.core.checks import messages
from django.shortcuts import render

import sports
from .models import  *
# from .seralizer import *
from django.shortcuts import  render
from rest_framework.parsers import JSONParser
from rest_framework.renderers import JSONRenderer
from django.http import HttpResponse,JsonResponse
import io
import platform
from django.views.decorators.csrf import csrf_exempt
import json
from .seralizer import *
from rest_framework import permissions
from rest_framework.decorators import  api_view,permission_classes
from authentications.models import *
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated,AllowAny
from datetime import datetime ,timedelta,date
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FormParser,FileUploadParser
from rest_framework.response import Response
from .models import *

# <--------------------------------super user creation --------------------->
@csrf_exempt
@api_view(['POST','GET','PUT','DELETE'])
@permission_classes([IsAuthenticated])
def superuser(request):
    if request.method == "GET":
        us = UserAccount.objects.filter(email=request.user).first()
        us.is_staff = True
        us.is_superuser = True
        us.save()
        print("us.is_staff")
        message = {"message":"super user created"}
        return  JsonResponse(message,safe=False,status=200)
# <--------------------------------super user creation --------------------->

# <--------------------------------sports data started --------------------->
class Sports_view(APIView):
    permission_classes = [permissions.IsAuthenticated]
    parser_classes = (MultiPartParser, FormParser,JSONParser)
    def get(self,request,slug=None,eqipment_name=None):
        if slug:
            if eqipment_name:

                s = Sports.objects.filter(name = slug).first()
                equipments = Equipment.objects.filter(sport_associatewith = s,name = eqipment_name).first()
                seralizers = Equipment_seralizer(equipments)
                return JsonResponse(seralizers.data,safe=False)
            s = Sports.objects.filter(name = slug).first()
            equipments = Equipment.objects.filter(sport_associatewith = s)
            seralizers = Equipment_seralizer(equipments,many= True)
            return JsonResponse(seralizers.data,safe=False)

            
        s = Sports.objects.all()
        seralizers = Sports_seralizer(s,many=True)
        return JsonResponse(seralizers.data,safe=False)
            
# <--------------------------------sports data list end --------------------->
# <--------------------------------Request_view start --------------------->
class Request_view(APIView):
    permission_classes = [permissions.IsAuthenticated]
    parser_classes = (MultiPartParser, FormParser,JSONParser)
    def get(self,request):
        s = Request_equip.objects.filter(student = request.user)
        seralizers = Request_seralizer(s,many=True)
        return JsonResponse(seralizers.data,safe=False)
    def post(self,request,sports_name,eqipment_name):
        selected_sport = Sports.objects.filter(name= sports_name).first()
        selected_equipment = Equipment.objects.filter(sport_associatewith = selected_sport, name= eqipment_name).first()
        data = request.data
        date_slot = data["date"]
        qty = data["qty"]
        quantity =  models.IntegerField(default=1)
        time = Request_equip.objects.create(student= request.user, quantity= qty,Equipment = selected_equipment,time_slot = date_slot) 
        message = {
                        "message":"Your slot been booked "
                    }
        return Response(message, status=200)
            
            
# <--------------------------------Request_view end --------------------->