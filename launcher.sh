#!/usr/bin/bash

# Setting LD_LIBRARY_PATH to force Brave to load its own supplied libraries.

exec /usr/bin/env LD_LIBRARY_PATH="/opt/brave-browser-bin:/usr/lib" /opt/brave-browser-bin/Brave "$@"
