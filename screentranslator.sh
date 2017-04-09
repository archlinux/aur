#!/bin/sh
export TESSDATA_PREFIX=/usr/share
cd /opt/screentranslator
exec ./screentranslator "$@"
