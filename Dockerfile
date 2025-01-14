FROM alpine:latest AS base

WORKDIR /

COPY ./app .



FROM python:3.10-slim-bullseye

WORKDIR /app


COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r ./requirements.txt

EXPOSE 5000


COPY --from=base /app.py /app

ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_APP=app.py


CMD ["flask", "run"]
