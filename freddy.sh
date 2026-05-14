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

  printf 'Usage: %s on|off\n' "$0" >&2
  return 1
}

krueger "$@"
