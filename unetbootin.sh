#!/bin/bash
export QT_X11_NO_MITSHM=1
if [ $(which pkexec) ]; then
  pkexec --disable-internal-agent "/usr/bin/unetbootin.elf" "$@" 2>/tmp/_polkit_error
  if [ -s /tmp/_polkit_error ]; then
    zenity --error --text="`cat /tmp/_polkit_error`"
    rm /tmp/_polkit_error
  fi
else
  /usr/bin/unetbootin.elf "$@"
fi
