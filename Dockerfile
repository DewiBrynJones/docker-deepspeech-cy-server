FROM python:3

COPY django-deepspeech-server /django-deepspeech-server
COPY config-macsen.json /django-deepspeech-server/speech_server_main/config/config.json

RUN mkdir -p /django-deepspeech-server/models
WORKDIR /django-deepspeech-server/models

RUN wget -O - http://techiaith.cymru/deepspeech/models/macsen_180924.tar.gz | tar xvfz -

WORKDIR /django-deepspeech-server
RUN mkdir -p audio

RUN pip3 install -r requirements.txt

RUN pip3 install deepspeech scipy

RUN python manage.py migrate

EXPOSE 8000
