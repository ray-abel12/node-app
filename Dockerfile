FROM python:3
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
EXPOSE 8000
ADD node-app /node-app
CMD ["python","/node-app/manage.py","runserver","0.0.0.0:8000"]