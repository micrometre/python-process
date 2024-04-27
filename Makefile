.PHONY: run
venv:
	python3 -m venv .venv



flask:
	flask run -h 0.0.0.0 --debug --reload
flask_db_init:
	flask --app flaskalpr init-db

clean: 
	rm -rf static/alprd1_images/
	mkdir static/alprd1_images

start:
	docker-compose up -d 

stop:
	docker-compose down 

update:
	docker-compose down 
	docker-compose pull
	docker-compose up -d --build

restart:
	docker-compose restart

remove:
	docker-compose down -v
	docker-compose rm -f


post:
	bash  scripts/watch-post.sh

watch:
	inotifywait -m static/alprd1_images/ -r -e close_write --format '%w%f'
