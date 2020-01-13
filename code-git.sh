#!/bin/bash

ELECTRON_RUN_AS_NODE=1 exec electron /usr/lib/code-git/out/cli.js /usr/lib/code-git/code-git.js "$@"
