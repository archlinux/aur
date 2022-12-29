#!/bin/sh

[ ! -d "resources" ] && ln -s /usr/lib/easyepg-lite/resources .
exec python /usr/lib/easyepg-lite/main.py
