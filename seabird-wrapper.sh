#!/bin/bash
# Wrapper script for Seabird to ensure config directory exists and proper PATH

# Use user's XDG_CONFIG_HOME if set, otherwise default to HOME/.config
: "${XDG_CONFIG_HOME:=${HOME}/.config}"

# Ensure seabird config directory exists
mkdir -p "${XDG_CONFIG_HOME}/seabird"

# Execute the actual seabird binary with XDG_CONFIG_HOME explicitly set for this process only
exec env XDG_CONFIG_HOME="${XDG_CONFIG_HOME}" /usr/lib/seabird/seabird "$@"
