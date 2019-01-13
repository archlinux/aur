#!/bin/bash

cd /opt/patchbay
exec electron2 index.js index.js "$@"
