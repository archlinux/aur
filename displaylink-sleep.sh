#!/usr/bin/env bash
# Copyright (c) 2015 - 2019 DisplayLink (UK) Ltd.

suspend_displaylink-driver()
{
  while read -n 1 -t 1 SUSPEND_RESULT < /tmp/PmMessagesPort_out; do : ; done;
  echo "S" > /tmp/PmMessagesPort_in

  if [[ -p /tmp/PmMessagesPort_out ]]; then
    read -n 1 -t 10 SUSPEND_RESULT < /tmp/PmMessagesPort_out
  fi
}

resume_displaylink-driver()
{
  echo "R" > /tmp/PmMessagesPort_in
}

case "$1" in
  pre)
    suspend_displaylink-driver
    ;;
  post)
    resume_displaylink-driver
    ;;
esac

