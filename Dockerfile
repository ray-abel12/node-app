FROM public.ecr.aws/sam/build-python3.7:latest
#public.ecr.aws/sam/build-python3.7:latest
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
EXPOSE 8000
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/code/entrypoint.sh"]
#ENV DJANGO_DB_NAME='database-1'
#ENV DJANGO_SU_NAME=admin
#ENV DJANGO_SU_EMAIL=admin@my.company
#ENV DJANGO_SU_PASSWORD=mypass
#ENV SECRET_KEY=$SECRET_KEY
#ENV POSTGRES_HOST=$POSTGRES_HOST
#ENV POSTGRES_DB=$POSTGRES_DB
#ENV POSTGRES_USER=$POSTGRES_USER
#ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD

#RUN python manage.py makemigrations
#RUN python manage.py migrate

#RUN python -c "import django; django.setup(); \
#   from django.contrib.auth.management.commands.createsuperuser import get_user_model; \
#   get_user_model()._default_manager.db_manager('$DJANGO_DB_NAME').create_superuser( \
#   username='$DJANGO_SU_NAME', \
#   email='$DJANGO_SU_EMAIL', \
#   password='$DJANGO_SU_PASSWORD')"
#RUN python manage.py create_superuser( username='$DJANGO_SU_NAME', \
#   email='$DJANGO_SU_EMAIL', \
#   password='$DJANGO_SU_PASSWORD')
