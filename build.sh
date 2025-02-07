#!/usr/bin/env bash
# Exit on error
set -o errexit

# Update the package list and install required libraries
echo "Installing required system libraries..."
sudo apt-get update 
sudo apt-get install libzbar0

# Install Python dependencies
echo "Installing Python dependencies..."
pip install --upgrade pip  # Upgrade pip
pip install -r requirements.txt

# Collect static files for production
echo "Collecting static files..."
python manage.py collectstatic --no-input

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate

# Any additional commands (optional)
# echo "Running additional setup tasks..."
