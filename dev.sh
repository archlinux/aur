#!/usr/bin/bash

set -e

./clean.sh
dotnet publish -c Release --use-current-runtime || echo "Build failed" >&2
bin/Release/net6.0/linux-x64/publish/rgx || echo "Execute failed" >&2
