#!/usr/bin/env sh

# Run the packaged JavaScript entrypoint while preserving all CLI arguments.
exec node /usr/lib/nanollm/dist/cli.js "$@"
