#!/bin/sh
cd /usr/share/nikto
exec /usr/bin/perl nikto.pl "$@"
