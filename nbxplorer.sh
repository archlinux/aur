#!/usr/bin/env bash
# This script starts NBXplorer.

dotnet run -c Release --no-build --no-launch-profile --project /usr/share/webapps/nbxplorer/NBXplorer/NBXplorer.csproj -- "${@}"
