#!/bin/bash

set -u

PATCHDIR=/usr/share/signal-desktop-fix-sway/patches
ASAR=/usr/lib/signal-desktop/resources/app.asar

if [[ ! -e "${PATCHDIR}" ]]; then
  printf >&2 'Not modifying %s because %s is not installed.' \
    "${ASAR}" "${PATCHDIR}"
  exit 0
fi

if [[ ! -e "${ASAR}" ]]; then
  printf >&2 'Not modifying %s because it is not installed.' "${ASAR}"
  exit 0
fi

# Patch the ASAR file
if ! patch-asar "${ASAR}" "${PATCHDIR}" "${ASAR}.patched"; then
  echo >&2 '[ERROR] Patch failed, skipping.'
  rm -f "${ASAR}.patched"
  exit 1
fi

exec mv -f "${ASAR}.patched" "${ASAR}"
