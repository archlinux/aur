#!/bin/bash

cd /opt/patchbay
exec electron index.js index.js "$@"
