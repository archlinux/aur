#!/bin/bash

[[ -n "$1" ]] && SLEEPTIME="$1" || SLEEPTIME="4"

while true; do
  CONNECTIONS="$(ss -tun | grep '^[a-z]*p' | sed 's|[a-z]*p[ ]*[A-Z]*[ ]*[0-9]*[ ]*[0-9]*[ ]*||g;s|-[A-Z]*.*||g;/^$/d')"

  #ports
  PORTS="$(echo "${CONNECTIONS}" | sed 's|.*:||1;s| *$||')"

  #ips local
  IPIN="$(echo "${CONNECTIONS}" | sed 's|:.*||1')"

  #ips remote
  IPOUT="$(echo "${CONNECTIONS}" | sed 's|[0-9]*.[0-9]*.[0-9]*.[0-9]*:[0-9]*[ ]*||1;s|:[0-9]*.*||g')"

  LINENUM="0"

  while read -r line; do
    ((LINENUM++))
    OUTPUT="$(echo "${IPIN}"| sed -n "${LINENUM}p") $(echo "${IPOUT}"| sed -n "${LINENUM}p") $(echo "${PORTS}"| sed -n "${LINENUM}p")"
    [[ ! "${OUTPUT}" == "\n" ]] && echo "${OUTPUT}"
  done <<< "${CONNECTIONS}"

  sleep "${SLEEPTIME}"
done
