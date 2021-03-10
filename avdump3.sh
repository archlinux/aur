#!/bin/sh
AVDUMP3CL='/opt/avdump3/AVDump3CL.dll'
exec dotnet "$AVDUMP3CL" "$@"
