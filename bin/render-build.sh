#!/usr/bin/env bash

set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean

# db:prepare migrates primary and loads Solid cache/queue/cable schemas
bin/rails db:prepare
