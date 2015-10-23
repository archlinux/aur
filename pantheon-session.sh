#!/bin/sh

export XDG_CURRENT_DESKTOP=Pantheon
if [ -n "$1" ]; then
  case $1 in
    lite) # Reduced resource usage with openbox in place of gala
      exec gnome-session --session pantheon-openbox
    ;;
    3d) # Improved functionality and decor with compiz in place of gala
      exec gnome-session --session pantheon-compiz
    ;;
    *) # Other custom sessions
      exec gnome-session --session pantheon-$1
    ;;
  esac
else
  exec gnome-session --session gnome-shell
fi
