#!/bin/sh

pushd /usr/share/pico-project-generator
python pico_project.py "$@"
popd
