FROM public.ecr.aws/sam/build-python3.7:latest
#public.ecr.aws/sam/build-python3.7:latest
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
EXPOSE 8000
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["bash", "/code/entrypoint.sh"]
