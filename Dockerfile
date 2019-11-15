FROM python:3.6

RUN apt-get update \ 
    && apt-get install -q -y --no-install-recommends cmake libboost-all-dev vim \
    && rm -rf /var/lib/apt/lists/*

COPY django-deepspeech-server /django-deepspeech-server
COPY config.json /django-deepspeech-server/speech_server_main/config/config.json

RUN mkdir -p /django-deepspeech-server/audio
RUN mkdir -p /django-deepspeech-server/models
WORKDIR /django-deepspeech-server/models

RUN wget -O - http://techiaith.cymru/deepspeech/models/macsen.tar.gz | tar xvfz -

WORKDIR /django-deepspeech-server

RUN pip3 install -r requirements.txt
RUN pip3 install deepspeech scipy six requests gunicorn

RUN python manage.py migrate

#
RUN mkdir -p native_client
WORKDIR /django-deepspeech-server/native_client
#RUN wget https://raw.githubusercontent.com/mozilla/DeepSpeech/master/util/taskcluster.py
RUN wget https://raw.githubusercontent.com/mozilla/DeepSpeech/v0.4.0/util/taskcluster.py
RUN python taskcluster.py --target /django-deepspeech-server/native_client

#
WORKDIR /django-deepspeech-server/native_client
RUN rm -rf kenlm \
    && git clone https://github.com/kpu/kenlm && cd kenlm \
    && mkdir -p build \
    && cd build \
    && cmake .. \
    && make -j 4

WORKDIR /django-deepspeech-server

EXPOSE 8000

