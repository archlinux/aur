#!/bin/bash

exec electron@ELECTRONVERSION@ /usr/lib/tagspaces/app.asar --no-sandbox "$@"
