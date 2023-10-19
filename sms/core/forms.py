from django import forms
from .models import CustomUser
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import AuthenticationForm



class SignUpForm(UserCreationForm):
    ROLE_CHOICES = [
        ('teacher', 'Teacher'),
        ('student', 'Student'),
    ]

    role = forms.ChoiceField(
        choices=ROLE_CHOICES,
        widget=forms.Select(attrs={'class': 'form-control'}),
    )

    class Meta:
        model = CustomUser  # Use your custom user model
        fields = ("username", "email", "password1", "password2", "role")

    username = forms.CharField(
        widget=forms.TextInput(attrs={'placeholder': 'Your username'}),
    )

    email = forms.EmailField(
        widget=forms.TextInput(attrs={'placeholder': 'Your email'}),
    )

    password1 = forms.CharField(
        widget=forms.PasswordInput(attrs={'placeholder': 'Your password'}),
    )

    password2 = forms.CharField(
        widget=forms.PasswordInput(attrs={'placeholder': 'Confirm your password'}),
    )



class LoginForm(AuthenticationForm):
    username = forms.CharField(
        widget=forms.TextInput(
            attrs={'placeholder': 'Your username',})
    )

    password = forms.CharField(
        widget=forms.PasswordInput(
            attrs={'placeholder': 'Your password',})
    )

