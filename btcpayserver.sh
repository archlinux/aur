#!/usr/bin/env bash
# This script starts BTCPayServer.

dotnet run --no-build --no-launch-profile -c Release --project /usr/share/webapps/btcpayserver/BTCPayServer/BTCPayServer.csproj -- "${@}"
