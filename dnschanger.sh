#!/bin/bash

export ELECTRON_IS_DEV=0
exec electron23 /usr/lib/dnschanger/app.asar "$@"