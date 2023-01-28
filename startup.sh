#!/bin/sh

[ ! -d "resources" ] && ln -s /usr/lib/easyepg-lite-git/resources .
exec python /usr/lib/easyepg-lite-git/main.py
