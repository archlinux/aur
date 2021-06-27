#!/bin/bash

function main() {
  local lines
  lines="$(bluetoothctl -- show | grep '^\s*Powered:')" || return $?

  local status='off'  # bluetooth status
  local line
  # Iterate over all bluetooth devices:
  # If at least one is powered on, then set status to "on"
  # otherwise leave status at "off"
  while read -r line; do
    case "${line}" in
      *'Powered: no')
        ;;
      *'Powered: yes')
        status='on';
        ;;
      *)
        echo 'Unknown power state: '"${line}" >&2;
        notify-send 'Bluetooth' 'Unknown power state!' --icon=dialog-information --category=device.error --urgency=critical;
        return 1;
    esac
  done <<< "${lines}"

  if [ "${status}" = 'off' ]; then
    power_on || return $?
    notify-send 'Bluetooth' 'Enabled'  --icon=dialog-information --category=device.added || return $?
  else
    power_off || return $?
    notify-send 'Bluetooth' 'Disabled' --icon=dialog-information --category=device.removed || return $?
  fi
}

function power_on() {
  bluetoothctl -- power on
}

function power_off() {
  bluetoothctl -- power off
}

main "$@"
