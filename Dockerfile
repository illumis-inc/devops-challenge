##### Builder #####
FROM python:3.9.5-slim-buster as builder

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY . /usr/src/app
COPY requirements* /requirements/

RUN pip wheel --no-cache-dir --no-deps --wheel-dir /usr/src/app/wheels -r requirements.txt

##### Final #####
FROM python:3.9.5-slim-buster

RUN mkdir -p /home/app && addgroup --system app && adduser --system --group app

ENV HOME=/home/app
WORKDIR $HOME

COPY --from=builder /usr/src/app/wheels /wheels
COPY --from=builder /usr/src/app/requirements.txt .

RUN pip install --no-cache-dir -U pip && pip install --no-cache /wheels/*

COPY ./docker/entrypoint.sh $HOME

COPY . $HOME

RUN chown -R app:app $HOME

USER app

ENTRYPOINT [ "/home/app/entrypoint.sh" ]
