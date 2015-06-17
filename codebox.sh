#!/bin/sh
cd /var/lib/codebox
./init.sh &
sleep 3
chromium --app=http://127.0.0.1:8000
