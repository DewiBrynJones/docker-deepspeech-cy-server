default: build


build:
	if [ ! -d "django-deepspeech-server" ]; then \
	    git clone https://github.com/ashwan1/django-deepspeech-server; \
	fi
	docker build --rm -t techiaith/django-deepspeech .

	
run: 
	docker run --name django-deepspeech -it --rm \
		-v ${PWD}/recordings/:/recordings \
		-v ${PWD}/local/bin:/django-deepspeech-server/bin \
		-p 5400:8000 \
		techiaith/django-deepspeech bash

stop:
	docker stop django-deepspeech
	docker rm django-deepspeech

clean:
	docker rmi techiaith/django-deepspeech

