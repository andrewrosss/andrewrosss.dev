PORT ?= 5005
VERSION = $(shell python -c "import andrewrosss_dev; print(andrewrosss_dev.__version__)")

.PHONY: docs pages dist clean help

help:                ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

docs:                ## build the html files using the *.rst files in docs/source/
	@bash -c "pushd docs && make html && popd"

pages: docs          ## after building the html, move html to andrewrosss_dev/static/pages
	@mkdir -p andrewrosss_dev/static/pages
	@bash -c "rsync -avz --delete docs/build/html/ andrewrosss_dev/static/pages"

local-docker-image:  ## build the docker image locally
	@docker build -t andrewrosss.dev:$(shell make version | tr + -) .

dev-server:          ## start serving the application using a "dev" server (2 threads)
	gunicorn --reload --bind :$(PORT) --workers 1 --threads 2 pages:app

prod-server:         ## start serving the application using a "prod" server (8 threads)
	gunicorn --bind :$(PORT) --workers 1 --threads 8 pages:app

dist:                ## build the source distribution
	@python setup.py sdist bdist_wheel

upload:              ## upload the source distribution to PyPI
	@python3 -m twine upload dist/*

version:             ## echo the application version
	@echo $(VERSION)

clean:               ## remove all HTML artifacts
	@pushd docs && make clean && popd
	@rm -rf andrewrosss_dev/static/pages/*

requirements:        ## Run 'pip freeze --all --exclude-editable'
	@pip freeze --all --exclude-editable
