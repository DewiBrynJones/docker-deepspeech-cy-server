FROM python:3

RUN apt-get update \ 
    && apt-get install -q -y --no-install-recommends cmake libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

COPY django-deepspeech-server /django-deepspeech-server
COPY config-macsen.json /django-deepspeech-server/speech_server_main/config/config.json

RUN mkdir -p /django-deepspeech-server/models
WORKDIR /django-deepspeech-server/models

RUN wget -O - http://techiaith.cymru/deepspeech/models/macsen_190208.tar.gz | tar xvfz -

WORKDIR /django-deepspeech-server
RUN mkdir -p audio
RUN mkdir -p native_client

RUN pip3 install -r requirements.txt

RUN pip3 install deepspeech scipy six

RUN python manage.py migrate

RUN wget https://raw.githubusercontent.com/mozilla/DeepSpeech/master/util/taskcluster.py
RUN python taskcluster.py --target /django-deepspeech-server/native_client

WORKDIR /django-deepspeech-server/native_client
RUN rm -rf kenlm \
    && git clone https://github.com/kpu/kenlm && cd kenlm \
    && mkdir -p build \
    && cd build \
    && cmake .. \
    && make -j 4

EXPOSE 8000

