#!/bin/sh
cd /opt/
#NODE_ENV=production electron openbazaar-next.asar "$@"
NODE_ENV=development electron openbazaar-next.asar "$@"
