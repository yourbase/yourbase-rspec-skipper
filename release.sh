#!/usr/bin/env bash
set -ex
echo "---\r\n:rubygems_api_key: $RUBYGEMS_API_KEY" > ~/.gem/credentials
chmod 0600 ~/.gem/credentials
gem build yourbase-rspec-skipper.gemspec
gem push *.gem
