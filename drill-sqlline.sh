#!/bin/bash

if [ -z "$DRILL_LOG_DIR" ]; then
    export DRILL_LOG_DIR="$HOME/.local/share/drill"
fi

exec /opt/apache-drill/bin/drill-embedded
