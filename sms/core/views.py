from .forms import SignUpForm
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.contrib.auth import login

def register(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)  # Create user instance but don't save to the database yet
            user.user_type = form.cleaned_data['role']  # Assign the user type
            user.save()  # Save the user with the user type

            login(request, user)  # Log in the user

            return HttpResponseRedirect('http://localhost:7000')  # Redirect to the home page after successful registration
    else:
        form = SignUpForm()
    return render(request, 'core/register.html', {'form': form})






