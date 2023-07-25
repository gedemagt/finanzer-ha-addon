#!/usr/bin/with-contenv bashio

mkdir -p $BUDGET_DIRECTORY

cd finance
gunicorn --bind "0.0.0.0:8050" webapp.webapp:flask_app
