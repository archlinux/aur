#!/bin/sh
exec /usr/lib/nethermind/nethermind \
  --logger-config /etc/nethermind/NLog.config \
  --configs-dir /etc/nethermind/configs \
  "$@"
