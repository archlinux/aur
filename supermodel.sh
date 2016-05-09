#!/bin/sh

mkdir -p ~/.supermodel/NVRAM
mkdir -p ~/.supermodel/saves

cd /usr/share/supermodel

if [[ ! -f ~/.supermodel/supermodel.ini ]]; then
    cp ./Config/Supermodel.ini ~/.supermodel/supermodel.ini
fi

./Supermodel "$@"
