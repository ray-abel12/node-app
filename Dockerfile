FROM python:3

WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
EXPOSE 8000
ENV POSTGRES_HOST=$POSTGRES_HOST
ENV POSTGRES_DB=$POSTGRES_DB
ENV POSTGRES_USER=$POSTGRES_USER
ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD
ENV DJANGO_DB_NAME=default
ENV DJANGO_SU_NAME=admin
ENV DJANGO_SU_EMAIL=admin@my.company
ENV DJANGO_SU_PASSWORD=mypass
RUN python manage.py makemigrations
RUN python manage.py migrate

#RUN python -c "import django; django.setup(); \
#   from django.contrib.auth.management.commands.createsuperuser import get_user_model; \
#   get_user_model()._default_manager.db_manager('$DJANGO_DB_NAME').create_superuser( \
#   username='$DJANGO_SU_NAME', \
#   email='$DJANGO_SU_EMAIL', \
#   password='$DJANGO_SU_PASSWORD')"
CMD ["python","manage.py","runserver","0.0.0.0:8000"]