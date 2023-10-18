# accounts/views.py
from django.contrib.auth import login
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from .forms import SignUpForm

def register(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.role = form.cleaned_data['role']
            user.save()
            login(request, user)
            return HttpResponseRedirect('http://localhost:7000')  # Redirect to the home page after successful registration
    else:
        form = SignUpForm()

    return render(request, 'core/register.html', {'form': form})
