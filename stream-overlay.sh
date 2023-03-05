#!/bin/sh
cd /usr/share/stream-overlay 
nohup /usr/bin/electron app 1>/tmp/stream-overlay.out 2>/tmp/stream-overlay.err &
