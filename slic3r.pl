#!/bin/bash
# This scrips is an easy fix to perl and slic3r locale problems
# This only has to be removed after i18n support will be added (not planned)
export LC_ALL=C
exec /usr/bin/vendor_perl/slic3r.pl "$@"
