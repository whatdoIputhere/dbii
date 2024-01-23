from django.shortcuts import render, redirect
from bd2app.functions import *


def index(request):
    return render(request, 'index.html')
    
def login(request):
    context = {}
    if request.method != 'POST':
        if 'user' in request.session:
            return redirect('index')
        return render(request, 'login.html')
    
    data = request.POST
    email = data.get("email")
    password = data.get("password")
    user = flogin(email, password)

    if not user:
        context['error'] = "Email or password incorrect!"
        context['email'] = email
        return render(request, 'login.html', context)
    
    request.session['user'] = user
    return redirect('index')
    
def logout(request):
    if 'user' in request.session:
        del request.session['user']
    return redirect('index')

def register(request):
    context = {}
    if request.method != 'POST':
        if 'user' in request.session:
            return redirect('index')
        return render(request, 'register.html')
    data = request.POST        
    username = data.get("username")
    email = data.get("email")
    if not isEmailValid(email):
        context['error'] = "Email inválido!"
        context['username'] = username
        return render(request, 'register.html', context)
    password = data.get("password")
    if(fregister(username, email, password)):
        return redirect('login')
    else:
        context['error'] = "Username ou email já existente!"
        context['username'] = username
        context['email'] = email
        return render(request, 'register.html', context)
    
def gerirComponentes(request):
    if isAdmin(request):
        return render(request, 'gerircomponentes.html', context={'componentes': getComponentes()})
    return redirect('index')

def gerirUtilizadores(request):
    if not isAdmin(request):
        return redirect('index')
    return render(request, 'gerirutilizadores.html', context={'utilizadores': getUtilizadores()})

def gerirEquipamentos(request):
    if isAdmin(request):
        return render(request, 'gerirequipamentos.html', context={'equipamentos': getEquipamentos()})
    return redirect('index')

def notFound(request, exception=None):
    return render(request, '404.html')

def isAdmin(request):
    if 'user' in request.session:
        if request.session['user'][4] != '1':
            return False
    return True