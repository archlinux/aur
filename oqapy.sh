#!/usr/bin/env bash

PYTHONPATH+=:/opt/opencv2/lib/python2.7/site-packages
LD_LIBRARY_PATH+=:/opt/opencv2/lib
export PYTHONPATH
export LD_LIBRARY_PATH
cd /usr/share/oqapy
python2 ./oqapy "$@"
