FROM python:3
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
EXPOSE 8000
#ENV POSTGRES_HOST=database-1.cjhenbij1ci1.eu-west-2.rds.amazonaws.com
#ENV POSTGRES_DB=database-1
#ENV POSTGRES_USER=postgres
#ENV POSTGRES_PASSWORD=Secure1251
#ENV DJANGO_DB_NAME=default
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