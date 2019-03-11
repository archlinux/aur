#!/bin/bash

# Script to change current working directory
# and execute the program from there
pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

pushd /opt/craft-git/
./craft
popd
