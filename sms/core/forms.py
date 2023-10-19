from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

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
        model = User
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
