# Requirements

## Postgres/psql
**Windows**\
`winget install -e --id PostgreSQL.PostgreSQL`

**Linux**\
`sudo apt update`\
`sudo apt install postgresql postgresql-contrib`\
`sudo systemctl start postgresql.service`
 
## Python
**Windows**\
`winget install -e --id Python.Python`

**Linux**\
`sudo apt update`
`sudo apt install python3`

## Django
**Windows\Linux**\
`python -m pip install Django`

## Python dependencies
**Windows\Linux**\
`pip install psycog2, django-bootstrap-v5, djongo, bcrypt`

# Initialize and run application
Depending if you're on windows or linux system run the appropriate **initdb** file\
**Make changes to the any of the variables in the file if necessary.**

After initializing the database run the following commands to start the web application\
`cd .\bd2project`\
`py manage.py runserver`