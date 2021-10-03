FROM ubuntu:lts

RUN apt-get update
RUN apt-get install -y build-essential python 3.6 python3-pip

COPY . simpleApp
WORKDIR ./simpleApp

#install to start Django server
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate

EXPOSE 8000

CMD["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]
