#!/bin/bash

cd /opt/patchbay-git
exec electron index.js index.js "$@"
