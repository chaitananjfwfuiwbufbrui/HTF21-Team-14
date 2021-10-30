from django.contrib import admin
from home import views
from django.urls import path,include
urlpatterns = [
    path('superuser/', views.superuser, name='superuser'),
    path('sports/', views.Sports_view.as_view(), name='superuser'),
    path('sports/<str:slug>/', views.Sports_view.as_view(), name='superuser'),
    path('sports/<str:slug>/<str:eqipment_name>/', views.Sports_view.as_view(), name='superuser'),
    path('request/', views.Request_view.as_view(), name='superuser'),
    path('request/<str:sports_name>/<str:eqipment_name>/', views.Request_view.as_view(), name='superuser'),
    # path('patents/', views.Patence.as_view(), name='patents'),
    # path('reports/<str:patientname>/', views.Reports.as_view(), name='reports'),
]