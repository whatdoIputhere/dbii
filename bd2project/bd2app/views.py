from django.shortcuts import render, redirect
from bd2app.functions import *
from django.http import HttpResponse
from urllib.parse import unquote
from django.http import HttpResponseForbidden


def index(request):
    return render(request, 'index.html')

def notFound(request, exception=None):
    return render(request, '404.html')

#region Account

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
#endregion

#region Componentes
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

# endregion

#region Fornecedores
def gerirFornecedores(request):
    if not isAdmin(request):
        return redirect('index')
    if(request.method != 'POST'):
        return render(request, 'gerirfornecedores.html', 
                    context={'fornecedores': getFornecedores(),
                            'componentes': getComponentes(),
                            'tiposcomponente': getTiposComponentes(), 
                            'fornecedorcomponente': getFornecedorComponente()})
    data = request.POST
    if(data.get("action") == "edit"):
        if(editFornecedor(data.get("fornecedor"))):
            return HttpResponse(status=200, content="edit")
        return HttpResponse(status=400)
    if(data.get("action") == "add"):
        newFornecedor = addFornecedor(data.get("fornecedor"))
        if(newFornecedor):
            return HttpResponse(status=200, content="add,"+str(newFornecedor))
        return HttpResponse(status=400)
    if(data.get("action") == "addcomponentes"):
        if(addFornecedorComponente(data.get("componentes"), data.get("fornecedorId"))):
            return HttpResponse(status=200, content="addcomponentes")
        return HttpResponse(status=400)
    if(deleteFornecedor(data.get("id"))):
        print('deleted ' + data.get("id"))
        return HttpResponse(status=200, content="delete")
    return HttpResponse(status=400)

def editDeleteFornecedorModal(request):
    if request.META.get('HTTP_REFERER') is None:
        return render(request, '404.html')
    
    fornecedor = unquote(request.POST.get("fornecedor"))
    fornecedor = json.loads(fornecedor)
    return render(request, 'modals/fornecedores/editdeletefornecedor.html', 
                    context={'fornecedor': fornecedor})
        
def viewEditComponentesModal(request):
    if request.META.get('HTTP_REFERER') is None:
        return render(request, '404.html')
    
    fornecedor = unquote(request.POST.get("fornecedor"))
    fornecedor = json.loads(fornecedor)
    return render(request, 'modals/fornecedores/vieweditcomponentes.html', 
                    context={'fornecedor': fornecedor,
                            'componentes': getComponentes(),
                            'tiposcomponente': getTiposComponentes(),
                            'fornecedorcomponente': getFornecedorComponente()})

#endregion

#region Utilizadores
def gerirUtilizadores(request):
    if not isAdmin(request):
        return redirect('index')
    return render(request, 'gerirutilizadores.html', context={'utilizadores': getUtilizadores()})
#endregion

#region Equipamentos
def gerirEquipamentos(request):
    if not isAdmin(request):
        return redirect('index')
    if(request.method != 'POST'):
        return render(request, 'gerirequipamentos.html', 
                        context={'equipamentos': getEquipamentos(),
                                'componentes': getComponentes(),
                                'tiposequipamento': getTiposEquipamentos(),
                                'producaoequipamento': getProducaoEquipamento(),
                                'equipamentosarmazem': getEquipamentosArmazem()})
    data = request.POST
    if(data.get("action") == "edit"):
        if(editEquipamento(data.get("equipamento"))):
            return HttpResponse(status=200, content="edit")
        return HttpResponse(status=400)
    if(data.get("action") == "add"):
        newEquipamento = addEquipamento(data.get("equipamento"))
        if(newEquipamento):
            return HttpResponse(status=200, content="add,"+str(newEquipamento))
        return HttpResponse(status=400)
    if(deleteEquipamento(data.get("id"))):
        return HttpResponse(status=200, content="delete")
    return HttpResponse(status=400)

def editDeleteEquipamentoModal(request):
    if request.META.get('HTTP_REFERER') is None:
        return render(request, '404.html')
    
    equipamento = unquote(request.POST.get("equipamento"))
    equipamento = json.loads(equipamento)
    return render(request, 'modals/equipamentos/editdeleteequipamento.html', 
                    context={'equipamento': equipamento, 
                            'tiposequipamento': getTiposequipamentos(), 
                            'armazens': getArmazens(), 
                            'equipamentosarmazem': getequipamentosArmazem()})
#endregion
