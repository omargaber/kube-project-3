FROM python:3.10-slim

USER root

WORKDIR /src

RUN apt-get update && apt-get install -y build-essential

COPY ./analytics/requirements.txt requirements.txt

RUN  pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

EXPOSE 5153

ENV DB_USERNAME=""
ENV DB_PASSWORD=""
ENV DB_HOST=""
ENV DB_PORT=""
ENV DB_NAME=""

COPY ./analytics .

CMD python app.py
