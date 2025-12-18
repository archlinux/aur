#!/bin/bash
# Launcher script for ZimaOS Client

exec electron /usr/lib/zima-linux-client --no-sandbox --disable-gpu "$@"
