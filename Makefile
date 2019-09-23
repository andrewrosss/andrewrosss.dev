PORT ?= 5005
VERSION = $(shell python -c "import andrewrosss_dev; print(andrewrosss_dev.__version__)")

.PHONY: docs pages dist clean

all: pages

docs:
	@pushd docs && make html && popd

pages: docs
	@rsync -avz --delete docs/build/html/ andrewrosss_dev/static/pages

dev-server:
	gunicorn --reload --bind :$(PORT) --workers 1 --threads 2 pages:app

dist:
	@python setup.py sdist bdist_wheel

upload:
	@python3 -m twine upload dist/*

version:
	@echo $(VERSION)

clean:
	@pushd docs && make clean && popd
	@rm -rf andrewrosss_dev/static/pages/*
