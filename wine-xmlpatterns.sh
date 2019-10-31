#!/bin/sh

set -e

@TRIPLE@-wine /usr/@TRIPLE@/bin/xmlpatterns.exe "$@"
