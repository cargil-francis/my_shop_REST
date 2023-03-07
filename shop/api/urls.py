
from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from .views import  RegisterAPIView


urlpatterns = [

    path('register/', RegisterAPIView.as_view(), name='register'),
]
