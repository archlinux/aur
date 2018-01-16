#! /usr/bin/env bash

LD_PRELOAD=libcurl.so.3 PATH="$PATH:/usr/lib/clever-arch-test/" /usr/lib/clever-arch-test/clever "$@"
