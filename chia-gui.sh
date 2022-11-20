#!/bin/sh
cd /opt/chia-blockchain
source venv/bin/activate
electron "$@" gui
