#!/bin/bash

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
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true

legacy_runtime_pattern='(/usr/bin/electron39|/usr/lib/electron39/electron) /usr/lib/rocket-mouse($| )'

stop_legacy_runtime_instances() {
  pkill -f "$legacy_runtime_pattern" >/dev/null 2>&1 || true

  for _ in 1 2 3 4 5 6 7 8 9 10; do
    if ! pgrep -f "$legacy_runtime_pattern" >/dev/null 2>&1; then
      return 0
    fi

    sleep 0.1
  done

  return 0
}

should_filter_stderr_line() {
  case "$1" in
    *'Failed to load module "appmenu-gtk-module"'*)
      return 0
      ;;
    *'vaInitialize failed: unknown libva error'*)
      return 0
      ;;
    'libEGL warning: egl: failed to create dri2 screen')
      return 0
      ;;
    'libEGL warning: pci id for fd '*)
      return 0
      ;;
    'pci id for fd '*)
      return 0
      ;;
  esac

  return 1
}

forward_filtered_stderr() {
  while IFS= read -r line; do
    if should_filter_stderr_line "$line"; then
      continue
    fi

    printf '%s\n' "$line" >&2
  done
}

stop_legacy_runtime_instances

exec /usr/lib/rocket-mouse/electron/electron /usr/lib/rocket-mouse "$@" \
  2> >(forward_filtered_stderr)
