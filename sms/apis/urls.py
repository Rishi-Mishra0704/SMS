from django.urls import path
from . import views

urlpatterns = [
    path('classroom/create/', views.postClass, name='classroom'),
    path('classroom/', views.classList, name='classroom'),

]

