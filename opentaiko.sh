#!/bin/bash
export SDL_VIDEODRIVER=x11
cd /opt/opentaiko/
exec ./OpenTaiko "$@"
