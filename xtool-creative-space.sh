#!/bin/sh
e=/usr/lib/electron27
exec bwrap --dev-bind / / --overlay-src $e --overlay-src /usr/lib/xtool-creative-space --ro-overlay $e $e/electron "$@"
