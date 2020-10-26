#!/bin/sh

set -e

@TRIPLE@-wine /usr/@TRIPLE@/bin/glslangValidator.exe "$@"
