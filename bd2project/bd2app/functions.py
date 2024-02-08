import psycopg2
from contextlib import closing
from django.db import connections
import bcrypt
from django.shortcuts import redirect
import re
import json
import datetime

def fregister(username, email, password):    
    try:
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
        return executedb("RegistarUtilizador", [username, email, hashed_password],'func')
    except Exception as e:
        print(f"Error: {str(e)}")
        return False 

def flogin(email, password):
    try:
        user = executedb("LoginUtilizador", [email],'func')[0].replace('(', '').replace(')', '').split(',')
        if not user[0]:
            return False
        if bcrypt.checkpw(password.encode('utf-8'), user[3].encode('utf-8')):
            return user
        else:
            return False
    except Exception as e:
        print(f"Error: {str(e)}")
        return False
    
def getUtilizadores():
    try:
        return executedb("GetUtilizadores", [], 'view')        
    except Exception as e:
        print(f"Error: {str(e)}")
        return False
    
def getTiposComponentes():
    try:
        return executedb("GetTipoComponentes", [], 'view')        
    except Exception as e:
        print(f"Error: {str(e)}")
        return False
    
def getTiposEquipamentos():
    try:
        return executedb("GetTipoEquipamento", [], 'view')        
    except Exception as e:
        print(f"Error: {str(e)}")
        return False

def getComponentesArmazem():
    try:
        return executedb("GetComponentesArmazem", [], 'view')        
    except Exception as e:
        print(f"Error: {str(e)}")
        return []
    
def getArmazens():
    try:
        return executedb("GetArmazens", [], 'view')        
    except Exception as e:
        print(f"Error: {str(e)}")
        return []

#region CRUD Equipamento

def addEquipamento(equipamento, componentes,userId):
    try:
        equipamento_obj = json.loads(equipamento)
        equipamento_obj.pop(0)
        newEquipamento = executedb("InserirEquipamentoReturn", equipamento_obj, 'func')
        addProducaoEquipamento(componentes, newEquipamento[0], userId)
        return json.dumps(newEquipamento, cls=CustomEncoder)
    except Exception as e:
        print(f"Error: {str(e)}")
        return False

def addProducaoEquipamento(componentes,equipamento,userId):
    try:
        print(componentes.replace('"',''))
        executedb("InserirProducaoEquipamento", [componentes.replace('"',''),equipamento,userId], 'proc')
        return True
    except Exception as e:
        print(f"Error: {str(e)}")
        return False

def getEquipamentos():
    try:
        equipamentos = executedb("GetEquipamentos", [], 'view')
        for i in range(len(equipamentos)):
            equipamentos[i] = list(equipamentos[i])
            equipamentos[i][6] = equipamentos[i][6].tobytes().decode('utf-8')
        return equipamentos
    except Exception as e:
        print(f"Error: {str(e)}")
        return []

def getProducaoEquipamento():
    try:
        return executedb("GetProducaoEquipamento", [], 'view')        
    except Exception as e:
        print(f"Error: {str(e)}")
        return []

def getEquipamentosArmazem():
    try:
        return executedb("GetEquipamentosArmazem", [], 'view')        
    except Exception as e:
        print(f"Error: {str(e)}")
        return []
    
def editEquipamento(equipamento, componentes,userId):
    try:
        equipamento_obj = json.loads(equipamento)
        executedb("AtualizarEquipamento", equipamento_obj, 'proc')
        addProducaoEquipamento(componentes, equipamento_obj[0], userId)
        return True
    except Exception as e:
        print(f"Error: {str(e)}")
        return False

def deleteEquipamento(id):
    try:
        executedb("RemoverEquipamento", [id], 'proc')
        return True
    except Exception as e:
        print(f"Error: {str(e)}")
        return False

#endregion

#region CRUD FornecedorComponente
def addFornecedorComponente(componentes, fornecedor):
    try:
        print(componentes.replace('"',''))
        executedb("InserirFornecedorComponente", [componentes.replace('"',''),fornecedor], 'proc')
        return True
    except Exception as e:
        print(f"Error: {str(e)}")
        return False
    
def getFornecedorComponente():
    try:
        return executedb("GetFornecedorComponente", [], 'view')        
    except Exception as e:
        print(f"Error: {str(e)}")
        return []
#endregion

#region CRUD Componente

def addComponente(componente):
    try:
        componente_obj = json.loads(componente)
        componente_obj.pop(0)
        newComponente = executedb("InserirComponenteReturn", componente_obj, 'func')
        return json.dumps(newComponente, cls=CustomEncoder)
    except Exception as e:
        print(f"Error: {str(e)}")
        return False
    
def getComponentes():
    try:
        componentes = executedb("GetComponentes", [], 'view')
        for i in range(len(componentes)):
            componentes[i] = list(componentes[i])
            componentes[i][6] = componentes[i][6].tobytes().decode('utf-8')
        return componentes
    except Exception as e:
        print(f"Error: {str(e)}")
        return False

def editComponente(componente):
    try:
        componente_obj = json.loads(componente)        
        executedb("AtualizarComponente", componente_obj, 'proc')
        return True
    except Exception as e:
        print(f"Error: {str(e)}")
        return False

def deleteComponente(id):
    try:
        executedb("RemoverComponente", [id], 'proc')
        return True
    except Exception as e:
        print(f"Error: {str(e)}")
        return False
#endregion

#region CRUD Fornecedor
def addFornecedor(fornecedor):
    try:
        fornecedor_obj = json.loads(fornecedor)
        fornecedor_obj.pop(0)
        newFornecedor = executedb("InserirFornecedorReturn", fornecedor_obj, 'func')
        return json.dumps(newFornecedor, cls=CustomEncoder)
    except Exception as e:
        print(f"Error: {str(e)}")
        return False
    
def getFornecedores():
    try:
        return executedb("GetFornecedores", [], 'view')        
    except Exception as e:
        print(f"Error: {str(e)}")
        return []
    
def editFornecedor(fornecedor):
    try:
        fornecedor_obj = json.loads(fornecedor) 
        executedb("AtualizarFornecedor", fornecedor_obj, 'proc')
        return True
    except Exception as e:
        print(f"Error: {str(e)}")
        return False

def deleteFornecedor(id):
    try:
        executedb("RemoverFornecedor", [id], 'proc')
        return True
    except Exception as e:
        print(f"Error: {str(e)}")
        return False
#endregion

#region Support functions
def printSessionValues(request):
    for key, value in request.session.items():
            print(f"{key}: {value}")
            
class CustomEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime.datetime):
            return obj.isoformat()
        elif isinstance(obj, memoryview):
            return obj.tobytes().decode('utf-8')
        return super().default(obj)
    
# TODO: Add try catch to all functions and display information that something went wrong with the database
def executedb(name, params, type):
    query = f"{name}({','.join(['%s'] * len(params))})"
    cursor = connections['default'].cursor()
    if type == "proc":
        cursor.execute('CALL ' + query, params)
    elif type == "func":
        cursor.callproc(name, params)
        return cursor.fetchone()
    elif type == "view":
        cursor.execute('SELECT * FROM ' + name)
        return cursor.fetchall()

def isEmailValid(email):
    regex = re.compile(r'([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+')    
    if re.fullmatch(regex, email):
      return True
    return False

def isAdmin(request):
    if 'user' in request.session:
        if request.session['user'][4] == '1':
            return True
        return False
    return False
#endregion