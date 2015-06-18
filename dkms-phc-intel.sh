#!/bin/bash

case "$1" in
  start)
  ;;
  stop)
    version="$(\ls -dt /usr/lib/modules/extramodules-* | head -n 1)"
    version="$(< $version/version)"
    dkms autoinstall -k "${version}"
  ;;
  *)
    echo "usage: $0 {start|stop}" >&2
  ;;
esac

# vim:set ts=2 sw=2 ft=sh et:
