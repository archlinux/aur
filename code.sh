#!/bin/bash

ELECTRON_RUN_AS_NODE=1 exec electron /usr/lib/code/out/cli.js /usr/lib/code/code.js "$@"
