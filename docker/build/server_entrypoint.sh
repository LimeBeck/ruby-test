#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

rake db:migrate
bundle exec rails s -e production -b 0.0.0.0