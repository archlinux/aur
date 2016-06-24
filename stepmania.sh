#!/bin/bash
#
# StepMania Launcher
#

# primusrun
if which primusrun > /dev/null 2>&1; then
    exec primusrun "/opt/stepmania/stepmania" "$@"

# optirun (default backend)
elif which optirun > /dev/null 2>&1; then
    exec optirun "/opt/stepmania/stepmania" "$@"

# default
else
    exec "/opt/stepmania/stepmania" "$@"
fi
