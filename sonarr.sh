#!/bin/sh
exec -a sonarr -- mono /usr/lib/sonarr/NzbDrone.exe "$@"
