SERVICE = configs-service
COMMON = dev-efficiency-common
test:
	pytest --cov=backend --blockage  --cov-report term-missing

coverage-collect:
	coverage run -m pytest

coverage: coverage-collect

mypy:
	mypy backend tests *.py

flake8:
	flake8 .

pycln:
	pycln .

isort:
	isort .

bandit:
	bandit -q -r -x /venv,/tests .

safety:
	safety check --bare --full-report -r requirements.txt -r requirements-dev.txt --ignore=42194

check-licenses:
	check_licenses > /dev/null

requirements:
	pip install -r requirements-dev.txt

check: isort flake8 mypy bandit safety check-licenses test
