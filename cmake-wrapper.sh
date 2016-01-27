#!/bin/bash

cd $PWD

if [ "${1}" == "--help" ]
then
    echo "cmake version 2.8.12.2"
    cmake --help
else
    cmake "${@}"
fi
