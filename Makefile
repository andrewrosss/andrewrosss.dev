PORT ?= 5005

.PHONY: docs pages dist clean

all: pages

docs:
	@pushd docs && make html && popd

pages: docs
	@rsync -avz --delete docs/build/html/ andrewrosss_dev/static/pages

local-server:
	gunicorn --bind :$(PORT) --workers 1 --threads 8 pages:app

dist:
	@python setup.py sdist bdist_wheel

upload:
	@python3 -m twine upload dist/*

clean:
	@pushd docs && make clean && popd
	@rm -rf andrewrosss_dev/static/pages/*
