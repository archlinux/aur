#!/usr/bin/env bash
# Copyright (c) 2015 - 2019 DisplayLink (UK) Ltd.

suspend_displaylink-driver()
{
  #flush any bytes in pipe
  while read -n 1 -t 1 SUSPEND_RESULT < /tmp/PmMessagesPort_out; do : ; done;

  #suspend DisplayLinkManager
  echo "S" > /tmp/PmMessagesPort_in

  if [[ -p /tmp/PmMessagesPort_out ]]; then
    #wait until suspend of DisplayLinkManager finish
    read -n 1 -t 10 SUSPEND_RESULT < /tmp/PmMessagesPort_out
  fi
}

resume_displaylink-driver()
{
  #resume DisplayLinkManager
  echo "R" > /tmp/PmMessagesPort_in
}

main_systemd()
{
  case "$1/$2" in
  pre/*)
    suspend_displaylink-driver
    ;;
  post/*)
    resume_displaylink-driver
    ;;
  esac
}
main_pm()
{
  case "$1" in
    suspend|hibernate)
      suspend_displaylink-driver
      ;;
    resume|thaw)
      resume_displaylink-driver
      ;;
  esac
  true
}

DIR=$(cd "$(dirname "$0")" && pwd)

if [[ $DIR == *systemd* ]]; then
  main_systemd "$@"
elif [[ $DIR == *pm* ]]; then
  main_pm "$@"
fi

