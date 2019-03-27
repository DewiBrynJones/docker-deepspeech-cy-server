default: build

build:
	if [ ! -d "django-deepspeech-server" ]; then \
	    git clone https://github.com/ashwan1/django-deepspeech-server; \
	fi
	docker-compose build
	
run: 
	docker-compose up -d

stop:
	docker-compose stop

clean:
	docker-compose down

