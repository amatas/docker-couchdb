#!/bin/bash

# Entrypoint for CouchDB Docker container

set -e
if [ "$1" = 'couchdb' ]; then

su couchdb -c "/usr/bin/couchdb -a /etc/couchdb/default.ini -a /etc/couchdb/local.ini -b -r 5 -p /var/run/couchdb/couchdb.pid -o /dev/null -e /dev/null -R"

chown -R couchdb:couchdb \
  /etc/couchdb \
  /var/run/couchdb \
  /var/lib/couchdb \
  /var/log/couchdb

chmod -R 0770  \
  /etc/couchdb \
  /var/run/couchdb \
  /var/lib/couchdb \
  /var/log/couchdb

fi

exec $@
