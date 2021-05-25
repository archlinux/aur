#!/bin/bash

# don't edit the electron binary name here! simply change the variable in the PKGBUILD and we will sed it into the correct one :)
ELECTRON_RUN_AS_NODE=1 exec electron /usr/lib/code/out/cli.js /usr/lib/code/code.js "$@"
