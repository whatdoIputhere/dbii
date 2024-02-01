from django.shortcuts import render, redirect
from bd2app.functions import *
from django.http import HttpResponse
from urllib.parse import unquote
from django.http import HttpResponseForbidden


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
        if(request.method != 'POST'):
            return render(request, 'gerircomponentes.html', 
                          context={'componentes': getComponentes(), 
                                   'tiposcomponente': getTiposComponentes(), 
                                   'armazens': getArmazens(), 
                                   'componentesarmazem': getComponentesArmazem()})
        data = request.POST
        if(data.get("action") == "edit"):
            if(editComponente(data.get("componente"))):
                return HttpResponse(status=200, content="edit")
            return HttpResponse(status=400)
        if(data.get("action") == "add"):
            newComponente = addComponente(data.get("componente"))
            if(newComponente):
                return HttpResponse(status=200, content="add,"+str(newComponente))
            return HttpResponse(status=400)
        if(deleteComponente(data.get("id"))):
            return HttpResponse(status=200, content="delete")
        return HttpResponse(status=400)
    return redirect('index')

def gerirFornecedores(request):
    if not isAdmin(request):
        return redirect('index')
    return render(request, 'gerirfornecedores.html', 
                  context={'fornecedores': getFornecedores(),
                           'componentes': getComponentes(),
                           'tiposcomponente': getTiposComponentes(), 
                           'fornecedorcomponente': getFornecedorComponente()})

def gerirUtilizadores(request):
    if not isAdmin(request):
        return redirect('index')
    return render(request, 'gerirutilizadores.html', context={'utilizadores': getUtilizadores()})

def gerirEquipamentos(request):
    if not isAdmin(request):
        return redirect('index')
    if(request.method != 'POST'):
            return render(request, 'gerirequipamentos.html', context={'equipamentos': getEquipamentos()})

def editDeleteComponenteModal(request):
    if request.META.get('HTTP_REFERER') is None:
        return render(request, '404.html')
    
        componente = unquote(request.POST.get("componente"))
        componente = json.loads(componente)
        return render(request, 'modals/componentes/editdeletecomponente.html', 
                      context={'componente': componente, 
                                'tiposcomponente': getTiposComponentes(), 
                                'armazens': getArmazens(), 
                                'componentesarmazem': getComponentesArmazem()})
            
def editDeleteFornecedorModal(request):
    if request.META.get('HTTP_REFERER') is None:
        return render(request, '404.html')
    
        fornecedor = unquote(request.POST.get("fornecedor"))
        fornecedor = json.loads(fornecedor)
        return render(request, 'modals/fornecedores/editdeletecomponente.html', 
                      context={'componente': componente, 
                                'tiposcomponente': getTiposComponentes(), 
                                'armazens': getArmazens(), 
                                'componentesarmazem': getComponentesArmazem()})
        
def viewEditComponentes(request):
    if request.META.get('HTTP_REFERER') is None:
        return render(request, '404.html')
    
        componente = unquote(request.POST.get("componente"))
        componente = json.loads(componente)
        return render(request, 'modals/fornecedores/vieweditcomponentes.html', 
                      context={'componente': componente, 
                                'tiposcomponente': getTiposComponentes(), 
                                'armazens': getArmazens(), 
                                'fornecedorcomponente': getFornecedorComponente()()})


def notFound(request, exception=None):
    return render(request, '404.html')

def isAdmin(request):
    if 'user' in request.session:
        if request.session['user'][4] == '1':
            return True
        return False
    return False