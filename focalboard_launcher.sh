#!/usr/bin/env bash

datadir=$HOME/.local/focalboard-bin/
[[ -d ${datadir} ]] || mkdir -p ${datadir}
cd ${datadir}
cp -r /opt/focalboard-bin/focalboard-app .
cp -r /opt/focalboard-bin/pack .
[[ -d "files" ]] || mkdir -p files
touch focalboard.db

./focalboard-app $@
