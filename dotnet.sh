#!/bin/sh

export DOTNET_ROOT=/usr/share/dotnet-runtime
exec /usr/share/dotnet-runtime/dotnet "$@"

# vim: ts=2 sw=2 et:

