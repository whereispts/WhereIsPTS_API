#!/bin/bash

# Create production user
sudo -u postgres -H -- psql -c "SELECT 1 FROM pg_catalog.pg_roles WHERE rolname = 'test_user';" | grep -q 1 || sudo -u postgres -H -- psql -c  "CREATE ROLE test_user LOGIN PASSWORD 'please_change_password';"

# Create production database if not exists
sudo -u postgres -H -- psql -c "SELECT 1 FROM pg_database WHERE datname = 'whereispts_test';" | grep -q 1 || sudo -u postgres -H -- psql -c  "CREATE DATABASE whereispts_test OWNER test_user;"

# Create extension
sudo -u postgres -H -- psql -d whereispts_test -c "CREATE EXTENSION IF NOT EXISTS postgis;"

env FLASK_CONFIG='testing' sudo -E python3 manage.py upgrade
