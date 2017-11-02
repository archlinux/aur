#!/bin/sh
cd /opt/
NODE_ENV=production electron openbazaar.asar "$@"
#NODE_ENV=development electron openbazaar.asar "$@"
