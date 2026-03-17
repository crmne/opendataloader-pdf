#!/bin/bash

# Local development test script for Ruby package

set -e

command -v ruby >/dev/null || { echo "Error: ruby not found"; exit 1; }
command -v bundle >/dev/null || { echo "Error: bundle not found. Install Bundler with: gem install bundler"; exit 1; }

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$SCRIPT_DIR/.."
PACKAGE_DIR="$ROOT_DIR/ruby/opendataloader-pdf"

cd "$PACKAGE_DIR"

ruby ./scripts/setup.rb
bundle install
bundle exec rspec "$@"
