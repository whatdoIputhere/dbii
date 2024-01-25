import psycopg2
from contextlib import closing
from django.db import connections
import bcrypt
from django.shortcuts import redirect
import re
import json

def executedb(name, params, type):
    query = f"{name}({','.join(['%s'] * len(params))})"
    cursor = connections['default'].cursor()
    if type == "proc":
        cursor.execute('CALL ' + query, params)
    elif type == "func":
        cursor.callproc(name, params)
        return cursor.fetchone()[0]
    elif type == "view":
        cursor.execute('SELECT * FROM ' + name)
        return cursor.fetchall()

def fregister(username, email, password):    
    try:
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
        return executedb("RegistarUtilizador", [username, email, hashed_password],'func')
    except Exception as e:
        print(f"Error: {str(e)}")
        return False 

def flogin(email, password):
    try:
        user = executedb("LoginUtilizador", [email],'func').replace('(','').replace(')','').replace('"','').split(',')
        if len(user[0]) == 0:
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


def getEquipamentos():
    try:
        return executedb("GetEquipamentos", [], 'view')        
    except Exception as e:
        print(f"Error: {str(e)}")
        return False

def isEmailValid(email):
    regex = re.compile(r'([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+')    
    if re.fullmatch(regex, email):
      return True
    return False

def editComponente(componente):
    try:
        componente_obj = json.loads(componente)
        values = list(componente_obj.values())
        print(values)
        print(executedb("AtualizarComponente", values, 'proc'))
        return True
    except Exception as e:
        print(f"Error: {str(e)}")
        return False


def printSessionValues(request):
    for key, value in request.session.items():
            print(f"{key}: {value}")