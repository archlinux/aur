#!/bin/sh

set -e

@TRIPLE@-wine /usr/@TRIPLE@/bin/qhelpgenerator-qt5.exe "$@"

