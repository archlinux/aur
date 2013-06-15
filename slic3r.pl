#!/bin/bash
# This scrips is easy fix to perl and slic3r local problem
export LC_ALL=C
exec /usr/bin/vendor_perl/slic3r.pl "$@"
