#!/bin/bash

export ELECTRON_IS_DEV=0

exec electron@ELECTRONVERSION@ /usr/lib/materialious/app.asar "$@"
