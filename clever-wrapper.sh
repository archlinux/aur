#! /usr/bin/env bash

LD_PRELOAD=libcurl.so.3 PATH="$PATH:/usr/lib/clever-tools-bin/" /usr/lib/clever-tools-bin/clever "$@"
