#!/bin/sh

# we can'use site-packages since it requires the root
export PYTHONPATH="/opt/freedv-gui/rade:${PYTHONPATH}"

# we need to declare the config file otherwise it uses
# the binary file name; in this case ~/.freedv_gui
exec freedv_gui --config="${HOME}/.freedv" $@
