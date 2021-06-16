#!/usr/bin/env sh

# wait for mongo to come up
gunicorn --bind 0.0.0.0:80 app:app -w 2 --threads 2
