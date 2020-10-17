#!/bin/bash

export QT_X11_NO_MITSHM=1

ELF_FILE='/usr/bin/unetbootin.elf'
TMP_FILE='/tmp/_polkit_error'

if [ $(command -v pkexec) ]; then
  pkexec --disable-internal-agent "${ELF_FILE}" "$@" 2>"${TMP_FILE}"
  if [ -s "${TMP_FILE}" ]; then
    zenity --error --text="$(cat ${TMP_FILE})"
    rm -f "${TMP_FILE}"
  fi
else
  "${ELF_FILE}" "$@"
fi
