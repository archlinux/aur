#!/usr/bin/env bash
# This script starts ERPNext.

cd /usr/share/webapps/erpnext/ || exit 1
bench start "${@}"
