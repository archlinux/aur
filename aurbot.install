#!/bin/bash

## arg 1:  the new package version
post_install() {
  # ensure system users are present
  systemd-sysusers aurbot.conf
  # check file permissions
  chown aurbot:aurbot /var/lib/aurbot
}

# vim:set ts=2 sw=2 ft=sh et:
