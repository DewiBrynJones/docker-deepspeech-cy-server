# docker-django-deepspeech-server

```
$ make
....
 ---> ef05ad7b0b1e
Successfully built ef05ad7b0b1e
Successfully tagged techiaith/django-deepspeech:latest
$ make run
docker run --name django-deepspeech -it --rm \
        -p 5400:8000 \
        techiaith/django-deepspeech bash
root@be445f33e414:/django-deepspeech-server# python manage.py runserver 0.0.0.0:8000
```

Yna http://localhost:5400
