# docker-deepspeech-cy-server

## Rhagofynion / Prerequisites

 - docker
 - docker-compose


## Defnyddio / Using
 
```shell
~/src$ git clone https://github.com/techiaith/docker-deepspeech-cy-server.git
~/src$ cd docker-deepspeech-cy-server
~/src/docker-deepspeech-cy-server$ make
if [ ! -d "django-deepspeech-server" ]; then \
    git clone https://github.com/ashwan1/django-deepspeech-server; \
fi
docker-compose build
nginx uses an image, skipping
Building deepspeechapp
Step 1/21 : FROM python:3.6
 ---> 2bb3204ab1d1

...

Step 20/21 : WORKDIR /django-deepspeech-server
 ---> Running in 835516bf2ae2
Removing intermediate container 835516bf2ae2
 ---> ef0dc2eac25a
Step 21/21 : EXPOSE 8000
 ---> Running in 9e5f561c2d7d
Removing intermediate container 9e5f561c2d7d
 ---> ea0914426f3e
Successfully built ea0914426f3e
Successfully tagged docker-django-deepspeech-server_deepspeechapp:latest
~/src/docker-deepspeech-cy-server$ make run
docker-compose up -d
Creating network "docker-django-deepspeech-server_deepspeech_nginx_network" with driver "bridge"
Creating techiaith-deepspeech-server ... done
Creating techiaith-deepspeech-server-nginx ... done
~/src/docker-deepspeech-cy-server$

```

Yna ewch i http://127.0.0.1:5400

Mae'r gweinydd yn llwytho modelau [Macsen](http://techiaith.cymru/macsen), felly gofynnwch "Beth yw'r newyddion?"

