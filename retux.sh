#!/bin/bash

export PYTHONPATH=$(echo -n /usr/share/retux/libs/lib/python*/site-packages):$PYTHONPATH
export PATH=/usr/share/retux/libs/bin:$PATH

/usr/share/retux/retux.py
