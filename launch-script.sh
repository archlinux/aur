#!/bin/sh

set -e

cd /opt/worldpainter

exec ./worldpainter -J-Dorg.pepsoft.worldpainter.disableUpdateCheck=true "$@"
