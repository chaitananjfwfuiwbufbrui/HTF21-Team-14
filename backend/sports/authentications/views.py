from django.shortcuts import render
import json
from django.shortcuts import render
from .models import  *
from rest_framework.permissions import IsAuthenticated,AllowAny
from django.shortcuts import  render
from rest_framework.parsers import JSONParser
from rest_framework.renderers import JSONRenderer
from django.http import HttpResponse,JsonResponse
import io
from django.views.decorators.csrf import csrf_exempt

from rest_framework.decorators import  api_view, permission_classes

from rest_framework.response import Response

@api_view(['POST','GET','PUT','DELETE'])
@permission_classes([AllowAny])
def hello_world(request):
    if request.method == "GET":
        msh = {'msg':'working'}
        ss = json.dumps(msh)
        
        return Response(ss)
    if request.method =="POST":
        # data =  request.data
        msh = {'msg':'post working'}
        ss = json.dumps(msh)
        
        return Response(ss)