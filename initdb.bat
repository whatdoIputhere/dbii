@echo off

set PATH=%PATH%;C:\Program Files\PostgreSQL\13\bin
set PGUSER=postgres
set PGPASSWORD=123
set PGHOST=localhost
set PGPORT=5432
set CONNSTRING="host=%PGHOST% port=%PGPORT% user=%PGUSER% password=%PGPASSWORD% connect_timeout=10"

psql -d %CONNSTRING% -tc "SELECT 1 FROM pg_database WHERE datname = 'bd2'" | findstr /C:"1" >nul || psql -U postgres -c "CREATE DATABASE bd2"

SET PGDATABASE=bd2

psql -d %CONNSTRING% -f ".\db_objects\createtables.sql"
psql -d %CONNSTRING% -f ".\db_objects\functions.sql"
psql -d %CONNSTRING% -f ".\db_objects\populatedata.sql"
psql -d %CONNSTRING% -f ".\db_objects\storedprocedures.sql"
psql -d %CONNSTRING% -f ".\db_objects\views.sql"

cd .\bd2project
python manage.py migrate