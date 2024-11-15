#!/bin/sh -eu

# Secret storage defaults to gnome-keyring, but can be changed by setting
# the environment variable WIRE_PASSWORD_STORE. For possible options, see:
# https://www.electronjs.org/docs/latest/api/safe-storage#safestoragegetselectedstoragebackend-linux
export NODE_ENV=production
exec electron@_electronver@ /usr/lib/wire-desktop/app.asar \
  --password-store="${WIRE_PASSWORD_STORE:-"gnome-libsecret"}" "$@"
