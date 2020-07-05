.PHONY: test_api test test_ui


deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt

test:
	PYTHONPATH=. py.test --verbose -s --ignore=test_ui

lint:
	flake8 hello_world test

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

docker_build:
		docker build -t hello-world-printer .

docker_run: docker_build
			docker run \
				--name hello-world-printer-dev \
				-p 5000:5000 \
				-d hello-world-printer

USERNAME=aropek
TAG=$(USERNAME)/hello_world_printer

docker_push: docker_build
				@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
				docker tag hello-world-printer $(TAG); \
				docker push $(TAG); \
				docker logout;

test_smoke:
		curl --fail 127.0.0.1:5000

#test coverage
#tesT_cov - wywolanie coverage z wpisaniem raportu na ekran
test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=. --ignore=test_iu
#test_xunit - generacja xunit i coverage
test_xunit:
	PYTHONPATH=. py.test --cov. --cov-report xml --junit-xml=test_results

test_api:
	python test_api/check_api.py

test_ui:
	py.test -s --verbose test_ui/test_ui.py
