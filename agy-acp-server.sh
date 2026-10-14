#!/bin/sh
export ANTIGRAVITY_HARNESS_PATH="${ANTIGRAVITY_HARNESS_PATH:-/usr/lib/agy-acp-server/localharness_external}"
exec /usr/lib/agy-acp-server/agy_acp_server.par --uid= "$@"
