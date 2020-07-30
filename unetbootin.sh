#!/bin/bash
#export QT_X11_NO_MITSHM=1
if type pkexec &> /dev/null; then
  pkexec "/usr/bin/unetbootin.elf" "$@" 2>/tmp/_polkit_error
  #pkexec --disable-internal-agent "/usr/bin/unetbootin.elf" "$@" 2>/tmp/_polkit_error
  if [ -s /tmp/_polkit_error ]; then
    if type zenity &> /dev/null; then
      zenity --error --text="`cat /tmp/_polkit_error`"
    else
      cat /tmp/_polkit_error
    fi
    rm /tmp/_polkit_error
  fi
else
  /usr/bin/unetbootin.elf "$@"
fi
