#!/bin/sh
node /opt/cloud9/server.js -w /opt/cloud9  -p 8181 -l 127.0.0.1 -a : &
chromium --app=http://127.0.0.1:8181 
