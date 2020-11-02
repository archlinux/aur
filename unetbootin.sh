#!/bin/bash

export QT_X11_NO_MITSHM=1

if [ $(command -v pkexec) ]; then
  pkexec --disable-internal-agent '/usr/bin/unetbootin.elf' "$@"
else
  '/usr/bin/unetbootin.elf' "$@"
fi
