from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view

from .serializer import ClassroomSerializer
from .models import Classroom

# Create your views here.

@api_view(['GET'])
def getClass(request):
    classrooms = Classroom.objects.all()
    serializer = ClassroomSerializer(classrooms, many=True)
    return Response(serializer.data)
