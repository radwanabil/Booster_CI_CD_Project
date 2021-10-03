FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip
    
ENV PYTHONUNBUFFERED=1
COPY . /simpleApp/

WORKDIR /simpleApp/

RUN pip3 install -r requirements.txt

RUN python3 manage.py makemigrations

RUN python3 manage.py migrate

CMD python3 manage.py runserver 0.0.0.0:8000
