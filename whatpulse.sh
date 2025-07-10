#!/bin/bash
# WhatPulse wrapper script

# Set up environment
export QT_PLUGIN_PATH="/usr/lib/whatpulse/plugins"
export LD_LIBRARY_PATH="/usr/lib/whatpulse/lib:$LD_LIBRARY_PATH"

# Change to the WhatPulse directory
cd /usr/lib/whatpulse || exit 1

# Execute WhatPulse with all arguments
exec ./whatpulse "$@"
