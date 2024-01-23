import psycopg2
from contextlib import closing
import bcrypt
import bcrypt

def executedb(name, params, type):
    query = f"{name}({','.join(['%s'] * len(params))})"
    with closing(psycopg2.connect(database="bd2", user="postgres", password="123", host="localhost", port="5432")) as conn:
        with conn, conn.cursor() as cursor:
            if type == "proc":
                cursor.execute('CALL ' + query, params)
            elif type == "func":
                cursor.callproc(name, params)
                return cursor.fetchone()[0]

def fregister(username, email, password):    
    try:
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
        return executedb("RegistarUtilizador", [username, email, hashed_password],'func')
    except Exception as e:
        print(f"Error: {str(e)}")
        return False 

def flogin(email, password):
    try:
        hashed_pw = executedb("LoginUtilizador", [email],'func')
        if bcrypt.checkpw(password.encode('utf-8'), hashed_pw.encode('utf-8')):
            return True
        else:
            return False
    except Exception as e:
        print(f"Error: {str(e)}")
        return False