#!/bin/sh
export MONO_TLS_PROVIDER=legacy
exec mono /usr/lib/sonarr/NzbDrone.exe "$@"
