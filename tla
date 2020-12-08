#!/bin/sh
exec "$(dirname "$0")"/tla-tools tlc2.REPL "$@"
