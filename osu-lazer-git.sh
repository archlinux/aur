#!/bin/sh
env DOTNET_CLI_TELEMETRY_OPTOUT="${DOTNET_CLI_TELEMETRY_OPTOUT-1}" \
	LD_LIBRARY_PATH='/usr/lib/ffmpeg4.4':"${LD_LIBRARY_PATH}" \
	dotnet '/usr/lib/osu-lazer/osu!.dll' "$@"
