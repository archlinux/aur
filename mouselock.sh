#!/bin/bash

# Explain usage and exit
Help() {
    echo "This script does not accept any arguments."
    echo "You can set the XPOINTER_ARGS variable with"
    echo "any arguments you want to pass to xpointerbarrier."
}

# Run xpointerbarrier in the background
Start() {
    xpointerbarrier $XPOINTER_ARGS &
}

# Kill xpointerbarrier
Kill() {
    pkill xpointerbarrier
}

# If there are any arguments, show Help and exit
if [ $# -ne 0 ]; then
    Help
    exit 1
fi

# Start xpointerbarrier if it isn't running, otherwise, kill it
pidof xpointerbarrier >/dev/null
if [[ $? -ne 0 ]]; then
    Start
else
    Kill
fi
