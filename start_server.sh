#!/bin/bash
sleep 3650d | "$@" &
echo $! > "$RUNTIME_DIR/pid"
