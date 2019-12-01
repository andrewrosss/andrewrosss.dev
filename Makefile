PORT ?= 5005
VERSION = $(shell python -c "import andrewrosss_dev; print(andrewrosss_dev.__version__)")

.PHONY: docs pages dist clean

all: pages

docs:
	@bash -c "pushd docs && make html && popd"

pages: docs
	@mkdir -p andrewrosss_dev/static/pages
	@bash -c "rsync -avz --delete docs/build/html/ andrewrosss_dev/static/pages"

local-docker-image:
	@docker build -t andrewrosss.dev:$(shell make version | tr + -) .

dev-server:
	gunicorn --reload --bind :$(PORT) --workers 1 --threads 2 pages:app

prod-server:
	gunicorn --bind :$(PORT) --workers 1 --threads 8 pages:app

dist:
	@python setup.py sdist bdist_wheel

upload:
	@python3 -m twine upload dist/*

version:
	@echo $(VERSION)

clean:
	@pushd docs && make clean && popd
	@rm -rf andrewrosss_dev/static/pages/*

requirements:   ## Run 'pip freeze --all --exclude-editable'
	@pip freeze --all --exclude-editable
