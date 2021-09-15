#!/bin/bash
if [ ! "$PWD" == "/opt/craftycontroller" ]; then
    cd /opt/craftycontroller
fi

source venv/bin/activate
python3 crafty.py
