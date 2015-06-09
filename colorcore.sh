#!/bin/bash
pushd /usr/share/colorcore > /dev/null && /usr/bin/python colorcore.py "$@" && popd > /dev/null
