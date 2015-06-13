#!/bin/bash

# Here I avoid to use the default $HOME/workspace folder
# which conflicts with the default Eclipse workspace

# Check if the user has provided the -data argument
while [[ $# > 0 ]]; do
    if [ "$1" == "-data" ]
    then
        shift
        WORKSPACE="$1"
    fi
    shift
done

# Check if no workspace argument was provided
if [ -z "$WORKSPACE" ]
then
  WORKSPACE="$HOME/.local/share/rpgng"
  echo "Unspecified -data argument, assuming $WORKSPACE as workspace."
fi

/usr/lib/rpgng/rpgng -data "$WORKSPACE"
