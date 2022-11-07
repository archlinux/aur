#!/usr/bin/env bash
# This script starts BTCPayServer.

dotnet run -c Release --no-build --no-launch-profile --project /usr/share/webapps/btcpayserver/BTCPayServer/BTCPayServer.csproj -- "${@}"
