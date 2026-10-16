#!/bin/sh
set -xeuo pipefail
python manage.py migrate --noinput
# TODO: change before deployment
#       https://docs.djangoproject.com/en/6.1/howto/deployment/checklist/
exec python manage.py runserver 0.0.0.0:8000
