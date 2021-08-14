#!/bin/bash
set -exu
python  manage.py makemigrations
python  manage.py migrate
export DJANGO_SUPERUSER_PASSWORD='Pass123'
python manage.py createsuperuser \
    --no-input \
    --username="admin" \
    --email="admin@admin.com"