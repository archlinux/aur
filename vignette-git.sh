#!/bin/sh

env DOTNET_CLI_TELEMETRY_OPTOUT="${DOTNET_CLI_TELEMETRY_OPTOUT-1}" \
    SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR=0 \
    dotnet /usr/lib/vignette/Vignette.dll
