#!/bin/sh

if [ -n "${GTK_MODULES-}" ]; then
  filtered_modules=''
  old_ifs=$IFS
  IFS=:

  for module in $GTK_MODULES; do
    if [ "$module" = 'appmenu-gtk-module' ] || [ -z "$module" ]; then
      continue
    fi

    if [ -n "$filtered_modules" ]; then
      filtered_modules="${filtered_modules}:$module"
      continue
    fi

    filtered_modules="$module"
  done

  IFS=$old_ifs

  if [ -n "$filtered_modules" ]; then
    export GTK_MODULES="$filtered_modules"
  else
    unset GTK_MODULES
  fi
fi

unset ELECTRON_RUN_AS_NODE

exec /usr/bin/electron39 /usr/lib/rocket-mouse "$@"
