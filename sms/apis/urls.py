from django.urls import path
from . import views

urlpatterns = [
    path('classroom/', views.getClass, name='classroom'),
]

