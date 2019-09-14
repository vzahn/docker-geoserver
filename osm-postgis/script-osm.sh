#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Create the OSM database
psql  -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<- 'EOSQL'
CREATE USER osm WITH LOGIN NOSUPERUSER INHERIT CREATEDB NOCREATEROLE NOREPLICATION;
CREATE DATABASE osm WITH OWNER = osm ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8' TABLESPACE = pg_default CONNECTION LIMIT = -1;
EOSQL

# Create extentions
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "osm" <<- 'EOSQL'
CREATE EXTENSION postgis;
CREATE EXTENSION hstore;
ALTER USER osm WITH PASSWORD 'osm';
EOSQL

