FROM python:3.7

WORKDIR /home

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    rsync \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . /home/

RUN make pages

CMD make prod-server
