#!/bin/sh
# The IR (IRMP) decoder loads libirmp.so via ctypes; point it at the bundled copy.
export LD_LIBRARY_PATH="/opt/atk-logic/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec /opt/atk-logic/ATK-Logic "$@"
