FROM python:3.7.5-slim-buster
MAINTAINER ben

ENV INSTALL_PATH /humble_brag
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
RUN pip install --editable .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "humble_brag.app:create_app()"
