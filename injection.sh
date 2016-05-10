#!/bin/bash

cd '/usr/lib/injection'
export PYTHONPATH="$(pwd)/custom_packages"

python main.py "$@"
