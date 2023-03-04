#!/usr/bin/env bash
# This script starts ERPNext.

sudo -u erpnext bash -c "cd /usr/share/webapps/erpnext/ || exit 1"
sudo -u erpnext bash -c "bench start \${@}"
