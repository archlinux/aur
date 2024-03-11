#!/bin/bash

set -e

INTERFACE=
PACKAGES=()
OPTIONS=()

function help() {
  echo "usage: ${0} [OPTIONS]"
  echo
  echo "where OPTIONS are:"
  echo " -b            remove branding"
  echo " -e            apply empty configuration"
  echo " -h            show this help"
  echo " -i INTERFACE  install via INTERFACE"
  echo " -k KEYFILE    use KEYFILE"
  echo " -p PACKAGE    install PACKAGE"
  echo " -r            apply default configuration"
  echo " -s SCRIPT     run script"
}

while getopts "behi:k:p:rs:" opt; do
  case ${opt} in
    b)
      OPTIONS+=(-b)
      ;;
    e)
      OPTIONS+=(-e)
      ;;
    h)
      help
      exit 0
      ;;
    i)
      if ! ip addr show dev "${OPTARG}" >/dev/null 2>/dev/null; then
        echo "Interface '${OPTARG}' does not exist." >&2
        exit 1
      fi
      INTERFACE="${OPTARG}"
      ;;
    k)
      OPTIONS+=(-k "${OPTARG}")
      ;;
    p)
      if [ ! -s "${OPTARG}" ]; then
        echo "Package '${OPTARG}' does not exist." >&2
        exit 1
      fi
      PACKAGES+=("${OPTARG}")
      ;;
    r)
      OPTIONS+=(-r)
      ;;
    s)
      OPTIONS+=(-s "${OPTARG}")
      ;;
  esac
done
      
if [ -z "${PACKAGES}" ]; then
  echo "No package given for installation." >&2
  exit 1
fi

if [ -z "${INTERFACE}" ]; then
  echo "No interface given for installation." >&2
  exit 1
fi

if [ "${UID}" -gt 0 ]; then
  exec sudo -p "This must be run as root. Please enter the password for %u to continue: " -- /bin/bash -- "${0}" $@
fi

ip netns add netinstall
trap 'ip netns delete netinstall' EXIT INT QUIT TERM HUP

ip link set dev "${INTERFACE}" netns netinstall
ip netns exec netinstall ip addr add 192.168.88.2/24 dev "${INTERFACE}"
ip netns exec netinstall ip link set dev "${INTERFACE}" up
ip netns exec netinstall ip route add default dev "${INTERFACE}"
ip netns exec netinstall /usr/lib/netinstall/netinstall-cli "${OPTIONS[@]}" -a 192.168.88.1 "${PACKAGES[@]}"
