#!/bin/sh
# daimon asks for a Node binary at bundleDir/runtime/node. electron43 bundles
# Node 24.x in exactly the range daimon requires (>=24.15 <25); run it in Node
# mode instead of downloading a managed Node from nodejs.org.
exec env ELECTRON_RUN_AS_NODE=1 /usr/bin/electron43 "$@"
