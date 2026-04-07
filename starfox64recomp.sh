#!/bin/bash
# Wrapper script for Starfox 64: Recompiled
# El juego necesita ejecutarse desde su directorio para encontrar assets/
cd /opt/starfox64recomp || exit 1
exec ./Starfox64Recompiled "$@"
