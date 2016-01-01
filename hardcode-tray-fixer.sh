#!/usr/bin/sh

if [ "$EUID" -eq 0 ] ; then
  echo 'This script should not be run as root; it will call sudo with `-E`'
  exit 1
fi
cd /opt/hardcode-tray-fixer/
sudo -E python /opt/hardcode-tray-fixer/script.py
