from django.urls import path
from django.contrib.auth import views as auth_views
from .views import register
from .forms import LoginForm


urlpatterns = [
    path('register/', register, name='register'),
    path("login/", auth_views.LoginView.as_view(template_name="core/login.html",
         authentication_form=LoginForm), name="login")
]
