#!/usr/bin/env sh

set -eu

krueger() {
  for freddy in "$@"; do
    case "$freddy" in
      on)
        if [ "$(uname -s)" = "Linux" ]; then
          # disable sleeping by almost all means
          sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
        else
          # disable sleeping by almost all means
          sudo pmset -a disablesleep 1
        fi
        return
        ;;
      off)
        if [ "$(uname -s)" = "Linux" ]; then
          # enable sleeping by default
          sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
        else
          # enable sleeping by default
          sudo pmset -a disablesleep 0
        fi
        return
        ;;
      status)
        if [ "$(uname -s)" = "Linux" ]; then
          # check if sleeping is disabled
          if [ "$(sudo systemctl is-enabled sleep.target)" = "static" ]; then
            echo 'disabled'
          else
            echo 'enabled'
          fi
        else
          # check if sleeping is disabled
          sudo pmset -g | grep -E "SleepDisabled|disablesleep"
        fi
        return
    esac
  done

  printf 'Usage: %s on|off|status\n\n' "$0" >&2
  printf 'Example:\n'
  printf '  krueger on      \x1b[2m# machine cannot sleep\x1b[0m\n'
  printf '  krueger off     \x1b[2m# machine can sleep\x1b[0m\n'
  printf '  krueger status  \x1b[2m# check krueger state\x1b[0m\n'
  return 1
}

krueger "$@"
