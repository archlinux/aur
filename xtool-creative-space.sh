#!/bin/sh
e=/usr/lib/electron31
exec bwrap --dev-bind / / --overlay-src $e --overlay-src /usr/lib/xtool-creative-space --ro-overlay $e $e/electron "$@"
