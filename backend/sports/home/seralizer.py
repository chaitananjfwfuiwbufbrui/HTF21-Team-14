from rest_framework import serializers
from home.models import *



class Sports_seralizer(serializers.ModelSerializer):
    class Meta:
        model = Sports()
        fields = '__all__'
class Equipment_seralizer(serializers.ModelSerializer):
    class Meta:
        model = Equipment()
        fields = '__all__'

class Request_seralizer(serializers.ModelSerializer):
    # patient_name = serializers.CharField(read_only=True, source='patient.get_full_name')
    class Meta:
        model = Request_equip()
        fields = ['student','time_slot','Equipment','state']

