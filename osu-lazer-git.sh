#!/bin/sh
env DOTNET_CLI_TELEMETRY_OPTOUT="${DOTNET_CLI_TELEMETRY_OPTOUT-1}" dotnet '/usr/lib/osu-lazer/osu!.dll' "$@"
