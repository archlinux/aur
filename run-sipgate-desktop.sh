#!/usr/bin/env bash

export VITE_WORKSPACE_BASE_URL="${VITE_WORKSPACE_BASE_URL:-https://workspace.sipgate.com}"

exec /opt/sipgate/sipgate-desktop "$@"
