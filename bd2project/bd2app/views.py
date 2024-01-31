from django.shortcuts import render, redirect
from bd2app.functions import *
from django.http import HttpResponse
from urllib.parse import unquote


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

def gerirUtilizadores(request):
    if not isAdmin(request):
        return redirect('index')
    return render(request, 'gerirutilizadores.html', context={'utilizadores': getUtilizadores()})

def gerirEquipamentos(request):
    if isAdmin(request):
        if(request.method != 'POST'):
            return render(request, 'gerirequipamentos.html', context={'equipamentos': getEquipamentos()})
        data = request.POST
    return redirect('index')

def editDeleteComponenteModal(request):
    if isAdmin(request):
        componente = unquote(request.POST.get("componente"))  
        componente = json.loads(componente)
        return render(request, 'modals/editdeletecomponente.html', context={'componente': componente, 'tiposcomponente': getTiposComponentes(), 'armazens': getArmazens(), 'componentesarmazem': getComponentesArmazem()})
            

# def editarComponente(request):
#     if not isAdmin(request):
#         return redirect('index')
#     if request.method == 'POST':
#         data = request.POST
#         id = data.get("id")
#         nome = data.get("nome")
#         descricao = data.get("descricao")
#         preco = data.get("preco")
#         stock = data.get("stock")
#         if id == "0":
#             executedb("AdicionarComponente", [nome, descricao, preco, stock], 'proc')
#         else:
#             executedb("EditarComponente", [id, nome, descricao, preco, stock], 'proc')
#         return redirect('gerircomponentes')
#     return render(request, 'editarcomponente.html', context={'componente': getComponentes()[0]})

# def editarUtilizadores(request):
#     if isAdmin(request):
#         if request.method != 'POST':
#             return redirect('index')
#         data = request.POST
#         id = data.get("id")
#         nome = data.get("nome")
#         email = data.get("email")
#         password = data.get("password")
#         if id == "0":
#             executedb("AdicionarUtilizador", [nome, email, password], 'proc')
#         else:
#             executedb("EditarUtilizador", [id, nome, email, password], 'proc')
#         return redirect('gerirutilizadores')
#     return redirect('index')

# def editarEquipamentos(request):
#     if isAdmin(request):
#         if request.method != 'POST':
#             return redirect('index')
#         data = request.POST
#         id = data.get("id")
#         nome = data.get("nome")
#         descricao = data.get("descricao")
#         preco = data.get("preco")
#         stock = data.get("stock")
#         if id == "0":
#             executedb("AdicionarEquipamento", [nome, descricao, preco, stock], 'proc')
#         else:
#             executedb("EditarEquipamento", [id, nome, descricao, preco, stock], 'proc')
#         return redirect('gerirequipamentos')
#     return redirect('index')


def notFound(request, exception=None):
    return render(request, '404.html')

def isAdmin(request):
    if 'user' in request.session:
        if request.session['user'][4] != '1':
            return False
    return True