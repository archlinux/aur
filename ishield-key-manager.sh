#!/bin/sh
# libkeymanagement.so embeds and exports its own OpenSSL. If the system libcrypto is loaded first (it is, via GTK), they conflict and connecting to the key fails with "The device responded in an unexpected way". Preloading libkeymanagement makes its embedded OpenSSL win.
export LD_PRELOAD="/opt/ishield-key-manager/lib/libkeymanagement.so${LD_PRELOAD:+:$LD_PRELOAD}"
exec /opt/ishield-key-manager/ishield-key-manager "$@"
