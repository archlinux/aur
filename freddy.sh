#!/usr/bin/env sh

set -eu

krueger() {
  for freddy in "$@"; do
    case "$freddy" in
      on)
        # disable sleeping by almost all means
        sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
        return
        ;;
      off)
        # enable sleeping by default
        sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
        return
        ;;
    esac
  done

  printf 'Usage: %s on|off\n\n' "$0" >&2
  printf 'Example:\n'
  printf '  krueger on \x1b[2m# machine cannot sleep\x1b[0m\n'
  printf '  krueger off \x1b[2m# machine can sleep\x1b[0m\n'
  return 1
}

krueger "$@"
