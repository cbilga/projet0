FROM ubuntu/apache2

WORKDIR /usr/src/app


#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt

COPY . .
COPY front/ /var/www/html


RUN apt update -y
RUN apt upgrade -y
RUN apt install python3 -y
RUN service apache2 start

EXPOSE 80

WORKDIR /usr/src/app/api

CMD [ "python3", "server.py" ]