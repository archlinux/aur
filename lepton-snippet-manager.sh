#!/bin/bash

PACKAGE_NAME="lepton-snippet-manager"
EW_DIR="/opt/$PACKAGE_NAME"

cd "$EW_DIR" || exit 1
exec electron . "$@"
