export PGUSER=postgres
export PGPASSWORD=123
export PGHOST=localhost
export PGPORT=5432
export CONNSTRING="host=$PGHOST port=$PGPORT user=$PGUSER password=$PGPASSWORD connect_timeout=10"

psql -d $CONNSTRING -tc "SELECT 1 FROM pg_database WHERE datname = 'bd2'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE bd2"

export PGDATABASE=bd2

psql -d $CONNSTRING -f "./db_objects/createtables.sql"
psql -d $CONNSTRING -f "./db_objects/views.sql"
psql -d $CONNSTRING -f "./db_objects/functions.sql"
psql -d $CONNSTRING -f "./db_objects/populatedata.sql"
psql -d $CONNSTRING -f "./db_objects/storedprocedures.sql"

cd ./bd2project
python manage.py migrate