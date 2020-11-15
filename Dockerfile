FROM python:3.9-slim

ENV HOST 0.0.0.0
ENV PORT 5000
ENV APP_USER=app
ENV APP_GROUP=app
ENV APP_ROOT=/home/${APP_USER}

RUN mkdir -p ${APP_ROOT}
WORKDIR ${APP_ROOT}

RUN set -ex && \
    apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
            build-essential \
            python3-dev

RUN set -ex && pip install --upgrade pip && pip install pipenv

COPY Pipfile Pipfile
COPY Pipfile.lock Pipfile.lock

RUN set -ex && pipenv install --deploy --system

RUN groupadd -r ${APP_GROUP} && useradd --no-log-init -r -g ${APP_GROUP} ${APP_USER}
RUN chown -R ${APP_USER}:${APP_GROUP} ${APP_ROOT}
USER ${APP_USER}

COPY --chown=app:app . ${APP_ROOT}

EXPOSE ${PORT}

CMD ["jupyter", "notebook", "--config", "jupyter_notebook_config.py"]