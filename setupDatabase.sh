#!/bin/bash
set -exu
python  /node-app/manage.py makemigrations
python  /node-app/manage.py migrate
export DJANGO_SUPERUSER_PASSWORD='Pass123'
python /node-app/manage.py createsuperuser \
    --no-input \
    --username="admin" \
    --email="admin@admin.com"