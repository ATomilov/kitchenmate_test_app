#!/bin/bash

set -e

bundle -v

if [[ $RAILS_ENV = "production" ]] || [[ $RAILS_ENV = "staging" ]]; then
  bundle install --without development test
else
  bundle install
fi

rm -f tmp/pids/server.pid

bundle exec rails s -b '0.0.0.0'

exec "$@"