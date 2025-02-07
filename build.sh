#!/usr/bin/env bash
# Exit on error
set -o errexit


apt-get update && apt-get install -y libzbar0
    

# Install dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --no-input

# Apply database migrations
python manage.py migrate
