ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache python3 git curl gcc musl-dev python3-dev libffi-dev openssl-dev cargo pkgconfig g++

RUN curl -sSL https://install.python-poetry.org | python3 -

RUN echo "Hello2"
RUN git clone -b dash https://github.com/gedemagt/finanzer.git

WORKDIR /finanzer
RUN export PATH="/root/.local/bin:$PATH" && poetry --version

RUN export PATH="/root/.local/bin:$PATH" && poetry config virtualenvs.create false \
  && poetry install --only main --no-interaction --no-ansi && poetry add setuptools gunicorn

COPY run.sh .
RUN chmod a+x run.sh

EXPOSE 8050

ENV BUDGET_DIRECTORY="/share/finanzer"

CMD [ "./run.sh" ]