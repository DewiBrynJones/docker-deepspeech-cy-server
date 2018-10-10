default: build


build:
	docker build --rm -t techiaith/django-deepspeech .

	
run: 
	docker run --name django-deepspeech -it --rm \
		-p 5400:8000 \
		techiaith/django-deepspeech bash

stop:
	docker stop django-deepspeech
	docker rm django-deepspeech

clean:
	docker rmi techiaith/django-deepspeech

