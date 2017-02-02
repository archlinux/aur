#!/bin/bash

set -e

if [ -d larryshell ]
then
    cd larryshell
    git pull || echo "Pulled"
else
    git clone git@github.com:Devon-Austin-Wood-Thomas/larryshell larryshell
fi
git checkout tags/v$1
