from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view

from .serializer import ClassroomSerializer
from .models import Classroom

# Create your views here.

@api_view(['POST'])
def postClass(request):
    serializer = ClassroomSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    else:
        return Response(serializer.errors)
    
@api_view(['PUT'])
def classDetail(request, pk):
    classroom = Classroom.objects.get(id=pk)
    if request.method == 'GET':
        serializer = ClassroomSerializer(classroom)
        return Response(serializer.data)
    elif request.method == 'PUT':
        serializer = ClassroomSerializer(classroom, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)
    elif request.method == 'DELETE':
        classroom.delete()
        return Response('Item deleted successfully')        
