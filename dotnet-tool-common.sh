#!/bin/sh

exec dotnet /usr/lib/@@DOTNET_TOOL_NAME@@/@@DOTNET_TOOL_DLL@@.dll "$@"
