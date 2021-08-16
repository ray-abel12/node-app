#!/bin/sh
python manage.py migrate
python manage.py createsuperuserwithpassword \
        --username recruitmentadmin \
        --password Passadmin \
        --email admin1@example.org \
        --preserve
python manage.py runserver 0.0.0.0:8000

exec "$@"