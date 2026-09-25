#!/bin/sh
export BACKLOG_BUNDLE_ASSET_DIR=/usr/lib/backlog
exec bun /usr/lib/backlog/cli.js "$@"
