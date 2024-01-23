from django.shortcuts import render, redirect
from bd2app.functions import *


def index(request):
    return render(request, 'index.html')
    
def login(request):
    context = {}
    if request.method == 'POST':
        data = request.POST
        email = data.get("email")
        password = data.get("password")
        if(flogin(email, password)):
            return redirect('notFound')
        else:
            context['error'] = "Username ou password errados!"
            context['email'] = email
            return render(request, 'login.html', context)
    else:
        return render(request, 'login.html')

def register(request):
    context = {}
    if request.method == 'POST':
        data = request.POST        
        username = data.get("username")
        email = data.get("email")
        password = data.get("password")
        if(fregister(username, email, password)):
            return redirect('login')
        else:
            context['error'] = "Username ou email já existente!"
            context['username'] = username
            context['email'] = email
            return render(request, 'register.html', context)
    else:
        return render(request, 'register.html')

def notFound(request, exception=None):
    return render(request, '404.html')