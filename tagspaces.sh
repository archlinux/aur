#!/bin/bash

exec @ELECTRONVERSION@ /usr/lib/tagspaces/app.asar --no-sandbox "$@"
