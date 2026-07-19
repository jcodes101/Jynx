#!/usr/bin/env bash

set -o errexit

bundle install

# Precompile without real credentials (same approach as Dockerfile).
# Runtime still requires RAILS_MASTER_KEY on the Render service.
SECRET_KEY_BASE_DUMMY=1 bin/rails assets:precompile
SECRET_KEY_BASE_DUMMY=1 bin/rails assets:clean
