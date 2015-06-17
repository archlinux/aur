#!/bin/sh
node /var/lib/stackedit/server.js & 
chromium --app=http://127.0.0.1:3000
