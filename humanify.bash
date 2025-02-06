#!/bin/bash

# See also:
# https://github.com/laverdet/isolated-vm/issues/420
exec /usr/bin/node --no-node-snapshot \
  /usr/lib/node_modules/humanifyjs/dist/index.mjs "$@"
