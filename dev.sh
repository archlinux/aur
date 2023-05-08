#!/usr/bin/bash

set -e

./clean.sh
dotnet publish -c Debug --use-current-runtime || echo "Build failed" >&2
bin/Debug/net7.0/linux-x64/publish/rgx --help || echo "Execute failed" >&2
